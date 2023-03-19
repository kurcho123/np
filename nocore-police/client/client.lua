local ShopItems = {}
local ObjectList = {}
local NearPoliceGarage = false
local NearPoliceImpound = false
local CurrentGarage = nil
local FingerPrintSession = nil
local RobingPlayer = false
Framework = exports['no-core']:GetCoreObject()
PlayerJob = {}
isLoggedIn = true
onDuty = false

--[[ Framework Events ]]

if Config.Debug then
    AddEventHandler('onResourceStart', function(resourceName)
        if (GetCurrentResourceName() == resourceName) then
            Citizen.SetTimeout(500, function()
                Framework.Functions.GetPlayerData(function(PlayerData)
                    PlayerJob, onDuty = PlayerData.job, PlayerData.job.onduty
                    if PlayerJob.name == 'police' and PlayerData.job.onduty then
                        TriggerEvent("raid_clothes:inService", true)
                        TriggerServerEvent("nocore-police:server:UpdateCurrentCops")
                        SpawnZones()
                    end
                    isLoggedIn = true
                end)
            end)
        end
    end)
end

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(500, function()
        Framework.Functions.GetPlayerData(function(PlayerData)
            PlayerJob, onDuty = PlayerData.job, PlayerData.job.onduty
            if PlayerJob.name == 'police' and PlayerData.job.onduty then
                TriggerEvent("raid_clothes:inService", true)
                TriggerServerEvent("nocore-police:server:UpdateCurrentCops")
                SpawnZones()
                PoliceBlip = AddBlipForCoord(-1628.057, -1175.856, 1.695544)
                SetBlipSprite(PoliceBlip, 410)
                SetBlipDisplay(PoliceBlip, 4)
                SetBlipScale(PoliceBlip, 0.5)
                SetBlipAsShortRange(PoliceBlip, true)
                SetBlipColour(PoliceBlip, 29)
        
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName("Полицейски лодки")
                EndTextCommandSetBlipName(PoliceBlip)
                PoliceBlip = AddBlipForCoord(599.9486, -2315.304, 1.976604)
                SetBlipSprite(PoliceBlip, 410)
                SetBlipDisplay(PoliceBlip, 4)
                SetBlipScale(PoliceBlip, 0.5)
                SetBlipAsShortRange(PoliceBlip, true)
                SetBlipColour(PoliceBlip, 29)
            
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName("Полицейски лодки")
                EndTextCommandSetBlipName(PoliceBlip)
            end -- -3427.288, 945.30847, 0.0257788, 176.86013
            isLoggedIn = true
        end)
    end)
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(500, function()
        TriggerEvent("Framework:GetObject", function(obj)
            Framework = obj
        end)
        Citizen.Wait(3500)
        Framework.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.metadata['tracker'] then
                TriggerEvent('nocore-police:client:set:tracker', true)
            end
            if PlayerData.metadata['ishandcuffed'] then
                TriggerServerEvent('nocore-sound:server:play:distance', 2.0, 'handcuff', 0.2)
                Config.IsHandCuffed = true
            end
            isLoggedIn = true
        end)
    end)
end)

function IsHandcuffed()
    return Config.IsHandCuffed
end

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    isLoggedIn = false
    if PlayerJob.name == 'police' then
        TriggerServerEvent("nocore-police:server:UpdateCurrentCops")
    end
    ClearPedTasks(globalPlayerPedId)
    DetachEntity(globalPlayerPedId, true, false)
    DeSpawnZones()
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    --print(PlayerJob.name)
    if PlayerJob.name == "police" then
        onDuty = PlayerJob.onduty
        TriggerEvent("raid_clothes:inService", true)
        SpawnZones()
    elseif PlayerJob.name == 'ambulance' then
        TriggerEvent("raid_clothes:inService", true)
        DeSpawnZones()
    else
        TriggerEvent("raid_clothes:inService", false)
        DeSpawnZones()
    end
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    if Onduty then
        if PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then
            TriggerEvent("raid_clothes:inService", true)
            TriggerServerEvent("nocore-police:server:UpdateCurrentCops")
        end
    else
        if PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then
            TriggerEvent("raid_clothes:inService", false)
            TriggerServerEvent("nocore-police:server:UpdateCurrentCops")
        end
    end
    onDuty = Onduty
end)

--[[ Threads ]]

local CheckingPressPersonalSafe = false
local CheckingPressJailItems = false

CreateThread(function()
    for k, v in pairs(Config.Locations['personal-safe']) do
        exports['nocore-polyzone']:AddBoxZone('personalsafe_' ..k, vector3(v['X'], v['Y'], v['Z']), 1.5, 1.5, {
            name='personalsafe_' ..k,
            heading=v['H'],
            minZ=v['Z'] - 1.5,
            maxZ=v['Z'] + 1.5,
            debugPoly=false
        })
    end
    exports['nocore-polyzone']:AddBoxZone('jailitems', vector3(1840.34, 2579.5, 46.01), 1.5, 1.5, {
        name='jailitems',
        heading=0,
        minZ=46.01 - 1.5,
        maxZ=46.01 + 1.5,
        debugPoly=false
    })
end)

AddEventHandler('nocore-polyzone:enter', function(name)
    for k, v in pairs(Config.Locations['personal-safe']) do
        if LocalPlayer.state["isLoggedIn"] then
            if name == 'personalsafe_' ..k then
                if PlayerJob.name == "police" then
                    CheckForPressPersonal()
                    exports['okokTextUI']:Open('<b>[E] Личен склад</b>', 'purple', 'right')
                end
            elseif name == "jailitems" then
                CheckForPressJailItems()
                exports['okokTextUI']:Open('<b>[E] Jail Items</b>', 'purple', 'right')
            end
        end
    end
end)

AddEventHandler('nocore-polyzone:exit', function(name)
    for k, v in pairs(Config.Locations['personal-safe']) do
        if LocalPlayer.state["isLoggedIn"] then
            if name == 'personalsafe_' ..k then
                if PlayerJob.name == "police" then
                    exports['okokTextUI']:Close()
                    CheckingPressPersonalSafe = false
                end
            elseif name == "jailitems" then
                exports['okokTextUI']:Close()
                CheckingPressJailItems = false
            end
        end
    end
end)

function CheckForPressPersonal()
    CheckingPressPersonalSafe = true
    Citizen.CreateThread(function()
        while CheckingPressPersonalSafe do
            Citizen.Wait(1)
            if IsControlJustReleased(0, 38) then
                if PlayerJob.name == "police" then
                    -- exports['okokTextUI']:Close()
                    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "personalsafe_" .. Framework.Functions.GetPlayerData().citizenid)
                    TriggerEvent("nocore-inventory:client:SetCurrentStash", "personalsafe_" .. Framework.Functions.GetPlayerData().citizenid)
                    -- CheckingPress = false
                    -- return
                end
            end
        end
    end)
end
function CheckForPressJailItems()
    CheckingPressJailItems = true
    Citizen.CreateThread(function()
        while CheckingPressJailItems do
            Citizen.Wait(1)
            if IsControlJustReleased(0, 38) then
                    -- exports['okokTextUI']:Close()
                    TriggerServerEvent("nocore-police:server:openjailitems", source)
                    -- CheckingPress = false
                    -- return
            end
        end
    end)
end

