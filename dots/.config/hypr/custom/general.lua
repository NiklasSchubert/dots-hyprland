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
})
