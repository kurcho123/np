local callID = 0
-- Hunting
local inHuntingZone = false
local paniccooldown = false

local huntingZone = PolyZone:Create({
    vector2(-1416.86, 2730.74),
    vector2(-2415.01, 3701.34),
    vector2(-973.52, 6225.8),
    vector2(356.86, 4802.33),
    vector2(-292.75, 3766.8),
    vector2(62.85, 3368.78)
}, {
    name = "huntingZone",
    minZ = -50.0,
    maxZ = 750.0,
    debugGrid = false,
    gridDivisions = 25
})

huntingZone:onPlayerInOut(function(isPointInside, point)
    inHuntingZone = isPointInside
end)

local playerPed, playerCoords = PlayerPedId(), vec3(0, 0, 0)
local currentVehicle, inVehicle, currentlyArmed, currentWeapon = nil, false, false, nil

Framework = exports['no-core']:GetCoreObject()
PlayerData = {}

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.Wait(1250)
        PlayerData = Framework.Functions.GetPlayerData()
        if (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
            TriggerServerEvent('nocore-dispatch:server:blips', PlayerData.job.onduty)
        end
    end
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1250, function()
        PlayerData = Framework.Functions.GetPlayerData()
        if (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
            TriggerServerEvent('nocore-dispatch:server:blips', PlayerData.job.onduty)
        end
    end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    if (PlayerData.job.name ~= 'police' or PlayerData.job.name ~= 'ambulance') then
        TriggerServerEvent('nocore-dispatch:server:removeblips')
    end
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    PlayerData.job.onduty = Onduty
    if (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
        TriggerServerEvent('nocore-dispatch:server:blips', PlayerData.job.onduty)
    end
end)

--[[ Garbage Coletor ]]
CreateThread(function()
    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        currentVehicle = GetVehiclePedIsIn(playerPed, false)
        currentWeapon = GetSelectedPedWeapon(playerPed)
        currentlyArmed = IsPedArmed(playerPed, 7) and not Config.WhitelistedWeapons[currentWeapon]
        if currentVehicle ~= 0 then inVehicle = true elseif inVehicle then inVehicle = false end
        Wait(1000)
    end
end)

local function getCardinalDirectionFromHeading()
    local heading = GetEntityHeading(playerPed)
    if heading >= 315 or heading < 45 then return "North Bound"
    elseif heading >= 45 and heading < 135 then return "West Bound"
    elseif heading >= 135 and heading < 225 then return "South Bound"
    elseif heading >= 225 and heading < 315 then return "East Bound" end
end

function GetStreetAndZone()
    local coords = GetEntityCoords(playerPed)
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    local area = GetLabelText(tostring(GetNameOfZone(coords.x, coords.y, coords.z)))
    local playerStreetsLocation = area
    if not zone then zone = "UNKNOWN" end
    if currentStreetName ~= nil and currentStreetName ~= "" then playerStreetsLocation = currentStreetName .. ", " .. area
    else playerStreetsLocation = area end
    return playerStreetsLocation
end

local function GetClosestNPC(sentPos, sentDistance, sentType, sentIgnoredPed)
    if sentType == 'combat' or sentType == 'drugsale' then
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) then
                if ped ~= sentIgnoredPed then
                    local dist = #(GetEntityCoords(ped) - sentPos)
                    if dist < sentDistance then
                        return ped
                    end
                end
            end
        end
    elseif sentType == 'gunshot' then
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) then
                local dist = #(GetEntityCoords(ped) - sentPos)
                if dist < sentDistance then
                    if not IsPedAimingFromCover(ped) and not IsPedBeingStunned(ped, 0) and not IsPedDeadOrDying(ped, 1) and IsPedHuman(ped) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedShooting(ped) and not IsPedAPlayer(ped) then
                        TaskUseMobilePhoneTimed(ped, 5000)
                        return ped
                    end
                end
            end
        end
    elseif sentType == 'armed' then
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local dist = #(GetEntityCoords(ped) - sentPos)
                if dist < 50.0 and math.random(10) > 4 then
                    if not IsPedAimingFromCover(ped) and not IsPedBeingStunned(ped, 0) and not IsPedDeadOrDying(ped, 1) and IsPedHuman(ped) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedShooting(ped) then
                        TaskUseMobilePhoneTimed(ped, 5000)
                        return ped
                    end
                end
            end
        end
    else
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped, 1) and IsPedHuman(ped) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedShooting(ped) then
                local dist = #(GetEntityCoords(ped) - sentPos)
                if dist < sentDistance then
                    return ped
                end
            end
        end
    end
end

local function GetPedInFront()
    local plyPed = playerPed
    local plyPos = GetEntityCoords(plyPed, false)
    local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
    local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
    local _, _, _, _, ped = GetShapeTestResult(rayHandle)
    return ped
end

local function GetVehicleDescription(sentVehicle)
    if not sentVehicle or sentVehicle == nil then
        local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if not DoesEntityExist(currentVehicle) then
            return
        end
    elseif sentVehicle then
        currentVehicle = sentVehicle
    end
    
    plate = GetVehicleNumberPlateText(currentVehicle)
    make = GetDisplayNameFromVehicleModel(GetEntityModel(currentVehicle))
    color1, color2 = GetVehicleColours(currentVehicle)
    
    if color1 == 0 then color1 = 1 end
    if color2 == 0 then color2 = 2 end
    if color1 == -1 then color1 = 158 end
    if color2 == -1 then color2 = 158 end
    
    if math.random(1, 2) == math.random(1, 2) then
        plate = "Unknown"
    end
    
    local dir = getCardinalDirectionFromHeading()
    
    local vehicleData = {
        model = make,
        plate = plate,
        firstColor = Config.Colors[color1],
        secondColor = Config.Colors[color2],
        heading = dir
    }
    return vehicleData
end

