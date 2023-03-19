Framework = exports['no-core']:GetCoreObject()
local closestDoor, closestV, closestDistance, playerPed, playerCoords, doorCount, retrievedData
local isDead, isCuffed = false, false
local playerNotActive = true
local PlayerData = {}
local PlayerJob = {}
local PlayerGrade = {}

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    SetTimeout(1000, function()
        isLoggedIn = true
        PlayerJob = Framework.Functions.GetPlayerData().job
        PlayerGrade = Framework.Functions.GetPlayerData().job.grade
        Framework.Functions.TriggerCallback('nui_doorlock:getDoorInfo', function(doorInfo)
            for doorID, locked in pairs(doorInfo) do
                while Config.DoorList[doorID] == nil do Citizen.Wait(0) end
                Config.DoorList[doorID].locked = locked
            end
            retrievedData = true
        end)
        while not retrievedData do
            Citizen.Wait(0)
        end
        while IsPedStill(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) do
            Citizen.Wait(0)
        end
        updateDoors()
        playerNotActive = nil
        retrievedData = nil
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.Wait(200)
        isLoggedIn = true
        PlayerJob = Framework.Functions.GetPlayerData().job
        PlayerGrade = Framework.Functions.GetPlayerData().job.grade
        Citizen.Wait(1000)
        Framework.Functions.TriggerCallback('nui_doorlock:getDoorInfo', function(doorInfo)
            for doorID, locked in pairs(doorInfo) do
                Config.DoorList[doorID].locked = locked
            end
            retrievedData = true
        end)
        while not retrievedData do
            Citizen.Wait(0)
        end
        while IsPedStill(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) do
            Citizen.Wait(0)
        end
        updateDoors()
        playerNotActive = nil
        retrievedData = nil
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    PlayerJob.onduty = Onduty
end)

-- Sync a door with the server
RegisterNetEvent('nui_doorlock:setState')
AddEventHandler('nui_doorlock:setState', function(sid, doorID, locked, src)
    CreateThread(function()
        local serverid = GetPlayerServerId(PlayerId())
        if sid == serverid and closestDoor == doorID then
            dooranim()
        end
        if Config.DoorList[doorID] then
            Config.DoorList[doorID].locked = locked
            updateDoors(doorID)
            ChangeDoorState(doorID, locked)
            while true do
                Citizen.Wait(0)
                if Config.DoorList[doorID].doors then
                    for k, v in pairs(Config.DoorList[doorID].doors) do
                        if not IsDoorRegisteredWithSystem(v.doorHash) then
                            return
                        end -- If door is not registered end the loop
                        v.currentHeading = GetEntityHeading(v.object)
                        v.doorState = DoorSystemGetDoorState(v.doorHash)
                        if Config.DoorList[doorID].slides then
                            if Config.DoorList[doorID].locked then
                                DoorSystemSetDoorState(v.doorHash, 1, false, false) -- Set to locked
                                DoorSystemSetAutomaticDistance(v.doorHash, 0.0, false, false)
                                if k == 2 then
                                    playSound(Config.DoorList[doorID], src)
                                    return
                                end -- End the loop
                            else
                                DoorSystemSetDoorState(v.doorHash, 0, false, false) -- Set to unlocked
                                DoorSystemSetAutomaticDistance(v.doorHash, 30.0, false, false)
                                if k == 2 then
                                    playSound(Config.DoorList[doorID], src)
                                    return
                                end -- End the loop
                            end
                        elseif Config.DoorList[doorID].locked and (v.doorState == 4) then
                            if Config.DoorList[doorID].oldMethod then
                                FreezeEntityPosition(v.object, true)
                            end
                            DoorSystemSetDoorState(v.doorHash, 1, false, false) -- Set to locked
                            if Config.DoorList[doorID].doors[1].doorState == Config.DoorList[doorID].doors[2].doorState then
                                playSound(Config.DoorList[doorID], src)
                                return
                            end -- End the loop
                        elseif not Config.DoorList[doorID].locked then
                            if Config.DoorList[doorID].oldMethod then
                                FreezeEntityPosition(v.object, false)
                            end
                            DoorSystemSetDoorState(v.doorHash, 0, false, false) -- Set to unlocked
                            if Config.DoorList[doorID].doors[1].doorState == Config.DoorList[doorID].doors[2].doorState then
                                playSound(Config.DoorList[doorID], src)
                                return
                            end -- End the loop
                        else
                            if round(v.currentHeading, 0) == round(v.objHeading, 0) then
                                DoorSystemSetDoorState(v.doorHash, 4, false, false) -- Force to close
                            end
                        end
                    end
                else
                    if not IsDoorRegisteredWithSystem(Config.DoorList[doorID].doorHash) then
                        return
                    end -- If door is not registered end the loop
                    Config.DoorList[doorID].currentHeading = GetEntityHeading(Config.DoorList[doorID].object)
                    Config.DoorList[doorID].doorState = DoorSystemGetDoorState(Config.DoorList[doorID].doorHash)
                    if Config.DoorList[doorID].slides then
                        if Config.DoorList[doorID].locked then
                            DoorSystemSetDoorState(Config.DoorList[doorID].doorHash, 1, false, false) -- Set to locked
                            DoorSystemSetAutomaticDistance(Config.DoorList[doorID].doorHash, 0.0, false, false)
                            playSound(Config.DoorList[doorID], src)
                            return -- End the loop
                        else
                            DoorSystemSetDoorState(Config.DoorList[doorID].doorHash, 0, false, false) -- Set to unlocked
                            DoorSystemSetAutomaticDistance(Config.DoorList[doorID].doorHash, 30.0, false, false)
                            playSound(Config.DoorList[doorID], src)
                            return -- End the loop
                        end
                    elseif Config.DoorList[doorID].locked and (Config.DoorList[doorID].doorState == 4) then
                        if Config.DoorList[doorID].oldMethod then
                            FreezeEntityPosition(Config.DoorList[doorID].object, true)
                        end
                        DoorSystemSetDoorState(Config.DoorList[doorID].doorHash, 1, false, false) -- Set to locked
                        playSound(Config.DoorList[doorID], src)
                        return -- End the loop
                    elseif not Config.DoorList[doorID].locked then
                        if Config.DoorList[doorID].oldMethod then
                            FreezeEntityPosition(Config.DoorList[doorID].object, false)
                        end
                        DoorSystemSetDoorState(Config.DoorList[doorID].doorHash, 0, false, false) -- Set to unlocked
                        playSound(Config.DoorList[doorID], src)
                        return -- End the loop
                    else
                        if round(Config.DoorList[doorID].currentHeading, 0) ==
                            round(Config.DoorList[doorID].objHeading, 0) then
                            DoorSystemSetDoorState(Config.DoorList[doorID].doorHash, 4, false, false) -- Force to close
                        end
                    end
                end
            end
        end
    end)
end)

