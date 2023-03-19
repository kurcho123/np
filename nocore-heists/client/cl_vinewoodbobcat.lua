local Framework = exports['no-core']:GetCoreObject()
local guardias = {}
local CurrentCadets = 0
local CurrentCops = 0
local Door = nil
local SafeLoop = false
local DoorOpened = false
local c4prop = nil
local Object1, Object2, Object3 = nil, nil, nil
local guardsConfig = {
	[1] = {
		pos = {266.00, 298.79, 105.55, 275.35},
		ped = 'mp_s_m_armoured_01',
		weapon = 'WEAPON_PISTOL',
		armour = 200
	},
	[2] = {
		pos = {269.62, 292.94, 105.55, 344.74},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_CARBINERIFLE_MK2',
		armour = 200
	},
	[3] = {
		pos = {272.99, 300.26, 105.55, 74.10},
		ped = 'mp_s_m_armoured_01',
		weapon = 'WEAPON_CARBINERIFLE_MK2',
		armour = 200
	},
	[4] = {
		pos = {272.92, 306.76, 105.55, 144.07},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_PISTOL',
		armour = 200
	},
	[5] = {
		pos = {281.28707, 276.46197, 105.55742, 64.07}, -- 281.28707, 276.46197, 105.55742, 64.348999
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_PISTOL',  
		armour = 200
	},
	[6] = {
		pos = {282.28707, 278.46197, 105.55742, 64.07},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_PISTOL',
		armour = 200
	},
	[7] = {
		pos = {282.28707, 280.46197, 105.55742, 64.07},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_PISTOL',
		armour = 200
	},
}

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

CreateThread(function()
    RequestIpl("prologue06_copy_milo_")
    local interiorid = GetInteriorAtCoords(277.75480000, 290.00350000, 104.55570000)
    ActivateInteriorEntitySet(interiorid, "dovux_vault_original")
    RefreshInterior(interiorid)
end)

local function UpdateDoorState()
    print('UpdateDoorState')
    door = GetClosestObjectOfType(281.03207397461, 305.04516601563, 104.5256729126, 3.0, 1737076325, 0, 0, 0)
    if door ~= nil then
        if DoorOpened then
            SetEntityCoords(door, 281.03207397461, 305.04516601563, 106.5256729126)
        else
            SetEntityCoords(door, 281.03207397461, 305.04516601563, 104.5256729126)
        end
    else
        Wait(2000)
        UpdateDoorState()
    end
end