local function canPedBeUsed(ped, isGunshot, isSpeeder)
    
    if math.random(100) > 15 then
        return false
    end
    
    if ped == nil then
        return false
    end
    
    if isSpeeder == nil then
        isSpeeder = false
    end
    
    if ped == PlayerPedId() then
        return false
    end
    
    if GetEntityHealth(ped) == 0 then
        return false
    end
    
    if isSpeeder then
        if not IsPedInAnyVehicle(ped, false) then
            return false
        end
    end
    
    local curcoords = GetEntityCoords(PlayerPedId())
    local startcoords = GetEntityCoords(ped)
    
    if #(curcoords - startcoords) < 10.0 then
        return false
    end
    
    -- here we add areas that peds can not alert the police
    if #(curcoords - vector3(1088.76, -3187.51, -38.99)) < 15.0 then
        return false
    end
    
    if not HasEntityClearLosToEntity(PlayerPedId(), ped, 17) and not isGunshot then
        return false
    end
    
    if not DoesEntityExist(ped) then
        return false
    end
    
    if IsPedAPlayer(ped) then
        return false
    end
    
    if IsPedFatallyInjured(ped) then
        return false
    end
    
    if IsPedArmed(ped, 7) then
        return false
    end
    
    if IsPedInMeleeCombat(ped) then
        return false
    end
    
    if IsPedShooting(ped) then
        return false
    end
    
    if IsPedDucking(ped) then
        return false
    end
    
    if IsPedBeingJacked(ped) then
        return false
    end
    
    if IsPedSwimming(ped) then
        return false
    end
    
    if IsPedJumpingOutOfVehicle(ped) or IsPedBeingJacked(ped) then
        return false
    end
    
    local pedType = GetPedType(ped)
    if pedType == 6 or pedType == 27 or pedType == 29 or pedType == 28 then
        return false
    end
    return true
end

-- GUNSHOTS
CreateThread(function()-- Gun Shots
        
        local isBusyGunShots, armed, cooldownGS, cooldownSMD = false, false, 0, 0
        
        while true do
            Wait(0)
            
            if not isBusyGunShots then
                
                armed = currentlyArmed
                
                if armed and Config.KnownWeapons[currentWeapon] then
                    if IsPedShooting(playerPed) and ((cooldownGS == 0) or cooldownGS - GetGameTimer() < 0) then
                        isBusyGunShots = true
                        
                        if IsPedCurrentWeaponSilenced(playerPed) then
                            cooldownGS = GetGameTimer() + math.random(25000, 30000)-- 20 => 25 Seconds.
                            TriggerEvent("civilian:alertPolice", 15.0, "gunshot", 0, true, inHuntingZone, currentWeapon)
                        elseif inVehicle then
                            cooldownGS = GetGameTimer() + math.random(20000, 25000)-- 20 => 25 Seconds.
                            TriggerEvent("civilian:alertPolice", 150.0, "gunshotvehicle", 0, true, inHuntingZone, currentWeapon)
                        else
                            cooldownGS = GetGameTimer() + math.random(15000, 20000)-- 15 => 20 Seconds.
                            TriggerEvent("civilian:alertPolice", 550.0, "gunshot", 0, true, inHuntingZone, currentWeapon)
                        end
                        
                        isBusyGunShots = false
                    elseif (cooldownSMD == 0 and math.random(10) > 7) or ((cooldownSMD - GetGameTimer() < 0) and math.random(10) > 7) then
                        local shouldAlert = true
                        local myPos = GetEntityCoords(playerPed)
                        for i = 1, #Config.NulledAreas do
                            local dist = #(Config.NulledAreas[i] - myPos)
                            if dist <= math.random(75, 100) then
                                shouldAlert = false
                                break
                            end
                        end
                        if not inVehicle and shouldAlert then
                            if math.random(10) > 5 then
                                cooldownSMD = GetGameTimer() + math.random(45000, 60000)-- 45 => 60 Seconds.
                            elseif not PlayerData.job.name == 'police' then
                                local closestNPC = GetClosestNPC(playerCoords, 25.0, 'armed')
                                if closestNPC and DoesEntityExist(closestNPC) then
                                    cooldownSMD = GetGameTimer() + math.random(60000, 90000)-- 60 => 90 Seconds.
                                    ArmedPlayer()
                                end
                            end
                        end
                    end
                else
                    Wait(1000)
                end
            else
                Wait(250)
            end
        end
end)

