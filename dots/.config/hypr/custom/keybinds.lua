hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

-- Unbind base on-screen keyboard toggle to use Super+K for keyboard layout switching
hl.unbind("SUPER + K")
hl.bind("SUPER + K", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), {
    description = "Input: Switch keyboard layout",
})
