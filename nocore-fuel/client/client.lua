local IsBusy = false
local LoggedIn = false
Framework = nil

Citizen.CreateThread(function()
    while true do
        globalPlayerPedId = PlayerPedId()
        globalPlayerPed = PlayerPedId()
        Citizen.Wait(3000)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1250, function()
            TriggerEvent("Framework:GetObject", function(obj)
                Framework = obj
            end)
            Citizen.Wait(250)
            Framework.Functions.TriggerCallback("nocore-fuel:server:get:fuel:config", function(config)
                Config = config
            end)
            LoggedIn = true
        end)
    end
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(5000, function()
        TriggerEvent("Framework:GetObject", function(obj)
            Framework = obj
        end)
        Citizen.Wait(250)
        Framework.Functions.TriggerCallback("nocore-fuel:server:get:fuel:config", function(config)
            Config = config
        end)
        LoggedIn = true
        print('Has Logged In')
    end)
end)

-- Code

-- // Events \\ --

RegisterNetEvent('nocore-fuel:client:register:vehicle:fuel')
AddEventHandler('nocore-fuel:client:register:vehicle:fuel', function(Plate, Vehicle, Amount)
    Config.VehicleFuel[Plate] = Amount
end)

RegisterNetEvent('nocore-fuel:client:update:vehicle:fuel')
AddEventHandler('nocore-fuel:client:update:vehicle:fuel', function(Plate, Vehicle, Amount)
    Config.VehicleFuel[Plate] = Amount
end)

RegisterNetEvent('nocore-fuel:client:get:fuel')
AddEventHandler('nocore-fuel:client:get:fuel', function(data)
    Framework.Functions.TriggerCallback("nocore-fuel:server:GetFuel", function(CanFuel)
        if CanFuel then
            Framework.Functions.Notify('Взехте туба с гориво за 100$..')
        else
            Framework.Functions.Notify('Нямаш достатъчно пари..', 'error')
        end
    end)
end)


-- // Loops \\ --

