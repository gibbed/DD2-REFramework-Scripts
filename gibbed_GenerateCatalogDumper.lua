local status = "Waiting..."

local zero_pos = Vector3f.new(0, 0, 0)

local via_gameobject_t = sdk.find_type_definition("via.GameObject")

local via_component_t = sdk.find_type_definition("via.Component")
local via_component_rt = via_component_t:get_runtime_type()

local via_render_mesh_t = sdk.find_type_definition("via.render.Mesh")
local via_render_mesh_rt = via_render_mesh_t:get_runtime_type()

local generate_manager = sdk.get_managed_singleton("app.GenerateManager")

local enum_get_name = sdk.find_type_definition("System.Enum"):get_method("GetName")
local prefab_instantiate = sdk.find_type_definition("via.Prefab"):get_method("instantiate(via.vec3)")
local gameobject_find_components = via_gameobject_t:get_method("findComponents(System.Type)")

local ch200000_t = sdk.find_type_definition("app.Ch200000")
local ch200000_rt = ch200000_t:get_runtime_type()

local monster_t = sdk.find_type_definition("app.Monster")
local monster_rt = monster_t:get_runtime_type()

local gimmickbase_t = sdk.find_type_definition("app.GimmickBase")
local gimmickbase_rt = gimmickbase_t:get_runtime_type()

local generator_category_t = sdk.find_type_definition("app.GeneratorCategory")
local generator_category_rt = generator_category_t:get_runtime_type()
local generator_category_get_name = function(value)
  return enum_get_name(nil, generator_category_rt, sdk.create_int32(value))
end

local character_id_t = sdk.find_type_definition("app.CharacterID")
local character_id_rt = character_id_t:get_runtime_type()
local character_id_get_name = function(value)
  return enum_get_name(nil, character_id_rt, sdk.create_int32(value))
end

local gimmick_id_t = sdk.find_type_definition("app.GimmickID")
local gimmick_id_rt = gimmick_id_t:get_runtime_type()
local gimmick_id_get_name = function(value)
  return enum_get_name(nil, gimmick_id_rt, sdk.create_int32(value))
end

local get_component_names_for_type = function(gameobject, component_type)
  local components = gameobject_find_components(gameobject, component_type)
  local data = {}
  if components ~= nil then
    local component_length = components:get_Length()
    for i = 0, component_length - 1, 1 do
      local component = components[i]
      local component_t = component:get_type_definition()
      local component_rt = component_t:get_runtime_type()
      table.insert(data, component_rt:get_FullName())
    end
  end
  table.sort(data)
  return data
end

local get_component_names_for_not_types = function(gameobject, bad_types)
  local components = gameobject_find_components(gameobject, via_component_rt)
  local data = {}
  if components ~= nil then
    local component_length = components:get_Length()
    for i = 0, component_length - 1, 1 do
      local component = components[i]
      local component_t = component:get_type_definition()
      local component_rt = component_t:get_runtime_type()
      local has_bad_type = false
      for _, bad_type in ipairs(bad_types) do
        if component_rt:IsSubclassOf(bad_type) == true then
          has_bad_type = true
          break
        end
      end
      if has_bad_type == false then
        table.insert(data, component_rt:get_FullName())
      end
    end
  end
  table.sort(data)
  return data
end

local get_mesh_path = function(gameobject)
  local components = gameobject_find_components(gameobject, via_render_mesh_rt)
  local data = {}
  if components ~= nil then
    local component_length = components:get_Length()
    for i = 0, component_length - 1, 1 do
      local component = components[i]
      local mesh_resource_holder = component:getMesh()
      if mesh_resource_holder ~= nil then
        table.insert(data, mesh_resource_holder:get_ResourcePath())
      end
    end
  end
  if #data == 1 then
    return data[1]
  end
  return data
end

local prefabs = {}

local prefabs_set_standby = function()
  for _, prefab in ipairs(prefabs) do
    prefab:set_Standby(true)
  end
end

local prefabs_not_ready = function()
  local count = 0
  for _, prefab in ipairs(prefabs) do
    if prefab:get_Ready() == false then
      count = count + 1
    end
  end
  return count
end

local gameobjects = {}

local gameobjects_not_valid = function()
  local count = 0
  for _, gameobject in pairs(gameobjects) do
    if gameobject:get_Valid() == false then
      count = count + 1
    end
  end
  return count
end

local gameobjects_destroy = function()
  for _, gameobject in pairs(gameobjects) do
    gameobject:destroy()
    gameobject:release()
    gameobject = nil
  end
end

local collect_prefab_callbacks = {}

collect_prefab_callbacks.Monster = function(catalog)
  if catalog == nil then
    return nil
  end
  local data = {}
  local list = catalog.enemyCatalogData.EnemyCatalogDataList
  local length = list:get_Length()
  for i = 0, length - 1, 1 do
    local item = list[i]
    table.insert(prefabs, item.EnemyPrefab)
  end
  return data
end

collect_prefab_callbacks.Gimmick = function(catalog)
  if catalog == nil then
    return nil
  end
  local data = {}
  local list = catalog.gimmickCatalogData.GimmickCatalogDataList
  local length = list:get_Length()
  for i = 0, length - 1, 1 do
    local item = list[i]
    table.insert(prefabs, item.GimmickPrefab)
  end
  return data
end

local dump_catalog_callbacks = {}

