local Framework = exports['no-core']:GetCoreObject()
local createdobjects = {}
local guardias = {}
local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

local objects = {
    [1] = {
        pzname = "groveBobcat-object1",
        object = "xm_prop_crates_weapon_mix_01a",
        coords = vector3(886.62, -2127.0, 30.23),
        heading = 150,
    },
    [2] = {
        pzname = "groveBobcat-object2",
        object = "prop_mil_crate_01",
        coords = vector3(889.08, -2121.65, 30.23),
        heading = 150,
    },
    [3] = {
        pzname = "groveBobcat-object3",
        object = "prop_drop_crate_01",
        coords = vector3(890.17, -2127.51, 30.23),
        heading = 150,
    }
}

local function CreateBoxes()
    for k, v in ipairs(objects) do
        RequestModel(v.object)
        local object = CreateObject(joaat(v.object), v.coords, 0, 0, 0)
        SetEntityHeading(object, v.heading)
        FreezeEntityPosition(object, true)
        exports['nocore-eye']:AddBoxZone(v.pzname, v.coords, 1.5, 1.8, {
            name = v.pzname,
            heading = v.heading,
            debugPoly = true,
            minZ = 30.23,
            maxZ = 32.23
        }, {
            options = {{
                event = "nocore-bobcat:client:rob",
                icon = "police-badge",
                label = "Обери",
                ObjectType = joaat(v.object),
                name = v.pzname,
            }},
            distance = 2
        })
        createdobjects[#createdobjects+1] = object
    end
end

local function c4anim(pedpos)
    local ped = PlayerPedId()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("h4_prop_h4_ld_bomb_01a")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and
        not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasModelLoaded("h4_prop_h4_ld_bomb_01a") do
        Citizen.Wait(50)
    end
    SetEntityHeading(ped, pedpos.w)
    Citizen.Wait(100)
    local rot = vec3(GetEntityRotation(ped))
    local bagscene = NetworkCreateSynchronisedScene(pedpos.x - 0.70, pedpos.y + 0.50, pedpos.z, rot, 2, false,
        false, 1065353216, 0, 1.3)
    local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, pedpos.x, pedpos.y, pedpos.z, true, true, false)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5,
        -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge",
        "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local c4 = CreateObject(`h4_prop_h4_ld_bomb_01a`, x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(c4, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 90.0, 180.0, 180.0, 0, 0, 0, 1, 1, 1)
    Citizen.Wait(3000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(c4, 1, 1)
    FreezeEntityPosition(c4, true)
    NetworkStopSynchronisedScene(bagscene)
    Framework.Functions.Progressbar("vest", "Детониране на бомбата..", 25000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        DeleteEntity(c4)
        FreezeEntityPosition(ped, false)
        TriggerServerEvent('nocore-heists:groveBobcat:server:sync:exposion')
        CreateBoxes()
    end)
end

RegisterNetEvent('nocore-heists:groveBobcat:explosion', function()
    AddExplosion(888.3242, -2130.5498, 31.2301, 43, 2.5, true, false, 1.0, true)
    CreateModelSwap(888.12, -2129.87, 29.23, 7.5, `des_vaultdoor001_start`, `des_vaultdoor001_end`, 1)
end)

local function closesafe()
    CreateModelSwap(888.12, -2129.87, 29.23, 7.5, `des_vaultdoor001_end`, `des_vaultdoor001_start`, 1)
end

CreateThread(function()
    exports['nocore-eye']:AddBoxZone("groveBobCatHack", vector3(974.97, -2289.08, 34.72), 2.05, 0.6, {
        name = "groveBobCatHack",
        heading = 355,
        minZ = 34.72 - 2,
        maxZ = 34.72 + 2,
        debugPoly = false
    }, {
        options = {{
            event = "nocore-heists:groveBobCat:injectUsb",
            icon = "fab fa-usb",
            label = "Hack"
        }},
        distance = 2
    })
end)

local function InjectUsb()
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    SetEntityCoords(ped, vector3(975.61, -2289.05, 33.72))
    SetEntityHeading(ped, 89.29)
    exports['nocore-assets']:AddProp('usb')
    local emotedata = {
        'anim@heists@humane_labs@finale@keycards',-- directory
        'ped_a_enter',-- animation
        false,-- loop
        false,--  move
    }
    TriggerEvent('animations:client:EmoteStartAdmin', emotedata)
    Citizen.Wait(500)
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
            Citizen.Wait(500)
            TriggerEvent('animations:client:EmoteCancelAdmin')
            exports['nocore-assets']:RemoveProp()
            FreezeEntityPosition(ped, false)
            Framework.Functions.Notify("Вирусът се качи успешно..", "success")
            TriggerServerEvent('nocore-heists:groveBobcat:server:Ijection')
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
            Citizen.Wait(500)
            TriggerEvent('animations:client:EmoteCancelAdmin')
            exports['nocore-assets']:RemoveProp()
            FreezeEntityPosition(ped, false)
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
        Citizen.Wait(500)
        TriggerEvent('animations:client:EmoteCancelAdmin')
        exports['nocore-assets']:RemoveProp()
        FreezeEntityPosition(ped, false)
    end)
