-- Re-enable window blur (base disables it for all windows) and add translucency so blur shows
hl.window_rule({ match = { class = ".*" }, no_blur = false, opacity = 0.9 })
