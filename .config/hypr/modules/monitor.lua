------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "5632x0",
    scale    = "1.67",
})

hl.monitor({
    output   = "desc:Samsung Electric Company LS28AG700N H4ZRC02855",
    mode     = "3840x2160@144",
    position = "2560x0",
    scale    = "1.5",
})

hl.monitor({
    output   = "desc:ViewSonic Corporation VX2718-2KPC WAL210200239",
    mode     = "2560x1440@60",
    position = "0x0",
    scale    = "1",
})

-- Monitor switch configuration

-- Trigger when the switch is turning on.
hl.bind(
    "switch:on:Lid Switch",
    function()
        hl.monitor({
            output   = "eDP-1",
            disabled = true
        })
    end,
    { locked = true }
)

-- Trigger when the switch is turning off.
hl.bind(
    "switch:off:Lid Switch",
    function()
        hl.monitor({
            output   = "eDP-1",
            mode     = "preferred",
            position = "5632x0",
            scale    = "1.5",
            disabled = false,
        })
    end,
    { locked = true }
)
