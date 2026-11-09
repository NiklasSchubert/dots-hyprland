-- Re-enable window blur (base disables it for all windows) and add translucency so blur shows
hl.window_rule({ match = { class = ".*" }, no_blur = false, opacity = 0.9 })
-- Translucency is for tiled windows; fullscreen video and games should cover the wallpaper.
hl.window_rule({ match = { fullscreen = true }, opaque = true })
