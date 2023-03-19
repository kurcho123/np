ServerMenu:AddButton({
    icon = '🌡️',
    label = Lang:t("menu.weather_options"),
    value = WeatherMenu,
    description = Lang:t("desc.weather_desc"),
    select = function()
        WeatherMenu:ClearItems()
        local elements = {
            [1] = {
                icon = '☀️',
                label = Lang:t("weather.extra_sunny"),
                value = "EXTRASUNNY",
                description = Lang:t("weather.extra_sunny_desc")
            },
            [2] = {
                icon = '☀️',
                label = Lang:t("weather.clear"),
                value = "CLEAR",
                description = Lang:t("weather.clear_desc")
            },
            [3] = {
                icon = '☀️',
                label = Lang:t("weather.neutral"),
                value = "NEUTRAL",
                description = Lang:t("weather.neutral_desc")
            },
            [4] = {
                icon = '🌁',
                label = Lang:t("weather.smog"),
                value = "SMOG",
                description = Lang:t("weather.smog_desc")
            },
            [5] = {
                icon = '🌫️',
                label = Lang:t("weather.foggy"),
                value = "FOGGY",
                description = Lang:t("weather.foggy_desc")
            },
            [6] = {
                icon = '⛅',
                label = Lang:t("weather.overcast"),
                value = "OVERCAST",
                description = Lang:t("weather.overcast_desc")
            },
            [7] = {
                icon = '☁️',
                label = Lang:t("weather.clouds"),
                value = "CLOUDS",
                description = Lang:t("weather.clouds_desc")
            },
            [8] = {
                icon = '🌤️',
                label = Lang:t("weather.clearing"),
                value = "CLEARING",
                description = Lang:t("weather.clearing_desc")
            },
            [9] = {
                icon = '☂️',
                label = Lang:t("weather.rain"),
                value = "RAIN",
                description = Lang:t("weather.rain_desc")
            },
            [10] = {
                icon = '⛈️',
                label = Lang:t("weather.thunder"),
                value = "THUNDER",
                description = Lang:t("weather.thunder_desc")
            },
            [11] = {
                icon = '❄️',
                label = Lang:t("weather.snow"),
                value = "SNOW",
                description = Lang:t("weather.snow_desc")
            },
            [12] = {
                icon = '🌨️',
                label = Lang:t("weather.blizzard"),
                value = "BLIZZARD",
                description = Lang:t("weather.blizzed_desc")
            },
            [13] = {
                icon = '❄️',
                label = Lang:t("weather.light_snow"),
                value = "SNOWLIGHT",
                description = Lang:t("weather.light_snow_desc")
            },
            [14] = {
                icon = '🌨️',
                label = Lang:t("weather.heavy_snow"),
                value = "XMAS",
                description = Lang:t("weather.heavy_snow_desc")
            },
            [15] = {
                icon = '🎃',
                label = Lang:t("weather.halloween"),
                value = "HALLOWEEN",
                description = Lang:t("weather.halloween_desc")
            }
        }
        for _, v in ipairs(elements) do
            WeatherMenu:AddButton({icon = v.icon,label = v.label,value = v,description = v.description, select = function(btn)
                local selection = btn.Value
                TriggerServerEvent('nocore-weathersync:server:setWeather', selection.value)
                Framework.Functions.Notify(Lang:t("weather.weather_changed", {value = selection.label}))
            end})
        end
    end
})

ServerMenu:AddSlider({
    icon = '⏲️',
    label = Lang:t("menu.server_time"),
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = Lang:t("menu.time")
    }, {
        label = '01',
        value = '01',
        description = Lang:t("menu.time")
    }, {
        label = '02',
        value = '02',
        description = Lang:t("menu.time")
    }, {
        label = '03',
        value = '03',
        description = Lang:t("menu.time")
    }, {
        label = '04',
        value = '04',
        description = Lang:t("menu.time")
    }, {
        label = '05',
        value = '05',
        description = Lang:t("menu.time")
    }, {
        label = '06',
        value = '06',
        description = Lang:t("menu.time")
    }, {
        label = '07',
        value = '07',
        description = Lang:t("menu.time")
    }, {
        label = '08',
        value = '08',
        description = Lang:t("menu.time")
    }, {
        label = '09',
        value = '09',
        description = Lang:t("menu.time")
    }, {
        label = '10',
        value = '10',
        description = Lang:t("menu.time")
    }, {
        label = '11',
        value = '11',
        description = Lang:t("menu.time")
    }, {
        label = '12',
        value = '12',
        description = Lang:t("menu.time")
    }, {
        label = '13',
        value = '13',
        description = Lang:t("menu.time")
    }, {
        label = '14',
        value = '14',
        description = Lang:t("menu.time")
    }, {
        label = '15',
        value = '15',
        description = Lang:t("menu.time")
    }, {
        label = '16',
        value = '16',
        description = Lang:t("menu.time")
    }, {
        label = '17',
        value = '17',
        description = Lang:t("menu.time")
    }, {
        label = '18',
        value = '18',
        description = Lang:t("menu.time")
    }, {
        label = '19',
        value = '19',
        description = Lang:t("menu.time")
    }, {
        label = '20',
        value = '20',
        description = Lang:t("menu.time")
    }, {
        label = '21',
        value = '21',
        description = Lang:t("menu.time")
    }, {
        label = '22',
        value = '22',
        description = Lang:t("menu.time")
    }, {
        label = '23',
        value = '23',
        description = Lang:t("menu.time")
    }},
    select = function(_, value)
        TriggerServerEvent("nocore-weathersync:server:setTime", value, value)
        Framework.Functions.Notify(Lang:t("time.changed", {time = value}))
    end
})

ServerMenu:AddButton({
    icon = '📻',
    label = Lang:t("info.radio_list"),
    value = '',
    description = Lang:t("desc.radio_list"),
    select = function()
            local dialog = exports["nocore-keyboard"]:KeyboardInput({
                header = Lang:t("info.radio_list"),
                rows = { { id = 0, label = "30", helper = "Channel" } }
                })
            if dialog and dialog[1] then
            TriggerServerEvent('nocore-admin:server:getradiolist', dialog[1].input)
        end
    end
})
RegisterNetEvent('nocore-admin:client:getradiolist', function(data, channel)
    local RadioMenu = {
        {
            header = Lang:t('info.radio_list').. ': ' ..channel,
            isMenuHeader = true
        }
    }
    for i = 1, #data do
        RadioMenu[#RadioMenu + 1] = {
            header = data[i].name,
            txt = data[i].id,
            params = {
                event = "",
                args = {
                    name = ''
                }
            }
        }
    end
    exports['nocore-context']:openMenu(RadioMenu)
end)

ServerMenu:AddButton({
    icon = '📦',
    label = Lang:t("menu.pull_stash"),
    value = '',
    description = Lang:t("desc.pull_stash"),
    select = function()
        local dialog = exports["nocore-keyboard"]:KeyboardInput({
            header = Lang:t("menu.pull_stash"),
            rows = { { id = 0, label = "apartment8467", helper = "Stash Name" } }
            })
        if dialog and dialog[1] then
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", tostring(dialog[1].input), {
                maxweight = 5000000,
                slots = 100
            })
            TriggerEvent("nocore-inventory:client:SetCurrentStash", tostring(dialog[1].input))
        end
    end
})
