local Framework = exports['no-core']:GetCoreObject()
local KeysList = {}
local IsRobbing = false
local LastVehicle = nil
local isLoggedIn = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        GetKeys()
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    GetKeys()
end)

-- Code

-- // Loops \\ --
CreateThread(function()
    while true do
        Wait(5)
        if LocalPlayer.state.isLoggedIn then
            local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local Plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true))
            if IsPedInAnyVehicle(PlayerPedId(), false) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), true), -1) == PlayerPedId() then
                if LastVehicle ~= Vehicle then
                    if HasKeys(Plate) then
                        HasCurrentKey = true
                        -- SetVehicleEngineOn(Vehicle, true, false, true)
                    else
                        HasCurrentKey = false
                        SetVehicleEngineOn(Vehicle, false, false, true)
                    end
                    LastVehicle = Vehicle
                else
                    Wait(750)
                end
            else
                Wait(750)
            end
            if not HasCurrentKey and IsPedInAnyVehicle(PlayerPedId(), false) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
                SetVehicleEngineOn(Vehicle, false, false, true)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(7)
        if LocalPlayer.state.isLoggedIn then
            if not IsRobbing then
                if GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= nil and GetVehiclePedIsTryingToEnter(PlayerPedId()) ~=
                    0 then
                    local Vehicle = GetVehiclePedIsTryingToEnter(PlayerPedId())
                    local Driver = GetPedInVehicleSeat(Vehicle, -1)
                    if Driver ~= 0 and not IsPedAPlayer(Driver) then
                        IsRobbing = true
                        TriggerServerEvent('hud:server:GainStress', math.random(1, 2))
                        Framework.Functions.Progressbar("rob_keys", _U("retrievekeys"), 3000, false, true, {}, {}, {},
                        {}, function()
                            TriggerServerEvent('nocore-vehiclekeys:server:AcquireVehicleKeys', GetVehicleNumberPlateText(Vehicle))
                            IsRobbing = false
                        end, function()
                            IsRobbing = false
                        end, 'fa-solid fa-key')
                    end
                end
            else
                Wait(10)
            end
        else
            Wait(1000)
        end
    end
end)

RegisterCommand('lockdoors', function()
    ToggleLocks()
end, false)
RegisterKeyMapping('lockdoors', 'Lock Vehicle Doors', 'keyboard', 'l')
TriggerEvent('chat:removeSuggestion', '/lockdoors')

-- // Events \\ --

RegisterNetEvent('nocore-vehiclekeys:client:toggle:engine')
AddEventHandler('nocore-vehiclekeys:client:toggle:engine', function()
    local EngineOn = IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false))
    local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local Plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true))
    if HasKeys(Plate) then
        if EngineOn then
            SetVehicleEngineOn(Vehicle, false, false, true)
            Framework.Functions.Notify('Изгасихте двигателя!', 'error', 5000)
        else
            SetVehicleEngineOn(Vehicle, true, false, true)
            Framework.Functions.Notify('Включи двигателя!', 'success', 5000)
        end
    else
        Framework.Functions.Notify(_U("nokeys"), 'error')
    end
end)


RegisterNetEvent('nocore-vehiclekeys:client:set:keys')
AddEventHandler('nocore-vehiclekeys:client:set:keys', function(Plate, CitizenId, bool)
    LastVehicle = nil
end)

RegisterNetEvent('nocore-vehiclekeys:client:give:key')
AddEventHandler('nocore-vehiclekeys:client:give:key', function()
    local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
    local Plate = GetVehicleNumberPlateText(Vehicle)
    if HasKeys(Plate) then
        local Players = GetNeareastPlayers()
        if #Players == 1 then
            Framework.Functions.Notify(_U("gavekeys") .. " " .. Plate, 'success')
            TriggerServerEvent('nocore-vehiclekeys:server:GiveVehicleKeys', Players[1].playerId, Plate)
        elseif #Players > 1 then
            local sendMenu = {}
            table.insert(sendMenu,{
                id = 1,
                header = "Близки играчи",
                txt = "",
                isMenuHeader = true
            })
            for i=1, #Players, 1 do
                table.insert(sendMenu,{
                    id = #sendMenu+1,
                    header = Players[i].playerName .. "[" .. tostring(Players[i].playerId) .. "]",
                    txt = "",
                    params = { 
                        event = "nocore-vehiclekeys:client:give:key:car",
                        args = {
                            target = Players[i].playerId,
                            plate = Plate
                        }
                    }
                })
            end
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = "Затвори",
                txt = "",
                params = { 
                    event = "nocore-vehiclekeys:client:fakeevent",
                    args = {}
                }
            })
            exports['nocore-context']:openMenu(sendMenu)
        else
            Framework.Functions.Notify(_U("nocitizen"), 'error')
        end
    else
        Framework.Functions.Notify(_U("nokeys"), 'error')
    end
