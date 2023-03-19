RegisterCommand('sadmin', function ()
    TriggerEvent('nocore-storageunits:adminMenu')
end)

AddEventHandler('nocore-storageunits:adminMenu', function ()
    if Framework.Functions.GetPlayerData().citizenid == "IGW94508" then
        local Menu = {}
        Menu[#Menu+1] = {
            id = #Menu+1,
            header = "Storages Admin",
            icon = 'fas fa-box-open',
            isMenuHeader = true
        }
        Menu[#Menu+1] = {
            id = #Menu+1,
            header = 'Всички складове',
            txt = 'Покажи всички складове на мапа',
            icon = 'fas fa-box-archive',
            params = {
                event = 'nocore-storageunits:showAllStorages',
            }
        }
        Menu[#Menu+1] = {
            id = #Menu+1,
            header = 'Всички складове',
            txt = 'Покажи всички складове в context menu',
            icon = 'fas fa-box-archive',
            params = {
                event = 'nocore-storageunits:showAllStoragesContext',
            }
        }
        Menu[#Menu+1] = {
            id = #Menu+1,
            header = 'Затвори',
            icon = 'fas fa-xmark',
        }
        exports['nocore-context']:openMenu(Menu)
    end
end)

AddEventHandler('nocore-storageunits:showAllStorages', function ()
	for k, v in pairs(Shared.Storages) do
        if StorageData[k] ~= nil then
            if tonumber(StorageData[k].owned) ~= 0 and tonumber(StorageData[k].expired) ~= 1 then
                v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
                SetBlipSprite (v.blip, 128)
                SetBlipDisplay(v.blip, 4)
                SetBlipScale  (v.blip, 0.8)
                SetBlipColour (v.blip, 1)
                ShowNumberOnBlip(v.blip, k)
                SetBlipAsShortRange(v.blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Зает storage '..k)
                EndTextCommandSetBlipName(v.blip)
                SetTimeout(15000, function ()
                    RemoveBlip(v.blip)
                end)
            elseif tonumber(StorageData[k].expired) ~= 0 and tonumber(StorageData[k].owned) ~= 1 then
                v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
                SetBlipSprite (v.blip, 128)
                SetBlipDisplay(v.blip, 4)
                SetBlipScale  (v.blip, 0.8)
                SetBlipColour (v.blip, 28)
                ShowNumberOnBlip(v.blip, k)
                SetBlipAsShortRange(v.blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Изтекъл storage '..k)
                EndTextCommandSetBlipName(v.blip)
                SetTimeout(15000, function ()
                    RemoveBlip(v.blip)
                end)
            end
        else
            v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite (v.blip, 128)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale  (v.blip, 0.8)
            SetBlipColour (v.blip, 2)
            ShowNumberOnBlip(v.blip, k)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('Свободен storage '..k)
            EndTextCommandSetBlipName(v.blip)
            SetTimeout(15000, function ()
                RemoveBlip(v.blip)
            end)
        end
	end
    Framework.Functions.Notify("Всички складове са показани на картата! <br> <span style='color:#47cf73'>Зелено</span> - Свободен <br> <span style='color:#ffff00'>Жълто</span> - Изтекъл <br> <span style='color:#ff0000'>Червено</span> - Зает", 'info', 7500, 'Storages')
end)

AddEventHandler('nocore-storageunits:showAllStoragesContext', function ()
    local Menu = {}
    Menu[#Menu+1] = {
        id = 1,
        header = "Всички складове",
        icon = 'fas fa-box-open',
        isMenuHeader = true
    }
    for k, v in pairs(Shared.Storages) do
        if StorageData[k] then
            if StorageData[k].owned == true and tonumber(StorageData[k].expired) == 0 then
                Menu[#Menu+1] = {
                    id = #Menu+1,
                    header = k,
                    icon = 'fas fa-xmark',
                    txt = 'Цъкни, за да сложиш waypoint на този склад',
                    params = {
                        event = 'nocore-storage:SetWaypoint',
                        args = {
                            storageId = k
                        }
                    }
                }
            elseif tonumber(StorageData[k].expired) == 1 and StorageData[k].owned == false then
                Menu[#Menu+1] = {
                    id = #Menu+1,
                    header = k,
                    icon = 'fas fa-clock-rotate-left',
                    txt = 'Цъкни, за да сложиш waypoint на този склад',
                    params = {
                        event = 'nocore-storage:SetWaypoint',
                        args = {
                            storageId = k
                        }
                    }
                }
            end
        else
            Menu[#Menu+1] = {
                id = #Menu+1,
                header = k,
                icon = 'fas fa-check',
                txt = 'Цъкни, за да сложиш waypoint на този склад',
                params = {
                    event = 'nocore-storage:SetWaypoint',
                    args = {
                        storageId = k
                    }
                }
            }
        end
	end
    exports['nocore-context']:openMenu(Menu)
end)

AddEventHandler('nocore-storage:SetWaypoint', function (data)
    for k, v in pairs(Shared.Storages) do
        if data.storageId == k then
            SetNewWaypoint(v.coords.x, v.coords.y)
        end
    end
end)