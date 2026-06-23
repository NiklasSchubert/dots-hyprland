hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"), {
    description = "Edit shell config",
})
hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {
    description = "Edit user keybinds",
})

-- Unbind base browser bind, rebind to toggle floating
hl.unbind("SUPER + W")
hl.bind("SUPER + W", hl.dsp.window.float({ action = "toggle" }), {
    description = "Window: Toggle floating",
})

-- Unbind base fullscreen bind, rebind to Firefox
hl.unbind("SUPER + F")
hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"), {
    description = "App: Firefox",
})

-- Unbind base text editor bind, use for resize window (mouse drag)
hl.unbind("SUPER + X")
hl.bind("SUPER + Z", hl.dsp.window.drag(), { mouse = true, description = "Window: Move (drag)" })
hl.bind("SUPER + X", hl.dsp.window.resize(), { mouse = true, description = "Window: Resize (drag)" })

hl.bind("CTRL + SUPER + Right", hl.dsp.exec_raw("workspace r+1"))
hl.bind("CTRL + SUPER + Left", hl.dsp.exec_raw("workspace r-1"))
hl.bind("CTRL + SUPER + Down", hl.dsp.exec_raw("workspace empty"))

-- Unbind base SHIFT+SUPER+arrow (window move direction) to use for resize instead
hl.unbind("SHIFT + SUPER + Left")
hl.unbind("SHIFT + SUPER + Right")
hl.unbind("SHIFT + SUPER + Up")
hl.unbind("SHIFT + SUPER + Down")
hl.bind("SHIFT + SUPER + Right", hl.dsp.exec_raw("resizeactive 30 0"), { repeating = true })
hl.bind("SHIFT + SUPER + Left", hl.dsp.exec_raw("resizeactive -30 0"), { repeating = true })
hl.bind("SHIFT + SUPER + Up", hl.dsp.exec_raw("resizeactive 0 -30"), { repeating = true })
hl.bind("SHIFT + SUPER + Down", hl.dsp.exec_raw("resizeactive 0 30"), { repeating = true })

-- Move focused window to workspace (Super+Shift+number)
for i = 1, 10 do
    local key = i % 10
    hl.bind("SHIFT + SUPER + " .. key, hl.dsp.window.move({ workspace = tostring(i) }), {
        description = "Window: Move to workspace " .. i,
    })
end

-- Move focused window to workspace silently (Super+Alt+number)
for i = 1, 10 do
    local key = i % 10
    hl.unbind("SUPER + ALT + " .. key) -- unbind base workspace_in_group binding
    hl.bind("SUPER + ALT + " .. key, hl.dsp.window.move({ workspace = tostring(i), follow = false }), {
        description = "Window: Send to workspace " .. i,
    })
end

hl.bind("ALT + SUPER + S", hl.dsp.window.move({ workspace = "special:special", follow = false }))

-- Unbind base bar toggle, use for togglesplit
hl.unbind("SUPER + J")
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"), { description = "Window: Toggle split" })

hl.bind("CTRL + SUPER + ALT + Right", hl.dsp.exec_raw("movetoworkspace r+1"))
hl.bind("CTRL + SUPER + ALT + Left", hl.dsp.exec_raw("movetoworkspace r-1"))

-- Unbind base on-screen keyboard toggle to use Super+K for keyboard layout switching
hl.unbind("SUPER + K")
hl.bind("SUPER + K", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), {
    description = "Input: Switch keyboard layout",
})
