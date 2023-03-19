local type = nil
local menu = {
    {
        id = 1,
        header = "FPS Boost",
        isMenuHeader = true
    },
    {
        id = 2,
        header = "Нулиране",
        txt = "Върни обратно настройките по default",
        params = {
            event = "nocore-fps:reset",
            args = {}
        }
    },
    {
        id = 3,
        header = "Ultra Low Settings",
        txt = "Ultra Low настройки за вашата игра.",
        params = {
            event = "nocore-fps:ulow",
            args = {}
        }
    },
    {
        id = 4,
        header = "Low Settings",
        txt = "Low настройки за вашата игра.",
        params = {
            event = "nocore-fps:low",
            args = {}
        }
    },
    {
        id = 5,
        header = "Medium Settings",
        txt = "Medium настройки за вашата игра.",
        params = {
            event = "nocore-fps:medium",
            args = {}
        }
    },
}

RegisterCommand("fps", function()
    exports['nocore-context']:openMenu(menu)
end)

AddEventHandler('nocore-fps:reset', function()
    type = "reset"
    RopeDrawShadowEnabled(true)

    CascadeShadowsSetAircraftMode(true)
    CascadeShadowsEnableEntityTracker(false)
    CascadeShadowsSetDynamicDepthMode(true)
    CascadeShadowsSetEntityTrackerScale(5.0)
    CascadeShadowsSetDynamicDepthValue(5.0)
    CascadeShadowsSetCascadeBoundsScale(5.0)
    
    SetFlashLightFadeDistance(10.0)
    SetLightsCutoffDistanceTweak(10.0)
    DistantCopCarSirens(true)
end)

RegisterNetEvent('nocore-fps:ulow')
AddEventHandler('nocore-fps:ulow', function()
    type = "ulow"
    RopeDrawShadowEnabled(false)

    CascadeShadowsClearShadowSampleType()
    CascadeShadowsSetAircraftMode(false)
    CascadeShadowsEnableEntityTracker(true)
    CascadeShadowsSetDynamicDepthMode(false)
    CascadeShadowsSetEntityTrackerScale(0.0)
    CascadeShadowsSetDynamicDepthValue(0.0)
    CascadeShadowsSetCascadeBoundsScale(0.0)

    SetFlashLightFadeDistance(0.0)
    SetLightsCutoffDistanceTweak(0.0)
    DistantCopCarSirens(false)
end)

RegisterNetEvent('nocore-fps:low')
AddEventHandler('nocore-fps:low', function()
    type = "low"
    RopeDrawShadowEnabled(false)

    CascadeShadowsClearShadowSampleType()
    CascadeShadowsSetAircraftMode(false)
    CascadeShadowsEnableEntityTracker(true)
    CascadeShadowsSetDynamicDepthMode(false)
    CascadeShadowsSetEntityTrackerScale(0.0)
    CascadeShadowsSetDynamicDepthValue(0.0)
    CascadeShadowsSetCascadeBoundsScale(0.0)

    SetFlashLightFadeDistance(5.0)
    SetLightsCutoffDistanceTweak(5.0)
    DistantCopCarSirens(false)
end)

RegisterNetEvent('nocore-fps:medium')
AddEventHandler('nocore-fps:medium', function()
    type = "medium"
    RopeDrawShadowEnabled(true)

    CascadeShadowsClearShadowSampleType()
    CascadeShadowsSetAircraftMode(false)
    CascadeShadowsEnableEntityTracker(true)
    CascadeShadowsSetDynamicDepthMode(false)
    CascadeShadowsSetEntityTrackerScale(5.0)
    CascadeShadowsSetDynamicDepthValue(3.0)
    CascadeShadowsSetCascadeBoundsScale(3.0)

    SetFlashLightFadeDistance(3.0)
    SetLightsCutoffDistanceTweak(3.0)
    DistantCopCarSirens(false)
end)


Citizen.CreateThread(function()
    while true do
        if type == "ulow" then
            --// Find closest ped and set the alpha
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end

                SetPedAoBlobRendering(ped, false)
                Citizen.Wait(1)
            end


            DisableOcclusionThisFrame()

            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)

        elseif type == "low" then
            --// Find closest ped and set the alpha
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end
                SetPedAoBlobRendering(ped, false)

                Citizen.Wait(1)
            end


            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)

        elseif type == "medium" then
            --// Find closest ped and set the alpha
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    end
                end

                SetPedAoBlobRendering(ped, false)
                Citizen.Wait(1)
            end


  
        else
            Citizen.Wait(500)
        end
        Citizen.Wait(8)
    end
end)

--// Clear broken thing, disable rain, disable wind and other tiny thing that dont require the frame tick
Citizen.CreateThread(function()
    while true do
        if type == "ulow" or type == "low" then
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearPedBloodDamage(PlayerPedId())
            ClearPedWetness(PlayerPedId())
            ClearPedEnvDirt(PlayerPedId())
            ResetPedVisibleDamage(PlayerPedId())
            ClearExtraTimecycleModifier()
            ClearTimecycleModifier()
            ClearHdArea()
            DisableVehicleDistantlights(false)
            DisableScreenblurFade()
            SetRainLevel(0.0)
            SetWindSpeed(0.0)
            Citizen.Wait(300)
        elseif type == "medium" then
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            SetWindSpeed(0.0)
            Citizen.Wait(1000)
        else
            Citizen.Wait(1500)
        end
    end
end)






--// Entity Enumerator (https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2#file-entityiter-lua)
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end

function GetWorldObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function GetWorldPeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function GetWorldVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function GetWorldPickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end