local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD Settings Loaded!",
        ["hud_restart"] = "HUD Is Restarting!",
        ["hud_start"] = "HUD Is Now Started!",
        ["hud_command_info"] = "This command resets your current HUD settings!",
        ["load_square_map"] = "Square Map Loading...",
        ["loaded_square_map"] = "Square Map Has Loaded!",
        ["load_circle_map"] = "Circle Map Loading...",
        ["loaded_circle_map"] = "Circle Map Has Loaded!",
        ["cinematic_on"] = "Cinematic Mode On!",
        ["cinematic_off"] = "Cinematic Mode Off!",
        ["engine_on"] = "Двигателят е включен!",
        ["engine_off"] = "Двигателят е изключен!",
        ["low_fuel"] = "Ниско ниво на горивото!",
        ["access_denied"] = "Нямате достъп!",
        ["stress_gain"] = "Чувствате се по-стресирани!",
        ["stress_removed"] = "Чувствате се по-спокойни!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