end)

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players = Framework.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 3.0)

    local players_clean = {}
    local found_players = false

    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            table.insert(players_clean, {playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i])} )
        end
    end
    return players_clean
end


RegisterNetEvent('nocore-vehiclekeys:client:give:key:target')
AddEventHandler('nocore-vehiclekeys:client:give:key:target', function(data)
    local Player = data.target
    local Plate = data.plate
    if HasKeys(Plate) then
        if Player ~= -1 and Player ~= 0 then
            Framework.Functions.Notify(_U("gavekeys") .. " " .. Plate, 'success')
            TriggerServerEvent('nocore-vehiclekeys:server:GiveVehicleKeys', GetPlayerServerId(Player), Plate)
        else
            Framework.Functions.Notify(_U("nocitizen"), 'error')
        end
    else
        Framework.Functions.Notify(_U("nokeys"), 'error')
    end
end)

RegisterNetEvent('nocore-vehiclekeys:client:give:key:car')
AddEventHandler('nocore-vehiclekeys:client:give:key:car', function(data)
    local Player = data.target
    local Plate = data.plate
    if HasKeys(Plate) then
        if Player ~= -1 and Player ~= 0 then
            Framework.Functions.Notify(_U("gavekeys") .. " " .. Plate, 'success')
            TriggerServerEvent('nocore-vehiclekeys:server:GiveVehicleKeys', Player, Plate)
        else
            Framework.Functions.Notify(_U("nocitizen"), 'error')
        end
    else
        Framework.Functions.Notify(_U("nokeys"), 'error')
    end
end)

RegisterNetEvent('nocore-vehiclekeys:client:give:key:menu')
AddEventHandler('nocore-vehiclekeys:client:give:key:menu', function(data)
    local TargetPlayer = NetworkGetPlayerIndexFromPed(data.entity)
    local Player = Framework.Functions.GetPlayerData().citizenid
    local sendMenu = {}
    table.insert(sendMenu, {
        id = 1,
        header = "Ключове",
        txt = "",
        isMenuHeader = true
    })
    for k, v in pairs(KeysList) do
        if v == Player then
            table.insert(sendMenu, {
                id = #sendMenu + 1,
                header = k,
                txt = 'Дай ключ',
                params = {
                    event = "nocore-vehiclekeys:client:give:key:target",
                    args = {
                        target = TargetPlayer,
                        plate = k
                    }
                }
            })
        end

    end
    table.insert(sendMenu, {
        id = #sendMenu + 1,
        header = "Затвори",
        txt = "",
        params = {
            event = "fakeevnettt",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end)


RegisterNetEvent('nocore-items:client:use:lockpick')
AddEventHandler('nocore-items:client:use:lockpick', function(IsAdvanced)
    local ped = PlayerPedId()
    local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
    local Plate = GetVehicleNumberPlateText(Vehicle)
    local VehicleLocks = GetVehicleDoorLockStatus(Vehicle)
    if VehDistance <= 4.5 then
        local boostingInfo = Entity(Vehicle).state.boostingData
        if boostingInfo ~= nil and boostingInfo.advancedSystem then
            Framework.Functions.Notify('Трябва ти нещо друго за да разбиеш това МПС', 'error')
            return
        end
        if not HasKeys(Plate) then
            if IsPedInAnyVehicle(ped, false) then
                if GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) == ped then
                    exports['nocore-assets']:RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
                    TaskPlayAnim(ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3.0, 3.0, -1, 16, 0, false, false, false)
                    exports['nocore-ui']:Circle(function(success)
                        if success then
                            TriggerServerEvent('nocore-vehiclekeys:server:AcquireVehicleKeys', Plate)
                            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                        else
                            if IsAdvanced then
                                if math.random(1, 100) < 19 then
                                    TriggerServerEvent('Framework:Server:RemoveItem', 'advancedlockpick', 1)
                                    TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['advancedlockpick'], "remove")
                                end
                            else
                                if math.random(1, 100) < 35 then
                                    TriggerServerEvent('Framework:Server:RemoveItem', 'lockpick', 1)
                                    TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['lockpick'], "remove")
                                end
                            end
                            Framework.Functions.Notify(_U("failed"), 'error')
                            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                        end
                    end, 4, 20) -- NumberOfCircles, MS
                end
            else
                Framework.Functions.TriggerCallback("nocore-vehiclekeys:server:checkPlayerOwned", function(IsOwned)
                    if not IsOwned then
                        if VehicleLocks == 2 then
                            exports['nocore-assets']:RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
                            TaskPlayAnim(ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3.0, 3.0, -1, 16, 0, false, false, false)
                            exports['nocore-lockpick']:OpenLockpickGame(function(Success)
                                if Success then
                                    TriggerServerEvent('nocore-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(Vehicle), 1)
                                    Framework.Functions.Notify(_U("dooropen"), 'success')
                                    TriggerEvent('nocore-vehicleley:client:blink:lights', Vehicle)
                                    TriggerServerEvent("nocore-sound:server:play:source", "car-unlock", 0.2)
                                    StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                                else
                                    if IsAdvanced then
                                        if math.random(1, 100) < 5 then
                                            TriggerServerEvent('Framework:Server:RemoveItem', 'advancedlockpick', 1)
                                            TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['advancedlockpick'], "remove")
                                        end
                                    else
                                        if math.random(1, 100) < 15 then
                                            TriggerServerEvent('Framework:Server:RemoveItem', 'lockpick', 1)
                                            TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['lockpick'], "remove")
                                        end
                                    end
                                    Framework.Functions.Notify(_U("failed"), 'error')
                                    StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                                end
                            end)
                        end
                    end
                end, Plate)
            end
        end
    end
