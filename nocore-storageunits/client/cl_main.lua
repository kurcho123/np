Framework = exports['no-core']:GetCoreObject()
StorageTargets = {}
StorageData = {}

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1000, function()
        Citizen.Wait(150)
        Framework.Functions.TriggerCallback('nocore-storageunits:GetConfig', function(data)
            StorageData = data
        end)
    end)
end)

RegisterNetEvent('nocore-storageunits:updateData', function(data)
    StorageData = data
end)

CreateThread(function()
    for k, v in pairs(Shared.Storages) do
        StorageTargets[k] = exports['nocore-eye']:AddBoxZone("Storage_".. k, v.coords, v.width, v.length, {
            name = "Storage_".. k,
            heading = v.heading,
            debugPoly = Shared.Debug,
            minZ=v.minZ,
            maxZ=v.maxZ
        }, {
            options = {
            {
                event = "nocore-storageunits:openstorage",
                icon = "fas fa-box",
                label = 'Склад',
                id = k,
            },
            {
                event = "nocore-storageunits:changepassword",
                icon = "fas fa-key",
                label = 'Смени паролата',
                id = k,
                canInteract = function ()
                    return StorageData[k] ~= nil and Framework.Functions.GetPlayerData().citizenid == StorageData[k].owner and StorageData[k].expired ~= nil and StorageData[k].expired ~= 1
                end
            }
        },
            distance = 1.5
        })
    end
end)

RegisterNetEvent('nocore-storageunits:openstorage', function(data)
    Framework.Functions.TriggerCallback('nocore-storageunits:isStorageOwned', function(owned)
        if owned then
            Framework.Functions.TriggerCallback('nocore-storageunits:isExpired', function(expired)
                if not expired then
                    local input = lib.inputDialog('Склад', {
                        { type = "input", label = "Парола за склада", password = true, icon = 'lock' },
                    })
                    if input and input[1] then
                        Framework.Functions.TriggerCallback('nocore-storageunits:Checkpassword', function(allowed)
                            if allowed then
                                OpenStorage(data.id)
                            else
                                Framework.Functions.Notify('Въведохте грешен пин код', 'error')
                            end
                        end, data.id, input[1])
                    end
                else
                    Framework.Functions.Notify('Този склад е заключен, защото не е бил платен', 'error')
                end
            end, data.id)
        else
            local alert = lib.alertDialog({
                header = 'Наеми склад',
                content = 'Складът не приндалежи на никой, желаете ли да го наемете?  \n  Заплащанията стават само чрез банков превод!  \n  Цена за наем на склада - ' ..Shared.RentPrice.. '$/седмица',
                centered = true,
                cancel = true
            })
            if alert == 'confirm' then
                local keyboard = lib.inputDialog('Слагане на парола', {
                    { type = "input", label = "Парола", password = true, icon = 'lock' },
                })
                if keyboard and keyboard[1] then
                    local Password = tostring(keyboard[1])
                    Framework.Functions.TriggerCallback('nocore-storageunits:BuyStorage', function(bought)
                        if bought then
                            Framework.Functions.Notify('Успешно нае склад '..data.id.. ' за 1 седмица', 'success', 5000, 'Storages')
                        end
                    end, data.id, Password)
                end
            end
        end
    end, data.id)
end)

RegisterNetEvent('nocore-storageunits:changepassword', function(data)
    local keyboard = lib.inputDialog('Смяна на паролата', {
        { type = "input", label = "Нова парола", password = true, icon = 'lock' },
    })
    if keyboard and keyboard[1] then
        local newPassword = tostring(keyboard[1])
        Framework.Functions.TriggerCallback('nocore-storageunits:ChangePassword', function(changed)
            if changed then
                Framework.Functions.Notify('Успешно смени паролата на склад '..data.id, 'success', 5000, 'Storages')
            end
        end, data.id, newPassword)
    end
end)

AddEventHandler('onResourceStop', function(r)
    if (GetCurrentResourceName() == r) then
      for k, v in pairs(StorageTargets) do
        exports['nocore-eye']:RemoveZone(k)
      end
    end
end)