function ArmedPlayer()-- When aiming weapon.
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local vehicleData = GetVehicleDescription() or {}
    local initialTenCode = "10-44"
    
    Wait(math.random(3000, 5000))
    
    local SendData = {
        dispatchCode = initialTenCode,
        firstStreet = locationInfo,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        priority = 3,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Brandishing",
        job = {"police"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    }
    TriggerServerEvent("erp-dispatch:sendAlert", SendData)
end

-- FIGHT IN PROGRESS
CreateThread(function()-- Fighting
    local isBusy, cooldown = false, 0
    while true do
        Wait(0)
        if not inVehicle and not isBusy and (cooldown - GetGameTimer() < 0) then
            local pedinfront = GetPedInFront()
            if pedinfront > 0 then
                if IsPedInMeleeCombat(playerPed) and IsPedInCombat(pedinfront, playerPed) and GetClosestNPC(playerCoords, 25.0, 'combat', pedinfront) then
                    TriggerEvent("civilian:alertPolice", 15.0, "fight", 0)
                    cooldown = GetGameTimer() + math.random(20000, 25000)-- 20 => 25 Seconds
                else
                    Wait(1000)
                end
            else
                Wait(1000)
            end
        else
            Wait(1000)
        end
    end
end)


-- Dispatch Itself
local disableNotis, disableNotifSounds = false, false

RegisterNetEvent('erp-dispatch:manageNotifs')
AddEventHandler('erp-dispatch:manageNotifs', function(sentSetting)
    local wantedSetting = tostring(sentSetting)
    if wantedSetting == "on" then
        disableNotis = false
        disableNotifSounds = false
        Framework.Functions.Notify('Dispatch enabled.', 'info', 5000, 'Dispatch')
    elseif wantedSetting == "off" then
        disableNotis = true
        disableNotifSounds = true
        Framework.Functions.Notify('Dispatch disabled.', 'info', 5000, 'Dispatch')
    elseif wantedSetting == "mute" then
        disableNotis = false
        disableNotifSounds = true
        Framework.Functions.Notify('Dispatch muted.', 'info', 5000, 'Dispatch')
    else
        Framework.Functions.Notify('Please choose to have dispatch as "on", "off" or "mute".', 'info', 6000, 'Dispatch')
    
    end
end)


local function randomizeBlipLocation(pOrigin, range)
    local Range = range ~= nil and range or 10
    local x = pOrigin.x
    local y = pOrigin.y
    local z = pOrigin.z
    y = y + math.random(Range * -1, Range)
    x = x + math.random(Range * -1, Range)
    return {x = x, y = y, z = z}
end

RegisterNetEvent('civilian:alertPolice')
AddEventHandler("civilian:alertPolice", function(basedistance, alertType, objPassed, isGunshot, isHunting, sentWeapon)
    if PlayerData.job == nil then return end;
    local isPolice = PlayerData.job.name == 'police'
    local plyCoords = GetEntityCoords(PlayerPedId())
    local object = objPassed ~= nil and objPassed or {}
    local nearNPCType = alertType
    local nearNPC
    local hours = GetClockHours()
    if hours >= 23 or hours <= 4 then
        basedistance = basedistance * 0.8
    end
    
    if alertType == "personRobbed" --[[and not isPolice]] then
        AlertpersonRobbed()
    elseif alertType == "gunshotvehicle" or alertType == "gunshot" then
        nearNPCType = 'gunshot'
    end
    
    nearNPC = GetClosestNPC(plyCoords, basedistance, nearNPCType, object)
    local dst = 0
    if nearNPC then
        dst = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(nearNPC))
    end
    
    if nearNPC and DoesEntityExist(nearNPC) then -- PED ANIMATION.
        if not isSpeeder and alertType ~= "robberyhouse" then
            Wait(500)
            if GetEntityHealth(nearNPC) == 0 then
                return
            end
            if not DoesEntityExist(nearNPC) then
                return
            end
            if IsPedFatallyInjured(nearNPC) then
                return
            end
            if IsPedInMeleeCombat(nearNPC) then
                return
            end
            if IsPedShooting(nearNPC) then
                return
            end
            local dontcall = {
                [29] = true,
                [28] = true,
                [27] = true
            }
            if not dontcall[GetPedType(nearNPC)] then
                ClearPedTasks(nearNPC)
                TaskPlayAnim(nearNPC, "cellphone@", "cellphone_call_listen_base", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
            end
        end
    else
        print('no npc')
        return
    end
    
    print('send')
    local isUnderground = false
    if plyCoords.z <= -25 then isUnderground = true end
    
    if alertType == "drugsale" and not underground --[[and not isPolice]] then
        if dst > 50.5 and dst < 75.0 then
            DrugSale()
        end
    elseif alertType == "carcrash" then
        CarCrash()
    elseif alertType == "death" then
        AlertDeath()
        local roadtest2 = IsPointOnRoad(GetEntityCoords(PlayerPedId()), PlayerPedId())
        if roadtest2 then return end
        BringNpcs()
    elseif alertType == "Suspicious" then
        AlertSuspicious()
    elseif (alertType == "gunshot" or alertType == "gunshotvehicle") then
        AlertGunShot(isHunting, sentWeapon)
    elseif alertType == "lockpick" then
        if dst > 5.0 and dst < 85.0 then
            if math.random(100) >= 25 then
                AlertCheckLockpick()
            end
        end
    elseif alertType == "robberyhouse" and not PlayerData.job.name == 'police' then
        AlertCheckRobbery2()
    end
end)


function AlertFight()
    local locationInfo = GetStreetAndZone()
    local gender, armed = IsPedMale(playerPed), IsPedArmed(playerPed, 7)
    local currentPos = GetEntityCoords(playerPed)
    
    local dispatchCode = "10-15"
    
    if armed then
        --dispatchCode = "something"
    end
    
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    
    local SendData = {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Disturbance",
        job = {"police"},
        BlipData = {
            sprite = 458,
            color = 25,
            scale = 1,
            shortrange = false,
            time = 60,
            Zone = {}
        }
    }
    TriggerServerEvent("erp-dispatch:sendAlert", SendData)
    
    if math.random(10) > 5 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(5000, 10000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                local SendData = {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Car fleeing 10-15",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 458,
                        color = 25,
                        scale = 1,
                        shortrange = false,
                        time = 60,
                        Zone = {}
                    }
                }
                TriggerServerEvent("erp-dispatch:sendAlert", SendData)
            end
            return
        end)
    end
end

