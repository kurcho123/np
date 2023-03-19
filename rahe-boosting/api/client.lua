--
--[[ Framework specific functions ]]--
--

local framework = shConfig.framework
local QBCore

CreateThread(function()
    QBCore = exports['no-core']:GetCoreObject()
end)

function isPlayerPolice()
    local playerJob = QBCore.Functions.GetPlayerData().job
    return playerJob.name == 'police' and playerJob.onduty
end

--
--[[ Boosting tablet opening ]]--
--
local display = false

-- Tablet opening through an event
RegisterNetEvent("rahe-boosting:client:openTablet")
AddEventHandler("rahe-boosting:client:openTablet", function()
    display = true
    DoAnim()
    openTablet()
end)


--
--[[ Using hacking device ]]--
--



-- Hacking device using through an event
RegisterNetEvent("rahe-boosting:client:hackingDeviceUsed")
AddEventHandler("rahe-boosting:client:hackingDeviceUsed", function()
    useHackingDevice()
end)

local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"
local tabletProp = 'prop_cs_tablet'
local tabletBone = 60309
local tabletOffset = vector3(0.03, 0.002, -0.0)
local tabletRot = vector3(10.0, 160.0, 0.0)

function DoAnim()
    if not display then return end

    RequestAnimDict(tabletDict)
    while not HasAnimDictLoaded(tabletDict) do Citizen.Wait(100) end
    -- Model
    RequestModel(tabletProp)
    while not HasModelLoaded(tabletProp) do Citizen.Wait(100) end

    local plyPed = PlayerPedId()

    local tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)

    local tabletBoneIndex = GetPedBoneIndex(plyPed, tabletBone)

    AttachEntityToEntity(tabletObj, plyPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
    SetModelAsNoLongerNeeded(tabletProp)

    CreateThread(function()
        while display do
            Wait(0)
            if not IsEntityPlayingAnim(plyPed, tabletDict, tabletAnim, 3) then
                TaskPlayAnim(plyPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end
        ClearPedSecondaryTask(plyPed)
        Wait(250)
        DetachEntity(tabletObj, true, false)
        DeleteEntity(tabletObj)
    end)
end

-- GPS hacking device using through an event
RegisterNetEvent("rahe-boosting:client:gpsHackingDeviceUsed")
AddEventHandler("rahe-boosting:client:gpsHackingDeviceUsed", function()
    useGpsHackingDevice()
end)


--
--[[ General]]--
--

RegisterNetEvent('rahe-boosting:client:notify')
AddEventHandler('rahe-boosting:client:notify',function(message, type)
    notifyPlayer(message, type)
end)

function notifyPlayer(message, type)
    QBCore.Functions.Notify(message, type, 7500)
end

-- You can do some logic here when the tablet is closed. For example, if you started an animation when opening, you can end the animation here.
RegisterNetEvent('rahe-boosting:client:tabletClosed', function()
    display = false
    DoAnim()
end)

-- The event which can be used to give vehicle keys to the player after completing the hack of a special boost (A / S class).
AddEventHandler('rahe-boosting:client:giveKeys', function(vehicleId, licensePlate)
    exports['nocore-vehiclekeys']:SetVehicleKey(licensePlate, true)
end)

-- The event which will be triggered when a player hacks the engine of an important boost. This marks the start of a high priority boost.
-- This event can be used to send a notification to police dispatch to alert the police.
AddEventHandler('rahe-boosting:client:importantBoostStarted', function(location, vehicleId, vehicleClass)
    local SendData = {
        dispatchCode = "10-90T",
        dispatchMessage = "Кражба на VIP автомобил",
        firstStreet = QBCore.Functions.GetStreetLabel(),
        model = vehicleId,
        plate = GetVehicleNumberPlateText(vehicleId),
        priority = 1, -- Priority
        origin = {
            x = location.x,
            y = location.y,
            z = location.z
        },
        randomizeBlipLocation = true, -- Randomize Blip Location
        job = {"police", "swat"},
        BlipData = {
            sprite = 326,
            color = 1,
            scale = 1,
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
end)

-- The event which will be triggered when the players fails a GPS hack.
-- This event can be used to raise player's stress level.
AddEventHandler('rahe-boosting:client:failedGpsHack', function()

end)

-- The event which will be triggered when the players successfully completes one GPS hack.
-- This event by default is used to send a notification, but can also be used to set a circle in a bottom UI circle.
RegisterNetEvent('rahe-boosting:client:successfulGpsHack')
AddEventHandler('rahe-boosting:client:successfulGpsHack', function(hacksCompleted, hacksRequired, gainedDelay)
    notifyPlayer(translations.NOTIFICATION_GAME_HACK_SUCCESSFUL:format(gainedDelay, hacksCompleted, hacksRequired), G_NOTIFICATION_TYPE_SUCCESS)
end)