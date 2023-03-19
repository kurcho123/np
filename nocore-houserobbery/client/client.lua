local HouseData, OffSets = nil, nil
local InsideHouse = false
local ShowingItems = false
local CurrentEvent = {}
local CurrentHouse = nil
local Framework = exports['no-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(450, function()
            Framework.Functions.TriggerCallback("nocore-houserobbery:server:get:config", function(ConfigData)
                Config = ConfigData
            end)
        end)
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(450, function()
        Framework.Functions.TriggerCallback("nocore-houserobbery:server:get:config", function(ConfigData)
            Config = ConfigData
        end)
    end)
end)

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)


-- Code

RegisterNetEvent('nocore-houserobbery:client:set:door:status')
AddEventHandler('nocore-houserobbery:client:set:door:status', function(RobHouseId, bool)
    Config.HouseLocations[RobHouseId]['Opened'] = bool
end)

RegisterNetEvent('nocore-houserobbery:client:set:locker:state')
AddEventHandler('nocore-houserobbery:client:set:locker:state', function(RobHouseId, LockerId, Type, bool)
    Config.HouseLocations[RobHouseId]['Lockers'][LockerId][Type] = bool
end)

RegisterNetEvent('nocore-houserobbery:client:set:extra:state')
AddEventHandler('nocore-houserobbery:client:set:extra:state', function(RobHouseId, Id, bool)
    Config.HouseLocations[RobHouseId]['Extras'][Id]['Stolen'] = bool
end)

