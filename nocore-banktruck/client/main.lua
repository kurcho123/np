Framework = exports['no-core']:GetCoreObject()


local spawnLocations = {
    [1] = {x = 1323.9591, y = -1712.414, z = 55.440769, h = 114.56417},
    [2] = {x = -1771.849, y = 53.999542, z = 68.042648, h = 228.59498},
    [3] = {x = -1615.03, y = -969.7481, z = 13.017472, h = 319.37338},
    [4] = {x = -3069.046, y = 380.76928, z = 6.9863162, h = 164.30691},
    [5] = {x = -3023.483, y = 1251.9946, z = 27.998157, h = 330.80844},
    [6] = {x = -1295.055, y = 799.22473, z = 189.00579, h = 335.07797},
    [7] = {x = -383.7868, y = 1174.9526, z = 325.70889, h = 249.28428},
    [8] = {x = 2221.5012, y = -738.421, z = 66.501693, h = 127.49162},
    [9] = {x = 744.87774, y = -2973.643, z = 5.8007173, h = 358.63806},
    [10] = {x = -931.2788, y = -1899.669, z = 30.417774, h = 185.89732},
    [11] = {x = 1173.585, y = -2545.198, z = 35.195289, h = 103.1819},
    [12] = {x = 806.19451, y = -1952.046, z = 29.271318, h = 345.75115},
    [13] = {x = -1014.022, y = -596.5905, z = 18.398952, h = 292.87359},
    [14] = {x = -409.8905, y = -559.1246, z = 41.152812, h = 165.52371},
    [15] = {x = 685.83142, y = -116.5368, z = 74.638214, h = 236.83378},
    [16] = {x = 588.41552, y = -1803.57, z = 23.117206, h = 171.20098},
    [17] = {x = -2649.093, y = 2283.6955, z = 23.333919, h = 265.03112},
    [18] = {x = -1942.598, y = 2289.7534, z = 56.391792, h = 289.37396},
    [19] = {x = -422.3927, y = 2828.9135, z = 38.813854, h = 308.32879},
    [20] = {x = 2382.653, y = -267.2481, z = 84.969474, h = 146.28485},
    [21] = {x = 937.97082, y = -1984.016, z = 30.212949, h = 170.80889},
    [22] = {x = -994.094, y = -2723.385, z = 13.749228, h = 56.984989},

}

local atTrolly, RobbingTrolly = false, false
local Trolly1, Trolly2, object1, object2, pickup1, pickup2
local maleSkin = GetHashKey('mp_m_freemode_01')-- Don't delete this
local femaleSkin = GetHashKey('mp_f_freemode_01')-- Don't delete this
local Ojects = {
    [1] = {--Cash
        object = 3781553190,
        pickup = 2846904189,
    },
    [2] = {--Diamonds
        object = 3489641539,
        pickup = 1041247119,
    },
    [3] = {--Gold
        object = 3559648747,
        pickup = 3784066701,
    },
}
local AllowedBags = {10, 11, 12, 13, 51, 52, 54, 55, 56, 57, 58, 92, 93, 94, 95, 96, 97, 98, 99}
local AllowedBagsFemale = {10, 11}

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

RegisterNetEvent('nocore-items:client:UseBomb')
AddEventHandler('nocore-items:client:UseBomb', function(bomblevel)
    local Vehicle = Framework.Functions.GetClosestVehicle()
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(Vehicle))
    local PedPos = GetEntityCoords(PlayerPedId())
    local GetTruckCoords = GetOffsetFromEntityInWorldCoords(Vehicle, 0.0, -2.0, 1.0)
    local TruckDist = #(vector3(PedPos.x, PedPos.y, PedPos.z) - vector3(GetTruckCoords.x, GetTruckCoords.y, GetTruckCoords.z))
    local Plate = GetVehicleNumberPlateText(Vehicle)
    local hasExplosiveLvl2 = Framework.Functions.HasItem('explosive_lv1')
    local hasExplosiveLvl3 = Framework.Functions.HasItem('explosive_lv3')
    if TruckDist >= 5.0 then
        return
    end
    if model:lower() ~= 'stockade' then
        Framework.Functions.Notify(_U("notruck"), "error")
        return
    end
    local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
    if haveGlobalCooldown then
        return
    end
    if CurrentCops < 0 then
        Framework.Functions.Notify("Няма достатъчно полицаи, забави се", "error", 15000)
        return
    end
    if Config.RobbedPlates[Plate] then
        return
        Framework.Functions.Notify(_U("alreadyrobbed"), "error")
    end
    if not (bomblevel == 1 or bomblevel == 3) then
        Framework.Functions.Notify("Тази бомба няма да ви свърши работа", "error")
        return
    end
    if not (hasExplosiveLvl2 and hasExplosiveLvl3) then
        Framework.Functions.Notify("Не стаа, Копеле!", "error")
        return
    end
    TriggerServerEvent('nocore-police:ActivateCooldown', 2, "Обир на инкасо")
    LocalPlayer.state:set("inv_busy", true, true)
    TriggerEvent('nocore-dispatch:alerts:banktruck', Plate)
    StartRobbingVan(Vehicle, bomblevel)