end)

-- // Functions \\ --

RegisterNetEvent('vehiclekeys:client:SetOwner', function (Plate)
    TriggerServerEvent('nocore-vehiclekeys:server:AcquireVehicleKeys', Plate)
end)

function SetVehicleKey(Plate)
    TriggerServerEvent('nocore-vehiclekeys:server:AcquireVehicleKeys', Plate)
end

RegisterNetEvent('nocore-vehiclekeys:client:ToggleLocks')
AddEventHandler('nocore-vehiclekeys:client:ToggleLocks', function()
    ToggleLocks()
end)

function ToggleLocks()
    local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
    if Vehicle ~= nil and Vehicle ~= 0 then
        local ped = PlayerPedId()
        local VehicleLocks = GetVehicleDoorLockStatus(Vehicle)
        local Plate = GetVehicleNumberPlateText(Vehicle)
        if VehDistance <= 5.0 then
            if HasKeys(Plate) then
                lib.requestAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)
                if VehicleLocks == 1 then
                    Wait(450)
                    TriggerServerEvent('nocore-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(Vehicle), 2)
                    ClearPedTasks(ped)
                    TriggerEvent('nocore-vehicleley:client:blink:lights', Vehicle)
                    Framework.Functions.Notify("Превозното средство е заключено", 'error')
                    TriggerServerEvent("nocore-sound:server:play:source", "car-lock", 0.2)
                else
                    Wait(450)
                    TriggerServerEvent('nocore-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(Vehicle), 1)
                    ClearPedTasks(ped)
                    TriggerEvent('nocore-vehicleley:client:blink:lights', Vehicle)
                    Framework.Functions.Notify("Превозното средство е отключено", 'success')
                    TriggerServerEvent("nocore-sound:server:play:source", "car-unlock", 0.2)
                end
            else
                Framework.Functions.Notify(_U("nokeys"), 'error')
            end
        end
    end
end

RegisterNetEvent('nocore-vehicleley:client:blink:lights')
AddEventHandler('nocore-vehicleley:client:blink:lights', function(Vehicle)
    SetVehicleLights(Vehicle, 2)
    SetVehicleBrakeLights(Vehicle, true)
    SetVehicleInteriorlight(Vehicle, true)
    SetVehicleIndicatorLights(Vehicle, 0, true)
    SetVehicleIndicatorLights(Vehicle, 1, true)
    Wait(450)
    SetVehicleIndicatorLights(Vehicle, 0, false)
    SetVehicleIndicatorLights(Vehicle, 1, false)
    Wait(450)
    SetVehicleInteriorlight(Vehicle, true)
    SetVehicleIndicatorLights(Vehicle, 0, true)
    SetVehicleIndicatorLights(Vehicle, 1, true)
    Wait(450)
    SetVehicleLights(Vehicle, 0)
    SetVehicleBrakeLights(Vehicle, false)
    SetVehicleInteriorlight(Vehicle, false)
    SetVehicleIndicatorLights(Vehicle, 0, false)
    SetVehicleIndicatorLights(Vehicle, 1, false)
end)

function GetKeys()
    Framework.Functions.TriggerCallback('nocore-vehiclekeys:server:GetVehicleKeys', function(keysList)
        KeysList = keysList
    end)
end

function HasKeys(plate)
    return KeysList[plate]
end

RegisterNetEvent('Framework:Client:OnPlayerUnload', function()
    KeysList = {}
end)

RegisterNetEvent('nocore-vehiclekeys:client:AddKeys', function(plate)
    KeysList[plate] = true
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local vehicleplate = GetVehicleNumberPlateText(vehicle)
        if plate == vehicleplate then
            SetVehicleEngineOn(vehicle, false, false, false)
        end
    end
end)
RegisterNetEvent('nocore-vehiclekeys:client:RemoveKeys', function(plate)
    KeysList[plate] = nil
end)