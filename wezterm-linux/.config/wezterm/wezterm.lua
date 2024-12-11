-- Pull in wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 12

config.macos_window_background_blur = 24

config.inactive_pane_hsb = {
    saturation = 0.2,
    brightness = 0.2
}

config.window_decorations = "RESIZE"
config.enable_tab_bar = true

config.window_padding = {
    left = 0,
    right = 0,
    bottom = 0,
    top = 0,
}

-- tmux
config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 2000 }
config.keys = {
    -- pane select
    {
        mods = "LEADER",
        key = "s",
        action = wezterm.action.PaneSelect {
            mode = 'SwapWithActive'
        },
    },

    {
        mods = "SUPER",
        key = "n",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },

    {
        mods = "CMD",
        key = "w",
        action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },

    {
        mods = "ALT",
        key = "n",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
        mods = "ALT",
        key = "w",
        action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },

    {
        mods = "SUPER|SHIFT",
        key = "h",
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        mods = "SUPER|SHIFT",
        key = "l",
        action = wezterm.action.ActivateTabRelative(1),
    },

    {
        mods = "ALT|SHIFT",
        key = "h",
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        mods = "ALT|SHIFT",
        key = "l",
        action = wezterm.action.ActivateTabRelative(1),
    },

    {
        mods = "CMD",
        key = "\\",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        mods = "CMD",
        key = "-",
        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        mods = "ALT",
        key = "\\",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        mods = "ALT",
        key = "-",
        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },

    -- for mac specific keys
    {
        mods = "CMD",
        key = "h",
        action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
        mods = "CMD",
        key = "j",
        action = wezterm.action.ActivatePaneDirection("Down"),
    },
    {
        mods = "CMD",
        key = "k",
        action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
        mods = "CMD",
        key = "l",
        action = wezterm.action.ActivatePaneDirection("Right"),
    },

    {
        mods = "ALT",
        key = "h",
        action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
        mods = "ALT",
        key = "j",
        action = wezterm.action.ActivatePaneDirection("Down"),
    },
    {
        mods = "ALT",
        key = "k",
        action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
        mods = "ALT",
        key = "l",
        action = wezterm.action.ActivatePaneDirection("Right"),
    },

    {
        mods = "CMD",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize({ "Left", 3 }),
    },
    {
        mods = "CMD",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize({ "Right", 3 }),
    },
    {
        mods = "CMD",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
    },
    {
        mods = "CMD",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
    },
    {
        mods = "ALT",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize({ "Left", 3 }),
    },
    {
        mods = "ALT",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize({ "Right", 3 }),
    },
    {
        mods = "ALT",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
    },
    {
        mods = "ALT",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
    },
    {
        mods = "LEADER",
        key = "z",
        action = wezterm.action.TogglePaneZoomState,
    },
}

config.window_background_opacity = 0.8

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/home/vince/.config/wallpapers/wallpaper.png",
-- 		},
-- 		hsb = dimmer,
-- 		width = "100%",
-- 		height = "100%",
-- 		opacity = 1,
-- 	},
-- }

for i = 0, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i),
    })
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
    local SOLID_LEFT_ARROW = ""
    local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
    local prefix = ""

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f30a) -- ocean wave
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    end

    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
    end -- arrow color based on if tab is first pane

    window:set_left_status(wezterm.format({
        { Background = { Color = "#b7bdf8" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW },
    }))
end)

return config
