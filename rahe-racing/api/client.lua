local Framework = exports['no-core']:GetCoreObject()

local display = false
local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"
local tabletProp = 'prop_cs_tablet'
local tabletBone = 60309
local tabletOffset = vector3(0.03, 0.002, -0.0)
local tabletRot = vector3(10.0, 160.0, 0.0)

local function DoAnim()
    if not display then return end

    exports['nocore-assets']:RequestAnimationDict(tabletDict)
    exports['nocore-assets']:RequestModelHash(tabletProp)

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

-- CLIENT export - This function is exported, so it can be opened from any other client-side script by using 'exports['rahe-racing']:openRacingTablet()'
function openRacingTablet()
    openTablet()
end

-- If you wish to open the tablet via. an event not the export.
RegisterNetEvent("rahe-racing:client:openTablet")
AddEventHandler("rahe-racing:client:openTablet", function()
    LocalPlayer.state:set("inv_busy", true, true)
    display = true
    DoAnim()
    openTablet()
end)

function notifyPlayer(message)
    Framework.Functions.Notify(message, 'info', 5000, 'Racing')
end

-- You can do some logic when the tablet is closed. For example if you started an animation when opened, you can end the animation here.
RegisterNetEvent('rahe-racing:client:tabletClosed', function()
    LocalPlayer.state:set("inv_busy", false, true)
    display = false
    DoAnim()
end)