RegisterNetEvent('nocore-houserobbery:server:reset:state')
AddEventHandler('nocore-houserobbery:server:reset:state', function(RobHouseId)
    Config.HouseLocations[RobHouseId]['Opened'] = bool
    for k, v in pairs(Config.HouseLocations[RobHouseId]["Lockers"]) do
        v["Opened"] = false
        v["Busy"] = false
    end
    if Config.HouseLocations[RobHouseId]["Extras"] ~= nil then
        for k, v in pairs(Config.HouseLocations[RobHouseId]["Extras"]) do
            v['Stolen'] = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LocalPlayer.state['isLoggedIn'] then
            local ItemsNeeded = {
                [1] = {
                    name = Framework.Shared.Items["toolkit"]["name"],
                    image = Framework.Shared.Items["toolkit"]["image"]
                },
                [2] = {
                    name = Framework.Shared.Items["lockpick"]["name"],
                    image = Framework.Shared.Items["lockpick"]["image"]
                }
            }
            NearRobHouse = false
            for k, v in pairs(Config.HouseLocations) do
                local PlayerCoords = GetEntityCoords(PlayerPedId())
                local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                    v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], true)
                if Distance < 2.0 then
                    NearRobHouse = true
                    CurrentHouse = k
                    if not ShowingItems and not v['Opened'] then
                        ShowingItems = true
                        TriggerEvent('nocore-inventory:client:requiredItems', ItemsNeeded, true)
                    end
                end
            end
            if not NearRobHouse then
                if ShowingItems then
                    ShowingItems = false
                    TriggerEvent('nocore-inventory:client:requiredItems', ItemsNeeded, false)
                end
                Citizen.Wait(1500)
                if not InsideHouse then
                    CurrentHouse = nil
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LocalPlayer.state['isLoggedIn'] then
            if CurrentHouse ~= nil then
                local PlayerCoords = GetEntityCoords(PlayerPedId())
                if not InsideHouse and Config.HouseLocations[CurrentHouse]['Opened'] then
                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                        Config.HouseLocations[CurrentHouse]['Coords']['X'],
                        Config.HouseLocations[CurrentHouse]['Coords']['Y'],
                        Config.HouseLocations[CurrentHouse]['Coords']['Z'], true) < 3.0) then
                        DrawMarker(2, Config.HouseLocations[CurrentHouse]['Coords']['X'],
                            Config.HouseLocations[CurrentHouse]['Coords']['Y'],
                            Config.HouseLocations[CurrentHouse]['Coords']['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1,
                            0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                        Framework.Functions.DrawText3D(Config.HouseLocations[CurrentHouse]['Coords']['X'],
                            Config.HouseLocations[CurrentHouse]['Coords']['Y'],
                            Config.HouseLocations[CurrentHouse]['Coords']['Z'], _U("inside"))
                        if IsControlJustReleased(0, 38) then
                            EnterHouseRobbery()
                        end
                    end
                elseif InsideHouse then
                    if OffSets ~= nil then
                        if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                            Config.HouseLocations[CurrentHouse]['Coords']['X'] - OffSets.exit.x,
                            Config.HouseLocations[CurrentHouse]['Coords']['Y'] - OffSets.exit.y,
                            Config.HouseLocations[CurrentHouse]['Coords']['Z'] - OffSets.exit.z, true) < 1.4) then
                            DrawMarker(2, Config.HouseLocations[CurrentHouse]['Coords']['X'] - OffSets.exit.x,
                                Config.HouseLocations[CurrentHouse]['Coords']['Y'] - OffSets.exit.y,
                                Config.HouseLocations[CurrentHouse]['Coords']['Z'] - OffSets.exit.z, 0.0, 0.0, 0.0, 0.0,
                                0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false,
                                false)
                            Framework.Functions.DrawText3D(Config.HouseLocations[CurrentHouse]['Coords']['X'] -
                                                               OffSets.exit.x,
                                Config.HouseLocations[CurrentHouse]['Coords']['Y'] - OffSets.exit.y,
                                Config.HouseLocations[CurrentHouse]['Coords']['Z'] - OffSets.exit.z + 0.12, _U("leave"))
                            if IsControlJustReleased(0, 38) then
                                LeaveHouseRobbery()
                            end
                        end
                        for k, v in pairs(Config.HouseLocations[CurrentHouse]['Lockers']) do
                            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                                v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], true) < 1.5) then
                                local Text = '~g~E~s~ - Прерови'
                                if Config.HouseLocations[CurrentHouse]['Lockers'][k]['Busy'] then
                                    Text = _U("robbing")
                                elseif Config.HouseLocations[CurrentHouse]['Lockers'][k]['Opened'] then
                                    Text = _U("empty")
                                end
                                Framework.Functions.DrawText3D(v['Coords']['X'], v['Coords']['Y'],
                                    v['Coords']['Z'] + 0.15, Text)
                                DrawMarker(2, v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], 0.0, 0.0, 0.0, 0.0,
                                    0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false,
                                    false)
                                if IsControlJustReleased(0, 38) and
                                    not Config.HouseLocations[CurrentHouse]['Lockers'][k]['Opened'] and
                                    not Config.HouseLocations[CurrentHouse]['Lockers'][k]['Busy'] then
                                    OpenLocker(k)
                                end
                            end
                        end
                        if Config.HouseLocations[CurrentHouse]['Extras'] ~= nil then
                            for k, v in pairs(Config.HouseLocations[CurrentHouse]['Extras']) do
                                if not v['Stolen'] then
                                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                                        v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], true) < 1.7) then
                                        Framework.Functions.DrawText3D(v['Coords']['X'], v['Coords']['Y'],
                                            v['Coords']['Z'] + 0.15, _U("steal"))
                                        DrawMarker(2, v['Coords']['X'], v['Coords']['Y'], v['Coords']['Z'], 0.0, 0.0,
                                            0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false,
                                            1, false, false, false)
                                        if IsControlJustReleased(0, 38) then
                                            StealPropItem(k)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('nocore-items:client:use:lockpick')
AddEventHandler('nocore-items:client:use:lockpick', function(IsAdvanced)
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if CurrentHouse ~= nil then
            if CurrentCadets >= 3 then
                local hours = GetClockHours()
                if hours >= Config.MinimumTime or hours <= Config.MaximumTime then
                    if IsAdvanced then
                        exports['nocore-lockpick']:OpenLockpickGame(function(Success)
                            if Success then
                                LockpickFinish(true)
                            else
                                if math.random(1, 100) < 19 then
                                    TriggerServerEvent('Framework:Server:RemoveItem', 'advancedlockpick', 1)
                                    TriggerServerEvent('nocore-police:server:CreateBloodDrop', PlayerCoords)
                                    TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['advancedlockpick'], "remove")
                                    Framework.Functions.Notify(_U("evidence"), "error")
                                end
                            end
                        end)
                    else
                        if HasItem then
                            exports['nocore-lockpick']:OpenLockpickGame(function(Success)
                                if Success then
                                    LockpickFinish(true)
                                else
                                    if math.random(1, 100) <= 35 then
                                        TriggerServerEvent('Framework:Server:RemoveItem', 'lockpick', 1)
                                        TriggerServerEvent('nocore-police:server:CreateBloodDrop', PlayerCoords)
                                        TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['lockpick'], "remove")
                                        Framework.Functions.Notify(_U("evidence"), "error")
                                    end
                                end
                            end)
                        else
                            Framework.Functions.Notify(_U("toolkitmissing"), "error")
                        end
                    end
                else
                    Framework.Functions.Notify(_U("nocops"), "info")
                end
            else
                Framework.Functions.Notify(_U("nocops"), "info")
            end
        end
    end, "toolkit")
