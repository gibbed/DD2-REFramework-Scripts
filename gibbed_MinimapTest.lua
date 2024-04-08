
local get_gui = function(type_name)
  local list = sdk.get_managed_singleton("app.GuiManager")._GUIList
  if list == nil then
    return nil
  end
  local count = list:get_Count()
  for i = 0, count - 1 do
    local item = list[i]
    if item ~= nil and item:get_type_definition():get_name() == type_name then
      return item
    end
  end
  return nil
end

local via_gui_material_t = sdk.find_type_definition("via.gui.Material")
local via_gui_material_rt = via_gui_material_t:get_runtime_type()
local via_gui_control_get_object = sdk.find_type_definition("via.gui.Control"):get_method("getObject(System.String, System.Type)")

re.on_draw_ui(function()
  if imgui.tree_node("Minimap Test") then
    local component = get_gui("ui020301")
    if component ~= nil then
      imgui.text(tostring(component:get_type_definition():get_name()))
      local root_view = component.Root
      if root_view ~= nil then
        imgui.text(tostring(root_view:get_type_definition():get_name()))
        local mat_bg = via_gui_control_get_object(root_view, "PNL_All/PNL_Bg/mat_Bg", via_gui_material_rt)
        if mat_bg ~= nil then
          imgui.text(tostring(mat_bg:get_type_definition():get_name()))
          if imgui.button("Visible = false") then
            mat_bg:set_Visible(false)
          end
          if imgui.button("Visible = true") then
            mat_bg:set_Visible(true)
          end
        end
      end
    end
    imgui.tree_pop()
  end
end)
