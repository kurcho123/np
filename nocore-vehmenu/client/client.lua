Framework = nil
local enabled = false
local player = false
local veh = 0

damageLevel, currPlate, currName, currFuel, currEngineStatus = nil

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
        Citizen.Wait(150)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if veh ~= 0 then
            if enabled then
                refreshUI()
            else
                Wait(100)
            end
        else
            Wait(250)
        end
    end
end)

RegisterKeyMapping('+vehiclemenu', 'Vehicle Menu', 'keyboard', 'Y')

RegisterNetEvent('nocore-carmenu:veh:options', function()
    if not enabled then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= 0 then
            EnableGUI(true)
        end
    end
end)

RegisterCommand("+vehiclemenu",function(source, args)
    if not enabled then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= 0 then
            EnableGUI(true)
        end
    end
end, false)

Citizen.CreateThread(function()
    while true do
        player = PlayerPedId()
        veh = GetVehiclePedIsIn(player, false)
        if veh ~= 0 then
            if enabled then
                damageLevel = GetVehicleEngineHealth(veh)
                currPlate = GetVehicleNumberPlateText(veh)
                currName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                currFuel = GetVehicleFuelLevel(veh)
                currEngineStatus = GetIsVehicleEngineRunning(veh)
            end
        end
        Wait(1000)
    end
end)

function EnableGUI(enable)
    enabled = enable
    SetCursorLocation(0.71, 0.83)
    SetNuiFocus(enable, enable)
    SendNUIMessage({
        type = "enablecarmenu",
        enable = enable
    })
end

function checkSeat(player, veh, seatIndex)
    local ped = GetPedInVehicleSeat(veh, seatIndex);
    if ped == player then
        return seatIndex;
    elseif ped ~= 0 then
        return false;
    else
        return true;
    end
end

function refreshUI()
    local settings = {}
    if veh ~= 0 and damageLevel ~= nil then
        settings.seat1 = checkSeat(player, veh, -1)
        settings.seat2 = checkSeat(player, veh,  0)
        settings.seat3 = checkSeat(player, veh,  1)
        settings.seat4 = checkSeat(player, veh,  2)
        settings.engineAccess = settings.seat1 == -1 and true or false
        if GetVehicleDoorAngleRatio(veh, 0) ~= 0 then settings.door0 = true end
        if GetVehicleDoorAngleRatio(veh, 1) ~= 0 then settings.door1 = true end
        if GetVehicleDoorAngleRatio(veh, 2) ~= 0 then settings.door2 = true end
        if GetVehicleDoorAngleRatio(veh, 3) ~= 0 then settings.door3 = true end
        if GetVehicleDoorAngleRatio(veh, 4) ~= 0 then settings.hood = true end
        if GetVehicleDoorAngleRatio(veh, 5) ~= 0 then settings.trunk = true end

        if not IsVehicleWindowIntact(veh, 0) then settings.windowr1 = true end
        if not IsVehicleWindowIntact(veh, 1) then settings.windowl1 = true end
        if not IsVehicleWindowIntact(veh, 2) then settings.windowr2 = true end
        if not IsVehicleWindowIntact(veh, 3) then settings.windowl2 = true end

        if currEngineStatus then settings.engine = true else settings.engine = false end
        settings.plate, settings.name, settings.fuel = currPlate, currName, currFuel
        local overallDamage = damageLevel / 10
        if overallDamage < 100 then settings.damage = overallDamage - 15 else settings.damage = 100 end

        SendNUIMessage({ type = "refreshcarmenu", settings = settings })
    else SendNUIMessage({ type = "resetcarmenu" }) end
end

RegisterNUICallback('openDoor', function(data, cb)
    doorIndex = tonumber(data['doorIndex'])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)

    if veh ~= 0 then
        local lockStatus = GetVehicleDoorLockStatus(veh)
        if lockStatus == 1 or lockStatus == 0 then
            if (GetVehicleDoorAngleRatio(veh, doorIndex) == 0) then
                SetVehicleDoorOpen(veh, doorIndex, false, false)
            else
                SetVehicleDoorShut(veh, doorIndex, false)
            end
        end
    end
    cb('ok')
end)

RegisterNUICallback('switchSeat', function(data, cb)
    seatIndex = tonumber(data['seatIndex'])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        SetPedIntoVehicle(player, veh, seatIndex)
    end
    cb('ok')
end)


--[[ RegisterCommand('neon', function(src, args)
    local id = tonumber(args[1])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    local neonStatus = false
    if IsVehicleNeonLightEnabled(veh) == false then neonStatus = true end

    if veh ~= 0 then
        local lockStatus = GetVehicleDoorLockStatus(veh)
        if lockStatus == 1 or lockStatus == 0 then
            if id ~= nil then
                if IsVehicleNeonLightEnabled(veh, id) == false then neonStatus = true end
                SetVehicleNeonLightEnabled(veh, id, neonStatus)
            else
                SetVehicleNeonLightEnabled(veh, 0, neonStatus)
                SetVehicleNeonLightEnabled(veh, 1, neonStatus)
                SetVehicleNeonLightEnabled(veh, 2, neonStatus)
                SetVehicleNeonLightEnabled(veh, 3, neonStatus)
            end
        end
    end
end) ]]

RegisterNUICallback('togglewindow', function(data, cb)
    windowIndex = tonumber(data['windowIndex'])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        if not IsVehicleWindowIntact(veh, windowIndex) then
            RollUpWindow(veh, windowIndex)
            if not IsVehicleWindowIntact(veh, windowIndex) then
                RollDownWindow(veh, windowIndex)
            end
        else
            RollDownWindow(veh, windowIndex)
        end
    end
    cb('ok')
end)

RegisterNUICallback('togglealldoor', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        SetVehicleDoorShut(veh, 0, false)
        SetVehicleDoorShut(veh, 1, false)
        SetVehicleDoorShut(veh, 2, false)
        SetVehicleDoorShut(veh, 3, false)
        SetVehicleDoorShut(veh, 4, false)
        SetVehicleDoorShut(veh, 5, false)
        SetVehicleDoorShut(veh, 6, false)
    end
    cb('ok')
end)

RegisterNUICallback('lockdoors', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        TriggerEvent('nocore-vehiclekeys:client:ToggleLocks')
    end
    cb('ok')
end)

RegisterNUICallback('givekeys', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        TriggerEvent('nocore-vehiclekeys:client:give:key')
    end
    cb('ok')
end)

RegisterNUICallback('convertroof', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        local roofState = GetConvertibleRoofState(veh)
        if roofState == 0 then
            LowerConvertibleRoof(veh)
        elseif roofState == 2 then
            RaiseConvertibleRoof(veh)
        end
    end
    cb('ok')
end)

RegisterNUICallback('toggleengine', function(data, cb)
    veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 then
        local engine = not GetIsVehicleEngineRunning(veh)
        if not IsPedInAnyHeli(player) then
            TriggerEvent('nocore-vehiclekeys:client:toggle:engine')
        else
            TriggerEvent('nocore-vehiclekeys:client:toggle:engine')
        end
    end
    cb('ok')
end)

RegisterNUICallback('escape', function(data, cb) EnableGUI(false) cb('ok') end)