end)

function LockpickFinish(Success)
    if Success then
        local Time = math.random(17000, 23000)
        LockpickAnim(Time)
        Framework.Functions.Progressbar("lockpick-door", _U("breaking"), Time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true
        }, {}, {}, {}, function() -- Done    
            TriggerServerEvent('nocore-houserobbery:server:set:door:status', CurrentHouse, true)
            EnterHouseRobbery()
            StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
        end, function() -- Cancel
            StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
        end)
    else
        Framework.Functions.Notify(_U("failed"), "error")
    end
end

function EnterHouseRobbery()
    local HouseInterior = {}
    local CoordsTable = {
        x = Config.HouseLocations[CurrentHouse]['Coords']['X'],
        y = Config.HouseLocations[CurrentHouse]['Coords']['Y'],
        z = Config.HouseLocations[CurrentHouse]['Coords']['Z'] - Config.ZOffSet
    }
    TriggerEvent("nocore-sound:client:play", "house-door-open", 0.1)
    TriggerEvent("animations:ToggleCanDoAnims", false)
    OpenDoorAnim()
    InsideHouse = true
    Citizen.Wait(350)
    if math.random(1, 100) <= 60 then
        TriggerEvent('nocore-dispatch:alerts:houserobbery')
    end
    if Config.HouseLocations[CurrentHouse]['Tier'] == 1 then
        HouseInterior = exports['nocore-interiors']:HouseRobTierOne(CoordsTable)
    elseif Config.HouseLocations[CurrentHouse]['Tier'] == 2 then
        HouseInterior = exports['nocore-interiors']:HouseRobTierOne(CoordsTable)
    else
        HouseInterior = exports['nocore-interiors']:HouseRobTierThree(CoordsTable)
    end
    TriggerEvent('nocore-weathersync:client:DisableSync')
    TriggerEvent("nocore-sound:client:play", "house-door-close", 0.1)
    HouseData, OffSets = HouseInterior[1], HouseInterior[2]
    if Config.HouseLocations[CurrentHouse]['HasDog'] ~= nil and Config.HouseLocations[CurrentHouse]['HasDog'] then
        exports['nocore-assets']:RequestModelHash("A_C_Rottweiler")
        SupriseEvent = CreatePed(GetPedType(GetHashKey("A_C_Rottweiler")), GetHashKey("A_C_Rottweiler"),
            Config.HouseLocations[CurrentHouse]['Dog']['X'], Config.HouseLocations[CurrentHouse]['Dog']['Y'],
            Config.HouseLocations[CurrentHouse]['Dog']['Z'], 90, 1, 0)
        TaskCombatPed(SupriseEvent, PlayerPedId(), 0, 16)
        SetPedKeepTask(SupriseEvent, true)
        SetEntityAsNoLongerNeeded(SupriseEvent)
        -- table.insert(CurrentEvent, SupriseEvent)
        CurrentEvent[#CurrentEvent+1] = SupriseEvent
    end
end

function LeaveHouseRobbery()
    TriggerEvent("nocore-sound:client:play", "house-door-open", 0.1)
    OpenDoorAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    exports['nocore-interiors']:DespawnInterior(HouseData, function()
        SetEntityCoords(PlayerPedId(), Config.HouseLocations[CurrentHouse]['Coords']['X'],
            Config.HouseLocations[CurrentHouse]['Coords']['Y'], Config.HouseLocations[CurrentHouse]['Coords']['Z'])
        TriggerEvent('nocore-weathersync:client:EnableSync')
        DoScreenFadeIn(1000)
        CurrentHouse = nil
        HouseData, OffSets = nil, nil
        InsideHouse = false
        TriggerEvent("animations:ToggleCanDoAnims", true)
        TriggerEvent("nocore-sound:client:play", "house-door-close", 0.1)
        if CurrentEvent ~= nil then
            for k, v in pairs(CurrentEvent) do
                DeleteEntity(v)
            end
            CurrentEvent = {}
        end
    end)
end

function StealPropItem(Id)
    local StealObject = GetClosestObjectOfType(Config.HouseLocations[CurrentHouse]['Extras'][Id]['Coords']['X'],
        Config.HouseLocations[CurrentHouse]['Extras'][Id]['Coords']['Y'],
        Config.HouseLocations[CurrentHouse]['Extras'][Id]['Coords']['Z'], 5.0, GetHashKey(
            Config.HouseLocations[CurrentHouse]['Extras'][Id]['PropName']), false, false, false)
    NetworkRequestControlOfEntity(StealObject)
    DeleteEntity(StealObject)
    TriggerServerEvent('nocore-houserobbery:server:recieve:extra', CurrentHouse, Id)
end

local NeededAttempts = 2
function OpenLocker(LockerId)
    local Skillbar = exports['nocore-skillbar']:GetSkillbarObject()
    local Time = math.random(15000, 20000)
    SucceededAttempts = 0
    if not IsWearingHandshoes() then
        TriggerServerEvent("nocore-police:server:CreateFingerDrop", GetEntityCoords(PlayerPedId()))
    end
    LockpickAnim(Time)
    TriggerServerEvent('nocore-houserobbery:server:set:locker:state', CurrentHouse, LockerId, 'Busy', true)
    Framework.Functions.Progressbar("lockpick-locker", _U("searching"), Time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('nocore-hud:server:gain:stress', 4)
        Skillbar.Start({
            duration = math.random(1500, 3000),
            pos = math.random(10, 30),
            width = math.random(10, 20)
        }, function()
            if SucceededAttempts + 1 >= NeededAttempts then
                -- Finish
                ClearPedTasks(PlayerPedId())
                SucceededAttempts = 0
                TriggerServerEvent('nocore-hud:server:gain:stress', 1)
                TriggerServerEvent('nocore-houserobbery:server:locker:reward', CurrentHouse, LockerId, 'Opened', true)
                TriggerServerEvent('nocore-houserobbery:server:set:locker:state', CurrentHouse, LockerId, 'Busy', false)
                -- TriggerServerEvent('nocore-houserobbery:server:set:locker:state', CurrentHouse, LockerId, 'Opened', true)
                StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            else
                -- Repeat
                Skillbar.Repeat({
                    duration = math.random(500, 750),
                    pos = math.random(10, 40),
                    width = math.random(8, 13)
                })
                SucceededAttempts = SucceededAttempts + 1
            end
        end, function()
            -- Fail
            StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            SucceededAttempts = 0
            TriggerServerEvent('nocore-hud:server:gain:stress', 2)
            TriggerServerEvent('nocore-houserobbery:server:set:locker:state', CurrentHouse, LockerId, 'Busy', false)
        end)
    end, function() -- Cancel
        OpeningSomething = false
        TriggerServerEvent('nocore-houserobbery:server:set:locker:state', CurrentHouse, LockerId, 'Busy', false)
        StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
    end)
end

function LockpickAnim(time)
    time = time / 1000
    exports['nocore-assets']:RequestAnimationDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, false, false,
        false)
    OpeningSomething = true
    Citizen.CreateThread(function()
        while OpeningSomething do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            if time <= 0 then
                OpeningSomething = false
                StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

function OpenDoorAnim()
    exports['nocore-assets']:RequestAnimationDict('anim@heists@keycard@')
    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    Citizen.Wait(400)
    ClearPedTasks(PlayerPedId())
end

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

local IsPlayerInsideHouse = function()
    return InsideHouse
end

exports('IsPlayerInsideHouse', IsPlayerInsideHouse)

-- function DrawText3D(x, y, z, text)
--   SetTextScale(0.35, 0.35)
--   SetTextFont(4)
--   SetTextProportional(1)
--   SetTextColour(255, 255, 255, 215)
--   SetTextEntry("STRING")
--   SetTextCentre(true)
--   AddTextComponentString(text)
--   SetDrawOrigin(x,y,z, 0)
--   DrawText(0.0, 0.0)
--   ClearDrawOrigin()
-- end