function playSound(door, src)
    local origin
    if src and src ~= playerPed then
        src = NetworkGetEntityFromNetworkId(src)
    end
    if not src then
        origin = door.textCoords
    elseif src == playerPed then
        origin = playerCoords
    else
        origin = NetworkGetPlayerCoords(src)
    end
    local distance = #(playerCoords - origin)
    -- print(origin)
    if distance < 10 then
        if not door.audioLock then
            if door.audioRemote then
                door.audioLock = {
                    ['file'] = 'button-remote.ogg',
                    ['volume'] = 0.08
                }
                door.audioUnlock = {
                    ['file'] = 'button-remote.ogg',
                    ['volume'] = 0.08
                }
            else
                door.audioLock = {
                    ['file'] = 'door-bolt-4.ogg',
                    ['volume'] = 0.1
                }
                door.audioUnlock = {
                    ['file'] = 'door-bolt-4.ogg',
                    ['volume'] = 0.1
                }
            end
        end
        local sfx_level = GetProfileSetting(300)
        if door.locked then
            SendNUIMessage({
                action = 'audio',
                audio = door.audioLock,
                distance = distance,
                sfx = sfx_level
            })
        else
            SendNUIMessage({
                action = 'audio',
                audio = door.audioUnlock,
                distance = distance,
                sfx = sfx_level
            })
        end
    end
end

AddEventHandler('playerSpawned', function(spawn)
    isDead = false
end)