function AlertGunShot(isHunting, sentWeapon)-- Check for automatic, change priority to 1
    if Config.KnownWeapons[sentWeapon] and not IsPedCurrentWeaponSilenced(PlayerPedId()) then
        local locationInfo = GetStreetAndZone()
        local gender = IsPedMale(playerPed)
        local currentPos = GetEntityCoords(playerPed)
        
        local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
        
        local vehicleData = GetVehicleDescription() or {}
        local initialTenCode = "10-71A"
        local dispatchMessage = "Стрелба на крак"
        if isInVehicle then
            initialTenCode = "10-71B"
            dispatchMessage = "Стрелба от МПС"
        end
        
        local isAuto = Config.KnownWeapons[sentWeapon]['isAuto']
        
        local job = {"police"}
        --if isHunting then job = {"sapr"} end
        TriggerServerEvent('erp-dispatch:sendAlert', {
            dispatchCode = initialTenCode,
            firstStreet = locationInfo,
            gender = gender,
            model = vehicleData.model,
            plate = vehicleData.plate,
            priority = 2,
            firstColor = vehicleData.firstColor,
            secondColor = vehicleData.secondColor,
            heading = vehicleData.heading,
            automaticGunfire = isAuto,
            origin = {
                x = currentPos.x,
                y = currentPos.y,
                z = currentPos.z
            },
            dispatchMessage = dispatchMessage,
            job = job,
            BlipData = {
                sprite = 458,
                color = 5,
                scale = 1,
                shortrange = true,
                time = 60
            }
        })
        
        if math.random(1, 10) > 3 and not isInVehicle then
            CreateThread(function()
                Wait(math.random(5000, 10000))
                if IsPedInAnyVehicle(PlayerPedId()) then
                    local vehicleData = GetVehicleDescription() or {}
                    local newPos = GetEntityCoords(PlayerPedId())
                    local locationInfo = GetStreetAndZone()
                    TriggerServerEvent('erp-dispatch:sendAlert', {
                        dispatchCode = '10-80G',
                        relatedCode = initialTenCode,
                        firstStreet = locationInfo,
                        gender = gender,
                        model = vehicleData.model,
                        plate = vehicleData.plate,
                        priority = 2,
                        firstColor = vehicleData.firstColor,
                        secondColor = vehicleData.secondColor,
                        heading = vehicleData.heading,
                        origin = {
                            x = newPos.x,
                            y = newPos.y,
                            z = newPos.z
                        },
                        dispatchMessage = "Бягство от стрелба",
                        job = {"police"},
                        BlipData = {
                            sprite = 458,
                            color = 5,
                            scale = 1,
                            shortrange = true,
                            time = 60
                        }
                    })
                end
                return
            end)
        end
    end
end

RegisterNetEvent('erp-dispatch:set:waypoint')
AddEventHandler("erp-dispatch:set:waypoint", function(coords)
    Framework.Functions.Notify('Зададохте локация към последният сигнал', 'success', 6000, 'Dispatch')
    SetNewWaypoint(coords.x, coords.y)
end)
    
RegisterCommand('911', function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    if string.len(msg) > 0 then
        local plyData = Framework.Functions.GetPlayerData()
        local locationInfo = GetStreetAndZone()
        local gender = IsPedMale(playerPed)
        local currentPos = GetEntityCoords(playerPed)
        
        TriggerEvent('animations:client:EmoteCommandStart', {"phone"})
        Citizen.Wait(math.random(2500, 4000))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        local SendData = {
            dispatchCode = "911",
            firstStreet = locationInfo,
            gender = gender,
            priority = 1,
            origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
            dispatchMessage = "Сигнал от цивилен",
            name = plyData.charinfo.firstname .. ' ' .. plyData.charinfo.lastname,
            number = plyData.charinfo.phone,
            job = {"police"},
            information = msg,
            BlipData = {
                sprite = 280,
                color = 2,
                scale = 1,
                shortrange = true,
                time = 60
            }
        }
        TriggerServerEvent("erp-dispatch:sendAlert", SendData)
    else
        Framework.Functions.Notify('Въведете информация за сигнала', 'info', 6000, 'Dispatch')
    end
end)

RegisterCommand('112', function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    if string.len(msg) > 0 then
        local plyData = Framework.Functions.GetPlayerData()
        local locationInfo = GetStreetAndZone()
        local gender = IsPedMale(playerPed)
        local currentPos = GetEntityCoords(playerPed)
        
        TriggerEvent('animations:client:EmoteCommandStart', {"phone"})
        Citizen.Wait(math.random(2500, 4000))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        local SendData = {
            dispatchCode = "112",
            firstStreet = locationInfo,
            gender = gender,
            priority = 1,
            origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
            dispatchMessage = "Сигнал от цивилен",
            name = plyData.charinfo.firstname .. ' ' .. plyData.charinfo.lastname,
            number = plyData.charinfo.phone,
            job = {"ambulance"},
            information = msg,
            BlipData = {
                sprite = 280,
                color = 3,
                scale = 1.4,
                shortrange = true,
                dontgoaway = true,
                time = 180
            }
        }
        TriggerServerEvent("erp-dispatch:sendAlert", SendData)
    else
        Framework.Functions.Notify('Въведете информация за сигнала', 'info', 6000, 'Dispatch')
    end
end)

function DrugSale()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local initialTenCode = "10-99"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = initialTenCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Suspicious Hand-off",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 5 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(7500, 12500))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = initialTenCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 2,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Car Fleeing 10-99",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function CarCrash()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currentVeh == 0 or GetVehicleNumberPlateText(currentVeh) == nil then currentVeh = GetVehiclePedIsIn(PlayerPedId(), true) end
    local vehicleData = GetVehicleDescription(currentVeh) or {}
    local dispatchCode = "10-50"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        priority = 3,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Vehicle Crash",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc", "ambulance", "cmmc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
end

function AlertCheckLockpick()
    
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    
    local vehicleData = GetVehicleDescription(currentVeh) or {}
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        priority = 3,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Vehicle Theft",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
end


function AlertpersonRobbed()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Store Robbery",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 3 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(20000, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 2,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Vehicle fleeing 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

RegisterNetEvent('erp-dispatch:houserobbery:force')
AddEventHandler("erp-dispatch:houserobbery:force", function()
    AlertCheckRobbery2()
end)

function AlertCheckRobbery2()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-33"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 2,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Breaking and entering",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 3 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(12500, 15000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Car fleeing 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertBankTruck()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Bank Truck",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(12500, 15000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading Bank Truck",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertArt()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Art Gallery",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(12500, 15000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading Bank Truck",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertG6()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Gruppe Sechs Alarm",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
end

function AlertJewelRob()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Vangelico Robbery",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(12500, 15000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertJailBreak()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local dispatchCode = "10-98"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Jail Break in Progress",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarFleeing',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading 10-98",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertPaletoRobbery()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Paleto Robbery",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertCarBoost(boosted)
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local veh = NetworkGetEntityFromNetworkId(boosted)
    local currentVeh = veh
    local dispatchCode = "10-81"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        relatedCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        model = GetDisplayNameFromVehicleModel(GetEntityModel(currentVeh)),
        plate = GetVehicleNumberPlateText(currentVeh),
        
        priority = 1,
        firstColor = GetVehicleModColor_1Name(currentVeh),
        secondColor = GetVehicleModColor_2Name(currentVeh),
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Car Boosting",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10000)
            hacked = Entity(currentVeh).state.hacked
            if not hacked and DoesEntityExist(currentVeh) then
                currentPos = GetEntityCoords(currentVeh)
                TriggerServerEvent('erp-dispatch:carboosting', currentPos, currentVeh, false)
            end
        end
    end)
