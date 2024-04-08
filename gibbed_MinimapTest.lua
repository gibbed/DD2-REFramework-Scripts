
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

local via_gui_playobject_t = sdk.find_type_definition("via.gui.PlayObject")
local via_gui_playobject_rt = via_gui_playobject_t:get_runtime_type()
local via_gui_control_get_object = sdk.find_type_definition("via.gui.Control"):get_method("getObject(System.String, System.Type)")

re.on_draw_ui(function()
  if imgui.tree_node("Minimap Test") then
    -- Abuse "repeat until true" as a way to break out the code block early instead of using nested ifs.
    repeat
      -- Get the GUI component with type name 'ui020301'
      local component = get_gui("ui020301")
      if component == nil then
        break
      end

      -- Show the type name of the component
      imgui.text(tostring(component:get_type_definition():get_name()))

      -- Get the root view of the component
      local root_view = component.Root
      if root_view == nil then
        break
      end

      -- Show the type name of the root view
      imgui.text(root_view:get_Name() .. ": " .. tostring(root_view:get_type_definition():get_name()))

      -- Get the nested object named 'PNL_Bg', which is nested under 'PNL_All'
      local pnl_bg = via_gui_control_get_object(root_view, "PNL_All/PNL_Bg", via_gui_playobject_rt)
      if pnl_bg == nil then
        break
      end

      -- Show the type name of 'PNL_Bg'
      imgui.text(pnl_bg:get_Name() .. ": " .. tostring(pnl_bg:get_type_definition():get_name()))

      -- Get the nested object named 'blr_Bg', which is nested under 'PNL_Bg'
      local blr_bg = via_gui_control_get_object(pnl_bg, "blr_Bg", via_gui_playobject_rt)
      if blr_bg ~= nil then
        -- Show the type name of 'blr_bg'
        imgui.text(blr_bg:get_Name() .. ": " .. tostring(blr_bg:get_type_definition():get_name()))

        -- Some buttons to toggle visibility
        if imgui.button("blr_Bg: Visible = false") then
          blr_bg:set_Visible(false)
        end
        if imgui.button("blr_Bg: Visible = true") then
          blr_bg:set_Visible(true)
        end
      end

      -- Get the nested object named 'mat_Bg', which is nested under 'PNL_Bg'
      local mat_bg = via_gui_control_get_object(pnl_bg, "mat_Bg", via_gui_playobject_rt)
      if mat_bg ~= nil then
        -- Show the type name of 'mat_Bg'
        imgui.text(mat_bg:get_Name() .. ": " .. tostring(mat_bg:get_type_definition():get_name()))

        -- Some buttons to toggle visibility
        if imgui.button("mat_bg: Visible = false") then
          mat_bg:set_Visible(false)
        end
        if imgui.button("mat_bg: Visible = true") then
          mat_bg:set_Visible(true)
        end
      end
    until true
    imgui.tree_pop()
  end
end)