local function InjectUsb()
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), vector3(292.18685, 300.37503, 131.09165))
    SetEntityHeading(PlayerPedId(), 254.87451)
    exports['nocore-assets']:AddProp('usb')
    local emotedata = {
        'anim@heists@humane_labs@finale@keycards',-- directory
        'ped_a_enter',-- animation
        false,-- loop
        false,--  move
    }
    TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
    Wait(500)
    TriggerEvent('animations:client:EmoteCancelAdmin')
    local emotedata = {
        'anim@heists@humane_labs@finale@keycards',-- directory
        'ped_a_enter_loop',-- animation
        false,-- loop
        false,--  move
    }
    TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
    Framework.Functions.Progressbar('insert_card', 'Пускате вируса', math.random(5000, 7000), false, true, {
     disableMovement = true,
     disableCarMovement = true,
     disableMouse = false,
     disableCombat = true,
     disableInventory = true,
    }, {}, {}, {}, function() -- Done
        local emotedata = {
            'anim@heists@humane_labs@finale@keycards',-- directory
            'ped_a_enter_loop',-- animation
            false,-- loop
            false,--  move
        }
        TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
        exports["memorygame"]:thermiteminigame(10, 3, 3, 10,
        function()-- success
            TriggerEvent('animations:client:EmoteCancelAdmin')
            local emotedata = {
                'anim@heists@humane_labs@finale@keycards',-- directory
                'ped_a_exit',-- animation
                false,-- loop
                false,--  move
            }
            TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
            Wait(500)
            TriggerEvent('animations:client:EmoteCancelAdmin')
            exports['nocore-assets']:RemoveProp()
            FreezeEntityPosition(PlayerPedId(), false)
            Framework.Functions.Notify("Вирусът се качи успешно..", "success")
            TriggerServerEvent('nocore-bobcat:server:Ijection')
            TriggerServerEvent('Framework:Server:RemoveItem', 'trojan_usb', 1)
        end,
        function()-- failure
            TriggerEvent('animations:client:EmoteCancelAdmin')
            local emotedata = {
                'anim@heists@humane_labs@finale@keycards',-- directory
                'ped_a_exit',-- animation
                false,-- loop
                false,--  move
            }
            TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
            Wait(500)
            TriggerEvent('animations:client:EmoteCancelAdmin')
            exports['nocore-assets']:RemoveProp()
            FreezeEntityPosition(PlayerPedId(), false)
            Framework.Functions.Notify("Не успяхте да качите вируса..", "error")
        end)
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCancelAdmin')
        local emotedata = {
            'anim@heists@humane_labs@finale@keycards',-- directory
            'ped_a_exit',-- animation
            false,-- loop
            false,--  move
        }
        TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
        Wait(500)
        TriggerEvent('animations:client:EmoteCancelAdmin')
        exports['nocore-assets']:RemoveProp()
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end

local BobcatZone = PolyZone:Create({
        vector2(284.84057617188, 304.51016235352),
        vector2(262.8948059082, 312.46838378906),
        vector2(252.1076965332, 283.34085083008),
        vector2(223.23846435546, 295.14682006836),
        vector2(247.78239440918, 358.48849487304),
        vector2(252.28295898438, 356.80996704102),
        vector2(258.35256958008, 371.28051757812),
        vector2(267.99578,       373.34207),
        vector2(299.95446777344, 386.15112304688),
        vector2(344.25903320312, 374.3761291504),
        vector2(352.81448364258, 364.53353881836),
        vector2(336.64080810546, 308.81750488282)
    }, {
    name="Bobcat",
    minZ = 103.00,
    maxZ = 140.00
})
  
local msBetweenPointCheck = 1000
BobcatZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        UpdateDoorState()
    end
end, msBetweenPointCheck)

local function CreateVehicleExhaustBackfire(effect, scale, coordsx, coordsz, coordsy)
    local i = 0
    while i < 25 do
        Wait(0)
        i = i + 1
        print(i)
        UseParticleFxAssetNextCall('core')
        StartNetworkedParticleFxNonLoopedAtCoord(effect, coordsx, coordsz, coordsy, 0.0, 0.0, 0.0, scale, false, false, false)
    end
end

