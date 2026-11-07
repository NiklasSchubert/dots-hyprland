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

-- Hyprland 0.57 delivers the Super release after every chord, toggling search; catchall is submap-only
local superChordMods = {
    "SUPER", "SUPER + SHIFT", "SUPER + CTRL", "SUPER + ALT",
    "SUPER + CTRL + SHIFT", "SUPER + CTRL + ALT", "SUPER + SHIFT + ALT", "SUPER + CTRL + SHIFT + ALT",
}
local superChordKeys = {
    "Tab", "Return", "Space", "Escape", "BackSpace", "Delete", "Left", "Right", "Up", "Down",
    "Period", "Comma", "Slash", "Minus", "Equal", "Semicolon", "Apostrophe", "Grave",
    "BracketLeft", "BracketRight", "Backslash", "Print", "Home", "End", "Page_Up", "Page_Down",
}
for c = string.byte("A"), string.byte("Z") do table.insert(superChordKeys, string.char(c)) end
for d = 0, 9 do table.insert(superChordKeys, tostring(d)) end
for f = 1, 12 do table.insert(superChordKeys, "F" .. f) end

local interruptSearch = hl.dsp.global("quickshell:searchToggleReleaseInterrupt")
for _, mods in ipairs(superChordMods) do
    for _, key in ipairs(superChordKeys) do
        hl.bind(mods .. " + " .. key, interruptSearch, { non_consuming = true })
    end
end
for _, button in ipairs({ "mouse:272", "mouse:273", "mouse:274", "mouse:275", "mouse:276", "mouse:277", "mouse_up", "mouse_down" }) do
    hl.bind("SUPER + " .. button, interruptSearch, { non_consuming = true })
end