--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            if PlayerJob.name == "police" then
                NearAnything = false
                if onDuty then
                    NearPoliceGarage = false
                    for k, v in pairs(Config.Locations['garage']) do
                        local Area = GetDistanceBetweenCoords(globalPlayerCoords.x, globalPlayerCoords.y, globalPlayerCoords.z, v['X'], v['Y'], v['Z'], true)
                        if Area < 5.5 then
                            NearAnything = true
                            NearPoliceGarage = true
                            CurrentGarage = k
                        end
                    end

                    for k, v in pairs(Config.Locations['personal-safe']) do
                        local Area = GetDistanceBetweenCoords(globalPlayerCoords.x, globalPlayerCoords.y, globalPlayerCoords.z, v['X'], v['Y'], v['Z'], true)
                        if Area < 1.5 then
                            NearAnything = true
                            Framework.Functions.ShowFloatingHelpNotify(v['X'], v['Y'], v['Z'] + 0.15, "~g~E~w~ - Личен склад")
                            DrawMarker(2, v['X'], v['Y'], v['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                            if IsControlJustReleased(0, Config.Keys["E"]) then
                                TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "personalsafe_" .. Framework.Functions.GetPlayerData().citizenid)
                                TriggerEvent("nocore-inventory:client:SetCurrentStash", "personalsafe_" .. Framework.Functions.GetPlayerData().citizenid)
                            end
                        end
                    end
                end
                if not NearAnything then
                    Citizen.Wait(1500)
                    CurrentGarage = nil
                end
            else
                Citizen.Wait(1000)
            end
        end
    end
end)
]]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if Config.IsEscorted then
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
            EnableControlAction(0, 2, true)
            EnableControlAction(0, 245, true)
            EnableControlAction(0, 249, true)
            EnableControlAction(0, 38, true)
            EnableControlAction(0, 322, true)
        end
        if Config.IsHandCuffed then
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 44, true)
            DisableControlAction(1, 37, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 288, true)
            DisableControlAction(2, 199, true)
            DisableControlAction(2, 244, true)
            DisableControlAction(0, 137, true)
            DisableControlAction(0, 59, true)
            DisableControlAction(0, 71, true)
            DisableControlAction(0, 72, true)
            DisableControlAction(0, 73, true)
            DisableControlAction(2, 36, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
            EnableControlAction(0, 245, true)
            if (not IsEntityPlayingAnim(globalPlayerPedId, "mp_arresting", "idle", 3) and
                not IsEntityPlayingAnim(globalPlayerPedId, "mp_arrest_paired", "crook_p2_back_right", 3)) and
                not Framework.Functions.GetPlayerData().metadata["isdead"] then
                exports['nocore-assets']:RequestAnimationDict("mp_arresting")
                TaskPlayAnim(globalPlayerPedId, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
                SetEnableHandcuffs(globalPlayerPedId,true)
            end
        end
        if not Config.IsEscorted and not Config.IsHandCuffed then
            Citizen.Wait(2000)
        end
    end
end)

-- // Events \\ --

RegisterNetEvent('nocore-police:client:Fingerprint:closest')
AddEventHandler('nocore-police:client:Fingerprint:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 2.5 then
        TriggerServerEvent("nocore-police:server:show:machine", GetPlayerServerId(Player))
    else
        Framework.Functions.Notify("Няма играч на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:getstatus:closest')
AddEventHandler('nocore-police:client:getstatus:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 1.5 then
        local ServerId = GetPlayerServerId(Player)
        TriggerServerEvent("nocore-police:server:getstatus:closest", ServerId)
    else
        Framework.Functions.Notify("Няма никой наблизо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:ToggleDuty')
AddEventHandler('nocore-police:client:ToggleDuty', function()
    if not onDuty then
        TriggerServerEvent("Framework:ToggleDuty", true)
    else
        TriggerServerEvent("Framework:ToggleDuty", false)
        Framework.Functions.Notify('Вие излязохте от смяна', 'error')
    end
end)

RegisterNetEvent('nocore-police:client:OpenArmory')
AddEventHandler('nocore-police:client:OpenArmory', function()
    if PlayerJob.name == "police" then
        --SetWeaponSeries()
        local Items = {}
        Config.Items.items = {}
        for k, v in pairs(Config.Items.citems) do
            print(PlayerJob.grade.level)
            if PlayerJob.grade.level >= v.rank then
                table.insert(Items, v)
                
            end
        end
        for k, v in pairs(Items) do
            v.slot = k
            if v.type == 'weapon' then
                v.info.serie = 'PD'..Framework.Shared.RandomInt(3):upper()..Framework.Shared.RandomStr(3)..Framework.Shared.RandomInt(3):upper()..Framework.Shared.RandomStr(2)..Framework.Shared.RandomInt(3):upper()
            end
        end
        Config.Items.items = Items
        TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "police", Config.Items)
    end
end)

function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end

RegisterNetEvent('nocore-police:client:bill:player')
AddEventHandler('nocore-police:client:bill:player', function(price)
    SetTimeout(math.random(2500, 3000), function()
        local gender = "meneer"
        if Framework.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "mevrouw"
        end
        local charinfo = Framework.Functions.GetPlayerData().charinfo
        TriggerServerEvent('nocore-phone:server:sendNewMail', {
            sender = "Police Los Santos",
            subject = "New fine",
            message = "Dear " .. gender .. " " .. charinfo.lastname ..
                ",<br/><br />Националната агенция за приходите (НАП) взеха парите, които дължите на държавата от вашата банкова сметка.<br /><br />Общ размер на глобата: <strong>$" ..
                price ..
                "</strong> <br><br>Моля, въведете тази сума <strong>14</strong> в рамките работни дни. <br/><br/>На Ваше разположение,<br />Съдът",
            button = {}
        })
    end)
end)

RegisterNetEvent('nocore-police:client:unlock')
AddEventHandler('nocore-police:client:unlock', function()
    local vehicle, dist = Framework.Functions.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    if vehicle and dist <= 2.0 then
        exports['nocore-ui']:Circle(function(success)
            if success then
                SetVehicleDoorsLockedForAllPlayers(vehicle,false)
                SetVehicleDoorsLocked(vehicle, 1)
                PlayVehicleDoorOpenSound(vehicle, 0)
                Framework.Functions.Notify("Разбиването е успешно!")
            else
                return Framework.Functions.Notify("Неуспешно!", "error")
            end
        end, 8, 20) -- NumberOfCircles, MS
    else
        return Framework.Functions.Notify("Няма кола на близо!", "error")
    end
end)

-- // Cuff & Escort Event \\ --

RegisterNetEvent('nocore-police:client:hardcuff:closest')
AddEventHandler('nocore-police:client:hardcuff:closest', function()
    if not IsPedRagdoll(globalPlayerPedId) then
        local Player = Framework.Functions.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
        if Player then
            local ServerId = GetPlayerServerId(Player)
            local TargetHeading = GetEntityHeading(GetPlayerPed(Player))
            local PlayerHeading = GetEntityHeading(PlayerPedId())
            local DifInHeading = TargetHeading - PlayerHeading
            if not IsPedInAnyVehicle(GetPlayerPed(Player)) and not globalIsPedInAnyVehicle and (DifInHeading > -50 and DifInHeading < 50) then
                TriggerServerEvent("nocore-police:server:hardcuff:closest", ServerId, false)
            else
                Framework.Functions.Notify("Не можете да сложите белезници на човек, който е в МПС или е с лице към вас", "error")
            end
        else
            Framework.Functions.Notify("Няма човек на близо", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)


RegisterNetEvent('nocore-police:client:cuff:target')
AddEventHandler('nocore-police:client:cuff:target', function(data)
    if not IsPedRagdoll(globalPlayerPedId) then
        local Player = NetworkGetPlayerIndexFromPed(data.entity)
        if Player ~= -1 then
            local ServerId = GetPlayerServerId(Player)
            local TargetHeading = GetEntityHeading(GetPlayerPed(Player))
            local PlayerHeading = GetEntityHeading(PlayerPedId())
            local DifInHeading = TargetHeading - PlayerHeading
            if not IsPedInAnyVehicle(GetPlayerPed(Player)) and not globalIsPedInAnyVehicle and (DifInHeading > -50 and DifInHeading < 50) then
                TriggerServerEvent("nocore-police:server:cuff:closest", ServerId, false)
            else
                Framework.Functions.Notify("Не можете да сложите белезници на човек, който е в МПС или е с лице към вас", "error")
            end
        else
            Framework.Functions.Notify("Няма човек на близо", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('nocore-police:client:cuff:closest')
AddEventHandler('nocore-police:client:cuff:closest', function(pigtails)
    if not IsPedRagdoll(globalPlayerPedId) then
        local Player, Distance = Framework.Functions.GetClosestPlayer()
        if Player ~= -1 and Distance < 1.5 then
            local ServerId = GetPlayerServerId(Player)
            local TargetHeading = GetEntityHeading(GetPlayerPed(Player))
            local PlayerHeading = GetEntityHeading(PlayerPedId())
            local DifInHeading = TargetHeading - PlayerHeading
            if not IsPedInAnyVehicle(GetPlayerPed(Player)) and not globalIsPedInAnyVehicle and (DifInHeading > -50 and DifInHeading < 50) then
                TriggerServerEvent("nocore-police:server:cuff:closest", ServerId, pigtails)
            else
                Framework.Functions.Notify(
                    "Не можете да сложите белезници на човек, който е в МПС или е с лице към вас",
                    "error")
            end
        else
            Framework.Functions.Notify("Няма човек на близо", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

--Pliers to cut the hand cuffs
RegisterNetEvent('nocore-police:client:use:pliers')
AddEventHandler('nocore-police:client:use:pliers', function()
    if not IsPedRagdoll(globalPlayerPedId) then
        local Player, Distance = Framework.Functions.GetClosestPlayer()
        if Player ~= -1 and Distance < 1.5 then
            local ServerId = GetPlayerServerId(Player)
            if not IsPedInAnyVehicle(GetPlayerPed(Player)) and not globalIsPedInAnyVehicle then
                TriggerServerEvent("nocore-police:server:use:pliers", ServerId, true)
            else
                Framework.Functions.Notify( "Не можете да помогнете на човек, който е в МПС","error")
            end
        else
            Framework.Functions.Notify("Няма човек на близо", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

-- The player cuffing the ped
RegisterNetEvent('nocore-police:client:cuffPed')
AddEventHandler('nocore-police:client:cuffPed',function()
    exports['nocore-assets']:RequestAnimationDict("mp_arrest_paired")
    Citizen.Wait(250)
    TaskPlayAnim(globalPlayerPed, 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
    Citizen.Wait(3000)
end)

-- The player uncuffing the pped
RegisterNetEvent('nocore-police:client:uncuffPed')
AddEventHandler('nocore-police:client:uncuffPed',function()
    exports['nocore-assets']:RequestAnimationDict("mp_arresting")
    Citizen.Wait(250)
    TaskPlayAnim(globalPlayerPed, 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
    Citizen.Wait(3500)
    TriggerServerEvent('nocore-sound:server:play:distance', 2.0, 'uncuff', 0.2)
    Citizen.Wait(2000)
    ClearPedTasks(globalPlayerPed)
end)


RegisterNetEvent('nocore-police:client:get:cuffed')
AddEventHandler('nocore-police:client:get:cuffed', function(sourceNetID, hard)
    print('cuff')
    local Skillbar = exports['nocore-skillbar']:GetSkillbarObject()
    local NotifySend = false
    local SucceededAttempts = 0
    local NeededAttempts = 1
        GetCuffedAnimation(sourceNetID)
        if not hard then
            Skillbar.Start({
                duration = math.random(360, 375),
                pos = math.random(10, 30),
                width = math.random(10, 20)
            }, function()
                if SucceededAttempts + 1 >= NeededAttempts then
                    -- Finish
                    SucceededAttempts = 0
                    ClearPedTasksImmediately(globalPlayerPedId)
                    SetEnableHandcuffs(globalPlayerPedId, false)
                    Config.IsHandCuffed = false
                    TriggerServerEvent("nocore-police:server:set:handcuff:status", false)
                    Framework.Functions.Notify("Ти се освободи")
                else
                    -- Repeat
                    Skillbar.Repeat({
                        duration = math.random(500, 1300),
                        pos = math.random(10, 40),
                        width = math.random(5, 13)
                    })
                    SucceededAttempts = SucceededAttempts + 1
                end
            end, function()
                -- Fail
                Config.IsHandCuffed = true
                TriggerServerEvent("nocore-police:server:set:handcuff:status", true)
                SetEnableHandcuffs(globalPlayerPedId, true)
                SetEnableBoundAnkles(globalPlayerPed, true)
                SetCurrentPedWeapon(globalPlayerPedId, GetHashKey("weapon_unarmed"), 1)
                ClearPedTasksImmediately(globalPlayerPedId)
                SucceededAttempts = 0
                if not NotifySend then
                    NotifySend = true
                    Framework.Functions.Notify("Ти си soft-cuffed")
                    Citizen.Wait(100)
                    NotifySend = false
                end
            end)
        end
        Config.IsHandCuffed = true
        TriggerServerEvent("nocore-police:server:set:handcuff:status", true)
        SetEnableHandcuffs(globalPlayerPedId, true)
        SetEnableBoundAnkles(globalPlayerPed, true)
        SetCurrentPedWeapon(globalPlayerPedId, GetHashKey("weapon_unarmed"), 1)
        ClearPedTasksImmediately(globalPlayerPedId)
        SucceededAttempts = 0
        if not NotifySend then
            NotifySend = true
            if hard then return Framework.Functions.Notify("Ти си hard-cuffed") else return Framework.Functions.Notify("Ти си soft-cuffed") end
            Citizen.Wait(100)
            NotifySend = false
        end
end)

RegisterNetEvent('nocore-police:client:get:uncuffed')
AddEventHandler('nocore-police:client:get:uncuffed', function(sourceNetID)
    local cuffingPed = GetPlayerPed(GetPlayerFromServerId(sourceNetID))
    Config.IsEscorted = false
    Config.IsHandCuffed = false
    DetachEntity(globalPlayerPedId, true, false)
    TriggerServerEvent("nocore-police:server:set:handcuff:status", false)
    SetEnableHandcuffs(globalPlayerPedId,false)
    SetEnableBoundAnkles(globalPlayerPedId,false)
    UncuffPed(globalPlayerPedId)
    SetEntityCoords(globalPlayerPedId,GetOffsetFromEntityInWorldCoords(cuffingPed,0.0,0.45,0.0))
    SetEntityHeading(globalPlayerPedId,GetEntityHeading(cuffingPed))
    Citizen.Wait(250)
    exports['nocore-assets']:RequestAnimationDict("mp_arresting")
    TaskPlayAnim(globalPlayerPedId, 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
    Citizen.Wait(5500)
    ClearPedTasks(globalPlayerPedId)
    Framework.Functions.Notify("Белезниците ти бяха премахнати")
end)

RegisterNetEvent('nocore-police:client:set:escort:status:false')
AddEventHandler('nocore-police:client:set:escort:status:false', function()
    if Config.IsEscorted then
        Config.IsEscorted = false
        DetachEntity(globalPlayerPedId, true, false)
        ClearPedTasks(globalPlayerPedId)
    end
end)

RegisterNetEvent('nocore-police:client:escort:closest')
AddEventHandler('nocore-police:client:escort:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 2.5 then
        local ServerId = GetPlayerServerId(Player)
        if not Config.IsHandCuffed and not Config.IsEscorted then
            if not globalIsPedInAnyVehicle then
                TriggerServerEvent("nocore-police:server:escort:closest", ServerId)
            else
                Framework.Functions.Notify("Не можете да ескортирате в превозно средство", "error")
            end
        end
    else
        Framework.Functions.Notify("Няма човек на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:get:escorted')
AddEventHandler('nocore-police:client:get:escorted', function(PlayerId)
    if not Config.IsEscorted then
        Config.IsEscorted = true
        local dragger = GetPlayerPed(GetPlayerFromServerId(PlayerId))
        local heading = GetEntityHeading(dragger)
        SetEntityCoords(globalPlayerPedId, GetOffsetFromEntityInWorldCoords(dragger, 0.0, 0.45, 0.0))
        AttachEntityToEntity(globalPlayerPedId, dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false,
            2, true)
    else
        Config.IsEscorted = false
        DetachEntity(globalPlayerPedId, true, false)
    end
end)

RegisterNetEvent('nocore-police:client:PutPlayerInVehicle')
AddEventHandler('nocore-police:client:PutPlayerInVehicle', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 2.5 then
        local ServerId = GetPlayerServerId(Player)
        if not Config.IsHandCuffed and not Config.IsEscorted then
            TriggerServerEvent("nocore-police:server:set:in:veh", ServerId)
        end
    else
        Framework.Functions.Notify("Няма човек на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:SetPlayerOutVehicle')
AddEventHandler('nocore-police:client:SetPlayerOutVehicle', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 2.5 then
        local ServerId = GetPlayerServerId(Player)
        if not Config.IsHandCuffed and not Config.IsEscorted then
            TriggerServerEvent("nocore-police:server:set:out:veh", ServerId)
        end
    else
        Framework.Functions.Notify("Няма човек на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:set:out:veh')
AddEventHandler('nocore-police:client:set:out:veh', function()
    if globalIsPedInAnyVehicle then
        local vehicle = GetVehiclePedIsIn(globalPlayerPedId, false)
        TaskLeaveVehicle(globalPlayerPedId, vehicle, 16)
    end
end)

RegisterNetEvent('nocore-police:client:set:in:veh')
AddEventHandler('nocore-police:client:set:in:veh', function()
    if Config.IsHandCuffed or Config.IsEscorted then
        local vehicle = Framework.Functions.GetClosestVehicle()
        if DoesEntityExist(vehicle) then
            for i = GetVehicleMaxNumberOfPassengers(vehicle), -1, -1 do
                if IsVehicleSeatFree(vehicle, i) then
                    Config.IsEscorted = false
                    ClearPedTasks(globalPlayerPedId)
                    DetachEntity(globalPlayerPedId, true, false)
                    Citizen.Wait(100)
                    SetPedIntoVehicle(globalPlayerPedId, vehicle, i)
                    return
                end
            end
        end
    end
end)
--[[
RegisterNetEvent('nocore-police:client:steal:closest')
AddEventHandler('nocore-police:client:steal:closest', function(data)
    Framework.Functions.Notify("Кофти тръпка, ZemReMasTa беше", "error")
end)
]]
RegisterNetEvent('nocore-police:client:steal:closest')
AddEventHandler('nocore-police:client:steal:closest', function(data)
    local entitycoords = GetEntityCoords(data.entity)
    local player = NetworkGetPlayerIndexFromPed(data.entity)
    if player ~= -1 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        if IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 3) or IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) or IsTargetDead(playerId) or IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_base", 3) then
            Framework.Functions.TriggerCallback('nocore-police:server:is:inventory:disabled', function(IsDisabled)
                if not IsDisabled then
                    Framework.Functions.TriggerCallback('nocore-police:server:is:policeman', function(isPolice)
                    local robbing = math.random(5000, 7000)
                    if isPolice then
                        robbing = math.random(30000, 40000)
                    end
                    Framework.Functions.Progressbar("robbing_player", "обиране..", robbing, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true
                        }, {
                            animDict = "random@shop_robbery",
                            anim = "robbery_action_b",
                            flags = 16
                        }, {}, {}, function() -- Done
                            local plyCoords = GetEntityCoords(playerPed)
                            local pos = GetEntityCoords(globalPlayerPedId)
                            if (IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 3) or
                            IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) or
                            IsTargetDead(playerId) or
                            IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_base", 3)) and
                            #(plyCoords - pos) < 2.5 then
                                StopAnimTask(globalPlayerPedId, "random@shop_robbery", "robbery_action_b", 1.0)
                                TriggerServerEvent("nocore-inventory:server:OpenInventory", "otherplayer", playerId)
                                TriggerEvent("nocore-inventory:server:RobPlayer", playerId)
                                RobPlayer(player)
                            else
                                StopAnimTask(globalPlayerPedId, "random@shop_robbery", "robbery_action_b", 1.0)
                                Framework.Functions.Notify("Няма човек на близо", "error")
                            end
                        end, function() -- Cancel
                            StopAnimTask(globalPlayerPedId, "random@shop_robbery", "robbery_action_b", 1.0)
                            Framework.Functions.Notify("Отменен..", "error")
                        end)
                   end, playerId)
                else
                    Framework.Functions.Notify("Жалко, че не можеш да ограбиш путьо", "error")
                end
            end, playerId)
        end
    else
        Framework.Functions.Notify("Няма човек на близо", "error")
    end
end)


RegisterNetEvent('nocore-inventory:client:onClose', function()
    RobingPlayer = false
end)

function RobPlayer(player)
    local playerPed = GetPlayerPed(player)
    local playerId = GetPlayerServerId(player)
    RobingPlayer = true
    CreateThread(function()
        while RobingPlayer do
            Citizen.Wait(100)
            local plyCoords = GetEntityCoords(playerPed)
            local pos = GetEntityCoords(globalPlayerPedId)
            if (IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 3) or
            IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) or
            IsEntityPlayingAnim(playerPed, 'dead', 'dead_a', 3) or
            IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_base", 3)) and
            #(plyCoords - pos) < 2.5 then
            else
                TriggerEvent("nocore-inventory:client:Close")
                RobingPlayer = false
                return
            end
        end
    end)
end

RegisterNetEvent('nocore-police:client:search:closest')
AddEventHandler('nocore-police:client:search:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 2.5 then
        local playerId = GetPlayerServerId(Player)
        TriggerServerEvent("nocore-inventory:server:OpenInventory", "otherplayer", playerId)
        TriggerServerEvent("nocore-police:server:SearchPlayer", playerId)
    else
        Framework.Functions.Notify("Няма човек на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:impound:closest')
AddEventHandler('nocore-police:client:impound:closest', function()
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
    if Vehicle ~= 0 and Distance < 1.7 then
        Framework.Functions.Progressbar("impound-vehicle",
            "Премахване на превозно средство..", math.random(10000, 15000), false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {
                animDict = "random@mugging4",
                anim = "struggle_loop_b_thief",
                flags = 49
            }, {}, {}, function() -- Done
                TriggerEvent('persistent-vehicles/forget-vehicle', Vehicle)
                Framework.Functions.DeleteVehicle(Vehicle)
                Framework.Functions.Notify("Завършено", "success")
            end, function()
                Framework.Functions.Notify("Прекратено..", "error")
            end)
    else
        Framework.Functions.Notify("Няма автомобил на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:impound:hard:closest')
AddEventHandler('nocore-police:client:impound:hard:closest', function()
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
    local Plate = GetVehicleNumberPlateText(Vehicle)
    if Vehicle ~= 0 and Distance < 1.7 then
        Framework.Functions.Progressbar("impound-vehicle",
            "Конфискуване на МПС..",
            math.random(10000, 15000), false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {
                animDict = "random@mugging4",
                anim = "struggle_loop_b_thief",
                flags = 49
            }, {}, {}, function() -- Done
                TriggerEvent('persistent-vehicles/forget-vehicle', Vehicle)
                Framework.Functions.DeleteVehicle(Vehicle)
                Framework.Functions.TriggerCallback("nocore-police:SetVehicleInPound", function() end, exports['nocore-fakeplate']:GetRealPlate(Plate), true)
                Framework.Functions.Notify("Завършено", "success")
            end, function()
                Framework.Functions.Notify("Прекратено..", "error")
            end)
    else
        Framework.Functions.Notify("Няма автомобил на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:enkelband:closest')
AddEventHandler('nocore-police:client:enkelband:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("nocore-police:server:set:tracker", GetPlayerServerId(Player))
    else
        Framework.Functions.Notify("Няма човек на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:set:tracker')
AddEventHandler('nocore-police:client:set:tracker', function(bool)
    local trackerClothingData = {}
    if bool then
        trackerClothingData.outfitData = {
            ["accessory"] = {
                item = 13,
                texture = 0
            }
        }
        TriggerEvent('nocore-clothing:client:loadOutfit', trackerClothingData)
    else
        trackerClothingData.outfitData = {
            ["accessory"] = {
                item = -1,
                texture = 0
            }
        }
        TriggerEvent('nocore-clothing:client:loadOutfit', trackerClothingData)
    end
end)

RegisterNetEvent('nocore-police:client:send:tracker:location')
AddEventHandler('nocore-police:client:send:tracker:location', function(RequestId)
    TriggerServerEvent('nocore-police:server:send:tracker:location', globalPlayerCoords, RequestId)
end)

RegisterNetEvent('nocore-police:client:show:machine')
AddEventHandler('nocore-police:client:show:machine', function(PlayerId)
    FingerPrintSession = PlayerId
    SendNUIMessage({
        type = "OpenFinger"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('nocore-police:client:show:fingerprint:id')
AddEventHandler('nocore-police:client:show:fingerprint:id', function(FingerPrintId)
    SendNUIMessage({
        type = "UpdateFingerId",
        fingerprintId = FingerPrintId
    })
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('nocore-police:client:HotwireVehicle')
AddEventHandler('nocore-police:client:HotwireVehicle', function()
    exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(GetVehiclePedIsIn(globalPlayerPedId)), true)
end)

RegisterNetEvent('nocore-police:client:CheckBank')
AddEventHandler('nocore-police:client:CheckBank', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 1.5 then
        local ServerId = GetPlayerServerId(Player)
        TriggerServerEvent("nocore-police:server:CheckBank", ServerId)
    else
        Framework.Functions.Notify("Няма никой наблизо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:CheckPlate')
AddEventHandler('nocore-police:client:CheckPlate', function()
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
    local Plate = GetVehicleNumberPlateText(Vehicle)

    if DoesEntityExist(Vehicle) and Distance < 4 then
        TriggerServerEvent("nocore-police:server:CheckPlate", Plate)
    else
        Framework.Functions.Notify("Няма автомобил на близо", "error")
    end
end)

RegisterNetEvent('nocore-police:client:RemoveMask')
AddEventHandler('nocore-police:client:RemoveMask', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 1.5 then
        local ServerId = GetPlayerServerId(Player)
        TriggerServerEvent('nocore-outfits:server:RemoveMask', ServerId)
    else
        Framework.Functions.Notify("Няма никой наблизо", "error")
    end
end)

RegisterNUICallback('ScanFinger', function(data)
    TriggerServerEvent('nocore-police:server:showFingerId', FingerPrintSession)
end)


RegisterNetEvent('nocore-police:client:open:evidence')
AddEventHandler('nocore-police:client:open:evidence', function(args)
    NearPolice = false
    for k, v in pairs(Config.Locations['EvidenceRoom']) do
        local Gebied = GetDistanceBetweenCoords(globalPlayerCoords.x, globalPlayerCoords.y, globalPlayerCoords.z, v["x"], v["y"], v["z"], true)
        if Gebied <= 45.0 then
            NearPolice = true
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "evidencestash_" .. args, {
                maxweight = 2500000,
                slots = 50
            })
            TriggerEvent("nocore-inventory:client:SetCurrentStash", "evidencestash_" .. args)
        end
    end
    if not NearPolice then
        Framework.Functions.Notify(
            "Трябва да сте в близост до полицейското управление, за да създадете доказателства, безопасни за всякакви престъпления.",
            "error")
    end
end)

RegisterNetEvent('nocore-police:client:open:evidence2')
AddEventHandler('nocore-police:client:open:evidence2', function(args)
    NearPolice = false
    for k, v in pairs(Config.Locations['EvidenceRoom']) do
        local Gebied = GetDistanceBetweenCoords(globalPlayerCoords.x, globalPlayerCoords.y, globalPlayerCoords.z, v["x"], v["y"], v["z"], true)
        if Gebied <= 45.0 then
            NearPolice = true
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "evidencestashjail_" .. args, {
                maxweight = 100000,
                slots = 10
            })
            TriggerEvent("nocore-inventory:client:SetCurrentStash", "evidencestashjail_" .. args)
        end
    end
    if not NearPolice then
        Framework.Functions.Notify(
            "Трябва да сте в близост до полицейското управление, за да създадете доказателства, безопасни за всякакви престъпления.",
            "error")
    end
end)

RegisterNetEvent('nocore-police:client:open:evidence3')
AddEventHandler('nocore-police:client:open:evidence3', function(args)
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "evidencestashjail_" .. args, {
                maxweight = 100000,
                slots = 10
            })
            TriggerEvent("nocore-inventory:client:SetCurrentStash", "evidencestashjail_" .. args)
end)




--   // Objects \\   --

RegisterNetEvent('nocore-police:client:spawn:object')
AddEventHandler('nocore-police:client:spawn:object', function(Type)
    Framework.Functions.Progressbar("spawn-object", "Поставяне на предмет..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16
    }, {}, {}, function() -- Done
        StopAnimTask(globalPlayerPedId, "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("nocore-police:server:spawn:object", Type, PlayerPedId())
    end, function() -- Cancel
        StopAnimTask(globalPlayerPedId, "anim@narcotics@trash", "drop_front", 1.0)
        Framework.Functions.Notify("Отказано..", "error")
    end)
end)

RegisterNetEvent('nocore-police:client:delete:object')
AddEventHandler('nocore-police:client:delete:object', function()
    local objectId, dist = GetClosestPoliceObject()
    if dist < 5.0 then
        Framework.Functions.Progressbar("remove-object", "Взимане на педмет..", 2500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {
            animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
            anim = "plant_floor",
            flags = 16
        }, {}, {}, function() -- Done
            StopAnimTask(globalPlayerPedId, "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
                "plant_floor", 1.0)
            TriggerServerEvent("nocore-police:server:delete:object", objectId)
        end, function() -- Cancel
            StopAnimTask(globalPlayerPedId, "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
                "plant_floor", 1.0)
            Framework.Functions.Notify("Прекратено..", "error")
        end)
    end
end)

RegisterNetEvent('nocore-police:client:place:object')
AddEventHandler('nocore-police:client:place:object', function(objectId, type, player, playerped)
    print(playerped)
    print(GetPlayerPed(GetPlayerFromServerId(player)))
    if GetPlayerPed(GetPlayerFromServerId(player)) == playerped then
        local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
        local heading = GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(player)))
        local forward = GetEntityForwardVector(globalPlayerPedId)
        local x, y, z = table.unpack(coords + forward * 0.5)
        local spawnedObj = CreateObject(Config.Objects[type].model, x, y, z, false, false, false)
        PlaceObjectOnGroundProperly(spawnedObj)
        SetEntityHeading(spawnedObj, heading)
        FreezeEntityPosition(spawnedObj, Config.Objects[type].freeze)
        NetworkRegisterEntityAsNetworked(spawnedObj)
        ObjectList[objectId] = {
            id = objectId,
            object = spawnedObj,
            coords = {
                x = x,
                y = y,
                z = z - 0.3
            }
        }
    end
end)

RegisterNetEvent('nocore-police:client:remove:object')
AddEventHandler('nocore-police:client:remove:object', function(objectId)
    NetworkRequestControlOfEntity(ObjectList[objectId].object)
    DeleteObject(ObjectList[objectId].object)
    ObjectList[objectId] = nil
end) 

RegisterNetEvent('nocore-police:client:open:impound')
AddEventHandler('nocore-police:client:open:impound', function()
    Framework.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.grade.level >= 2 then
            MenuImpound()
        else
            Framework.Functions.Notify('Как си сладък?', 'error', 5000)
        end
    end)
end)

RegisterNetEvent('nocore-police:client:TakeOutImpoundVehicle')
AddEventHandler('nocore-police:client:TakeOutImpoundVehicle', function(data)
    local coords = Config.Locations["impound"]
    if Framework.Functions.IsSpawnPointClear(coords, 4) then
        Framework.Functions.SpawnVehicle(data.vehicle.vehicle, function(veh)
            Framework.Functions.SetVehicleProperties(veh, json.decode(data.vehicle.mods))
            SetVehicleNumberPlateText(veh, exports['nocore-fakeplate']:GetFakePlate(data.vehicle.plate))
            SetEntityHeading(veh, coords.h)
            exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(veh), true)
            exports['nocore-fuel']:SetFuelLevel(veh, GetVehicleNumberPlateText(veh), 100.0, false)
            SetVehicleEngineOn(veh, true, true)
            Framework.Functions.TriggerCallback("nocore-police:SetVehicleInPound", function() end, data.vehicle.plate, false)
        end, coords, false)
    else
        Framework.Functions.Notify('На мястото има дурга коля, моля преместете я', 'error', 5000)
    end
end)

RegisterNetEvent('nocore-police:client:SeizeCash', function()
    local player, distance = Framework.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("nocore-police:server:SeizeCash", playerId)
    else
        Framework.Functions.Notify("Няма никой наблизо", "error")
    end
end)

-- // Functions \\ --


function GetCuffedAnimation(sourceNetID)
    local cuffingPed = GetPlayerPed(GetPlayerFromServerId(sourceNetID))
    exports['nocore-assets']:RequestAnimationDict("mp_arrest_paired")
    SetCurrentPedWeapon(globalPlayerPedId, `WEAPON_UNARMED`,true)
    SetEntityCoords(globalPlayerPedId,GetOffsetFromEntityInWorldCoords(cuffingPed,0.0,0.45,0.0))
    SetEntityHeading(globalPlayerPedId,GetEntityHeading(cuffingPed))
    Citizen.Wait(250)
    TaskPlayAnim(globalPlayerPedId,'mp_arrest_paired','crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
    Citizen.Wait(1760)
    TriggerServerEvent('nocore-sound:server:play:distance', 2.0, 'handcuff', 0.2)
    Citizen.Wait(2000)
    exports['nocore-assets']:RequestAnimationDict("mp_arresting")
    TaskPlayAnim(globalPlayerPedId, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end

function GetClosestPoliceObject()
    local pos = GetEntityCoords(globalPlayerPedId, true)
    local current = nil
    local dist = nil
    for id, data in pairs(ObjectList) do
        if current ~= nil then
            if (GetDistanceBetweenCoords(pos, ObjectList[id].coords.x, ObjectList[id].coords.y, ObjectList[id].coords.z,
                true) < dist) then
                current = id
                dist = GetDistanceBetweenCoords(pos, ObjectList[id].coords.x, ObjectList[id].coords.y, ObjectList[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, ObjectList[id].coords.x, ObjectList[id].coords.y,
                       ObjectList[id].coords.z, true)
            current = id
        end
    end
    return current, dist
end

function IsTargetDead(playerId)
    local IsDead = false
    Framework.Functions.TriggerCallback('nocore-police:server:is:player:dead', function(result)
        IsDead = result
    end, playerId)
    Citizen.Wait(100)
    return IsDead
end

function SetWeaponSeries()
    Config.Items.items[1].info.serie = Framework.Functions.GetPlayerData().job.serial
    Config.Items.items[2].info.serie = Framework.Functions.GetPlayerData().job.serial
    Config.Items.items[3].info.serie = Framework.Functions.GetPlayerData().job.serial
end

function GetEscortStatus()
    return Config.IsEscorted
end

function GetImpoundStatus()
    return NearPoliceImpound
end

function MenuImpound()
      local sendMenu = {}
      table.insert(sendMenu,{
          id = 1,
          header = "Наказателен Паркинг",
          txt = "",
          isMenuHeader = true
      })
      Framework.Functions.TriggerCallback("nocore-police:GetImpoundedVehicles", function(result)
        if result == nil then
            Framework.Functions.Notify("Няма иззети превозни средства", "error", 5000)
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = 'Няма иззети превозни средства',
                txt = '',
            })
        else
            for k, v in pairs(result) do
                table.insert(sendMenu,{
                  id = #sendMenu+1,
                  header = Framework.Shared.Vehicles[v.vehicle]["name"],
                  txt = v.plate .. ' - '.. v.citizenid,
                  params = { 
                      event = "nocore-police:client:TakeOutImpoundVehicle",
                      args = {
                          vehicle = v
                      }
                  }
                })
            end
        end
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Затвори",
            txt = "",
            params = { 
                event = "fakeevnettt",
                args = {}
            }
        })
          exports['nocore-context']:openMenu(sendMenu)
      end)
end



function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function SpawnZones()
    -- Davis PD
    exports['nocore-eye']:AddBoxZone("PoliceArmory", vector3(365.2633, -1603.837, 27.20716), 0.3, 4.0, {
        name= "PoliceArmory",
        heading= 230,
        debugPoly = Config.DebugZones,
        minZ = 24.5,
        maxZ = 27.3
    }, {
        options = {{
            event = "nocore-police:client:OpenArmory",
            icon = "fas fa-archive",
            label = "Склад",
            job = 'police',
            duty = true
        }},
        distance = 2.5
    })
    exports['nocore-eye']:AddBoxZone("Police BossMenu", vector3(359.4532, -1590.98, 30.87548), 0.34, 0.4, {
        name= "Police BossMenu",
        heading= 233,
        debugPoly = Config.DebugZones,
        minZ = 30.8,
        maxZ = 30.9
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'police',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        },
        {
            event = "nocore-police:Client:OpenBossCarMenu",
            icon = "fas fa-clipboard-list",
            label = "МПС-та",
            job = 'police',
            duty = true
        }},
        distance = 2
    })
    exports['nocore-eye']:AddBoxZone("Police Printer", vector3(356.38, -1599.02, 31.05), 1.0, 1.0, {
        name= "Police Printer",
        heading = 50,
        debugPoly = Config.DebugZones,
        minZ = 30.0,
        maxZ = 31.5
    }, {
        options = {{
            event = "nocore-printer:client:OpenPrinter",
            icon = "fas fa-circle",
            label = "Принтер",
            job = 'police',
            duty = true
        }},
        distance = 2.5
    })
    exports['nocore-eye']:AddBoxZone("PoliceFingerprint", vector3(380.4398, -1603.242, 25.4409), 0.5, 1.4, {
        name= "PoliceFingerprint",
        heading= 229,
        debugPoly = Config.DebugZones,
        minZ = 25.3,
        maxZ = 25.5
    }, {
        options = {{
            event = "nocore-police:client:Fingerprint:closest",
            icon = "fas fa-fingerprint",
            label = "Пръстов Отпечатък",
            job = 'police',
            duty = true
        }},
        distance = 2.0
    })
    -- Paleto Sheriff
    exports['nocore-eye']:AddBoxZone("Paleto Sheriff BossMenu", vector3(-432.95, 6004.97, 37.0), 1, 2, {
        name= "Paleto Sheriff BossMenu",
        heading= 315,
        debugPoly = Config.DebugZones,
        minZ = 36.8,
        maxZ = 37.1
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'police',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        },
        {
            event = "nocore-police:Client:OpenBossCarMenu",
            icon = "fas fa-clipboard-list",
            label = "МПС-та",
            job = 'police',
            duty = true
        }},
        distance = 2
    })
    exports['nocore-eye']:AddBoxZone("PoliceArmoryPaleto", vector3(-447.9784, 6017.278, 35.36149), 1.0, 8.0, {
        name= "PoliceArmory",
        heading= 45,
        debugPoly = Config.DebugZones,
        maxZ = 39.0,
        minZ = 36.0
    }, {
        options = {{
            event = "nocore-police:client:OpenArmory",
            icon = "fas fa-archive",
            label = "Склад",
            job = 'police',
            duty = true
        }},
        distance = 3.0
    })

    exports['nocore-eye']:AddBoxZone("PoliceFingerprintPaleto", vector3(-440.0742, 6011.233, 27.45042), 0.34, 0.9, {
        name= "PoliceFingerprint",
        heading= 315,
        debugPoly = Config.DebugZones,
        maxZ = 27.6,
        minZ = 27.3
    }, {
        options = {{
            event = "nocore-police:client:Fingerprint:closest",
            icon = "fas fa-fingerprint",
            label = "Пръстов Отпечатък",
            job = 'police',
            duty = true
        }},
        distance = 2.0
    })
    -- Park Rangers
    exports['nocore-eye']:AddBoxZone("Park Rangers BossMenu", vector3(387.33, 797.76, 190.49), 1, 2,  {
        name= "Park Rangers BossMenu",
        heading= 0,
        debugPoly = Config.DebugZones,
        minZ = 190.0,
        maxZ = 190.6
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'police',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        },
        {
            event = "nocore-police:Client:OpenBossCarMenu",
            icon = "fas fa-clipboard-list",
            label = "МПС-та",
            job = 'police',
            duty = true
        }},
        distance = 2
    })
    exports['nocore-eye']:AddBoxZone("Park Rangers Fingerprint/Duty", vector3(385.58, 795.25, 187.46), 1, 1, {
        name= "Park Rangers Fingerprint/Duty",
        heading= 0,
        debugPoly = Config.DebugZones,
        minZ = 187.4,
        maxZ = 187.7
    }, {
        options = {{
            event = "nocore-police:client:Fingerprint:closest",
            icon = "fas fa-fingerprint",
            label = "Пръстов Отпечатък",
            job = 'police',
            duty = true
        },{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'police'
        }},
        distance = 2.0
    })
    -- La Mesa PD
    exports['nocore-eye']:AddBoxZone("LAMESAPD Duty", vector3(837.69, -1289.32, 28.24), 0.35, 0.5, {
        name= "LAMESAPD Duty",
        heading= 343,
        debugPoly = Config.DebugZones,
        minZ = 28.0,
        maxZ = 29.0
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'police'
        }},
        distance = 2.0
    })
    exports['nocore-eye']:AddBoxZone("LAMESAPD Fingerprint", vector3(838.58, -1298.91, 28.24), 1.1, 2.05, {
        name= "LAMESAPD Fingerprint",
        heading= 0,
        debugPoly = Config.DebugZones,
        minZ = 28.0,
        maxZ = 30.0
    }, {
        options = {{
            event = "nocore-police:client:Fingerprint:closest",
            icon = "fas fa-fingerprint",
            label = "Пръстов Отпечатък",
            job = 'police',
            duty = true
        }},
        distance = 2.0
    })
    exports['nocore-eye']:AddBoxZone("LAMESAPD Armory", vector3(847.82, -1313.52, 28.24), 0.4, 1.4, {
        name= "LAMESAPD Armory",
        heading = 0,
        debugPoly = Config.DebugZones,
        minZ = 25.5,
        maxZ = 29.3
    }, {
        options = {{
            event = "nocore-police:client:OpenArmory",
            icon = "fas fa-archive",
            label = "Склад",
            job = 'police',
            duty = true
        }},
        distance = 2.5
    })
    exports['nocore-eye']:AddBoxZone("LAMESAPD Printer", vector3(844.76, -1309.56, 28.24), 1.0, 1.0, {
        name= "LAMESAPD Printer",
        heading = 0,
        debugPoly = Config.DebugZones,
        minZ = 28.0,
        maxZ = 29.3
    }, {
        options = {{
            event = "nocore-printer:client:OpenPrinter",
            icon = "fas fa-circle",
            label = "Принтер",
            job = 'police',
            duty = true
        }},
        distance = 2.5
    })
    -- Sandy Sheriff
    exports['nocore-eye']:AddBoxZone("Sheriff Duty", vector3(1833.73, 3678.4, 34.19), 0.45, 0.35, {
        name= "Sheriff Fingerprint/Duty",
        heading= 0,
        debugPoly = Config.DebugZones,
        minZ = 34.0,
        maxZ = 35.0
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'police'
        }},
        distance = 2.0
    })
    exports['nocore-eye']:AddBoxZone("Sheriff Printer", vector3(1833.39, 3682.67, 34.19), 1.0, 1.0, {
        name= "Sheriff Printer",
        heading = 0,
        debugPoly = Config.DebugZones,
        minZ = 33.0,
        maxZ = 34.5
    }, {
        options = {{
            event = "nocore-printer:client:OpenPrinter",
            icon = "fas fa-circle",
            label = "Принтер",
            job = 'police',
            duty = true
        }},
        distance = 2.5
    })
    exports['nocore-eye']:AddBoxZone("Sheriff Fingerprint", vector3(1818.04, 3673.43, 34.19), 1.0, 2.0, {
        name= "Park Rangers Fingerprint/Duty",
        heading= 0,
        debugPoly = Config.DebugZones,
        minZ = 33.4,
        maxZ = 35.7
    }, {
        options = {{
            event = "nocore-police:client:Fingerprint:closest",
            icon = "fas fa-fingerprint",
            label = "Пръстов Отпечатък",
            job = 'police',
            duty = true
        }},
        distance = 2.0
    })
    exports['nocore-eye']:AddBoxZone("PoliceArmorySheriff", vector3(1836.81, 3685.11, 34.19), 1.0, 0.6, {
        name= "PoliceArmory",
        heading= 30,
        debugPoly = Config.DebugZones,
        maxZ = 36.0,
        minZ = 33.0
    }, {
        options = {{
            event = "nocore-police:client:OpenArmory",
            icon = "fas fa-archive",
            label = "Склад",
            job = 'police',
            duty = true
        }},
        distance = 3.0
    })
end

function DeSpawnZones()
    exports['nocore-eye']:RemoveZone("PoliceArmory")
    exports['nocore-eye']:RemoveZone("PoliceDuty")
    exports['nocore-eye']:RemoveZone("Police BossMenu")
    exports['nocore-eye']:RemoveZone("PoliceFingerprint")
    exports['nocore-eye']:RemoveZone("PoliceArmorySandy")
    exports['nocore-eye']:RemoveZone("Police Printer")
    exports['nocore-eye']:RemoveZone("Sheriff Duty")
    exports['nocore-eye']:RemoveZone("PoliceFingerprintSandy")
    exports['nocore-eye']:RemoveZone("PoliceArmorySheriff")
    exports['nocore-eye']:RemoveZone("Sheriff Fingerprint")
    exports['nocore-eye']:RemoveZone("Sheriff Printer")
    exports['nocore-eye']:RemoveZone("LAMESAPD Fingerprint")
    exports['nocore-eye']:RemoveZone("LAMESAPD Duty")
    exports['nocore-eye']:RemoveZone("LAMESAPD Armory")
    exports['nocore-eye']:RemoveZone("LAMESAPD Printer")
end

RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
    if exports['nocore-assets']:GetPropStatus() then
        exports['nocore-assets']:RemoveProp()
        PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
        TaskPlayAnim(globalPlayerPedId, "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1,
            49, 0, 0, 0, 0)
    end
end)

boat = false



function createcar(carsend, x,y,z,h)
    local car = GetHashKey(carsend)
    RequestModel(car)
    cv = CreateVehicle(car, x, y, z, h, 1, 0)
    SetVehicleOnGroundProperly(cv)
    SetVehicleHasBeenOwnedByPlayer(cv, true)
    SetEntityAsMissionEntity(cv, false, false)
    SetPedIntoVehicle(PlayerPedId() , cv , -1)
    TriggerEvent("nocore-police:client:HotwireVehicle")
end

RegisterCommand("policesv", function ( source, args )
    print(args[1])
    if args[1] == 'heli' then
        TriggerEvent('nocore-police:client:spawn:heli', args[1])
    elseif args[1] == 'boat' then
        TriggerEvent('nocore-police:client:spawn:boat', args[1])
    end
end)

HaveSpawnedHelicopter = false
RegisterNetEvent('nocore-police:client:spawn:heli')
AddEventHandler('nocore-police:client:spawn:heli', function(int)
    if (Framework.Functions.GetPlayerData().job.name == "police") and (Framework.Functions.GetPlayerData().job.grade.level >= 3 ) then
        if GetDistanceBetweenCoords( 449.45401, -981.2597, 43.691658, GetEntityCoords(PlayerPedId())) < 2.0 then
            if int == 'heli' then
            Framework.Functions.SpawnVehicle('polmav', function(Vehicle)
                local CoordTable = Config.Locations['Helipad']['Spawn']
                Citizen.Wait(25)
                exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(Vehicle), true)
                exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 100, false)
                SetVehicleLivery(Vehicle,0)
                Framework.Functions.Notify(_U("helilanded"), 'info')
            end, CoordsTable, true, false)
            HaveSpawnedHelicopter = true
            SetTimeout((1000*60)*30, function()
                HaveSpawnedHelicopter = false
            end)
        end
    else
        Framework.Functions.Notify('Слабо, слабо', 'info')
        end
    end
end)

local boatAccess = {
    "DYM20044",
    "DCR43028",
    "KPU48910",
    "OPI34469",
    "LOS33311",
    "MNR30468",
    "QQW42637",
    "KZI69499",
    "JCF20571",
    "IWH91647",
}

HaveSpawnedboat = false
RegisterNetEvent('nocore-police:client:spawn:boat', function(int)
    local CitizenId = Framework.Functions.GetPlayerData().citizenid
    for _, v in ipairs(boatAccess) do
        if (Framework.Functions.GetPlayerData().job.name == "police" and Framework.Functions.GetPlayerData().job.grade.level >= 7) or CitizenId == v then
            if int == 'boat' then
                if IsEntityInWater(PlayerPedId()) then
                    Framework.Functions.SpawnVehicle('predator', function(Vehicle)
                        Citizen.Wait(25)
                        exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(Vehicle), true)
                        exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 100, false)
                        SetVehicleLivery(Vehicle,0)
                        Framework.Functions.Notify(_U("helilanded"), 'info')
                    end, CoordsTable, true, false)
                    HaveSpawnedboat = true
                    SetTimeout((1000*60)*30, function()
                        HaveSpawnedboat = false
                    end)
                end
            else
                Framework.Functions.Notify('Слабо, слабо', 'info')
            end
        end
    end
end)

RegisterNetEvent('nocore-police:client:RepairVehicleambulance')
AddEventHandler('nocore-police:client:RepairVehicleambulance', function()
    local ped = PlayerPedId()
    local Veh = GetVehiclePedIsIn(ped)
    local pCoords = GetEnttityCoords(ped)
    if GetVehicleClass(Veh) == 18 then
        if (#(vector3(961.42, -96.89, 74.35) - pCoords) < 5.0) or (#(vector3(548.19, -205.68, 54.2) - pCoords) < 5.0) then
             if Veh ~= nil then
                    Framework.Functions.Progressbar('AmbRepair', 'Вашето МПС се поправя', math.random(10000,15000), false, true, {
                   disableMovement = true,
                   disableCarMovement = true,
                   disableMouse = false,
                   disableCombat = true,
                   disableInventory = true,
                   }, {}, {}, {}, function() -- Done
                   SetVehicleFixed(Veh)
                   SetVehicleDirtLevel(Veh, 0)
                   TriggerServerEvent('nocore-police:removerepairmoney', source)
                   Framework.Functions.Notify("Вашето МПС бе поправено!")
                    end, function() -- Cancel
                Framework.Functions.Notify("Вие отказахте поправката на вашето мпс!")
                end)
            else
                Framework.Functions.Notify("Трябва да сте в МПС", "error")
            end
        end
    end
end)

exports('checkGlobalCooldown', function(level)
    Wait(1)
    local p = promise.new()
    Framework.Functions.TriggerCallback('nocore-police:checkCooldown', function(result)
        p:resolve(result)
    end, level)
    return Citizen.Await(p)
end)