function createpfx()
    AddExplosion(272.69033, 309.11849, 105.5473, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, 272.69033, 309.11849, 105.5473)
    AddExplosion(935.69378, -963.6022, 39.499855, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, 935.69378, -963.6022, 39.499855)
    AddExplosion(-460.5192, -352.2864, 34.501617, 0, 0, true, false, true)-- -429.8043, -318.0762, 34.910766
    AddExplosion(-429.8043, -318.0762, 34.910766, 0, 0, true, false, true)
    Wait(200)
    AddExplosion(-383.0397, -369.2192, 31.639089, 0, 0, true, false, true)-- -457.0584, -326.0291, 37.964645, 319.64678
    Wait(200)
    AddExplosion(-457.0584, -326.0291, 37.964645, 0, 0, true, false, true)-- -459.8462, -339.434, 35.197853, 89.570381
    Wait(200)
    AddExplosion(-459.8462, -339.434, 35.197853, 0, 0, true, false, true)
    Wait(200)
    AddExplosion(-459.8462, -339.434, 35.197853, 0, 0, true, false, true)
    Wait(200)
    AddExplosion(-459.8462, -339.434, 35.197853, 0, 0, true, false, true)
    Wait(200)
    AddExplosion(-459.8462, -339.434, 35.197853, 0, 0, true, false, true)
    Wait(200)
    AddExplosion(-459.8462, -339.434, 35.197853, 0, 0, true, false, true)
    Wait(200)
    AddExplosion(-472.5645, -339.0534, 38.100494, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(896.94482, -79.63546, 110.94209, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(1121.4161, -580.7396, 110.94138, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(1122.0144, -1340.245, 122.29914, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(636.54351, -1965.853, 122.29985, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(-107.0505, -1988.896, 122.29916, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(-641.487, -1337.229, 122.29985, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    AddExplosion(196.29696, -937.028, 34.099151, 0, 0, true, false, true)-- -472.5645, -339.0534, 38.100494, 258.80609
    Wait(200)
    
    ShakeGameplayCam("JOLT_SHAKE", 1.0)
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, -472.5645, -339.0534, 38.100494)
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, -460.5192, -352.2864, 34.501617)
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 2.25, -457.0584, -326.0291, 37.964645)
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, -459.8462, -339.434, 35.197853)
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, -429.8043, -318.0762, 34.910766)
    CreateVehicleExhaustBackfire('exp_grd_grenade_lod', 1.25, -383.0397, -369.2192, 31.639089)
    blackout = true
end

local function PlantBomb()
    local playerPed = PlayerPedId()
    local bombprop, item, brotx, broty = GetHashKey("h4_prop_h4_ld_bomb_01a"), 'explosive_lv3', 90.0, 180.0
    exports['nocore-assets']:RequestAnimationDict("anim@heists@ornate_bank@thermal_charge")
	if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then        
        SetEntityCoords(playerPed, vector3(273.63439, 283.43093, 104.55539))
        local forwardVector, rightVector, upVector, pos = GetEntityMatrix(playerPed)
        local newPos = (forwardVector * 0.3) + pos            
        SetEntityCoords(playerPed, newPos.x, newPos.y, newPos.z - 1)
        SetEntityHeading(playerPed, 339.16952)
        FreezeEntityPosition(playerPed, true)
        local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
        SetPedComponentVariation(playerPed, 5, -1, 0, 0)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
        local scene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, 0, 0, 1065353216, 0, 1.3)
        SetEntityCollision(bag, 0, 1)
        NetworkAddPedToSynchronisedScene(playerPed, scene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(scene)
        Wait(1500)
        pos = GetEntityCoords(playerPed)
        c4prop = CreateObject(bombprop, pos.x, pos.y, pos.z + 0.2, 1, 1, 1)
        SetEntityCollision(c4prop, 0, 1)
        AttachEntityToEntity(c4prop, playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, brotx, broty, 180.0, 0, 0, 0, 1, 1, 1)
        Wait(4000)
        NetworkRequestControlOfEntity(bag)

        while not NetworkHasControlOfEntity(bag) do Wait(0) end
        DeleteEntity(bag)
        local newc4coords = GetEntityCoords(c4prop)
        DetachEntity(c4prop, 1, 1)
        SetEntityCoords(c4prop, newc4coords)
        FreezeEntityPosition(c4prop, 1)
        SetEntityCollision(c4prop, 0, 1)
        FreezeEntityPosition(playerPed, false)
        NetworkStopSynchronisedScene(scene)
        TriggerServerEvent('nocore-bobcat:server:sync:exposion')		
    end	
end

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    local startTime = GetGameTimer()
    while (GetGameTimer() - startTime) < 1050 do
        Citizen.Wait(0)
    end
    Framework.Functions.TriggerCallback('nocore-bobcat:server:getdoorstate', function(Opened)
        DoorOpened = Opened
        UpdateDoorState()
    end)

    exports['nocore-eye']:AddBoxZone("Bobcat hack", vector3(292.9, 300.29, 132.09), 0.4, 1, {
        name = "Bobcat hack",
        heading = 340,
        minZ = 132.09,
        maxZ = 133.09,
        debugPoly = false
    }, {
        options = {{
            event = "nocore-bobcat:client:injectusb",
            icon = "fas fa-usb",
            label = "Hack"
        }},
        distance = 2
    })
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Framework.Functions.TriggerCallback('nocore-bobcat:server:getdoorstate', function(Opened)
            DoorOpened = Opened
            UpdateDoorState()
        end)

        exports['nocore-eye']:AddBoxZone("Bobcat hack", vector3(292.9, 300.29, 132.09), 0.4, 1, {
            name = "Bobcat hack",
            heading = 340,
            minZ = 132.09,
            maxZ = 134.09,
            debugPoly = false
        }, {
            options = {{
                event = "nocore-bobcat:client:injectusb",
                icon = "fab fa-usb",
                label = "Hack"
            }},
            distance = 2
        })
    end
end)

RegisterNetEvent('nocore-bobcat:client:injectusb')
AddEventHandler('nocore-bobcat:client:injectusb', function() 
    local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
    if haveGlobalCooldown then
        return
    end
    if CurrentCops < 8 then
        Framework.Functions.Notify("Няма достатъчно куки", "error") 
        return
    end
    local HasItem = Framework.Functions.HasItem('trojan_usb')
    if not HasItem then
        Framework.Functions.Notify("Нямате необходимата флашка..", "error")
        return
    end
    Framework.Functions.TriggerCallback('nocore-bobcat:server:getinjectionstate', function(Injected)
        if Injected then
            Framework.Functions.Notify("Изглежда някой те е изпреварил..", "error")
        else
            InjectUsb()
        end
    end)
end)

-- sync event to open the door and set the cooldown
RegisterNetEvent('nocore-bobcat:client:start')
AddEventHandler('nocore-bobcat:client:start', function()
    CoolDown = true
    DoorOpened = true
    if #(GetEntityCoords(PlayerPedId()) - vector3(280.60247, 306.09371, 105.54369)) < 100 then
        print('inrange')
        AddExplosion(vector3(292.18685, 300.37503, 132.59165), 51, 0.5, 1, 0, 0, 1)
        UpdateDoorState()
        SafeLoop = true
    end
    createpfx()
end)

-- client start
RegisterNetEvent('nocore-bobcat:client:startc')
AddEventHandler('nocore-bobcat:client:startc', function()
    SpawnGuardias()
end)

-- sync stop bomb loop
RegisterNetEvent('nocore-bobcat:client:stopbombloop')
AddEventHandler('nocore-bobcat:client:stopbombloop', function()
    SafeLoop = false
end)

RegisterNetEvent('nocore-items:client:UseBomb')
AddEventHandler('nocore-items:client:UseBomb', function(bomblevel)
    if #(GetEntityCoords(PlayerPedId()) - vector3(273.43786621094, 282.79684448242, 105.55565643311)) > 2 then
        return
    end
    if bomblevel < 4 then
        return
    end
    if CurrentCops < 8 then
        return
    end
    Framework.Functions.TriggerCallback('nocore-bobcat:checkExploded', function(isExploded)
        if not isExploded then            
            TriggerServerEvent('nocore-bobcat:server:bombplant')
            PlantBomb()
            TriggerServerEvent('Framework:Server:RemoveItem', "explosive_lv4", 1)
            SafeLoop = false
        end
    end)
end)

function SpawnGuardias()
    local p = PlayerPedId()
    SetPedRelationshipGroupHash(p, GetHashKey("PLAYER"))
    AddRelationshipGroup('Guardias')
    for i = 1, #guardsConfig do
        local guardia = guardsConfig[i]
        RequestModel(GetHashKey(guardia.ped))
        while not HasModelLoaded(GetHashKey(guardia.ped)) do
            Wait(1)
        end
        guardias[i] = CreatePed(4, GetHashKey(guardia.ped), guardia.pos[1], guardia.pos[2], guardia.pos[3], guardia.pos[4], false, true)
        NetworkRegisterEntityAsNetworked(guardias[i])
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(guardias[i]), true)
        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(guardias[i]), true)
        SetPedCanSwitchWeapon(guardias[i], true)
        SetPedArmour(guardias[i], guardia.armour)
        SetPedAccuracy(guardias[i], math.random(70, 90))
        SetEntityInvincible(guardias[i], false)
        SetEntityVisible(guardias[i], true)
        SetEntityAsMissionEntity(guardias[i])
        GiveWeaponToPed(guardias[i], GetHashKey(guardia.weapon), 255, false, false)
        SetPedDropsWeaponsWhenDead(guardias[i], false)
        SetPedFleeAttributes(guardias[i], 0, false)
        SetPedRelationshipGroupHash(guardias[i], GetHashKey("Guardias"))
        TaskGuardCurrentPosition(guardias[i], 5.0, 5.0, 1)
        SetPedCanRagdoll(guardias[i], false)
        SetPedSuffersCriticalHits(guardias[i], false)
    end
    Wait(1000)
    SetRelationshipBetweenGroups(0, GetHashKey("Guardias"), GetHashKey("Guardias"))
    SetRelationshipBetweenGroups(5, GetHashKey("Guardias"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("Guardias"))
end


RegisterNetEvent('nocore-bobcat:explosion')
AddEventHandler('nocore-bobcat:explosion', function(source)
    local interiorid = GetInteriorAtCoords(277.75480000, 290.00350000, 104.55570000)
    if #(GetEntityCoords(PlayerPedId()) - vector3(273.57418823242, 282.86407470703, 105.55570220947)) < 100 then
        RequestNamedPtfxAsset('scr_josh3')
        while not HasNamedPtfxAssetLoaded('scr_josh3') do
            Wait(1)
        end
        
        Framework.Functions.Progressbar("vest", "Детониране на бомбата..", 25000, false, false, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done

            DeleteObject(c4prop)
        
            UseParticleFxAssetNextCall('scr_josh3')
            explo1 = StartParticleFxLoopedAtCoord("scr_josh3_explosion", 273.57418823242, 282.86407470703, 105.55570220947, 0.0, 0.0, 0.0, 3.0, false, false, false, 0)
            SetStateOfRayfireMapObject(handle, 6)
            SetStateOfRayfireMapObject(handle2, 6)
            PlaySoundFromCoord(-1, "MAIN_EXPLOSION_CHEAP", 273.57418823242, 282.86407470703, 105.55570220947, 0, 0, 100, 0)
            DeactivateInteriorEntitySet(interiorid, "dovux_vault_original")
            ActivateInteriorEntitySet(interiorid, "dovux_vault_broken")
            RefreshInterior(interiorid)
            CreateBoxes()
            --CreateZones()
        end)
    end
end)

RegisterNetEvent('nocore-bobcat:client:addloot')
AddEventHandler('nocore-bobcat:client:addloot', function()
    local interiorid = GetInteriorAtCoords(277.75480000, 290.00350000, 104.55570000)
    DeactivateInteriorEntitySet(interiorid, "dovux_vault_broken")
    ActivateInteriorEntitySet(interiorid, "dovux_vault_original")
    RefreshInterior(interiorid)
end)

RegisterNetEvent('nocore-bobcat:reset')
AddEventHandler('nocore-bobcat:reset', function()
    local interiorid = GetInteriorAtCoords(277.75480000, 290.00350000, 104.55570000)
    DeactivateInteriorEntitySet(interiorid, "dovux_vault_broken")
    ActivateInteriorEntitySet(interiorid, "dovux_vault_original")
    RefreshInterior(interiorid)
end)

RegisterNetEvent('nocore-dispatch:alerts:bobcat', function(coords)
    local SendData = {
        dispatchCode = "10-90B",
        dispatchMessage = "Склад за оръжия",
        firstStreet = Framework.Functions.GetStreetLabel(),
        gender = 1, -- 1 malle, 2 female
        --model = 'Car Model', -- String Car model
        -- plate = vehplate, -- String Car plate
        --firstColor = 'Red', -- String Car firstColor
       -- secondColor = 'Blue', -- String Car secondColor
       -- automaticGunfire = true, -- automaticGunfire bool
        --name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname,
        --number = PlayerData.charinfo.phone,
       -- information = 'Тука седи по дългата информация за сигнала, Тука седи по дългата информация за сигнала, Тука седи по дългата информация за сигнала', -- <
        priority = 1, -- Priority
        time = 'February 18, 2022 03:24:00',
        origin = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        randomizeBlipLocation = true, -- Randomize Blip Location
        job = {"police", "swat"},
        BlipData = {
            sprite = 150,
            color = 67,
            scale = 2,
            shortrange = false,
            time = 60,
        },
        ZoneData = {
            color = 67,
            time = 60,
            radius = 150,
        }
    }
    TriggerServerEvent("erp-dispatch:sendAlert", SendData)
end)

local createdobjects = {}
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        local interiorid = GetInteriorAtCoords(277.75480000, 290.00350000, 104.55570000)
        DeactivateInteriorEntitySet(interiorid, "dovux_vault_broken")
        ActivateInteriorEntitySet(interiorid, "dovux_vault_original")
        RefreshInterior(interiorid)
        for k, v in ipairs(createdobjects) do
            DeleteEntity(v)
        end
    end
end)

