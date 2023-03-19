
local isShuffling = false	-- please do not change this, it is internal to the script and not a config variable
interactionDistance = 3.5 -- The radius you have to be in to interact with the vehicle.
lockDistance = 25 -- The radius you have to be in to lock your vehicle.
saved = false
controlsave_bool = false
chistachki = false

RegisterNetEvent("nocore-vehcommands:chistachki")
AddEventHandler("nocore-vehcommands:chistachki", function()
    chistachki = not chistachki
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if chistachki then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsUsing(ped)
            if AreBombBayDoorsOpen(veh)then
                CloseBombBayDoors(veh)
            else
                OpenBombBayDoors(veh)
            end
            Citizen.Wait(1000)
        else
            Citizen.Wait(5000)
        end
    end
end)



RegisterNetEvent("nocore-vehcommands:trunk")
AddEventHandler("nocore-vehcommands:trunk", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
        else
            SetVehicleDoorOpen(veh, door, false, false)
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
            end
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:hood")
AddEventHandler("nocore-vehcommands:hood", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
        else
            SetVehicleDoorOpen(veh, door, false, false)
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
            end
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:door")
AddEventHandler("nocore-vehcommands:door", function(args)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local args = tonumber(args)

    if args == 1 then -- Front Left Door
        door = 0
    elseif args == 2 then -- Front Right Door
        door = 1
    elseif args == 3 then -- Back Left Door
        door = 2
    elseif args == 4 then -- Back Right Door
        door = 3
    else
        door = nil
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
            else
                SetVehicleDoorOpen(veh, door, false, false)
            end
        else
            if distanceToVeh < 6 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                else
                    SetVehicleDoorOpen(vehLast, door, false, false)
                end
            end
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:windows")
AddEventHandler("nocore-vehcommands:windows", function(args)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local args = tonumber(args)

    if args == 1 then -- Front Left windowIndex
        windowIndex = 0
    elseif args == 2 then -- Front Right windowIndex
        windowIndex = 1
    elseif args == 3 then -- Back Left windowIndex
        windowIndex = 2
    elseif args == 4 then -- Back Right windowIndex
        windowIndex = 3
    else
        windowIndex = nil
    end

    if windowIndex ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if not IsVehicleWindowIntact(veh, windowIndex) then
                RollUpWindow(veh, windowIndex)
                if not IsVehicleWindowIntact(veh, windowIndex) then
                    RollDownWindow(veh, windowIndex)
                end
            else
                RollDownWindow(veh, windowIndex)
            end
        else
            if distanceToVeh < 6 then
                if not IsVehicleWindowIntact(vehLast, windowIndex) then
                    RollUpWindow(vehLast, windowIndex)
                    if not IsVehicleWindowIntact(vehLast, windowIndex) then
                        RollDownWindow(vehLast, windowIndex)
                    end
                else
                    RollDownWindow(vehLast, windowIndex)
                end
            end
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:backdoors")
AddEventHandler("nocore-vehcommands:backdoors", function()
    local player = PlayerPedId()

    if controlsave_bool == true then
        vehicle = saveVehicle
    else
        vehicle = GetVehiclePedIsIn(player, true)
    end

    local isopen = GetVehicleDoorAngleRatio(vehicle, 2) and GetVehicleDoorAngleRatio(vehicle, 3)
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
    if distanceToVeh <= interactionDistance then
        if (isopen == 0) then
            SetVehicleDoorOpen(vehicle, 2, 0, 0)
            SetVehicleDoorOpen(vehicle, 3, 0, 0)
        else
            SetVehicleDoorShut(vehicle, 2, 0)
            SetVehicleDoorShut(vehicle, 3, 0)
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:frontdoors")
AddEventHandler("nocore-vehcommands:frontdoors", function()
    local player = PlayerPedId()

    if controlsave_bool == true then
        vehicle = saveVehicle
    else
        vehicle = GetVehiclePedIsIn(player, true)
    end

    local isopen = GetVehicleDoorAngleRatio(vehicle, 0) and GetVehicleDoorAngleRatio(vehicle, 1)
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
    if distanceToVeh <= interactionDistance then
        if (isopen == 0) then
            SetVehicleDoorOpen(vehicle, 0, 0, 0)
            SetVehicleDoorOpen(vehicle, 1, 0, 0)
        else
            SetVehicleDoorShut(vehicle, 0, 0)
            SetVehicleDoorShut(vehicle, 1, 0)
        end
    end

end)

RegisterNetEvent("nocore-vehcommands:alldoors")
AddEventHandler("nocore-vehcommands:alldoors", function()
    local player = PlayerPedId()

    if controlsave_bool == true then
        vehicle = saveVehicle
    else
        vehicle = GetVehiclePedIsIn(player, true)
    end

    local isopen = GetVehicleDoorAngleRatio(vehicle, 0) and GetVehicleDoorAngleRatio(vehicle, 1)
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
    if distanceToVeh <= interactionDistance then
        if (isopen == 0) then
            SetVehicleDoorOpen(vehicle, 0, 0, 0)
            SetVehicleDoorOpen(vehicle, 1, 0, 0)
            SetVehicleDoorOpen(vehicle, 2, 0, 0)
            SetVehicleDoorOpen(vehicle, 3, 0, 0)
        else
            SetVehicleDoorShut(vehicle, 0, 0)
            SetVehicleDoorShut(vehicle, 1, 0)
            SetVehicleDoorShut(vehicle, 2, 0)
            SetVehicleDoorShut(vehicle, 3, 0)
        end
    end
end)

Citizen.CreateThread(function()
    RegisterNetEvent('nocore-vehcommands:toggleShuffle')
    AddEventHandler('nocore-vehcommands:toggleShuffle', function()
        stopPassengerShuffle = not stopPassengerShuffle
        TriggerEvent('chat:addMessage', {
            color = {63, 63, 255},
            multiline = true,
            args = {"Anti-Shuffle", (function()
                if (stopPassengerShuffle) then
                    return "Enabled; preventing seat shuffle"
                else
                    return "Disabled; allowing seat shuffle"
                end
            end)()}
        })
    end)

    RegisterNetEvent('nocore-vehcommands:toggleSlide')
    AddEventHandler('nocore-vehcommands:toggleSlide', function()
        allowEntrySlide = not allowEntrySlide
        TriggerEvent('chat:addMessage', {
            color = {63, 63, 255},
            multiline = true,
            args = {"Entry-Slide", (function()
                if (allowEntrySlide) then
                    return "Enabled; allowing entry slide"
                else
                    return "Disabled; preventing entry slide"
                end
            end)()}
        })
    end)

    if (enableSeatCommand) then
        RegisterNetEvent('nocore-vehcommands:seat')
        AddEventHandler('nocore-vehcommands:seat', function(seat)
            seat = tonumber(seat) - 2 or -2
            local player, v = PlayerPedId(), 0
            if (seat < -1) then
                TriggerEvent('chat:addMessage', {
                    color = {63, 63, 255},
                    multiline = true,
                    args = {"Seat", "Invalid seat number"}
                })
                goto complete
            end
            if (IsPedInAnyVehicle(player, 1)) then
                v = GetVehiclePedIsIn(player, 0)
                if (seat == getPedSeat(player, v)) then
                    TriggerEvent('chat:addMessage', {
                        color = {63, 63, 255},
                        multiline = true,
                        args = {"Seat", "You are already in that seat"}
                    })
                    goto complete
                end
                if not (AreAnyVehicleSeatsFree(v)) then
                    goto noseat
                end
                if (seat <= (GetVehicleModelNumberOfSeats(GetEntityModel(v)) - 2)) then
                    if (IsVehicleSeatFree(v, seat)) then
                        SetPedIntoVehicle(player, v, seat)
                        goto complete
                    else
                        goto fullseat
                    end
                else
                    TriggerEvent('chat:addMessage', {
                        color = {63, 63, 255},
                        multiline = true,
                        args = {"Seat", "Invalid seat number"}
                    })
                end
                goto complete
                ::fullseat::
                TriggerEvent('chat:addMessage', {
                    color = {63, 63, 255},
                    multiline = true,
                    args = {"Seat", "That seat is occupied"}
                })
                goto complete
                ::noseat::
                TriggerEvent('chat:addMessage', {
                    color = {63, 63, 255},
                    multiline = true,
                    args = {"Seat", "There are no free seats"}
                })
                goto complete
            else
                TriggerEvent('chat:addMessage', {
                    color = {63, 63, 255},
                    multiline = true,
                    args = {"Seat", "You are not in a vehicle"}
                })
            end
            ::complete::
        end)
    end
end)

function areExemptKeysReleased()
    if (#exemptKeys == 0) then
        return false
    end
    local keys = 0
    for i = 1, #exemptKeys do
        if (IsControlReleased(0, exemptKeys[i])) and (IsInputDisabled(2)) and (not isDead) then
            keys = keys + 1
        end
    end
    if (keys == #exemptKeys) then
        return true
    else
        return false
    end
end

function enterRearSeat(p)
    if (IsPedInAnyVehicle(player, 1)) then
        goto complete
    end
    local v = getVehicleInFront(p)
    if (v ~= 0) then
        local entityHead, playerHead = GetEntityHeading(v), GetEntityHeading(p)
        local angleBetween = getAngleBetweenForwardVectors(GetEntityForwardVector(p), GetEntityForwardVector(v))
        local angleLeft, angleRight = normalizeAngle(playerHead + angleBetween),
            normalizeAngle(playerHead - angleBetween)
        local seatsMax = GetVehicleModelNumberOfSeats(GetEntityModel(v))
        if (roundFloat(angleLeft) == roundFloat(entityHead)) then
            if (seatsMax > 2) and (IsVehicleSeatFree(v, 1)) then
                TaskEnterVehicle(p, v, -1, 1, 1.0, 1, 0)
            end
        elseif (roundFloat(angleRight) == roundFloat(entityHead)) then
            if (seatsMax > 2) and (IsVehicleSeatFree(v, 2)) then
                TaskEnterVehicle(p, v, -1, 2, 1.0, 1, 0)
            end
        end
    end
    ::complete::
end

function getAngleBetweenForwardVectors(v1, v2)
    return math.deg(math.acos(getDotProduct(v1, v2) / (getMagnitude(v1) * getMagnitude(v2))))
end

function getDotProduct(v1, v2)
    return (v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z)
end

function getMagnitude(x)
    return math.sqrt((x.x * x.x) + (x.y * x.y) + (x.z * x.z))
end

function getPedSeat(p, v)
    local seats = GetVehicleModelNumberOfSeats(GetEntityModel(v))
    for i = -1, seats do
        local t = GetPedInVehicleSeat(v, i)
        if (t == p) then
            return i
        end
    end
    return -2
end

function getVehicleInFront(p)
    local pos1, pos2 = GetEntityCoords(p), GetOffsetFromEntityInWorldCoords(p, 0.0, 7.0, 0.0)
    local ray = StartShapeTestRay(pos1.x, pos1.y, pos1.z, pos2.x, pos2.y, pos2.z, 2, p, 0)
    local ret, hit, endPos, hitPos, entityHit = GetShapeTestResult(ray)
    return entityHit
end

function normalizeAngle(a)
    while (a < 0) do
        a = a + 360
    end
    while (a > 360) do
        a = a - 360
    end
    return a
end

function roundFloat(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        if (stopPassengerShuffle) then
            if (not GetPedConfigFlag(player, 184, 1)) then
                SetPedConfigFlag(player, 184, true)
            end
            if (IsPedInAnyVehicle(player, false)) then
                local v = GetVehiclePedIsIn(player, 0)
                if (not areExemptKeysReleased()) then
                    if (GetPedConfigFlag(player, 184, 1)) then
                        SetPedConfigFlag(player, 184, false)
                    end
                    if (allowKeyShuffle) and (not isShuffling) then
                        local seatCurrent, seatTarget = getPedSeat(player, v), nil
                        if ((seatCurrent % 2) == 1) then
                            seatTarget = seatCurrent + 1
                        else
                            seatTarget = seatCurrent - 1
                        end
                        if (seatCurrent ~= 0) and (GetVehicleModelNumberOfSeats(GetEntityModel(v)) >= seatTarget + 2) then
                            if (IsVehicleSeatFree(v, seatTarget)) then
                                TaskShuffleToNextVehicleSeat(player, v)
                            end
                        end
                    end
                end
                if (GetIsTaskActive(player, 165)) then
                    isShuffling = true
                    if (not allowEntrySlide) then
                        if (GetSeatPedIsTryingToEnter(player) == -1) then
                            if (GetPedConfigFlag(player, 184, 1)) then
                                SetPedIntoVehicle(player, v, 0)
                                SetVehicleCloseDoorDeferedAction(v, 0)
                            end
                        end
                    end
                else
                    isShuffling = false
                end
            end
        else
            if (GetPedConfigFlag(player, 184, 1)) then
                SetPedConfigFlag(player, 184, false)
            end
        end
        if (IsControlJustPressed(0, enterRearSeatKey)) and (IsInputDisabled(2)) and not IsPedInAnyVehicle(player, false) then
            enterRearSeat(player)
        end
        Citizen.Wait(0)
    end
end)


--[[ Target Events ]]

RegisterNetEvent("nocore-vehcommands:target:open:trunk")
AddEventHandler("nocore-vehcommands:target:open:trunk", function(data)
    local ped = PlayerPedId()
    local veh = data.entity
    local vehLast = data.entity
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
        else
            SetVehicleDoorOpen(veh, door, false, false)
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
            end
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:target:open:hood")
AddEventHandler("nocore-vehcommands:target:open:hood", function(data)
    local ped = PlayerPedId()
    local veh = data.entity
    local vehLast = data.entity
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
        else
            SetVehicleDoorOpen(veh, door, false, false)
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
            end
        end
    end
end)

RegisterNetEvent("nocore-vehcommands:target:open:door")
AddEventHandler("nocore-vehcommands:target:open:door", function(data)
    local ped = PlayerPedId()
    local veh = data.entity
    local vehLast = data.entity
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)

    if data.closestBoneName == 'door_dside_f' or data.closestBoneName == 'seat_dside_f' or data.closestBoneName == 'window_lf' then-- Front Left Door
        door = 0
    elseif data.closestBoneName == 'door_pside_f' or data.closestBoneName == 'seat_pside_f' or data.closestBoneName == 'window_rf' then -- Front Right Door
        door = 1
    elseif data.closestBoneName == 'door_dside_r' or data.closestBoneName == 'seat_dside_r' or data.closestBoneName == 'window_lr' then -- Back Right Door
        door = 2
    elseif data.closestBoneName == 'door_pside_r' or data.closestBoneName == 'seat_pside_r' or data.closestBoneName == 'window_rr' then -- Back Left Door
        door = 3
    else
        door = nil
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
            else
                SetVehicleDoorOpen(veh, door, false, false)
            end
        else
            if distanceToVeh < 6 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                else
                    SetVehicleDoorOpen(vehLast, door, false, false)
                end
            end
        end
    end
end)
