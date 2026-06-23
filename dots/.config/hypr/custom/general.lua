-- Custom 3-finger horizontal gesture for workspace switching
-- (overrides base 3-finger swipe=move gesture)
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.config({
    input = {
        kb_layout = "de,us",
        kb_variant = ",altgr-intl",
    },
    decoration = {
        blur = {
            xray = false,
            size = 6,
            passes = 3,
            noise = 0.025,
            contrast = 0.5,
            vibrancy = 0.5,
            vibrancy_darkness = 0.5,
        },
    },
    misc = {
        vrr = true,
    },
    general = {
        allow_tearing = false,
    },
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1.6
})