function Draw3dText(coords, text) -- You can revert to text if you want - it has higher average performance cost but lower spikes
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropShadow(0, 0, 0, 55)
        SetTextEdge(0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function dooranim()
    Citizen.CreateThread(function()
        loadAnimDict("anim@heists@keycard@")
        TaskPlayAnim(playerPed, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        Citizen.Wait(550)
        ClearPedTasks(playerPed)
    end)
end

function round(num, decimal)
    local mult = 10 ^ (decimal)
    return math.floor(num * mult + 0.5) / mult
end

function debug(doorID, data)
    if GetDistanceBetweenCoords(playerCoords, data.textCoords) < 3 then
        for k, v in pairs(data) do
            print(('%s = %s'):format(k, v))
        end
        print('\nCurrent Heading: ' .. GetEntityHeading(data.object))
        print('Current Coords: ' .. GetEntityCoords(data.object))
    end
end

function setTextCoords(data)
    local minDimension, maxDimension = GetModelDimensions(data.objHash)
    local dimensions = maxDimension - minDimension
    local dx, dy = tonumber(dimensions.x), tonumber(dimensions.y)
    if dy <= -1 or dy >= 1 then
        dx = dy
    end
    if data.fixText then
        return GetOffsetFromEntityInWorldCoords(data.object, dx / 2, 0, 0)
    else
        return GetOffsetFromEntityInWorldCoords(data.object, -dx / 2, 0, 0)
    end
end

function updateDoors(specificDoor)
    playerCoords = GetEntityCoords(PlayerPedId())
    for doorID, data in ipairs(Config.DoorList) do
        if (not specificDoor or doorID == specificDoor) then
            if data.doors then
                for k, v in ipairs(data.doors) do
                    if #(vector2(playerCoords.x, playerCoords.y) - vector2(v.objCoords.x, v.objCoords.y)) < 100 then
                        v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objHash, false, false, false)
                        if data.delete then
                            SetEntityAsMissionEntity(v.object, 1, 1)
                            DeleteObject(v.object)
                            v.object = nil
                        end
                        if v.object then
                            v.doorHash = 'doorlock_' .. doorID .. '_' .. k
                            if not IsDoorRegisteredWithSystem(v.doorHash) then
                                AddDoorToSystem(v.doorHash, v.objHash, v.objCoords, false, false, false)
                                if data.locked then
                                    DoorSystemSetDoorState(v.doorHash, 4, false, false)
                                    DoorSystemSetDoorState(v.doorHash, 1, false, false)
                                else
                                    DoorSystemSetDoorState(v.doorHash, 0, false, false)
                                    if data.oldMethod then
                                        FreezeEntityPosition(v.object, false)
                                    end
                                end
                            end
                        end
                        if DoesEntityExist(v.object) then
                            data.Exist = true
                        else
                            data.Exist = false
                        end
                    elseif v.object then
                        RemoveDoorFromSystem(v.doorHash)
                    end
                end
            elseif not data.doors then
                if #(vector2(playerCoords.x, playerCoords.y) - vector2(data.objCoords.x, data.objCoords.y)) < 100 then
                    if data.slides then
                        data.object = GetClosestObjectOfType(data.objCoords, 5.0, data.objHash, false, false, false)
                    else
                        data.object = GetClosestObjectOfType(data.objCoords, 1.0, data.objHash, false, false, false)
                    end
                    if data.delete then
                        SetEntityAsMissionEntity(data.object, 1, 1)
                        DeleteObject(data.object)
                        data.object = nil
                    end
                    if data.object then
                        data.doorHash = 'doorlock_' .. doorID
                        if not IsDoorRegisteredWithSystem(data.doorHash) then
                            AddDoorToSystem(data.doorHash, data.objHash, data.objCoords, false, false, false)
                            if data.locked then
                                DoorSystemSetDoorState(data.doorHash, 4, false, false)
                                DoorSystemSetDoorState(data.doorHash, 1, false, false)
                            else
                                DoorSystemSetDoorState(data.doorHash, 0, false, false)
                                if data.oldMethod then
                                    FreezeEntityPosition(data.object, false)
                                end
                            end
                        end
                    end
                    if DoesEntityExist(data.object) then
                        data.Exist = true
                    else
                        data.Exist = false
                    end
                elseif data.object then
                    RemoveDoorFromSystem(data.doorHash)
                end
            end
            -- set text coords
            if not data.setText and data.doors then
                for k, v in ipairs(data.doors) do
                    if k == 1 and DoesEntityExist(v.object) then
                        data.textCoords = v.objCoords
                    elseif k == 2 and DoesEntityExist(v.object) and data.textCoords then
                        local textDistance = data.textCoords - v.objCoords
                        data.textCoords = (data.textCoords - (textDistance / 2))
                        data.setText = true
                    end
                    if k == 2 and data.textCoords and data.slides then
                        if GetEntityHeightAboveGround(v.object) < 1 then
                            data.textCoords = vector3(data.textCoords.x, data.textCoords.y, data.textCoords.z + 1.2)
                        end
                    end
                end
            elseif not data.setText and not data.doors and DoesEntityExist(data.object) then
                if data.garage == true then
                    data.textCoords = data.objCoords
                    data.setText = true
                else
                    data.textCoords = setTextCoords(data)
                    data.setText = true
                end
                if data.slides then
                    if GetEntityHeightAboveGround(data.object) < 1 then
                        data.textCoords = vector3(data.textCoords.x, data.textCoords.y, data.textCoords.z + 1.6)
                    end
                end
            end
        end
    end
    doorCount = DoorSystemGetSize()
    -- if doorCount ~= 0 then print(('%s doors are loaded'):format(doorCount)) end
end

Citizen.CreateThread(function()
    while playerNotActive do
        Citizen.Wait(100)
    end
    lastCoords = playerCoords
    while playerCoords do
        local distance = #(playerCoords - lastCoords)
        if distance > 30 then
            updateDoors()
            lastCoords = playerCoords
        end
        Citizen.Wait(500)
        if doorCount == 0 then
            Citizen.Wait(500)
        end
    end
end)

local doorSleep = 500
Citizen.CreateThread(function()
    while not playerCoords do
        Citizen.Wait(0)
    end
    while true do
        Citizen.Wait(0)
        if doorCount then
            while true do
                if not closestDistance then
                    break
                end
                Citizen.Wait(10)
            end
            local distance
            for k, v in pairs(Config.DoorList) do
                if v.setText and v.textCoords then
                    distance = #(vector2(v.textCoords.x, v.textCoords.y) - vector2(playerCoords.x, playerCoords.y))
                    if v.setText and distance < v.maxDistance and v.Exist then
                        closestDoor, closestV, closestDistance = k, v, distance
                        ShowText()
                    end
                end
            end
            Citizen.Wait(doorSleep)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        if doorCount ~= nil and doorCount ~= 0 and closestDistance and closestV.setText then
            closestDistance = #(closestV.textCoords - playerCoords)
            if closestDistance < closestV.maxDistance then
                if not closestV.doors then
                    local doorState = DoorSystemGetDoorState(closestV.doorHash)
                else
                    local door = {}
                    local state = {}
                    door[1] = closestV.doors[1]
                    door[2] = closestV.doors[2]
                    state[1] = DoorSystemGetDoorState(door[1].doorHash)
                    state[2] = DoorSystemGetDoorState(door[2].doorHash)
                end
            else
                if closestDistance > closestV.maxDistance and isDrawing then
                    isDrawing = false
                end
                closestDoor, closestV, closestDistance = nil, nil, nil
                exports['okokTextUI']:Close()
            end
        end

        if doorCount == 0 then
            doorSleep = 1000
            Citizen.Wait(1000)
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)
        if closestV ~= nil then
            if not closestV.doors then
                local doorState = DoorSystemGetDoorState(closestV.doorHash)
                if not closestV.locked then
                    -- exports['okokTextUI']:Open('Отключено', 'darkgreen', 'left')
                else
                    -- exports['okokTextUI']:Open('Заключено', 'darkred', 'left')
                end
            else
                local door = {}
                local state = {}
                door[1] = closestV.doors[1]
                door[2] = closestV.doors[2]
                state[1] = DoorSystemGetDoorState(door[1].doorHash)
                state[2] = DoorSystemGetDoorState(door[2].doorHash)
                if not closestV.locked then
                    -- TriggerEvent("textui:show", 'show', 'Отключено', 'green')
                else
                    -- exports['okokTextUI']:Open('Заключено', 'darkred', 'left') 
                end
            end
        end
    end
end)]]

