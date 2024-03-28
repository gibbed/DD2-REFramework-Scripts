local dump_data = function()
  local generate_manager = sdk.get_managed_singleton("app.GenerateManager")
  local enumerator = generate_manager._NeverGenetateID:GetEnumerator()
  local unique_ids = {}
  while enumerator:MoveNext() == true do
    local unique_id = enumerator:get_Current()
    table.insert(unique_ids, unique_id:ToString())
  end
  json.dump_file("gibbed_NeverGenerateDump.json", unique_ids)
end

re.on_draw_ui(function()
  if imgui.tree_node("Never Generate Dumper") then
    if imgui.button("Dump") then
      dump_data()
    end
    imgui.tree_pop()
  end
end)
