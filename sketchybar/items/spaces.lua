local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

local space_ids = {"z", "a", "s", "d", "f", "1", "2", "3", "4", "5"}

local display_space_map = {
  ["z"] = "1",
  ["a"] = "1",
  ["s"] = "1",
  ["d"] = "1",
  ["f"] = "1",
  ["1"] = "3",
  ["2"] = "3",
  ["3"] = "3",
  ["4"] = "3",
  ["5"] = "2",
}

-- If there's only one display connected, then we display everything in 1
local displays = sbar.query("display")
if #displays == 1 then
  for k, _ in pairs(display_space_map) do
    display_space_map[k] = "1"
  end
end

for _, i in ipairs(space_ids) do
  local space = sbar.add("space", "space." .. i, {
    space = display_space_map[i],
    icon = {
      font = { family = settings.font.numbers },
      string = i,
      padding_left = 15,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 20,
      color = colors.grey,
      highlight_color = colors.white,
      font = "sketchybar-app-font:Regular:16.0",
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = colors.black,
    },
    popup = { background = { border_width = 5, border_color = colors.black } }
  })

  spaces[i] = space

  -- Single item bracket for space items to achieve double border on highlight
  local space_bracket = sbar.add("bracket", { space.name }, {
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      height = 28,
      border_width = 2
    }
  })

  -- Padding space
  sbar.add("space", "space.padding." .. i, {
    space = i,
    script = "",
    width = settings.group_paddings,
  })

  local space_popup = sbar.add("item", {
    position = "popup." .. space.name,
    padding_left= 5,
    padding_right= 0,
    background = {
      drawing = true,
      image = {
        corner_radius = 9,
        scale = 0.2
      }
    }
  })

  space:subscribe("mouse.clicked", function(env)
    if env.BUTTON == "other" then
      space_popup:set({ background = { image = "space." .. env.SID } })
      space:set({ popup = { drawing = "toggle" } })
    else
      sbar.exec("aerospace workspace " .. i)
    end
  end)

  space:subscribe("mouse.exited", function(_)
    space:set({ popup = { drawing = false } })
  end)
end

local workspace_logger = sbar.add("item", {
  drawing = false,
  updates = true,
})

workspace_logger:subscribe("aerospace_workspace_change", function(env)
  local focused_workspace = env.FOCUSED_WORKSPACE
  local focused_workspace_display = display_space_map[focused_workspace]

  -- loop through all spaces and update their state
  for _, i in ipairs(space_ids) do
    local space = spaces[i]
    local current_display = display_space_map[i]
    local selected = (focused_workspace == i)
    if current_display == focused_workspace_display then
      space:set({
        icon = { highlight = selected, },
        label = { highlight = selected },
        background = { border_color = selected and colors.black or colors.bg2 }
      })
    end
  end
end)


local space_window_observer = sbar.add("item", {
  drawing = false,
  updates = true,
})

local function withWindows(f)
  local open_windows = {}
  local get_windows = "aerospace list-windows --monitor all --format '%{workspace}%{app-name}%{window-id}' --json"
  sbar.exec(get_windows, function(workspace_and_windows)
    local processed_windows = {}

    for _, entry in ipairs(workspace_and_windows) do
      local workspace_index = entry.workspace
      local app = entry["app-name"]
      local window_id = entry["window-id"]

      if not processed_windows[window_id] then
        processed_windows[window_id] = true

        if open_windows[workspace_index] == nil then
          open_windows[workspace_index] = {}
        end

        local app_exists = false
        for _, existing_app in ipairs(open_windows[workspace_index]) do
          if existing_app == app then
            app_exists = true
            break
          end
        end

        if not app_exists then
          table.insert(open_windows[workspace_index], app)
        end
      end
    end

    f(open_windows)
  end)
end

local function updateWindow(space_id, open_windows)
  local list = open_windows[space_id] or {}

  local icon_line = ""
  local no_app = true
  for _, app in ipairs(list) do
    no_app = false
    local lookup = app_icons[app]
    local icon = ((lookup == nil) and app_icons["Default"] or lookup)
    icon_line = icon_line .. icon
  end

  if no_app then
    icon_line = " —"
  end

  sbar.animate("tanh", 10, function()
    spaces[space_id]:set({ label = { string = icon_line } })
  end)
end

local function updateWindows()
  withWindows(function(open_windows)
    for _, space_id in ipairs(space_ids) do
      updateWindow(space_id, open_windows)
    end
  end)
end

local spaces_indicator = sbar.add("item", {
  padding_left = -3,
  padding_right = 0,
  icon = {
    padding_left = 8,
    padding_right = 9,
    color = colors.grey,
    string = icons.switch.on,
  },
  label = {
    width = 0,
    padding_left = 0,
    padding_right = 8,
    string = "Spaces",
    color = colors.bg1,
  },
  background = {
    color = colors.with_alpha(colors.grey, 0.0),
    border_color = colors.with_alpha(colors.bg1, 0.0),
  }
})

-- space_window_observer:subscribe("space_windows_change", function(env)
--   local icon_line = ""
--   local no_app = true
--   for app, count in pairs(env.INFO.apps) do
--     no_app = false
--     local lookup = app_icons[app]
--     local icon = ((lookup == nil) and app_icons["Default"] or lookup)
--     icon_line = icon_line .. icon
--   end

--   if (no_app) then
--     icon_line = " —"
--   end
--   sbar.animate("tanh", 10, function()
--     spaces[env.INFO.space]:set({ label = icon_line })
--   end)
-- end)

spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
  local currently_on = spaces_indicator:query().icon.value == icons.switch.on
  spaces_indicator:set({
    icon = currently_on and icons.switch.off or icons.switch.on
  })
end)

space_window_observer:subscribe("aerospace_workspace_change", function()
  updateWindows()
end)

space_window_observer:subscribe("front_app_switched", function()
  updateWindows()
end)

space_window_observer:subscribe("display_change", function()
  updateWindows()
end)

spaces_indicator:subscribe("mouse.entered", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 1.0 },
        border_color = { alpha = 1.0 },
      },
      icon = { color = colors.bg1 },
      label = { width = "dynamic" }
    })
  end)
end)

spaces_indicator:subscribe("mouse.exited", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 0.0 },
        border_color = { alpha = 0.0 },
      },
      icon = { color = colors.grey },
      label = { width = 0, }
    })
  end)
end)

spaces_indicator:subscribe("mouse.clicked", function(env)
  sbar.trigger("swap_menus_and_spaces")
end)

updateWindows()
