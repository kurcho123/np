

RegisterNetEvent('nocore-police:client:send:alert:dead')
AddEventHandler('nocore-police:client:send:alert:dead', function(Coords, StreetName)
        if Config.UsingDispatch then
            exports['nocore-dispatch']:addCall('10-30B', "Пострадал гражданин", {{
                icon = "fa-globe-europe",
                info = StreetName
            }}, {Coords.x, Coords.y, Coords.z}, "ambulance", 7500, 480, 5)
        else
            TriggerEvent('nocore-alerts:client:send:alert', {
                timeOut = 7500,
                alertTitle = "Citizen need help",
                priority = 1,
                coords = {
                    x = Coords.x,
                    y = Coords.y,
                    z = Coords.z
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = StreetName
                    }
                },
                callSign = '10-30B'
            }, true)
            AddAlert('Citizen need help', 480, 250, Coords, false, true)
        end
end)

RegisterNetEvent('nocore-police:client:send:bank:alert')
AddEventHandler('nocore-police:client:send:bank:alert', function(Coords, StreetName)
        if Config.UsingDispatch then
            exports['nocore-dispatch']:addCall('10-90B', "Fleeca Bank", {{
                icon = "fa-globe-europe",
                info = StreetName
            }}, {Coords.x, Coords.y, Coords.z}, "police", 15000, 108, 5)
        else
            TriggerEvent('nocore-alerts:client:send:alert', {
                timeOut = 15000,
                alertTitle = "Fleeca Bank",
                priority = 1,
                coords = {
                    x = Coords.x,
                    y = Coords.y,
                    z = Coords.z
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = StreetName
                    }
                },
                callSign = '10-42A'
            }, false)
            AddAlert('Fleeca Bank', 108, 250, Coords, false, true)
        end
end)

RegisterNetEvent('nocore-police:client:send:big:bank:alert')
AddEventHandler('nocore-police:client:send:big:bank:alert', function(Coords, StreetName)
        if Config.UsingDispatch then
            exports['nocore-dispatch']:addCall('10-90B', "Pacific Bank", {{
                icon = "fa-globe-europe",
                info = StreetName
            }}, {Coords.x, Coords.y, Coords.z}, "police", 15000, 108, 5)
        else
            TriggerEvent('nocore-alerts:client:send:alert', {
                timeOut = 15000,
                alertTitle = "Pacific Bank",
                priority = 1,
                coords = {
                    x = Coords.x,
                    y = Coords.y,
                    z = Coords.z
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = StreetName
                    }
                },
                callSign = '10-35A'
            }, false)
            AddAlert('Pacific Bank', 108, 250, Coords, false, true)
        end
end)

RegisterNetEvent('nocore-police:client:send:alert:jewellery')
AddEventHandler('nocore-police:client:send:alert:jewellery', function(Coords, StreetName)
        if Config.UsingDispatch then
            exports['nocore-dispatch']:addCall('10-90J', "Vangelico Jewellery", {{
                icon = "fa-globe-europe",
                info = StreetName
            }}, {Coords.x, Coords.y, Coords.z}, "police", 15000, 617, 5)
        else
            TriggerEvent('nocore-alerts:client:send:alert', {
                timeOut = 15000,
                alertTitle = "Vangelico Jewellery",
                priority = 1,
                coords = {
                    x = Coords.x,
                    y = Coords.y,
                    z = Coords.z
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = StreetName
                    }
                },
                callSign = '10-42A'
            }, false)
            AddAlert('Vangelico Jewellery', 617, 250, Coords, false, true)
        end
    --end
end)

RegisterNetEvent('nocore-police:client:send:alert:ammunation')
AddEventHandler('nocore-police:client:send:alert:ammunation', function(Coords, StreetName)
        if Config.UsingDispatch then
            exports['nocore-dispatch']:addCall('10-90A', "Ammu Nation", {{
                icon = "fa-globe-europe",
                info = StreetName
            }}, {Coords.x, Coords.y, Coords.z}, "police", 15000, 617, 5)
        else
            TriggerEvent('nocore-alerts:client:send:alert', {
                timeOut = 15000,
                alertTitle = "Ammu Nation",
                priority = 1,
                coords = {
                    x = Coords.x,
                    y = Coords.y,
                    z = Coords.z
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = StreetName
                    }
                },
                callSign = '10-42A'
            }, false)
            AddAlert('Ammu Nation', 617, 250, Coords, false, true)
        end
end)

RegisterNetEvent('nocore-police:client:send:train')
AddEventHandler('nocore-police:client:send:train', function(c)
    local t, cs = 'Обир на Влак', '10-90V'
    exports['nocore-dispatch']:addCall(cs, t, {{
        icon = "fa-globe-europe",
        info = Framework.Functions.GetStreetLabel()
    }}, {c.x, c.y, c.z}, 'police', 3000, 568, 27)
end)


RegisterNetEvent('nocore-police:client:send:tracker:alert')
AddEventHandler('nocore-police:client:send:tracker:alert', function(Coords, Name)
    if (Framework.Functions.GetPlayerData().job.name == "police") and Framework.Functions.GetPlayerData().job.onduty then
        AddAlert('Anklenecklace Location: ' .. Name, 480, 250, Coords, true, true)
    end
end)

-- // Funtions \\ --

function AddAlert(Text, Sprite, Transition, Coords, Tracker, Flashing)
    local Transition = Transition
    local Blips = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
    SetBlipSprite(Blips, Sprite)
    SetBlipColour(Blips, 6)
    SetBlipDisplay(Blips, 4)
    SetBlipAlpha(Blips, transG)
    SetBlipScale(Blips, 1.0)
    SetBlipAsShortRange(Blips, false)
    if Flashing then
        SetBlipFlashes(Blips, true)
    end
    BeginTextCommandSetBlipName('STRING')
    if not Tracker then
        AddTextComponentString('Melding: ' .. Text)
    else
        AddTextComponentString(Text)
    end
    EndTextCommandSetBlipName(Blips)
    while Transition ~= 0 do
        Wait(180 * 4)
        Transition = Transition - 1
        SetBlipAlpha(Blips, Transition)
        if Transition == 0 then
            SetBlipSprite(Blips, 2)
            RemoveBlip(Blips)
            return
        end
    end
end


