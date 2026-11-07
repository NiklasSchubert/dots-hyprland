-- 3-finger swipe moves workspaces instead of windows
hl.gesture({
    fingers = 3,
    direction = "swipe",
    action = "unset",
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.config({
    gestures = {
        workspace_swipe_invert = true,
    },
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
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 2
})