end

function AlertFleecaRobbery()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Fleeca Robbery",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

RegisterNetEvent('erp-dispatch:drugjob')
AddEventHandler("erp-dispatch:drugjob", function()
    AlertDrugJob()
end)

RegisterNetEvent('erp-dispatch:bankrobbery')
AddEventHandler("erp-dispatch:bankrobbery", function()
    AlertFleecaRobbery()
end)

RegisterNetEvent('erp-dispatch:paleto:bankrobbery')
AddEventHandler("erp-dispatch:paleto:bankrobbery", function()
    AlertPaletoRobbery()
end)

RegisterNetEvent('erp-dispatch:carboost')
AddEventHandler("erp-dispatch:carboost", function(boosted)
    AlertCarBoost(boosted)
end)

RegisterNetEvent('erp-dispatch:bankrobbery:pacific')
AddEventHandler("erp-dispatch:bankrobbery:pacific", function()
    AlertPacificRobbery()
end)

function AlertPacificRobbery()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Pacific Standard Heist",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

function AlertPowerplant()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    
    TriggerServerEvent('erp-dispatch:sendAlert', {
        dispatchCode = dispatchCode,
        firstStreet = "Senora Way, Palmer-Taylor Power Station",
        gender = gender,
        priority = 1,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Powerplant Hit",
        job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
        BlipData = {
            sprite = 280,
            color = 1,
            scale = 1,
            shortrange = true,
            time = 60
        }
    })
    
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('erp-dispatch:sendAlert', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {
                        x = newPos.x,
                        y = newPos.y,
                        z = newPos.z
                    },
                    dispatchMessage = "Evading 10-90",
                    job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc"},
                    BlipData = {
                        sprite = 280,
                        color = 1,
                        scale = 1,
                        shortrange = true,
                        time = 60
                    }
                })
            end
            return
        end)
    end
end

RegisterNetEvent('erp-dispatch:jailbreak')
AddEventHandler("erp-dispatch:jailbreak", function()
    AlertJailBreak()
end)

RegisterNetEvent('client:erp-dispatch:jewelrobbery')
AddEventHandler("client:erp-dispatch:jewelrobbery", function()
    AlertJewelRob()
end)

RegisterNetEvent('erp-dispatch:storerobbery')
AddEventHandler("erp-dispatch:storerobbery", function()
    AlertpersonRobbed()
end)

RegisterNetEvent('erp-dispatch:carjacking')
AddEventHandler("erp-dispatch:carjacking", function()
    AlertCheckLockpick()
end)

RegisterNetEvent('erp-police:downplayer')
AddEventHandler("erp-police:downplayer", function()
    AlertDeath()
end)

RegisterNetEvent('erp-dispatch:AlertG6')
AddEventHandler("erp-dispatch:AlertG6", function()
    AlertG6()
end)


local tenThirteenAC = false

RegisterNetEvent('police:tenThirteenA')
AddEventHandler('police:tenThirteenA', function()
    if tenThirteenAC then return end;
    
    if PlayerData.job.name == 'police' then
        
        local pos = GetEntityCoords(PlayerPedId(), true)
        local plyData = Framework.Functions.GetPlayerData()
        
        TriggerServerEvent("erp-dispatch:sendAlert", {
            dispatchCode = "10-13A",
            firstStreet = GetStreetAndZone(),
            name = plyData['firstname'] .. ' ' .. plyData['lastname'],
            number = plyData['phone_number'],
            priority = 1,
            isDead = true,
            dispatchMessage = "Officer Down",
            origin = {
                x = pos.x,
                y = pos.y,
                z = pos.z
            },
            job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc", "ambulance", "cmmc"},
            BlipData = {
                sprite = 280,
                color = 1,
                scale = 1,
                shortrange = true,
                time = 60
            }
        })
        
        CreateThread(function()
            tenThirteenAC = true
            Wait(30000)
            tenThirteenAC = false
        end)
    end
end)