RegisterCommand('getdoor', function()
    print(closestDoor)
end)

function ShowText()
    if not closestV.doors then
        local doorState = DoorSystemGetDoorState(closestV.doorHash)
        if not closestV.locked then
            --TriggerEvent("textui:show", 'show', 'Отключено '..closestDoor..'', 'rgb(35, 160, 4)')
            exports['okokTextUI']:Open('Отключено', 'darkgreen', 'left')
        else
            --TriggerEvent("textui:show", 'show', 'Заключено '..closestDoor..'', 'rgb(160, 4, 4)')
            exports['okokTextUI']:Open('Заключено', 'darkred', 'left')
        end
    else
        local door = {}
        local state = {}
        door[1] = closestV.doors[1]
        door[2] = closestV.doors[2]
        state[1] = DoorSystemGetDoorState(door[1].doorHash)
        state[2] = DoorSystemGetDoorState(door[2].doorHash)
        if not closestV.locked then
            --TriggerEvent("textui:show", 'show', 'Отключено '..closestDoor..'', 'green')
            exports['okokTextUI']:Open('Отключено', 'darkgreen', 'left')
        else
            --TriggerEvent("textui:show", 'show', 'Заключено '..closestDoor..'', 'rgb(160, 4, 4)') 
            exports['okokTextUI']:Open('Заключено', 'darkred', 'left')
        end
    end
end

function ChangeDoorState(DoorID, locked)
    if closestV ~= nil and closestDoor == DoorID then
        if locked then
            exports['okokTextUI']:Close()
            Citizen.Wait(500)
            exports['okokTextUI']:Open('Заключено', 'darkred', 'left')
            SetTimeout(1000, function()
                if closestV == nil then
                    exports['okokTextUI']:Close()
                end
            end)
        else
            exports['okokTextUI']:Close()
            Citizen.Wait(500)
            exports['okokTextUI']:Open('Отключено', 'darkgreen', 'left')
            SetTimeout(1000, function()
                if closestV == nil then
                    exports['okokTextUI']:Close()
                end
            end)
        end
    end
end

