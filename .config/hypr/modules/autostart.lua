-------------------
---- AUTOSTART ----
-------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local isCaelestiaEnabled = true;

hl.on("hyprland.start", function()
    if isCaelestiaEnabled then
        return
    end
    hl.exec_cmd("walker --gapplication-service")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("waybar & hyprpaper")
end)
