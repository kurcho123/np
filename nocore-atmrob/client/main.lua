Framework = exports['no-core']:GetCoreObject()
PlayerData = {}
isLoggedIn = false
Cops = 0
local AbleToRob = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        isLoggedIn = true
        PlayerData = Framework.Functions.GetPlayerData()
    end
end)

RegisterNetEvent(Config.CoreName..":Client:OnPlayerLoaded")
AddEventHandler(Config.CoreName..":Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1000, function()
        isLoggedIn = true
        PlayerData = Framework.Functions.GetPlayerData()
    end)
end)

RegisterNetEvent(Config.CoreName..':Client:OnJobUpdate')
AddEventHandler(Config.CoreName..':Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent(Config.CoreName..':Client:SetDuty')
AddEventHandler(Config.CoreName..':Client:SetDuty', function(Onduty)
    PlayerData.job.onduty = Onduty
end)

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

function NearATM()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    
    for k, v in pairs(Config.ATM) do
        local atm = GetClosestObjectOfType(pos.x, pos.y, pos.z, Config.ATMDistance + 5, k, false, false, false)
        if DoesEntityExist(atm) then
	        local atmPos = GetEntityCoords(atm)
	        -- local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, atmPos.x, atmPos.y, atmPos.z, true)
            local dist = #(vector3(pos.x, pos.y, pos.z) - vector3(atmPos.x, atmPos.y, atmPos.z))
	        
	        if dist <= Config.ATMDistance then
	            return atm
	        else
	        	return false
	        end
	    end
    end
end

-- RegisterNetEvent('nocore-atmrob:client:startatmrob')
-- AddEventHandler('nocore-atmrob:client:startatmrob', function()
--     Framework.Functions.Notify('Имате отворен тунел за хакване на банкомат', 'success', 4000, 'ATM')
--     AbleToRob = true
-- end)

-- RegisterNetEvent('nocore-atmrob:client:stopatmrob')
-- AddEventHandler('nocore-atmrob:client:stopatmrob', function()
--     if AbleToRob then
--         Framework.Functions.Notify('Изпуснахте вашия тунел за хакване на банкомат', 'error', 4000, 'ATM')
--         AbleToRob = false
--     end
-- end)

-- RegisterNetEvent('nocore-items:client:UseBomb')
-- AddEventHandler('nocore-items:client:UseBomb', function(bomblevel)
--     if (AbleToRob or (not Config.StartOnEvent and IsAbleToStartATM())) and not NearExplodedATM() and  not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and bomblevel >= Config.MinBombLevel then
--         local NearAtm = NearATM()
--         if NearAtm then
--             Citizen.Wait(300)
--             TriggerServerEvent('nocore-police:ActivateCooldown', 1, "Обир на банкомат")
--             c4anim(NearAtm, bomblevel)
--         end
--     end
-- end)

--[[ RegisterNetEvent('nocore-atmrob:client:startrob')
AddEventHandler('nocore-atmrob:client:startrob', function(data)
    if (AbleToRob or (not Config.StartOnEvent and IsAbleToStartATM())) and not NearExplodedATM() and  not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and data.bomblevel >= Config.MinBombLevel then
        local NearAtm = NearATM()
        if NearAtm then
            Citizen.Wait(300)
            c4anim(NearAtm, data.bomblevel)
            TriggerServerEvent('globalcooldownlv1', "Обир на банкомат")
        end
    end
end)
 ]]
-- function c4anim(NearAtm, bomblevel)
--     local playerPed = PlayerPedId()
--     local bombprop, item, brotx, broty = GetHashKey("prop_bomb_01_s"), 'explosive_lv1', 90.0, 180.0
--     if bomblevel == 2 then
--         bombprop, item = GetHashKey("h4_prop_h4_ld_bomb_01a"), 'explosive_lv2'
--     elseif bomblevel == 3 then
--         bombprop, item, brotx, broty = GetHashKey("ch_prop_ch_explosive_01a"), 'explosive_lv3', 0.0, 0.0
--     elseif bomblevel == 4 then
--         bombprop, item = GetHashKey("ch_prop_ch_ld_bomb_01a"), 'explosive_lv4'
--     end
--     LoadAnim('anim@heists@ornate_bank@thermal_charge')
-- 	if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
--         local AtmHeading = GetEntityHeading(NearAtm)
--         local AtmCoords = GetEntityCoords(NearAtm)
--         local Forward = GetEntityForwardVector(NearAtm)
--         local newPos = (AtmCoords + Forward * Config.ATM[GetEntityModel(NearAtm)][1])
--         local newPos2 = (AtmCoords + Forward * Config.ATM[GetEntityModel(NearAtm)][2])
--         TaskGoStraightToCoord(playerPed, newPos.x, newPos.y, newPos.z, 1.0, -1, AtmHeading, 786603, 1.0)
--         --TaskTurnPedToFaceCoord(playerPed, AtmCoords, 0)
--         Citizen.Wait(2000)
--         SetCamCoords(AtmCoords)
--         SetEntityCoords(playerPed, newPos2)