end)

RegisterNetEvent('nocore-banktruck:plate:table')
AddEventHandler('nocore-banktruck:plate:table', function(Plate)
    Config.RobbedPlates[Plate] = true
end)

function StartRobbingVan(Veh, bomblevel)
    IsRobbing = true
    local Coords = GetEntityCoords(Veh)
    local PedPos = GetEntityCoords(PlayerPedId())
    if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
        TriggerServerEvent("nocore-police:server:CreateFingerDrop", PedPos)
    end
    C4Anim(Veh, bomblevel)
end


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

function C4Anim(Veh, bomblevel)
    local playerPed = PlayerPedId()
    local vehicleCoords = GetEntityCoords(Veh)
    local vehicleHeading = GetEntityHeading(Veh)
    local vehicleTrunkCoords = GetOffsetFromEntityInWorldCoords(Veh, 0, -3.57, 0)
    local vehicleCoordsBomb = GetOffsetFromEntityInWorldCoords(Veh, 0, -3.53, 1.0)
    local PedBag, IsFemale = IsPedWearingBag(playerPed)
    local bombprop, item, brotx, broty = GetHashKey("prop_bomb_01_s"), 'explosive_lv1', 90.0, 180.0
    if bomblevel == 2 then
        bombprop, item = GetHashKey("h4_prop_h4_ld_bomb_01a"), 'explosive_lv2'
    elseif bomblevel == 3 then
        bombprop, item, brotx, broty = GetHashKey("ch_prop_ch_explosive_01a"), 'explosive_lv3', 0.0, 0.0
    elseif bomblevel == 4 then
        bombprop, item = GetHashKey("ch_prop_ch_ld_bomb_01a"), 'explosive_lv4'
    end
    exports['nocore-assets']:RequestAnimationDict("anim@heists@ornate_bank@thermal_charge")
    if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
        local fwd, _, _, pos = GetEntityMatrix(playerPed)
        local newPos = (fwd * 0.6) + pos
        SetEntityCoords(playerPed, vehicleTrunkCoords.x, vehicleTrunkCoords.y, vehicleTrunkCoords.z)
        SetEntityHeading(playerPed, vehicleHeading)
        FreezeEntityPosition(playerPed, true)
        local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
        SetPedComponentVariation(playerPed, 5, -1, 0, 0)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z, true, true, false)
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
            SetPedComponentVariation(playerPed, 5, 23, 0, 0)-- Female Bag
        else
            SetPedComponentVariation(playerPed, 5, 23, 0, 0)-- Мale Bag
        end
        DetachEntity(c4, 1, 1)
        SetEntityCoords(c4, vehicleCoordsBomb.x, vehicleCoordsBomb.y, vehicleCoordsBomb.z)
        FreezeEntityPosition(c4, 1)
        SetEntityCollision(c4, 0, 1)
        FreezeEntityPosition(playerPed, false)
        NetworkStopSynchronisedScene(scene)
        TriggerServerEvent('nocore-banktruck:removeExplosives')
        Countdown(Veh)
    end
end