local objects = {
    [1] = {
        pzname = "Bobcat-object1",
        object = "xm_prop_crates_weapon_mix_01a",
        coords = vector3(276.27, 291.96, 104.55),
        heading = 150,
    },
    [2] = {
        pzname = "Bobcat-object2",
        object = "prop_mil_crate_01",
        coords = vector3(277.34002, 286.60836, 104.55561),
        heading = 150,
    },
    [3] = {
        pzname = "Bobcat-object3",
        object = "prop_drop_crate_01",
        coords = vector3(272.04913, 287.48114, 104.5292),
        heading = 150,
    }
}

function CreateBoxes()
    for k, v in ipairs(objects) do
        RequestModel(v.object)
        local object = CreateObject(GetHashKey(v.object), v.coords, 0, 0, 0)
        SetEntityHeading(object, v.heading)
        FreezeEntityPosition(object, true)
        exports['nocore-eye']:AddBoxZone(v.pzname, v.coords, 1.5, 1.8, {
            name = v.pzname,
            heading = v.heading,
            debugPoly = false,
            minZ = 104.0,
            maxZ = 106.0
        }, {
            options = {{
                event = "nocore-bobcat:client:rob",
                icon = "police-badge",
                label = "Обери",
                ObjectType = GetHashKey(v.object),
                name = v.pzname,
            }},
            distance = 2
        })
        -- table.insert(createdobjects, object)
        createdobjects[#createdobjects+1] = object
    end
end

RegisterNetEvent('nocore-bobcat:client:rob')
AddEventHandler('nocore-bobcat:client:rob', function(data)
    local ped = PlayerPedId()
    TriggerServerEvent('nocore-bobcat:server:RemoveLoot', data.name)
    object = GetClosestObjectOfType(GetEntityCoords(ped), 3.0, data.ObjectType, false, false, false)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    Framework.Functions.Progressbar('lootbobcat', 'Събирате оръжията', math.random(20000, 30000), false, false, {
     disableMovement = true,
     disableCarMovement = true,
     disableMouse = false,
     disableCombat = true,
     disableInventory = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if object ~= nil then
            Framework.Functions.TriggerCallback('nocore-heists:upperbobcat:getrewards', function(func)
            end)
            NetworkRequestControlOfEntity(object)
            DeleteEntity(object)
        end
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if object ~= nil then
            NetworkRequestControlOfEntity(object)
            DeleteEntity(object)
        end
    end)
end)

RegisterNetEvent('nocore-bobcat:client:RemoveLoot')
AddEventHandler('nocore-bobcat:client:RemoveLoot', function(name)
    exports['nocore-eye']:RemoveZone(name)
end)