RegisterNetEvent('erp-dispatch:policealertA')
AddEventHandler('erp-dispatch:policealertA', function(targetCoords)
    if (PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'police') and PlayerData.job.onduty then
        local alpha = 250
        local policedown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
        
        SetBlipSprite(policedown, 126)
        SetBlipColour(policedown, 1)
        SetBlipScale(policedown, 1.3)
        SetBlipAsShortRange(policedown, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-13A Officer Down')
        EndTextCommandSetBlipName(policedown)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(policedown, alpha)
            
            if alpha == 0 then
                RemoveBlip(policedown)
                return
            end
        end
    end
end)

local tenThirteenBC = false

RegisterNetEvent('police:tenThirteenB')
AddEventHandler('police:tenThirteenB', function()
    if tenThirteenBC then return end;
    
    if PlayerData.job.name == 'police' then
        local pos = GetEntityCoords(PlayerPedId(), true)
        
        local plyData = Framework.Functions.GetPlayerData()
        
        TriggerServerEvent("erp-dispatch:sendAlert", {
            dispatchCode = "10-13B",
            firstStreet = GetStreetAndZone(),
            name = plyData['firstname'] .. ' ' .. plyData['lastname'],
            number = plyData['phone_number'],
            priority = 1,
            isDead = true,
            dispatchMessage = "Officer Down",
            origin = {
                x = pos.x,
                y = pos.y,
                z = pos.z
            },
            job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc", "ambulance", "cmmc"},
            BlipData = {
                sprite = 280,
                color = 1,
                scale = 1,
                shortrange = true,
                time = 60
            }
        })
        CreateThread(function()
            tenThirteenBC = true
            Wait(30000)
            tenThirteenBC = false
        end)
    end
end)

RegisterNetEvent('erp-dispatch:policealertB')
AddEventHandler('erp-dispatch:policealertB', function(targetCoords)
    if (PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'police') and PlayerData.job.onduty then
        local alpha = 250
        local policedown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
        
        SetBlipSprite(policedown2, 126)
        SetBlipColour(policedown2, 1)
        SetBlipScale(policedown2, 1.3)
        SetBlipAsShortRange(policedown2, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('10-13B Officer Down')
        EndTextCommandSetBlipName(policedown2)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(policedown2, alpha)
            
            if alpha == 0 then
                RemoveBlip(policedown2)
                return
            end
        end
    end
end)


RegisterNetEvent('dispatch:getCallResponse')
AddEventHandler('dispatch:getCallResponse', function(message, sendername)
    SendNUIMessage({
        update = "newCall",
        callID = math.random(1000, 9999),
        data = {
            dispatchCode = 'RSP',
            priority = 1,
            dispatchMessage = "Call Response",
            information = message,
            name = sendername
        },
        timer = 10000,
        isPolice = true
    })
end)


-- EMS 10-14
RegisterNetEvent('ems:tenThirteenA')
AddEventHandler('ems:tenThirteenA', function()
    if tenThirteenAC then return end;
    
    if PlayerData.job.name == 'ambulance' then
        
        local pos = GetEntityCoords(PlayerPedId(), true)
        local plyData = Framework.Functions.GetPlayerData()
        local job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc", "ambulance", "cmmc"}
        
        TriggerServerEvent("erp-dispatch:sendAlert", {
            dispatchCode = "10-14A",
            firstStreet = GetStreetAndZone(),
            name = plyData['firstname'] .. ' ' .. plyData['lastname'],
            number = plyData['phone_number'],
            priority = 1,
            isDead = true,
            dispatchMessage = "Medic Down",
            origin = {
                x = pos.x,
                y = pos.y,
                z = pos.z
            },
            job = job,
            BlipData = {
                sprite = 280,
                color = 1,
                scale = 1,
                shortrange = true,
                time = 60
            }
        })
        
        CreateThread(function()
            tenThirteenAC = true
            Wait(30000)
            tenThirteenAC = false
        end)
    end
end)

RegisterNetEvent('ems:tenThirteenB')
AddEventHandler('ems:tenThirteenB', function()
    if tenThirteenBC then return end;
    
    if PlayerData.job.name == 'ambulance' then
        local pos = GetEntityCoords(PlayerPedId(), true)
        local plyData = Framework.Functions.GetPlayerData()
        
        TriggerServerEvent("erp-dispatch:sendAlert", {
            dispatchCode = "10-14B",
            firstStreet = GetStreetAndZone(),
            name = plyData['firstname'] .. ' ' .. plyData['lastname'],
            number = plyData['phone_number'],
            priority = 1,
            isDead = true,
            dispatchMessage = "Medic Down",
            origin = {
                x = pos.x,
                y = pos.y,
                z = pos.z
            },
            job = {"police", "bcso", "pa", "sast", "sapr", "sasp", "doc", "ambulance", "cmmc"},
            BlipData = {
                sprite = 280,
                color = 1,
                scale = 1,
                shortrange = true,
                time = 60
            }
        })
        CreateThread(function()
            tenThirteenBC = true
            Wait(30000)
            tenThirteenBC = false
        end)
    end
end)

--[[ AXEL ]]
-- getCardinalDirectionFromHeading() -- Uset for heading
--[[ RegisterCommand('testaleart', function(source, args, rawCommand)
    TriggerEvent("nocore-dispatch:alerts:scrapyard")
end)

RegisterCommand('testaleart2', function(source, args, rawCommand)
    local pos = GetEntityCoords(PlayerPedId())
    local SendData = {
        dispatchCode = "10",
        dispatchMessage = "Officer Down",
        firstStreet = GetStreetAndZone(),
        heading = getCardinalDirectionFromHeading(),
        gender = 1, -- 1 malle, 2 female
        model = 'Car Model', -- String Car model
        plate = 'Car Plate', -- String Car plate
        firstColor = 'Red', -- String Car firstColor
        secondColor = 'Blue', -- String Car secondColor
        automaticGunfire = true, -- automaticGunfire bool
        name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname,
        number = PlayerData.charinfo.phone,
        information = 'Тука седи по дългата информация за сигнала, Тука седи по дългата информация за сигнала, Тука седи по дългата информация за сигнала', -- <
        priority = 3, -- Priority
        time = 'February 12, 2022 03:24:00',
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        randomizeBlipLocation = true, -- Randomize Blip Location
        job = {"police", "ambulance", "cmmc"},
        BlipData = {
            sprite = 306,
            color = 2,
            scale = 2,
            shortrange = false,
            time = 60,
        },
        ZoneData = {
            color = 2,
            time = 60,
            radius = 60,
        }
    }
    TriggerServerEvent("erp-dispatch:sendAlert", SendData)
end) ]]

RegisterNetEvent('erp-dispatch:sendSilentAlert')
AddEventHandler('erp-dispatch:sendSilentAlert', function(data)
    for i=1, #data do
        if not data[i]['origin'] then
            data[i]['origin']['x'] = 1
            data[i]['origin']['y'] = 1
        end
        TriggerEvent("dispatch:clNotify", data[i], data[i]['callId'])
    end
end)

RegisterNetEvent('erp-dispatch:sendAlert')
AddEventHandler('erp-dispatch:sendAlert', function(data, sender)
    if not LocalPlayer.state['isLoggedIn'] then return end
    local NotificationId = data['callId']
    if sender == GetPlayerServerId(PlayerId()) and data['dispatchCode'] == '911' then
        SendNUIMessage({
            update = "newCall",
            callID = NotificationId + math.random(1000, 9999),
            data = {
                dispatchCode = '911',
                priority = 1,
                dispatchMessage = "Sent 911 call",
                information = "Thank you for sending a 911 call in, it has been received and is being processed."
            },
            timer = 5000,
            isPolice = true
        })
    elseif sender == GetPlayerServerId(PlayerId()) and data['dispatchCode'] == '311' then
        SendNUIMessage({
            update = "newCall",
            callID = NotificationId + math.random(1000, 9999),
            data = {
                dispatchCode = '311',
                priority = 2,
                dispatchMessage = "Sent 311 call",
                information = "Thank you for sending a 311 call in, it has been received and is being processed."
            },
            timer = 5000,
            isPolice = true
        })
    end
    if not PlayerData.job.onduty or disableNotis then return end;
    local shouldAlert = false
    for i = 1, #data['job'] do
        if data['job'][i] == PlayerData.job.name then
            shouldAlert = true
            break
        end
    end
    if shouldAlert then
        TriggerEvent("dispatch:clNotify", data, NotificationId)
        if data.origin ~= nil then
            if data.randomizeBlipLocation ~= nil then
                if type(data.randomizeBlipLocation) == 'number' then
                    data.origin = randomizeBlipLocation(data.origin, data.randomizeBlipLocation)
                else
                    data.origin = randomizeBlipLocation(data.origin)
                end
            end
        end
        if data['priority'] == 1 and not disableNotifSounds then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        elseif data['priority'] == 2 and not disableNotifSounds then
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
            PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
        elseif data['priority'] == 3 and not disableNotifSounds then
            TriggerEvent('nocore-sound:client:play', 'alert-panic-button', 0.5)
        end
        SendNUIMessage({
            update = "newCall",
            callID = NotificationId,
            data = data,
            timer = 5000,
            isPolice = PlayerData.job.name == 'police'
        })
        if data.BlipData ~= nil then
            DispatchCreateBlip(data.origin, data.BlipData, NotificationId, data["dispatchMessage"])
        end
        
        if data.ZoneData ~= nil then
            DispatchCreateZone(data.origin, data.ZoneData)
        end
    end
end)

function DispatchCreateBlip(Coords, BlipInfo, CallId, SignalName)
    local BlipAlpha = 250
    local BlipTime = BlipInfo.time ~= nil and BlipInfo.time or 60
    local BlipTime = BlipTime * 25
    local BlipColor = BlipInfo.color ~= nil and BlipInfo.color or 58
    local BlipSprite = BlipInfo.sprite ~= nil and BlipInfo.sprite or 306
    local BlipScale = BlipInfo.scale ~= nil and BlipInfo.scale or 0.8
    local BlipGoAway = BlipInfo.dontgoaway ~= nil and BlipInfo.dontgoaway or false
    local BlipGoAway = not BlipGoAway
    local BlipShortRange = BlipInfo.longrange ~= nil and BlipInfo.longrange or false
    local BlipShortRange = not BlipShortRange
    local newblip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
    local BlipName = '[' .. tostring(CallId) .. '] ' .. SignalName
    
    SetBlipSprite(newblip, BlipSprite)
    SetBlipColour(newblip, BlipColor)
    SetBlipScale(newblip, BlipScale * 1.0)
    SetBlipAsShortRange(newblip, BlipShortRange)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(BlipName)
    EndTextCommandSetBlipName(newblip)

    if BlipGoAway then
        CreateThread(function()
            while BlipAlpha ~= 0 and DoesBlipExist(newblip) do
                Citizen.Wait(BlipTime)
                BlipAlpha = BlipAlpha - 5
                SetBlipAlpha(newblip, BlipAlpha)
                
                if BlipAlpha <= 50 then
                    RemoveBlip(newblip)
                    return
                end
            end
            return
        end)
    else
        CreateThread(function()
            Citizen.Wait(BlipInfo.time * 1000)
            RemoveBlip(newblip)
            return
        end)
        
    end
end

function DispatchCreateZone(Coords, ZoneInfo)
    local ZoneAlpha = 200
    local ZoneColor = ZoneInfo.color ~= nil and ZoneInfo.color or 58
    local ZoneTime = ZoneInfo.time ~= nil and ZoneInfo.time or 60
    local ZoneTime = ZoneTime * 25
    local ZoneRadius = ZoneInfo.radius ~= nil and ZoneInfo.radius or 50.0
    local Zone = AddBlipForRadius(Coords.x, Coords.y, Coords.z, ZoneRadius * 1.0)
    SetBlipHighDetail(Zone, true)
    SetBlipColour(Zone, ZoneColor)
    SetBlipAlpha(Zone, ZoneAlpha)
    SetBlipAsShortRange(Zone, true)
    CreateThread(function()
        while ZoneAlpha ~= 0 and DoesBlipExist(Zone) do
            Citizen.Wait(ZoneTime)
            ZoneAlpha = ZoneAlpha - 5
            SetBlipAlpha(Zone, ZoneAlpha)
            
            if ZoneAlpha <= 50 then
                RemoveBlip(Zone)
                return
            end
        end
        return
    end)
end


--[[ AXEL ALerts ]]

RegisterNetEvent('nocore-dispatch:police:down')
AddEventHandler('nocore-dispatch:police:down', function(prio)
    local pos = GetEntityCoords(PlayerPedId(), true)
    local PlayerData = Framework.Functions.GetPlayerData()
    local Code = "10-13B"
    local Message = "Пострадал полицай"
    local LongRange = false
    local Time = 60
    local Sprite = 153
    if prio == 3 then
        Code = "10-13A"
        Message = "Неутрализиран полицай"
        LongRange = true
        Time = 120
        Sprite = 303
    end
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname,
        number = PlayerData.charinfo.phone,
        priority = prio,
        isDead = true,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police", "ambulance"},
        BlipData = {
            sprite = Sprite,
            color = 3,
            scale = 1,
            longrange = LongRange,
            time = Time
        }
    })
end)