function Countdown(Veh)
    local exposionCoords = GetOffsetFromEntityInWorldCoords(Veh, 0, -3.48, 1.0)
    local insideCoords = GetOffsetFromEntityInWorldCoords(Veh, 0, -3.0, 0.2)
    
    local Loot1Type = 1
    local Loot2Type = 1
    
    if math.random(1, 100) > 95 then
        Loot1Type = 2
    end
    if math.random(1, 100) > 85 then
        Loot2Type = 3
    end

    while not NetworkHasControlOfEntity(Veh) do
        Citizen.Wait(1)
        NetworkRequestControlOfEntity(Veh)
    end
    
    pickup1 = Ojects[Loot1Type].pickup
    object1 = Ojects[Loot1Type].object
    Trolly1 = CreateObject(object1, insideCoords.x, insideCoords.y, insideCoords.z, true, true, false)
    AttachEntityToEntity(Trolly1, Veh, 'seat_pside_r', 0.0, -2.0, 0.9, 0.0, 0.0, 23.0, 0, 0, 0, 0, 0, 1)
    SetEntityHeading(Trolly1, GetEntityHeading(Veh))
    
    pickup2 = Ojects[Loot2Type].pickup
    object2 = Ojects[Loot2Type].object
    Trolly2 = CreateObject(object2, insideCoords.x, insideCoords.y, insideCoords.z, true, true, false)
    AttachEntityToEntity(Trolly2, Veh, 'seat_pside_r', 0.0, -2.9, 0.9, 0.0, 0.0, 171.0, 0, 0, 0, 0, 0, 1)
    SetEntityHeading(Trolly2, GetEntityHeading(Veh))
    
    
    Framework.Functions.Progressbar("open_locker", _U("using_c4"), math.random(240000, 300000), false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = false,
        disableInventory = true
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
        
        AddExplosion(exposionCoords.x, exposionCoords.y, exposionCoords.z, 2, 0.5, 1, 0, 1065353216, 0)
        SetVehicleDoorBroken(Veh, 2, true)
        SetVehicleDoorBroken(Veh, 3, true)
        
        IsRobbing = false
        local Plate = GetVehicleNumberPlateText(Veh)
        TriggerServerEvent('nocore-bankrob:server:remove:card')
        LocalPlayer.state:set("inv_busy", false, true)
        TriggerServerEvent('nocore-banktruck:server:OpenTruck', Veh)
        TriggerServerEvent('nocore-banktruck:server:set:truckamount', 'Count-Minus', 1)
        StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
        Framework.Functions.Notify("Success!", "success")
    end, function()-- Cancel
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
        
        IsRobbing = false
        LocalPlayer.state:set("inv_busy", false, true)
        StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
        Framework.Functions.Notify("Cancelled..", "error")
    end)
end