function IsAuthorized(doorID)
    local canOpen = false
    if PlayerJob == nil then
        return false
    end
    if doorID.authorizedJobs then
        for job, rank in pairs(doorID.authorizedJobs) do
            if (job == PlayerJob.name and rank <= PlayerJob.grade.level) then
                canOpen = true
            end
        end
    end

    if not canOpen and doorID.items then
        canOpen = true -- Let the server determine if they have the item to open the door
    end
    return canOpen
end

RegisterNetEvent('nocore-items:client:UseBomb')
AddEventHandler('nocore-items:client:UseBomb', function(bomblevel)
    if not exports['nocore-hospital']:GetDeathStatus() and not isCuffed and closestDoor and bomblevel >= closestV.bomb and closestV.locked then
        local cdoor = closestDoor
        local door = closestV
        Citizen.Wait(300)
        c4anim(door, cdoor, bomblevel)
    end
end)

function c4anim(door, cdoor, bomblevel)
    local playerPed = PlayerPedId()
    local PedBag, IsFemale = IsPedWearingBag(playerPed)
    local bombprop, item, brotx, broty = GetHashKey("prop_bomb_01_s"), 'explosive_lv1', 90.0, 180.0
    if bomblevel == 2 then
        bombprop, item, brotx, broty = GetHashKey("h4_prop_h4_ld_bomb_01a"), 'explosive_lv2', 0.0, 0.0
    elseif bomblevel == 3 then
        bombprop, item = GetHashKey("ch_prop_ch_explosive_01a"), 'explosive_lv3' --ch_prop_ch_explosive_01a
    elseif bomblevel == 4 then
        bombprop, item = GetHashKey("ch_prop_ch_ld_bomb_01a"), 'explosive_lv4'
    end
    exports['nocore-assets']:RequestAnimationDict("anim@heists@ornate_bank@thermal_charge")
	if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
        local forwardVector, rightVector, upVector, pos = GetEntityMatrix(playerPed)
        local newPos = (forwardVector * 0.5) + pos            
        SetEntityCoords(playerPed, newPos.x, newPos.y, newPos.z - 1)
        TaskTurnPedToFaceCoord(playerPed, door.textCoords, 0)
        FreezeEntityPosition(playerPed, true)
        local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
        SetPedComponentVariation(playerPed, 5, -1, 0, 0)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
        local scene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, 0, 0, 1065353216, 0, 1.3)
        SetEntityCollision(bag, 0, 1)
        NetworkAddPedToSynchronisedScene(playerPed, scene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(scene)
        Citizen.Wait(1500)
        pos = GetEntityCoords(playerPed)
        c4 = CreateObject(bombprop, pos.x, pos.y, pos.z + 0.2, 1, 1, 1)
        SetEntityCollision(c4, 0, 1)
        AttachEntityToEntity(c4, playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, brotx, broty, 180.0, 0, 0, 0, 1, 1, 1)
        Citizen.Wait(4000)
        NetworkRequestControlOfEntity(bag)

        while not NetworkHasControlOfEntity(bag) do Citizen.Wait(0) end
        DeleteEntity(bag)
        if IsFemale then
            SetPedComponentVariation(playerPed, 5, 45, 0, 0) -- Female Bag
        else
            SetPedComponentVariation(playerPed, 5, 23, 0, 0) -- Мale Bag
        end
        local newc4coords = GetEntityCoords(c4)
        DetachEntity(c4, 1, 1)
        SetEntityCoords(c4, newc4coords)
        FreezeEntityPosition(c4, 1)
        SetEntityCollision(c4, 0, 1)
        FreezeEntityPosition(playerPed, false)
        NetworkStopSynchronisedScene(scene)
        TriggerServerEvent('Framework:Server:RemoveItem', item, 1)
        Countdown(door, cdoor)			
    end	
end

function Countdown(door, cdoor)
    Framework.Functions.Progressbar("open_locker", "using_c4", math.random(5000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = false,
        disableInventory = true,
    }, {}, {}, {}, function()
        while not NetworkHasControlOfEntity(c4) do
            Citizen.Wait(1)
            NetworkRequestControlOfEntity(c4)
        end
        DeleteObject(c4)
        while DoesEntityExist(c4) do
            Citizen.Wait(1)
            DeleteObject(c4)
        end
        AddExplosion(door.textCoords, 2, 0.5, 1, 0, 1065353216, 0)
        local locked = not door.locked
        TriggerServerEvent('nui_doorlock:updateState', cdoor, locked, nil, true) -- Broadcast new state of the door to everyone
        Framework.Functions.Notify("Success!", "success")
    end, function() -- Cancel
        while not NetworkHasControlOfEntity(c4) do Citizen.Wait(0) end
        while not NetworkHasControlOfEntity(c4) do
            Citizen.Wait(1)
            NetworkRequestControlOfEntity(c4)
        end
        DeleteObject(c4)
        while DoesEntityExist(c4) do
            Citizen.Wait(1)
            DeleteObject(c4)
        end
        StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
        Framework.Functions.Notify("Cancelled..", "error")
    end)
end

local AllowedBags = {10, 11, 12, 13, 51, 52, 54, 55, 56, 57, 58, 92, 93, 94, 95, 96, 97, 98, 99}
local AllowedBagsFemale = {10, 11}


function IsPedWearingBag(Ped)
    local list = AllowedBags
    if GetEntityModel(Ped) == femaleSkin then list = AllowedBagsFemale end
    for k, v in pairs(list) do
        if IsPedComponentVariationValid(Ped, 9, k, nil) then
            return true
        end
    end
    return false, GetEntityModel(Ped) == femaleSkin
end


exports('updateDoors', updateDoors)
-- Use this export if doors do not load after a teleport event (such as /tp, /setcoords, /jail, etc)
-- `exports.nui_doorlock:updateDoors()`

RegisterCommand('doorlock', function()
    if not isDead and not isCuffed and closestDoor and IsAuthorized(closestV) then
        if IsControlPressed(0, 86) or IsControlReleased(0, 86) then
            key = 'e'
        end
        local veh = GetVehiclePedIsIn(playerPed)
        if veh and key == 'e' then
            Citizen.CreateThread(function()
                local counter = 0
                local siren = IsVehicleSirenOn(veh)
                repeat
                    DisableControlAction(0, 86, true)
                    SetHornEnabled(veh, false)
                    if not siren then
                        SetVehicleSiren(veh, false)
                    end
                    counter = counter + 1
                    Citizen.Wait(0)
                until (counter == 100)
                SetHornEnabled(veh, true)
            end)
        end
        local locked = not closestV.locked
        -- debug(closestDoor, closestV)
        if closestV.audioRemote then
            src = NetworkGetNetworkIdFromEntity(playerPed)
        else
            src = nil
        end
        TriggerServerEvent('nui_doorlock:updateState', closestDoor, locked, src) -- Broadcast new state of the door to everyone
    end
end)
RegisterKeyMapping('doorlock', 'Interact with a door lock', 'keyboard', 'e')

-- LOCKPICK
RegisterNetEvent('nocore-items:client:use:lockpick') -- Modify for whichever lockpick you're using
AddEventHandler('nocore-items:client:use:lockpick', function(advanced)
    if not exports['nocore-hospital']:GetDeathStatus() and not isCuffed and closestDoor and closestV.lockpick and closestV.locked then
        TaskTurnPedToFaceCoord(playerPed, closestV.textCoords, 0)
        Citizen.Wait(300)
        exports['nocore-assets']:RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        TaskPlayAnim(playerPed, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3.0, 3.0, -1, 16, 0, false, false, false)
        exports['nocore-ui']:Circle(function(success)
            if success then
                Citizen.Wait(800)
                local locked = not closestV.locked
                TriggerServerEvent('nui_doorlock:updateState', closestDoor, locked, nil, true) -- Broadcast new state of the door to everyone
                StopAnimTask(playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
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
                Framework.Functions.Notify("Не успя!", 'error')
                StopAnimTask(playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            end
        end, 4, 20) -- NumberOfCircles, MS
    end
end)

RegisterNetEvent('nocore-housing:client:breaking:door')
AddEventHandler('nocore-housing:client:breaking:door', function()
    if PlayerJob.name == "police" and PlayerJob.onduty and not exports['nocore-hospital']:GetDeathStatus() and not isCuffed and closestDoor then
        TaskTurnPedToFaceCoord(playerPed, closestV.textCoords, 0)
        Citizen.Wait(300)
        if closestV.locked then
            TriggerEvent('dp:EmoteStart', {"knock2"})
            exports['nocore-ui']:Circle(function(success)
                if success then
                    Citizen.Wait(800)
                    TriggerEvent('dp:EmoteCancel')
                    local locked = not closestV.locked
                    TriggerServerEvent('nui_doorlock:updateState', closestDoor, locked, nil, true) -- Broadcast new state of the door to everyone
                else
                    TriggerEvent('dp:EmoteCancel')
                    Framework.Functions.Notify("Не успя!", 'error')
                end
            end, math.random(8,10), 20) -- NumberOfCircles, MS
        else
            TriggerEvent('dp:EmoteStart', {"mechanic4"})
            exports['nocore-ui']:Circle(function(success)
                if success then
                    Citizen.Wait(800)
                    TriggerEvent('dp:EmoteCancel')
                    local locked = not closestV.locked
                    TriggerServerEvent('nui_doorlock:updateState', closestDoor, locked, nil, true) -- Broadcast new state of the door to everyone
                else
                    TriggerEvent('dp:EmoteCancel')
                    Framework.Functions.Notify("Не успя!", 'error')
                end
            end, 2, 20) -- NumberOfCircles, MS
        end
    end
end)



RegisterNetEvent('nocore-hotel:client:use:key') -- Modify for whichever lockpick you're using
AddEventHandler('nocore-hotel:client:use:key', function(data)
    if not exports['nocore-hospital']:GetDeathStatus() and not isCuffed and closestDoor and closestV.motel then
        Framework.Functions.TriggerCallback('nocore-hotel:server:get:doorcode', function(doorcode)
            if data.code == doorcode or data.code == 'admincode' then
                local locked = not closestV.locked
                TriggerServerEvent('nui_doorlock:updateState', closestDoor, locked, nil, true) -- Broadcast new state of the door to everyone
            else
                Framework.Functions.Notify('Този ключ не пасва за тази врата!', 'error', 2500)
            end
        end, closestV.motel)
    end
end)

function closeNUI()
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "newDoorSetup",
        enable = false
    })
end

RegisterNUICallback('newDoor', function(data, cb)
    receivedDoorData = true
    arg = data
    closeNUI()
end)

RegisterNUICallback('close', function(data, cb)
    closeNUI()
end)

RegisterCommand('-nui', function(playerId, args, rawCommand)
    closeNUI()
end, false)

RegisterNetEvent('nui_doorlock:newDoorSetup')
AddEventHandler('nui_doorlock:newDoorSetup', function(args)
    if not args[1] then
        receivedDoorData = false
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "newDoorSetup",
            enable = true
        })
        while not receivedDoorData do
            Citizen.Wait(100)
        end
        receivedDoorData = false
    end
    -- if not args[1] then print('/newdoor [doortype] [locked] [jobs]\nDoortypes: door, sliding, garage, double, doublesliding\nLocked: true or false\nJobs: Up to four can be added with the command') return end
    if arg then
        doorType = arg.doortype
    else
        doorType = args[1]
    end
    if arg then
        doorLocked = arg.doorlocked
    else
        doorLocked = not not args[1]
    end
    local validTypes = {
        ['door'] = true,
        ['sliding'] = true,
        ['garage'] = true,
        ['double'] = true,
        ['doublesliding'] = true
    }
    if not validTypes[doorType] then
        print(doorType .. ' is not a valid doortype')
        return
    end
    if arg and arg.item == '' and arg.job1 == '' then
        print('You must enter either a job or item for lock authorisation')
        return
    end
    if args[7] then
        print('You can only set four authorised jobs - if you want more, add them to the config later')
        return
    end
    if doorType == 'door' or doorType == 'sliding' or doorType == 'garage' then
        local entity, coords, heading, model = nil, nil, nil, nil
        local result = false
        print('Aim at your desired door and press left mouse button')
        while true do
            Citizen.Wait(0)
            if IsPlayerFreeAiming(PlayerId()) then
                result, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                coords = GetEntityCoords(entity)
                model = GetEntityModel(entity)
                heading = GetEntityHeading(entity)
            end
            if result then
                DrawInfos("Coordinates: " .. coords .. "\nHeading: " .. heading .. "\nHash: " .. model)
            else
                DrawInfos("Aim at your desired door and shoot")
            end
            if IsControlJustPressed(0, 24) then
                break
            end
        end
        if not model or model == 0 then
            print('Did not receive a model hash\nIf the door is transparent, make sure you aim at the frame')
            return
        end
        local jobs = {}
        if args[3] then
            jobs[1] = args[3]
            jobs[2] = args[4]
            jobs[3] = args[5]
            jobs[4] = args[6]
        else
            if arg.job1 ~= '' then
                jobs[1] = arg.job1
            end
            if arg.job2 ~= '' then
                jobs[2] = arg.job2
            end
            if arg.job3 ~= '' then
                jobs[3] = arg.job3
            end
            if arg.job4 ~= '' then
                jobs[4] = arg.job4
            end
            if arg.item ~= '' then
                item = arg.item
            end
        end
        local maxDistance, slides, garage = 2.0, false, false
        if doorType == 'sliding' then
            slides = true
        elseif doorType == 'garage' then
            slides, garage = 6.0, true, true
        end
        if slides then
            maxDistance = 6.0
        end
        local doorHash = 'doorlock_' .. #Config.DoorList + 1
        AddDoorToSystem(doorHash, model, coords, false, false, false)
        DoorSystemSetDoorState(doorHash, 4, false, false)
        coords = GetEntityCoords(entity)
        heading = GetEntityHeading(entity)
        RemoveDoorFromSystem(doorHash)
        if arg then
            doorname = arg.doorname
        end
        TriggerServerEvent('nui_doorlock:newDoorCreate', model, heading, coords, jobs, item, doorLocked, maxDistance,
            slides, garage, false, doorname)
        print('Successfully sent door data to the server')
    elseif doorType == 'double' or doorType == 'doublesliding' then
        local entity, coords, heading, model = {}, {}, {}, {}
        local result = false
        print('Aim at each desired door and press left mouse button')
        while true do
            Citizen.Wait(0)
            if IsPlayerFreeAiming(PlayerId()) then
                result, entity[1] = GetEntityPlayerIsFreeAimingAt(PlayerId())
                coords[1] = GetEntityCoords(entity[1])
                model[1] = GetEntityModel(entity[1])
                heading[1] = GetEntityHeading(entity[1])
            end
            if result then
                DrawInfos("Coordinates: " .. coords[1] .. "\nHeading: " .. heading[1] .. "\nHash: " .. model[1])
            else
                DrawInfos("Aim at your desired door and shoot")
            end
            if IsControlJustPressed(0, 24) then
                break
            end
        end
        result = false
        while true do
            Citizen.Wait(0)
            if IsPlayerFreeAiming(PlayerId()) then
                result, entity[2] = GetEntityPlayerIsFreeAimingAt(PlayerId())
                coords[2] = GetEntityCoords(entity[2])
                model[2] = GetEntityModel(entity[2])
                heading[2] = GetEntityHeading(entity[2])
            end
            if result then
                DrawInfos("Coordinates: " .. coords[2] .. "\nHeading: " .. heading[2] .. "\nHash: " .. model[2])
            else
                DrawInfos("Aim at your desired door and shoot")
            end
            if IsControlJustPressed(0, 24) then
                break
            end
        end
        if not model[1] or model[1] == 0 or not model[2] or model[2] == 0 then
            print('Did not receive a model hash\nIf the door is transparent, make sure you aim at the frame')
            return
        end
        if entity[1] == entity[2] then
            print('Can not add double door if entities are the same')
            return
        end
        local jobs = {}
        if args[3] then
            jobs[1] = args[3]
            jobs[2] = args[4]
            jobs[3] = args[5]
            jobs[4] = args[6]
        else
            if arg.job1 ~= '' then
                jobs[1] = arg.job1
            end
            if arg.job2 ~= '' then
                jobs[2] = arg.job2
            end
            if arg.job3 ~= '' then
                jobs[3] = arg.job3
            end
            if arg.job4 ~= '' then
                jobs[4] = arg.job4
            end
            if arg.item ~= '' then
                item = arg.item
            end
        end
        local maxDistance, slides, garage = 2.5, false, false
        if doorType == 'sliding' or doorType == 'doublesliding' then
            slides = true
        end
        if slides then
            maxDistance = 6.0
        end

        local doors = #Config.DoorList + 1
        local doorHash = {}
        doorHash[1] = 'doorlock_' .. doors .. '_' .. '1'
        doorHash[2] = 'doorlock_' .. doors .. '_' .. '2'
        for i = 1, #doorHash do
            AddDoorToSystem(doorHash[i], model[i], coords[i], false, false, false)
            DoorSystemSetDoorState(doorHash[i], 4, false, false)
            coords[i] = GetEntityCoords(entity[i])
            heading[i] = GetEntityHeading(entity[i])
            RemoveDoorFromSystem(doorHash[i])
        end
        if arg then
            doorname = arg.doorname
        end
        TriggerServerEvent('nui_doorlock:newDoorCreate', model, heading, coords, jobs, item, doorLocked, maxDistance,
            slides, garage, true, doorname)
        print('Successfully sent door data to the server')
        arg = nil
    end
end)

function DrawInfos(text)
    SetTextColour(255, 255, 255, 255) -- Color
    SetTextFont(4) -- Font
    SetTextScale(0.4, 0.4) -- Scale
    SetTextWrap(0.0, 1.0) -- Wrap the text
    SetTextCentre(false) -- Align to center(?)
    SetTextDropshadow(0, 0, 0, 0, 255) -- Shadow. Distance, R, G, B, Alpha.
    SetTextEdge(50, 0, 0, 0, 255) -- Edge. Width, R, G, B, Alpha.
    SetTextOutline() -- Necessary to give it an outline.
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.015, 0.71) -- Position
end

RegisterNetEvent('nui_doorlock:newDoorAdded')
AddEventHandler('nui_doorlock:newDoorAdded', function(newDoor, doorID, locked)
    Config.DoorList[doorID] = newDoor
    updateDoors()
    TriggerEvent('nui_doorlock:setState', GetPlayerServerId(PlayerId()), doorID, locked)
end)

function IsNearAnyDoor()
    if closestDoor ~= nil then
        return true
    end
end