RegisterNetEvent('nocore-dispatch:police:panicbutton')
AddEventHandler('nocore-dispatch:police:panicbutton', function()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local PlayerData = Framework.Functions.GetPlayerData()
    local Code = "10-13C"
    local Message = "Полицай в опасност"

    if not paniccooldown then
        paniccooldown = true
        CreateThread(function()
            Wait(120000)
            paniccooldown = false
        end)
        TriggerServerEvent("erp-dispatch:sendAlert", {
            dispatchCode = Code,
            dispatchMessage = Message,
            firstStreet = GetStreetAndZone(),
            name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname,
            number = PlayerData.charinfo.phone,
            priority = 3,
            isDead = true,
            origin = {
                x = pos.x,
                y = pos.y,
                z = pos.z
            },
            job = {"police"},
            BlipData = {
                sprite = 461,
                color = 3,
                scale = 1,
                longrange = true,
                time = 120
            }
        })
    else
        Framework.Functions.Notify("Изчакай малко време преди да го натискаш пак", "error", 10000, "Police")
    end
end)

RegisterNetEvent('nocore-dispatch:ambulance:panicbutton')
AddEventHandler('nocore-dispatch:ambulance:panicbutton', function()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local PlayerData = Framework.Functions.GetPlayerData()
    local Code = "10-13M"
    local Message = "Медик в опасност"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname,
        number = PlayerData.charinfo.phone,
        priority = 3,
        isDead = true,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police", "ambulance"},
        BlipData = {
            sprite = 461,
            color = 1,
            scale = 1,
            longrange = true,
            time = 120
        }
    })