RegisterNetEvent('nocore-banktruck:client:OpenTruck')
AddEventHandler('nocore-banktruck:client:OpenTruck', function(Veh)
    local Plate = GetVehicleNumberPlateText(Veh)
    RequestModel("mp_s_m_armoured_01")
    while not HasModelLoaded("mp_s_m_armoured_01") do
        Wait(10)
    end
    SetVehicleUndriveable(Veh, true)
    SetVehicleEngineHealth(Veh, 100.0)
    SetVehicleBodyHealth(Veh, 100.0)
    SetEntityAsNoLongerNeeded(Veh)
    for i = 1, 4 do
        Citizen.Wait(1)
        local Yew = CreatePedInsideVehicle(Veh, 5, "mp_s_m_armoured_01", i, 1, 1)
        SetPedShootRate(Yew, 750)
        SetPedCombatAttributes(Yew, 46, true)
        SetPedFleeAttributes(Yew, 0, 0)
        SetPedAsEnemy(Yew, true)
        SetPedArmour(Yew, 200.0)
        SetPedMaxHealth(Yew, 900.0)
        SetPedAlertness(Yew, 3)
        SetPedCombatRange(Yew, 0)
        SetPedCombatMovement(Yew, 3)
        TaskCombatPed(Yew, PlayerPedId(), 0, 16)
        TaskLeaveVehicle(Yew, Veh, 0)
        GiveWeaponToPed(Yew, GetHashKey("WEAPON_SMG"), 5000, true, true)
        SetPedRelationshipGroupHash(Yew, GetHashKey("HATES_PLAYER"))
    end
    RobbingVan = true
    Citizen.CreateThread(function()
        while RobbingVan do
            Citizen.Wait(5)
            local PedPos = GetEntityCoords(PlayerPedId())
            local GetTruckCoords = GetOffsetFromEntityInWorldCoords(Veh, 0.0, -3.5, 0.5)
            -- local TruckDist = GetDistanceBetweenCoords(PedPos.x, PedPos.y, PedPos.z, GetTruckCoords.x, GetTruckCoords.y, GetTruckCoords.z, true)
            local TruckDist = #(vector3(PedPos.x, PedPos.y, PedPos.z) - vector3(GetTruckCoords.x, GetTruckCoords.y, GetTruckCoords.z))
            if TruckDist <= 4.2 then
                if not Config.RobbedPlates[Plate] then
                    Framework.Functions.DrawText3D(GetTruckCoords.x, GetTruckCoords.y, GetTruckCoords.z, 'Свали количките')
                    DrawMarker(2, GetTruckCoords.x, GetTruckCoords.y, GetTruckCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('nocore-banktruck:server:updateplates', Plate)
                        RobbingVan = false
                        LetDawnMoney(Veh)
                    end
                else
                    RobbingVan = false
                end
            end
        end
    end)
end)

function LetDawnMoney(Veh)
    SetEntityHeading(PlayerPedId(), GetEntityHeading(Veh))
    TriggerEvent('animations:client:EmoteCommandStart', {"pull"})
    Framework.Functions.Progressbar("open_locker", "Сваляте количките...", math.random(3000, 4000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        local Plate = GetVehicleNumberPlateText(Veh)
        
        local Trolly1Coords = GetOffsetFromEntityInWorldCoords(Veh, -1.0, -4.52, 1.0)
        local Trolly2Coords = GetOffsetFromEntityInWorldCoords(Veh, 1.2, -4.48, 1.0)
        
        if DetachMyEntity(Trolly1) then
            print('Detach Trolly1')
        end
        if DetachMyEntity(Trolly2) then
            print('Detach Trolly2')
        end

        SetEntityCoords(Trolly1, Trolly1Coords.x, Trolly1Coords.y, Trolly1Coords.z - GetEntityHeightAboveGround(Trolly1) + 0.38)
        SetEntityCoords(Trolly2, Trolly2Coords.x, Trolly2Coords.y, Trolly2Coords.z - GetEntityHeightAboveGround(Trolly2) + 0.38)
        
        SetEntityHeading(Trolly1, GetEntityHeading(Trolly1) + math.random(220, 230))
        SetEntityHeading(Trolly2, GetEntityHeading(Trolly2) - math.random(20, 30))
        
        local Trolly1Coords = GetEntityCoords(Trolly1)
        local Trolly2Coords = GetEntityCoords(Trolly2)
        
        
        TriggerServerEvent('nocore-banktruck:server:AddTrolly', {pickup = pickup1, object = object1, coords = Trolly1Coords, heading = GetEntityHeading(Trolly1), name = Plate .. '-1'})
        TriggerServerEvent('nocore-banktruck:server:AddTrolly', {pickup = pickup2, object = object2, coords = Trolly2Coords, heading = GetEntityHeading(Trolly2), name = Plate .. '-2'})
        Framework.Functions.TriggerCallback('nocore-banktruck:server:GetTrojan', function(cb)
            if cb then
                Framework.Functions.Notify('Изпадна някаква флашка от едната количка', 'success')
            end
        end)
        
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        Framework.Functions.Notify("Success!", "success")
    end, function()-- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        Framework.Functions.Notify("Cancelled", "error")
    end)
end

function DetachMyEntity(entity)
    Citizen.Wait(10)
    if NetworkHasControlOfEntity(entity) then
        DetachEntity(entity, true, true)
        if IsEntityAttachedToAnyVehicle(entity) then
            DetachMyEntity(entity)
            --print('Still attached')
        else
            --print('Detached')
            return true
        end
    else
        --print('NO Control')
        NetworkRequestControlOfEntity(Veh)
        NetworkRequestControlOfEntity(entity)
        DetachMyEntity(entity)
    end
end

RegisterNetEvent('nocore-banktruck:client:AddTrolly')
AddEventHandler('nocore-banktruck:client:AddTrolly', function(data)
    exports['nocore-eye']:AddBoxZone(data.name, data.coords, 0.5, 0.8, {
        name = data.name,
        heading = data.heading,
        debugPoly = false,
        minZ = data.coords.z - 0.3,
        maxZ = data.coords.z + 0.6
    }, {
        options = {{
            event = "nocore-banktruck:client:rob:tray",
            icon = "police-badge",
            label = "Обери",
            ObjectType = data.object,
            PickUpType = data.pickup,
            name = data.name,
        }},
        distance = 2
    })
end)

RegisterNetEvent('nocore-banktruck:client:RemoveTrolly')
AddEventHandler('nocore-banktruck:client:RemoveTrolly', function(name)
    exports['nocore-eye']:RemoveZone(name)
end)

RegisterNetEvent('nocore-banktruck:client:rob:tray')
AddEventHandler('nocore-banktruck:client:rob:tray', function(data)
    local ped = PlayerPedId()
    local model = data.PickUpType
    local PedBag, IsFemale = IsPedWearingBag(ped)
    if not RobbingTrolly and PedBag then
        RobbingTrolly = true
        
        Grab2clear = false
        Grab3clear = false
        Money = GetClosestObjectOfType(GetEntityCoords(ped), 2.0, data.ObjectType, false, false, false)-- 1st Right
        
        TriggerServerEvent('nocore-banktruck:server:RemoveTrolly', data.name)
        local function AnimDinero()
            local pedCoords = GetEntityCoords(ped)
            local grabmodel = model
            
            RequestModel(grabmodel)
            while not HasModelLoaded(grabmodel) do
                Citizen.Wait(100)
            end
            local grabobj = CreateObject(grabmodel, pedCoords, true)
            
            FreezeEntityPosition(grabobj, true)
            SetEntityInvincible(grabobj, true)
            SetEntityNoCollisionEntity(grabobj, ped)
            SetEntityVisible(grabobj, false, false)
            AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
            local startedGrabbing = GetGameTimer()
            
            Citizen.CreateThread(function()
                while GetGameTimer() - startedGrabbing < 37000 do
                    Citizen.Wait(1)
                    DisableControlAction(0, 73, true)
                    if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
                        if not IsEntityVisible(grabobj) then
                            SetEntityVisible(grabobj, true, false)
                        end
                    end
                    if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                        if IsEntityVisible(grabobj) then
                            SetEntityVisible(grabobj, false, false)
                        end
                    end
                end
                DeleteObject(grabobj)
                atTrolly = false
            end)
        end
        local emptyobj = GetHashKey("ch_prop_ch_cash_trolly_01c_empty")
        
        if IsEntityPlayingAnim(Money, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
            return
        end
        local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
        
        RequestAnimDict("anim@heists@ornate_bank@grab_cash")
        RequestModel(baghash)
        RequestModel(emptyobj)
        while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
            Citizen.Wait(100)
        end
        while not NetworkHasControlOfEntity(Money) do
            Citizen.Wait(1)
            NetworkRequestControlOfEntity(Money)
        end
        GrabBag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
        Grab1 = NetworkCreateSynchronisedScene(GetEntityCoords(Money), GetEntityRotation(Money), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        NetworkStartSynchronisedScene(Grab1)
        Citizen.Wait(1500)
        AnimDinero()
        if not Grab2clear then
            Grab2 = NetworkCreateSynchronisedScene(GetEntityCoords(Money), GetEntityRotation(Money), 2, false, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, Grab2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(GrabBag, Grab2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(Money, Grab2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
            NetworkStartSynchronisedScene(Grab2)
            Citizen.Wait(37000)
        end
        if not Grab3clear then
            Grab3 = NetworkCreateSynchronisedScene(GetEntityCoords(Money), GetEntityRotation(Money), 2, false, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, Grab3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(GrabBag, Grab3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
            NetworkStartSynchronisedScene(Grab3)
            NewTrolley = CreateObject(emptyobj, GetEntityCoords(Money) + vector3(0.0, 0.0, -0.985), true, false, false)
            SetEntityRotation(NewTrolley, GetEntityRotation(Money))
            while not NetworkHasControlOfEntity(Money) do
                Citizen.Wait(1)
                NetworkRequestControlOfEntity(Money)
            end
            DeleteObject(Money)
            while DoesEntityExist(Money) do
                Citizen.Wait(1)
                DeleteObject(Money)
            end
            PlaceObjectOnGroundProperly(NewTrolley)
        end
        Citizen.Wait(1800)
        if DoesEntityExist(GrabBag) then
            DeleteEntity(GrabBag)
        end
        if IsFemale then
            SetPedComponentVariation(ped, 5, 23, 0, 0)-- Female Bag
        else
            SetPedComponentVariation(ped, 5, 23, 0, 0)-- Мale Bag
        end
        RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
        SetModelAsNoLongerNeeded(emptyobj)
        SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
        Framework.Functions.TriggerCallback('nocore-banktruck:server:GetReward', function(cb) end, data.PickUpType)
        RobbingTrolly = false
        RemoveBlip(blipce)
    else
        Framework.Functions.Notify('Вие нямате раница!')
    end
end)

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
local cwnd = false

RegisterNUICallback('startincasoevent', function()
    Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        print(HasItem)
        if HasItem then
            if CurrentCops >= 6 then
                if not cwnd then
                    TriggerEvent("nocore-items:client:damage:gaming-laptop", 2)
                    function getRandomLocation(variable)
                        return variable[math.random(1, #spawnLocations)]
                    end
                    Framework.Functions.Notify("Локализираме инкасо камион...!", "info")
                    Citizen.Wait(10000)
                    --Framework.Functions.Notify("Инкасо камионът беше локализиран и отбелязан на GPS-а ти!", "error")
                    vehiclehash = GetHashKey('stockade')
                    local coords = getRandomLocation(spawnLocations)
                    CreateCar(vehiclehash, coords.x, coords.y, coords.z, coords.h)
                    cwnd = true
                    TriggerClientEvent("nocore-items:client:damage:gaming-laptop", 2)
                else
                    TriggerEvent("nocore-items:client:damage:gaming-laptop", 1)
                    Framework.Functions.Notify("Интернет връзката ти не е безопасна!", "error")
                end
            else
                Framework.Functions.Notify("Няма достатъчно полицаи", "error", 15000)
            end
        else
            Framework.Functions.Notify("Интернет връзката ти не е безопасна!", "error")
        end
    end, 'npv')
end)


function CreateCar(vehiclehash, x, y, z, h)
    RequestModel(GetHashKey("s_m_m_bouncer_01"))
    RequestModel(GetHashKey("stockade"))
    while (not HasModelLoaded(GetHashKey("s_m_m_bouncer_01"))) do
        Citizen.Wait(1)
    end
    while (not HasModelLoaded(GetHashKey("stockade"))) do
        Citizen.Wait(1)
    end
    local car = GetHashKey("stockade")
    RequestModel(car)
    cv = CreateVehicle(car, x, y, z, h, 1, 0)
    while not DoesEntityExist(cv) do
        Wait(500)  
        cv = CreateVehicle(car, x, y, z, h, 1, 0)
    end
    Framework.Functions.Notify("Инкасо камионът беше локализиран и отбелязан на GPS-а ти!", "info")
    SetVehicleOnGroundProperly(cv)
    SetVehicleHasBeenOwnedByPlayer(cv, true)
    SetEntityAsMissionEntity(cv, true, true)
    driver = CreatePedInsideVehicle(cv, 5, "s_m_m_bouncer_01", -1, 1, 1)
    passenger = CreatePedInsideVehicle(cv, 5, "s_m_m_bouncer_01", 1, 1, 1)
    blipce = AddBlipForEntity(cv)
    SetBlipSprite(blipce, 161)
    Citizen.InvokeNative(0x06FAACD625D80CAA, cv)
    SetPedIntoVehicle(driver, cv, -1)
    SetPedIntoVehicle(passenger, cv, -2)
    TaskVehicleDriveWander(driver, cv, 35.0, 786603)
    SetPedRelationshipGroupHash(driver, GetHashKey("stockade"))
    SetPedRelationshipGroupHash(passenger, GetHashKey("stockade"))
    SetDriverAbility(driver, 10.0)
    SetPedFleeAttributes(driver, 0, 1)
    SetPedFleeAttributes(passenger, 0, 1)
    SetPedSuffersCriticalHits(driver,false)
    SetPedSuffersCriticalHits(passenger,false)
    SetPedAccuracy(driver, 80)
    SetPedAccuracy(passenger, 80)
    GiveWeaponToPed(driver, GetHashKey("WEAPON_PUMPSHOTGUN"), -1, 0, 1)
    GiveWeaponToPed(passenger, GetHashKey("WEAPON_PUMPSHOTGUN"), -1, 0, 1)
end
