---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "walker -H"
local nightMode   = "$HOME/.local/bin/night-mode"
local powerMenu   = "$HOME/.local/bin/walker-power"


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(menu .. " -NH -m clipboard"))
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd(nightMode))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Swap active window with neighbor (SUPER + SHIFT + vim/arrows)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }), { description = "Swap window to the left" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }), { description = "Swap window to the right" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "u" }), { description = "Swap window up" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "d" }), { description = "Swap window down" })

-- Move workspace to adjacent monitor (CTRL + SUPER + SHIFT + A/F)
-- Note: movecurrentworkspacetomonitor becomes hl.dsp.workspace.move_current({ monitor = ... })
hl.bind(
    "CTRL + " .. mainMod .. " + SHIFT + A",
    hl.dsp.workspace.move({ monitor = "+1" }),
    { description = "Move workspace to the right monitor" }
)
hl.bind(
    "CTRL + " .. mainMod .. " + SHIFT + F",
    hl.dsp.workspace.move({ monitor = "-1" }),
    { description = "Move workspace to the left monitor" }
)

-- Tab keybinds: Cycle windows and bring to top
-- Multiple actions on one key require a lambda function
hl.bind(
    "ALT + Tab",
    function()
        hl.dispatch(hl.dsp.window.cycle_next())   -- Cycle between windows
        hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring active window to top
    end,
    { description = "Cycle and raise window" }
)

-- Workspace switching with mainMod + Tab
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "+1" }), { description = "Open next workspace" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "-1" }), { description = "Open previous workspace" })

-- Resize active window (using keycodes for - and = keys)
-- code:20 is '-', code:21 is '='
-- Note: resizeactive takes a table { x = val, y = val, relative = true }
hl.bind(
    mainMod .. " + code:20",
    hl.dsp.window.resize({ x = -100, y = 0, relative = true }),
    { description = "Expand window left" }
)
hl.bind(
    mainMod .. " + code:21",
    hl.dsp.window.resize({ x = 100, y = 0, relative = true }),
    { description = "Shrink window left" }
)
-- Note: positive X shrinks if tiled left
hl.bind(
    mainMod .. " + SHIFT + code:20",
    hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
    { description = "Shrink window up" }
)
hl.bind(
    mainMod .. " + SHIFT + code:21",
    hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
    { description = "Expand window down" }
)

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Copy / Paste / Cut (Universal shortcuts)
-- sendshortcut syntax: hl.dsp.send_shortcut({ mods = {...}, key = "Key" })
hl.bind(mainMod .. " + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert" }),
    { description = "Universal copy" })
hl.bind(mainMod .. " + V", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert" }),
    { description = "Universal paste" })
hl.bind(mainMod .. " + X", hl.dsp.send_shortcut({ mods = "CTRL", key = "X" }),
    { description = "Universal cut" })

-- Toggle groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "Toggle window grouping" })
hl.bind(mainMod .. " + ALT + G", hl.dsp.window.move({ out_of_group = true }),
    { description = "Move active window out of group" })

-- Join groups (move window into neighbor group)
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ into_group = "l" }),
    { description = "Move window to group on left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ into_group = "r" }),
    { description = "Move window to group on right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ into_group = "u" }),
    { description = "Move window to group on top" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ into_group = "d" }),
    { description = "Move window to group on bottom" })

-- Navigate a single set of grouped windows (Next/Prev)
hl.bind(mainMod .. " + ALT + Tab", hl.dsp.group.next(), { description = "Next window in group" })
hl.bind(mainMod .. " + ALT + SHIFT + Tab", hl.dsp.group.prev(), { description = "Previous window in group" })


-- Window navigation for grouped windows (Legacy directional style)
-- Note: 'b' (back) and 'f' (forward) map to prev/next in the new API
hl.bind(mainMod .. " + CTRL + left", hl.dsp.group.prev(), { description = "Move grouped window focus left/back" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.group.next(), { description = "Move grouped window focus right/forward" })

-- Scroll through grouped windows with SUPER + ALT + Scroll
-- Mouse binds use 'mouse_up' and 'mouse_down' directly
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.group.next(), { description = "Next window in group (scroll)" })
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.group.prev(), { description = "Previous window in group (scroll)" })

-- Activate window in a group by number (1-5)
-- Keycodes: code:10='1', code:11='2', etc.
hl.bind(mainMod .. " + ALT + code:10", hl.dsp.group.active({ index = 1 }), { description = "Switch to group window 1" })
hl.bind(mainMod .. " + ALT + code:11", hl.dsp.group.active({ index = 2 }), { description = "Switch to group window 2" })
hl.bind(mainMod .. " + ALT + code:12", hl.dsp.group.active({ index = 3 }), { description = "Switch to group window 3" })
hl.bind(mainMod .. " + ALT + code:13", hl.dsp.group.active({ index = 4 }), { description = "Switch to group window 4" })
hl.bind(mainMod .. " + ALT + code:14", hl.dsp.group.active({ index = 5 }), { description = "Switch to group window 5" })


-- Construct the base OSD command dynamically or statically depending on preference
-- For performance, you might prefer defining the command inline in each bind
-- using the shell's command substitution directly inside the string.
local osdclient = "swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\""

-- Laptop multimedia keys (Volume & Brightness with OSD)
-- bindel (locked + repeating) -> { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume raise"),
    { locked = true, repeating = true, description = "Volume up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume lower"),
    { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(osdclient .. " --output-volume mute-toggle"),
    { locked = true, description = "Mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(osdclient .. " --input-volume mute-toggle"),
    { locked = true, description = "Mute microphone" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness raise"),
    { locked = true, repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness lower"),
    { locked = true, repeating = true, description = "Brightness down" })

-- Precise 1% multimedia adjustments with Alt modifier
-- bindeld (locked + repeating + release?) -> Usually just locked + repeating for media
-- Note: Your original config used 'bindeld'. In hyprlang: 'e'=repeat, 'l'=locked, 'd'=description.
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume +1"),
    { locked = true, repeating = true, description = "Volume up precise" })
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume -1"),
    { locked = true, repeating = true, description = "Volume down precise" })
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness 1%+"),
    { locked = true, repeating = true, description = "Brightness up precise" })
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness 1%-"),
    { locked = true, repeating = true, description = "Brightness down precise" })

-- PlayerCTL controls (Media playback)
-- bindl (locked) -> { locked = true }
-- These work even when the screen is locked or an input inhibitor is active
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(osdclient .. " --playerctl next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"),
    { locked = true, description = "Pause" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), { locked = true, description = "Play" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(osdclient .. " --playerctl previous"),
    { locked = true, description = "Previous track" })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
--     { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
--     { locked = true, repeating = true })
-- hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
--     { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
--     { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