--         FreezeEntityPosition(playerPed, true)
--         local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
--         SetPedComponentVariation(playerPed, 5, -1, 0, 0)
--         local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
--         local scene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, 0, 0, 1065353216, 0, 1.3)
--         SetEntityCollision(bag, 0, 1)
--         NetworkAddPedToSynchronisedScene(playerPed, scene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
--         NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
--         NetworkStartSynchronisedScene(scene)
--         Citizen.Wait(1500)
--         pos = GetEntityCoords(playerPed)
--         c4 = CreateObject(bombprop, pos.x, pos.y, pos.z + 0.2, 1, 1, 1)
--         SetEntityCollision(c4, 0, 1)
--         AttachEntityToEntity(c4, playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, brotx, broty, 180.0, 0, 0, 0, 1, 1, 1)
--         Citizen.Wait(4000)
--         NetworkRequestControlOfEntity(bag)
        
--         while not NetworkHasControlOfEntity(bag) do Citizen.Wait(0) end
--         DeleteEntity(bag)
--         local newc4coords = GetEntityCoords(c4)
--         DetachEntity(c4, 1, 1)
--         SetEntityCoords(c4, newc4coords)
--         FreezeEntityPosition(c4, 1)
--         SetEntityCollision(c4, 0, 1)
--         FreezeEntityPosition(playerPed, false)
--         NetworkStopSynchronisedScene(scene)
--         TriggerServerEvent(Config.CoreName..':Server:RemoveItem', item, 1)
--         RemoveAnimDict('anim@heists@ornate_bank@thermal_charge')
--         exports["memorygame"]:thermiteminigame(Config.MemoryGame[1], Config.MemoryGame[2], Config.MemoryGame[3], Config.MemoryGame[4],
--         function()-- success
--             DestroyCamera()
--             Countdown(NearAtm)
--         end,
--         function()-- failure
--             while not NetworkHasControlOfEntity(c4) do Citizen.Wait(0) end
--             AddExplosion(AtmCoords, 2, 0.5, 1, 0, 1065353216, 0)
--             DeleteObject(c4)
--             ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
--             DestroyCamera()
--         end)		
--     end	
-- end

-- function Countdown(NearAtm)
--     local AtmCoords = GetEntityCoords(NearAtm)
--     local pos = GetEntityCoords(PlayerPedId())
--     local SendData = {
--         dispatchCode = "10-90A",
--         dispatchMessage = "Обир на банкомат",
--         firstStreet = Framework.Functions.GetStreetLabel(),
--         priority = 1, -- Priority
--         origin = {
--             x = pos.x,
--             y = pos.y,
--             z = pos.z
--         },
--         job = {"police"},
--         BlipData = {
--             sprite = 535,
--             color = 5,
--             scale = 1,
--             shortrange = false,
--             time = 120,
--         },
--         ZoneData = {
--             color = 5,
--             time = 120,
--             radius = 75,
--         }
--     }
--     TriggerServerEvent("erp-dispatch:sendAlert", SendData)
--     Framework.Functions.Progressbar("open_locker", Config.Lang["bombtimer_progressbar"], Config.BombTimer, false, true, {
--         disableMovement = false,
--         disableCarMovement = true,
--         disableMouse = false,
--         disableCombat = false,
--         disableInventory = true
--     }, {}, {}, {}, function()
--         DoScreenFadeIn(300)
--         while not NetworkHasControlOfEntity(c4) do Citizen.Wait(0) end
--         AddExplosion(AtmCoords, 2, 0.5, 1, 0, 1065353216, 0)
--         DeleteObject(c4)
--         ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
--         Citizen.Wait(300)
--         AbleToRob = false
--         TriggerServerEvent("nocore-atmrob:server:add:exploded:atms", AtmCoords)
--         local RandomNames = {[1] = 'Товарния', [2] = 'Marc', [3] = 'Valentino', [4] = 'Montana', [5] = 'Keith', [6] = 'Tyrone', [7] = 'Cor', [8] = 'Steven'}
--         local RandomName = RandomNames[math.random(1, #RandomNames)]
--         SetTimeout(math.random(10000, 25000), function()
--             TriggerServerEvent('nocore-atmrob:event')
--         end)
--         DropMoney(NearAtm)
--         if not Config.StartOnEvent then
--             TriggerServerEvent("nocore-atmrob:server:start:cooldown")
--         end
--         --Give Cash
--     end, function() -- Cancel
--         while not NetworkHasControlOfEntity(c4) do Citizen.Wait(0) end
--         while not NetworkHasControlOfEntity(c4) do
--             Citizen.Wait(1)
--             NetworkRequestControlOfEntity(c4)
--         end
--         DeleteObject(c4)
--         while DoesEntityExist(c4) do
--             Citizen.Wait(1)
--             DeleteObject(c4)
--         end
--         Framework.Functions.Notify(Config.Lang["cancelled_progressbar"], "error")
--     end, 'fa-solid fa-bomb')
-- end

-- function DropMoney(NearAtm)
--     local CreatedProps = {}
--     local AtmCoords = GetEntityCoords(NearAtm)
--     local Forward = GetEntityForwardVector(NearAtm)
-- 	local x, y, z = table.unpack(AtmCoords + Forward * -1)
--     for i = 1, 10 do
--         local prop = CreateObject(Config.CashProps[math.random(1, #Config.CashProps)], x + (math.random(-5, 5) / 10.0), y + (math.random(-5, 5) / 10.0), z, true, true, false)
--         PlaceObjectOnGroundProperly(prop)
--         SetEntityHeading(prop, math.random(0, 360) * 1.0)
--         exports['nocore-eye']:AddTargetEntity(prop, {
--             options = {
--               {
--                 event = "nocore-atmrob:client:getcash",
--                 icon = "fas fa-handshake",
--                 label = "Вземи"
--               }
--             },
--             distance = 3.0
--         })
--         CreatedProps[#CreatedProps+1] = prop
--         -- table.insert(CreatedProps, prop)
--     end
-- end

-- RegisterNetEvent('nocore-atmrob:client:getcash')
-- AddEventHandler('nocore-atmrob:client:getcash', function(data)
--     LoadAnim('random@domestic')
--     TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 2.0, 2.0, -1, 0, 0, false, false, false)
--     RemoveAnimDict('random@domestic')
--     Framework.Functions.Progressbar("colecting_money", Config.Lang["colecting_money"], 2000, false, true, {
--         disableMovement = false,
--         disableCarMovement = true,
--         disableMouse = false,
--         disableCombat = false,
--         disableInventory = true
--     }, {}, {}, {}, function()
--         NetworkRequestControlOfEntity(data.entity)
--         while not NetworkHasControlOfEntity(data.entity) do Wait(1) end
--         DeleteEntity(data.entity)
--         ClearPedTasks(PlayerPedId())
--         Framework.Functions.TriggerCallback('nocore-atmrob:server:loot', function(cb)
--             if cb then
--             end
--         end)
--     end, function() -- Cancel
--         ClearPedTasks(PlayerPedId())
--         Framework.Functions.Notify(Config.Lang["cancelled_progressbar"], "error")
--     end)
-- end)

function NearExplodedATM()
    local NearExplodedAtm = nil
    Framework.Functions.TriggerCallback('nocore-atmrob:server:get:exploded:atms', function(cb)
        if cb ~= nil then
            local Atms = cb
            local PlayerPos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Atms) do
                if #(PlayerPos - v) < 5 then
                    NearExplodedAtm = true
                end
            end
            if NearExplodedAtm == nil then NearExplodedAtm = false end
        end
    end)
    while NearExplodedAtm == nil do Wait(0) end
    return NearExplodedAtm
end

-- function IsAbleToStartATM()
--     local IsAbleToStart = nil
--     if CurrentCops >= 5 then -- 5
--         Framework.Functions.TriggerCallback('nocore-atmrob:server:get:cooldown', function(cb)
--             IsAbleToStart = not cb
--         end)
--         if IsAbleToStart then
--             IsAbleToStart = not exports['nocore-police']:checkGlobalCooldown(1)
--         end
--     else
--         IsAbleToStart = false
--     end
--     while IsAbleToStart == nil do Wait(0) end
--     return IsAbleToStart
-- end

-- function LoadAnim(dict)
--     while not HasAnimDictLoaded(dict) do
--         RequestAnimDict(dict)
--         Wait(10)
--     end
-- end

-- function SetCamCoords(AtmCorods)
--     local pedPos = GetEntityCoords(PlayerPedId())
--     local Forward, Right, Up, C = GetEntityMatrix(PlayerPedId())
--     local x, y, z = table.unpack(pedPos + (Right * 0.8) + (Forward * -0.2))
--     local Rot = GetEntityRotation(PlayerPedId())
--     cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",  x, y, z + 0.3, 0.0, 0.0, Rot.z + 10, 80.0, false, 0)
--     PointCamAtCoord(cam, AtmCorods.x, AtmCorods.y, AtmCorods.z + 1)
--     SetCamActive(cam, true)
--     RenderScriptCams(true, true, 1000, true, true)
-- end

-- function DestroyCamera()
--     SetTimecycleModifier('default')
--     SetCamActive(cam, false)
--     DestroyCam(cam, true)
--     RenderScriptCams(false, true, 1000, true, true)
--     FreezeEntityPosition(PlayerPedId(), false)
-- end

-- function CanRobAtm()
--     if AbleToRob and IsAbleToStartATM() then
--         return true
--     else
--         return false
--     end
-- end