end)

local Stores = {}

-- Store Robbery Client main 480 
RegisterNetEvent('nocore-dispatch:alerts:storerobbery')
AddEventHandler('nocore-dispatch:alerts:storerobbery', function(camera)
    if Stores[camera] ~= nil and Stores[camera] then return end
    local pos = GetEntityCoords(PlayerPedId(), true)
    local PlayerData = Framework.Functions.GetPlayerData()
    local Code = "10-90S"
    local Message = "Аларма на магазин"
    Stores[camera] = true

    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        information = "Camera: "..camera,
        priority = 2,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 628,
            color = 2,
            scale = 1,
            dontgoaway = true,
            time = 60
        }
    })

    SetTimeout(60000, function()
        Stores[camera] = false
    end)
end)

RegisterNetEvent('nocore-dispatch:alerts:digitaldenrobbery')
AddEventHandler('nocore-dispatch:alerts:digitaldenrobbery', function()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local PlayerData = Framework.Functions.GetPlayerData()
    local Code = "10-90S"
    local Message = "Обир на Digital Den"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        information = "Camera: 35",
        priority = 1,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 521,
            color = 5,
            scale = 1,
            time = 60
        }
    })
end)

--
RegisterNetEvent('nocore-dispatch:alerts:houserobbery')
AddEventHandler('nocore-dispatch:alerts:houserobbery', function()
    local PlayerData = Framework.Functions.GetPlayerData()
    if PlayerData.job.name == "police" then return end
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "10-90H"
    local Message = "Аларма от имот"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        priority = 1,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 492,
            color = 5,
            scale = 1,
            dontgoaway = true,
            time = 60
        }
    })
end)


RegisterNetEvent('nocore-dispatch:alerts:banktruck')
AddEventHandler('nocore-dispatch:alerts:banktruck', function(plate)
    local PlayerData = Framework.Functions.GetPlayerData()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "10-90T"
    local Message = "Обир на инкасо"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        plate = plate,
        priority = 2,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 67,
            color = 5,
            scale = 1,
            dontgoaway = true,
            time = 180
        }
    })
end)

RegisterNetEvent('nocore-dispatch:alerts:cardelivery')
AddEventHandler('nocore-dispatch:alerts:cardelivery', function(plate)
    local PlayerData = Framework.Functions.GetPlayerData()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "10-90V"
    local Message = "Кражда на VIP автомобил"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        plate = plate,
        priority = 1,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 380,
            color = 5,
            scale = 1,
            dontgoaway = true,
            time = 30
        }
    })
end)

--[[
RegisterNetEvent('nocore-dispatch:alerts:bobcat')
AddEventHandler('nocore-dispatch:alerts:bobcat', function()
    local PlayerData = Framework.Functions.GetPlayerData()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "10-90G"
    local Message = "Обир на Bobcat"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        priority = 2,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 556,
            color = 5,
            scale = 1,
            time = 120
        }
    })
end)
]]

RegisterNetEvent('nocore-dispatch:alerts:drugsell')
AddEventHandler('nocore-dispatch:alerts:drugsell', function()
    local PlayerData = Framework.Functions.GetPlayerData()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "10-31D"
    local Message = "Продажба на наркотици"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        priority = 2,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        randomizeBlipLocation = 65,
        job = {"police"},
        BlipData = {
            sprite = 469,
            color = 2,
            scale = 1,
            dontgoaway = true,
            time = 60
        },
        ZoneData = {
            color = 5,
            radius = 80
        }
    })
end)


RegisterNetEvent('nocore-dispatch:alerts:scrapyard')
AddEventHandler('nocore-dispatch:alerts:scrapyard', function(vehicle)
    local PlayerData = Framework.Functions.GetPlayerData()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "10-90R"
    local Message = "Разфасовка на МПС"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        priority = 1,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"police"},
        BlipData = {
            sprite = 643,
            color = 5,
            scale = 1,
            dontgoaway = true,
            time = 60
        }
    })
end)

RegisterNetEvent('nocore-dispatch:alerts:dead')
AddEventHandler('nocore-dispatch:alerts:dead', function()
    local PlayerData = Framework.Functions.GetPlayerData()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local Code = "20-20"
    local Message = "Пострадал гражданин"
    
    TriggerServerEvent("erp-dispatch:sendAlert", {
        dispatchCode = Code,
        dispatchMessage = Message,
        firstStreet = GetStreetAndZone(),
        priority = 1,
        origin = {
            x = pos.x,
            y = pos.y,
            z = pos.z
        },
        job = {"ambulance"},
        BlipData = {
            sprite = 409,
            color = 5,
            scale = 1,
            dontgoaway = true,
            longrange = true,
            time = 180
        }
    })
end)