end

RegisterNetEvent('nocore-heists:groveBobCat:injectUsb')
AddEventHandler('nocore-heists:groveBobCat:injectUsb', function() 
    local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
    if haveGlobalCooldown then
        return
    end
    if CurrentCops >= 8 then
        Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
            if HasItem then
                Framework.Functions.TriggerCallback('nocore-heists:groveBobcat:server:getinjectionstate', function(Injected)
                    if Injected then
                        Framework.Functions.Notify("Изглежда някой те е изпреварил..", "error")
                    else
                        InjectUsb()
                    end
                end)
            else
                Framework.Functions.Notify("Нямате необходимата флашка..", "error")
            end
        end, 'trojan_usb')
    else
        Framework.Functions.Notify("Няма достатъчно куки", "error") 
    end
end)

local function SpawnGuardias()
    local p = PlayerPedId()
    SetPedRelationshipGroupHash(p, `PLAYER`)
    AddRelationshipGroup('Guardias')
    for i = 1, #Shared.groveBobcatGuards do
        local guardia = Shared.groveBobcatGuards[i]
        RequestModel(joaat(guardia.ped))
        while not HasModelLoaded(joaat(guardia.ped)) do
            Wait(1)
        end
        guardias[i] = CreatePed(4, joaat(guardia.ped), guardia.pos[1], guardia.pos[2], guardia.pos[3], guardia.pos[4], false, true)
        NetworkRegisterEntityAsNetworked(guardias[i])
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(guardias[i]), true)
        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(guardias[i]), true)
        SetPedCanSwitchWeapon(guardias[i], true)
        SetPedArmour(guardias[i], guardia.armour)
        SetPedAccuracy(guardias[i], math.random(70, 90))
        SetEntityInvincible(guardias[i], false)
        SetEntityVisible(guardias[i], true)
        SetEntityAsMissionEntity(guardias[i])
        GiveWeaponToPed(guardias[i], joaat(guardia.weapon), 255, false, false)
        SetPedDropsWeaponsWhenDead(guardias[i], false)
        SetPedFleeAttributes(guardias[i], 0, false)
        SetPedRelationshipGroupHash(guardias[i], `Guardias`)
        TaskGuardCurrentPosition(guardias[i], 5.0, 5.0, 1)
        SetPedCanRagdoll(guardias[i], false)
        SetPedSuffersCriticalHits(guardias[i], false)
    end
    Citizen.Wait(1000)
    SetRelationshipBetweenGroups(0, `Guardias`, `Guardias`)
    SetRelationshipBetweenGroups(5, `Guardias`, `PLAYER`)
    SetRelationshipBetweenGroups(5, `PLAYER`, `Guardias`)
end

RegisterNetEvent('nocore-items:client:UseBomb')
AddEventHandler('nocore-items:client:UseBomb', function(bomblevel)
    if #(GetEntityCoords(PlayerPedId()) - vector3(888.4, -2131.03, 31.23)) <= 2 then
        if bomblevel >= 4 then
            if CurrentCops >= 8 then
                c4anim(vector4(889.0, -2130.6, 31.2300, 0.7961))
                TriggerServerEvent('Framework:Server:RemoveItem', "explosive_lv4", 1)
            end
        end
    end
end)

RegisterNetEvent('nocore-heists:groveBobcat:client:startc')
AddEventHandler('nocore-heists:groveBobcat:client:startc', function()
    TriggerServerEvent('nui_doorlock:updateState', 492, false, nil, true)
    SpawnGuardias()
end)

RegisterNetEvent('nocore-heists:groveBobcat:client:start')
AddEventHandler('nocore-heists:groveBobcat:client:start', function()
    if #(GetEntityCoords(PlayerPedId()) - vector3(975.61, -2289.05, 33.72)) < 100 then
        AddExplosion(vector3(975.11, -2288.84, 34.62), 51, 0.5, 1, 0, 0, 1)
    end
end)



RegisterNetEvent('nocore-heists:groveBobcat:client:rob')
AddEventHandler('nocore-heists:groveBobcat:client:rob', function(data)
    local ped = PlayerPedId()
    TriggerServerEvent('nocore-heists:groveBobcat:server:RemoveLoot', data.name)
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
            Framework.Functions.TriggerCallback('nocore-heists:groveBobcat:getrewards', function(func)
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

RegisterNetEvent('nocore-heists:groveBobcat:client:RemoveLoot')
AddEventHandler('nocore-heists:groveBobcat:client:RemoveLoot', function(name)
    exports['nocore-eye']:RemoveZone(name)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in ipairs(createdobjects) do
            DeleteEntity(v)
        end
    end
end)