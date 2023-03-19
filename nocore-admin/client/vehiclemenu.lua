local vehicles = {}
local function OpenCarModelsMenu(category)
    VehNameMenu:ClearItems()
    MenuV:OpenMenu(VehNameMenu)
    for k, v in pairs(category) do
        VehNameMenu:AddButton({
            label = v["name"],
            value = k,
            description = 'Spawn ' .. v["name"],
            select = function()
                TriggerServerEvent('nocore-admin:server:spawnVehicle', k)
            end
        })
    end
end
VehicleMenu:AddButton({
    icon = '🚗',
    label = Lang:t("menu.spawn_vehicle"),
    value = VehCategorieMenu,
    description = Lang:t("desc.spawn_vehicle_desc"),
    select = function()
        VehCategorieMenu:ClearItems()
        for k, v in pairs(Framework.Shared.Vehicles) do
            local category = v["category"]
            if vehicles[category] == nil then
                vehicles[category] = { }
            end
            vehicles[category][k] = v
        end
        for k, v in pairs(vehicles) do
            VehCategorieMenu:AddButton({
                label = k,
                value = v,
                description = Lang:t("menu.category_name"),
                select = function(btn)
                    local select = btn.Value
                    OpenCarModelsMenu(select)
                end
            })
        end
    end
})

VehicleMenu:AddButton({
    icon = '🔧',
    label = Lang:t("menu.fix_vehicle"),
    description = Lang:t("desc.fix_vehicle_desc"),
    select = function()
        TriggerServerEvent('Framework:CallCommand', "fix", {})
    end
})

VehicleMenu:AddButton({
    icon = '☠',
    label = Lang:t("menu.remove_vehicle"),
    description = Lang:t("desc.remove_vehicle_desc"),
    select = function()
        TriggerServerEvent('Framework:CallCommand', "dv", {})
    end
})

RegisterNetEvent('nocore-admin:client:maxvehicle')
AddEventHandler('nocore-admin:client:maxvehicle', function(model)
    local props = {
        modEngine = 3,
        modBrakes = 2,
        modTransmission = 2,
        modTurbo = true,
        modSpoilers = 1
    }
    Framework.Functions.SpawnVehicle(model, function(vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
        Citizen.Wait(100)
        exports['nocore-fuel']:SetFuelLevel(vehicle, GetVehicleNumberPlateText(vehicle), 100, true)
        Framework.Functions.SetVehicleProperties(vehicle, props)
        Framework.Functions.Notify('Извади си кола от джоба', 'success')
    end, nil, true, true)
end)