Citizen.CreateThread(function()
    Citizen.Wait(150)
    DecorRegister('_DOBAWKA_BRATMEEE_', 2)
    while true do
        Citizen.Wait(5)
        --print(LoggedIn)
        if LoggedIn then
            local Vehicle = GetVehiclePedIsIn(globalPlayerPed)
            local Plate = GetVehicleNumberPlateText(Vehicle)
            if Vehicle ~= 0 then
                if Config.VehicleFuel[Plate] ~= nil then
                    if IsVehicleEngineOn(Vehicle) then
                        if Config.VehicleFuel[Plate] ~= 0 then
                            if GetPedInVehicleSeat(Vehicle, -1) == globalPlayerPed then
                                if not DecorExistOn(Vehicle, '_DOBAWKA_BRATMEEE_') then
                                    SetFuelLevel(Vehicle, Plate, Config.VehicleFuel[Plate] - Config.FuelUsageSpeed[Round(GetVehicleCurrentRpm(Vehicle, 1))] * Config.VehicleFuelUsage[GetVehicleClass(Vehicle)], false)
                                    if tonumber(GetVehicleClass(Vehicle)) == 15 then
                                        SetFuelLevel(Vehicle, Plate, Config.VehicleFuel[Plate] - 0.5 * Config.VehicleFuelUsage[GetVehicleClass(Vehicle)], false)
                                    else
                                        SetFuelLevel(Vehicle, Plate, Config.VehicleFuel[Plate] - Config.FuelUsageSpeed[Round(GetVehicleCurrentRpm(Vehicle, 1))] * Config.VehicleFuelUsage[GetVehicleClass(Vehicle)], false)
                                    end
                                else
                                    SetFuelLevel(Vehicle, Plate, Config.VehicleFuel[Plate] - (Config.FuelUsageSpeed[Round(GetVehicleCurrentRpm(Vehicle, 1))] / 2 )* Config.VehicleFuelUsage[GetVehicleClass(Vehicle)], false)
                                end
                                Citizen.Wait(7250)
                            end
                        end
                    else
                        Citizen.Wait(250)
                    end
                else
                    --print('Register fuel 55/75')
                    Citizen.Wait(250)
                    TriggerServerEvent('nocore-fuel:server:register:fuel', Plate, Vehicle, math.random(55, 75))
                    Citizen.Wait(2000)
                end
            else
                Citizen.Wait(2000)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(150)
    while true do
        Citizen.Wait(5)
        if LoggedIn then
            local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
            local Plate = GetVehicleNumberPlateText(Vehicle)
            InRange = false
            for k, v in pairs(Config.TankLocations) do
                local Distance = GetDistanceBetweenCoords(GetEntityCoords(globalPlayerPedId),
                    Config.TankLocations[k]["Coords"]["X"], Config.TankLocations[k]["Coords"]["Y"],
                    Config.TankLocations[k]["Coords"]["Z"], true)
                if Distance < 15.0 then
                    InRange = true
                    if VehDistance < 2.5 and not IsPedSittingInVehicle(globalPlayerPedId, Vehicle) and GetFuelLevel(Plate) ~=
                        100 then
                        local VehicleCoords = GetEntityCoords(Vehicle)
                        DrawMarker(2, VehicleCoords.x, VehicleCoords.y, VehicleCoords.z + 1.15, 0.0, 0.0, 0.0, 0.0, 0.0,
                            0.0, 0.1, 0.1, 0.05, 35, 161, 48, 255, false, false, false, 1, false, false, false)
                        DrawText3D(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z + 1.10,
                            '~g~Content~s~: ' .. GetFuelLevel(Plate) .. '%\n~g~E~s~ - Гориво | Цена ~g~$~s~' ..
                                Config.TankLocations[k]['Tank-Price'])
                        if IsControlJustReleased(0, 38) and not IsBusy then
                            Framework.Functions.TriggerCallback("nocore-fuel:server:can:fuel", function(CanFuel)
                                if CanFuel then
                                    IsBusy = true
                                    RefuelCar(Vehicle, Plate)
                                else
                                    Framework.Functions.Notify('Нямаш достатъчно пари..', 'error')
                                end
                            end, Config.TankLocations[k]["Tank-Price"])
                        end
                    else
                        Citizen.Wait(1500)
                    end
                end
            end
            if not InRange then
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

-- // Functions \\ --

function GetFuelLevel(Plate)
    if Config.VehicleFuel[Plate] ~= nil then
        return Config.VehicleFuel[Plate]
    else
        return 0
    end
end

function SetFuelLevel(Vehicle, Plate, Amount, Spawned)
    if Amount < 0 then
        Amount = 0
    end
    if Spawned then
        if Amount < 100 or GetFuelLevel(Plate) < 100 then
            Amount = 100
        end
    end
    SetVehicleFuelLevel(Vehicle, Amount + 0.0)
    TriggerServerEvent('nocore-fuel:server:update:fuel', Plate, Vehicle, Amount)
end

function RefuelCar(Vehicle, Plate)
    exports['nocore-assets']:RequestAnimationDict("weapon@w_sp_jerrycan")
    TaskPlayAnim(globalPlayerPedId, "weapon@w_sp_jerrycan", "fire", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
    Framework.Functions.Progressbar("refuel-car", "Зареждаш..", math.random(5000, 6500), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function() -- Done
        IsBusy = false
        SetFuelLevel(Vehicle, Plate, 100, false)
        PlaySound(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Framework.Functions.Notify(
            'Превозното средство е напълно заредено с гориво', 'success')
        StopAnimTask(globalPlayerPedId, "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end, function() -- Cancel
        IsBusy = false
        StopAnimTask(globalPlayerPedId, "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function Round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end
RegisterNetEvent('fuel:jarhead')
AddEventHandler('fuel:jarhead', function(data)
    if LoggedIn then
        local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
        local Plate = GetVehicleNumberPlateText(Vehicle)
        if Vehicle ~= 0 then
            if VehDistance < 2.5 and not IsPedSittingInVehicle(globalPlayerPedId, Vehicle) then
                if not DecorExistOn(Vehicle, '_DOBAWKA_BRATMEEE_') then
                    exports['nocore-assets']:RequestAnimationDict("weapon@w_sp_jerrycan")
                    TaskPlayAnim(globalPlayerPedId, "weapon@w_sp_jerrycan", "fire", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
                    Framework.Functions.Progressbar("tune-car", "Слагаш добавката..", math.random(5000, 6500), false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function() -- Done
                        IsBusy = false
                        DecorSetFloat(Vehicle, '_DOBAWKA_BRATMEEE_', true)
                        PlaySound(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
                        Framework.Functions.Notify(
                            'Сложи добавката успешно', 'success')
                        StopAnimTask(globalPlayerPedId, "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                        TriggerServerEvent('Framework:Server:RemoveItem', 'dobawkagoriwo', 1)
                        TriggerEvent("nocore-inventory:client:ItemBox",
                        Framework.Shared.Items['dobawkagoriwo'], "remove")
                    end, function() -- Cancel
                        IsBusy = false
                        StopAnimTask(globalPlayerPedId, "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                    end)
                else
                    Framework.Functions.Notify('Стига буха тая кола бе')
                end
            else
                Framework.Functions.Notify('Трябва да си до колата')
            end
        end
    end
end)