local dump_monster = function(item)
  if item == nil then
    return nil
  end
  local id = item.EnemyId
  local prefab_path = item.EnemyPrefab:get_ResourcePath()

  local data = {}
  data.id = { name = character_id_get_name(id), value = id }
  data.prefab_path = prefab_path
  local gameobject = gameobjects[prefab_path]
  if gameobject == nil or gameobject:get_Valid() == false then
    data.gameobject = { bad = true }
  else
    local go_data = {}
    go_data.name = gameobject:get_Name()
    go_data.components = {}
    go_data.components.character = get_component_names_for_type(gameobject, ch200000_rt)
    go_data.components.monster = get_component_names_for_type(gameobject, monster_rt)
    go_data.components.other = get_component_names_for_not_types(gameobject, { ch200000_rt, monster_rt })
    local mesh_path = get_mesh_path(gameobject)
    if mesh_path ~= nil then
      go_data.mesh_path = mesh_path
    end
    data.gameobject = go_data
  end
  return data
end

dump_catalog_callbacks.Monster = function(catalog)
  if catalog == nil then
    return nil
  end
  local data = {}
  local list = catalog.enemyCatalogData.EnemyCatalogDataList
  local length = list:get_Length()
  for i = 0, length - 1, 1 do
    local item = list[i]
    local monster = dump_monster(list[i])
    if monster ~= nil then
      table.insert(data, monster)
    end
  end
  return data
end

local dump_gimmick = function(item)
  if item == nil then
    return nil
  end
  local id = item.gimmickId
  local prefab_path = item.GimmickPrefab:get_ResourcePath()

  local data = {}
  data.id = { name = gimmick_id_get_name(id), value = id }
  data.prefab_path = prefab_path
  local gameobject = gameobjects[prefab_path]
  if gameobject == nil or gameobject:get_Valid() == false then
    data.gameobject = { bad = true }
  else
    local go_data = {}
    go_data.name = gameobject:get_Name()
    go_data.components = {}
    go_data.components.gimmick = get_component_names_for_type(gameobject, gimmickbase_rt)
    go_data.components.other = get_component_names_for_not_types(gameobject, { gimmickbase_rt })
    local mesh_path = get_mesh_path(gameobject)
    if mesh_path ~= nil then
      go_data.mesh_path = mesh_path
    end
    data.gameobject = go_data
  end
  return data
end

dump_catalog_callbacks.Gimmick = function(catalog)
  if catalog == nil then
    return nil
  end
  local data = {}
  local list = catalog.gimmickCatalogData.GimmickCatalogDataList
  local length = list:get_Length()
  for i = 0, length - 1, 1 do
    local item = list[i]
    local gimmick = dump_gimmick(list[i])
    if gimmick ~= nil then
      table.insert(data, gimmick)
    end
  end
  return data
end

-- StrayPawn is empty currently...

local current_step = nil

local steps = {}

steps.dump_catalogs = function()
  local data = {}
  local enumerator = generate_manager._Catalogs:GetEnumerator()
  while enumerator:MoveNext() == true do
    local key_value = enumerator:get_Current()
    local key = generator_category_get_name(key_value:get_Key())
    local value = key_value:get_Value()
    local dump_catalog = dump_catalog_callbacks[key]
    local catalog_data = {}
    if dump_catalog ~= nil then
      catalog_data = dump_catalog(value)
    end
    data[key] = catalog_data
  end
  prefabs = {}
  gameobjects_destroy()
  gameobjects = {}
  json.dump_file("gibbed_GenerateCatalogsDump.json", data)
  status = "Done!"
end

steps.wait_gameobjects_valid = function()
  local count = gameobjects_not_valid()
  if count > 0 then
    status = "Waiting on " .. tostring(count) .. " game objects..."
    return steps.wait_gameobjects_valid
  end
  status = "Dumping catalogs..."
  return steps.dump_catalogs
end

steps.instantiate_prefabs = function()
  for _, prefab in ipairs(prefabs) do
    local path = prefab:get_ResourcePath()
    if gameobjects[path] == nil then
      local gameobject = prefab_instantiate(prefab, zero_pos):add_ref()
      gameobject:set_DrawSelf(false)
      gameobject:set_UpdateSelf(false)
      gameobjects[path] = gameobject
    end
  end
  status = "Waiting on game objects..."
  return steps.wait_gameobjects_valid
end

steps.wait_prefabs_ready = function()
  local count = prefabs_not_ready()
  if count > 0 then
    status = "Waiting on " .. tostring(count) .. " prefabs..."
    return steps.wait_prefabs_ready
  end
  status = "Instantiating prefabs..."
  return steps.instantiate_prefabs
end

steps.collect_all_prefabs = function()
  prefabs = {}
  local enumerator = generate_manager._Catalogs:GetEnumerator()
  while enumerator:MoveNext() == true do
    local key_value = enumerator:get_Current()
    local key = generator_category_get_name(key_value:get_Key())
    local value = key_value:get_Value()
    local collect_prefabs = collect_prefab_callbacks[key]
    if collect_prefabs ~= nil then
      collect_prefabs(value)
    end
  end
  prefabs_set_standby()
  status = "Waiting on prefabs..."
  return steps.wait_prefabs_ready
end

re.on_frame(function()
  if current_step == nil then
    return
  end
  local step = current_step
  current_step = nil
  local next_step = step()
  current_step = next_step
end)

re.on_draw_ui(function()
  if imgui.tree_node("Generate Catalog Dumper") then
    imgui.text(status)
    if imgui.button("Dump") and current_step == nil then
      current_step = steps.collect_all_prefabs
    end
    imgui.tree_pop()
  end
end)
