local Framework = exports['no-core']:GetCoreObject()
local RockerHeist = {
    ['guardPeds'] = {},
    ['inMission'] = false
}

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

local function loadModel(model)
    if type(model) ~= 'number' then
        model = GetHashKey(model)
    end

    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(0)
    end
end

local function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

local function policenotify()
    local SendData = {
        dispatchCode = "10-71",
        dispatchMessage = "Масова стрелба",
        firstStreet = Framework.Functions.GetStreetLabel(),
        priority = 2, -- Priority
        origin = {
            x = 2447.5568,
            y = 4977.5508,
            z = 51.564777
        },
        randomizeBlipLocation = true, -- Randomize Blip Location
        job = {"police"},
        BlipData = {
            sprite = 795,
            color = 67,
            scale = 1,
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
end

local function SpawnGuards()
    local ped = PlayerPedId()

    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('GuardPeds')

    for k, v in pairs(Shared['RockerHeist']['guardPeds']) do
        loadModel(v['model'])
        RockerHeist['guardPeds'][k] = CreatePed(26, GetHashKey(v['model']), v['coords'], v['heading'], true, true)
        NetworkRegisterEntityAsNetworked(RockerHeist['guardPeds'][k])
        networkID = NetworkGetNetworkIdFromEntity(RockerHeist['guardPeds'][k])
        SetNetworkIdCanMigrate(networkID, true)
        SetNetworkIdExistsOnAllMachines(networkID, true)
        SetPedRandomComponentVariation(RockerHeist['guardPeds'][k], 0)
        SetPedRandomProps(RockerHeist['guardPeds'][k])
        SetEntityAsMissionEntity(RockerHeist['guardPeds'][k])
        SetEntityVisible(RockerHeist['guardPeds'][k], true)
        SetPedRelationshipGroupHash(RockerHeist['guardPeds'][k], GetHashKey("GuardPeds"))
        SetPedAccuracy(RockerHeist['guardPeds'][k], 80)
        SetPedCanSwitchWeapon(RockerHeist['guardPeds'][k], true)
        SetPedDropsWeaponsWhenDead(RockerHeist['guardPeds'][k], false)
		SetPedFleeAttributes(RockerHeist['guardPeds'][k], 0, false)
        GiveWeaponToPed(RockerHeist['guardPeds'][k], GetHashKey('WEAPON_CARBINERIFLE_MK2'), 255, false, false)
        SetPedCanRagdoll(RockerHeist['guardPeds'][k], false)
        local random = math.random(1, 2)
        if random == 2 then
            TaskGuardCurrentPosition(RockerHeist['guardPeds'][k], 10.0, 10.0, 1)
        end
    end

    SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
end

RegisterNetEvent('nocore-heists:rockerHeist:start', function()
    Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
            if CurrentCops >= Shared['RockerHeist']['requiredPoliceCount'] then
                Framework.Functions.TriggerCallback('nocore-heists:rockerHeist:checkCooldown', function(cooldown)
                    if not cooldown then
                        local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
                        if haveGlobalCooldown then
                            return
                        end
                        Framework.Functions.Notify('Благодаря! Предателите ми взеха всичко, ето ти локация. Всичко което вземеш е за теб, но искам да умрат!', 'info', 10000, 'Tonny')
                        TriggerServerEvent('Framework:Server:RemoveItem', "harley-key", 1)
                        TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items['harley-key'], "remove", 1)
                        SetNewWaypoint(2447.5568, 4977.5507)
    
                        repeat
                            local ped = PlayerPedId()
                            local pedCo = GetEntityCoords(ped)
                            local dist = #(pedCo - Shared['RockerHeist']['startHeist']['pos'])
                            Wait(1)
                        until dist <= 100.0
                        SpawnGuards()
                        RockerHeist['inMission'] = true
                        policenotify()
                        TriggerServerEvent('nocore-police:ActivateCooldown', 2, "Rocker Heist")
                        TriggerServerEvent('nocore-heists:rockerHeist:cooldown')
                    else
                        Framework.Functions.Notify('В момента не са там, ще ти кажа кога са и тогава отиди')
                    end
                end)
            else
                Framework.Functions.Notify('В момента не са там, ще ти кажа кога са и тогава отиди', 'error', 10000, 'Tonny')
            end
        else
            Framework.Functions.Notify('А къде ми е ключа за Harley Davidson?', 'error', 10000, 'Tonny')
        end
    end, 'harley-key')
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local sleep = 1000
        for k, v in pairs(Shared['RockerHeist']['robs']) do
            local dist = #(pedCo - v['robPos'])
            if dist <= 1.0 then
                sleep = 1
                if not v['taken'] then
                    if RockerHeist['inMission'] then
                        ShowHelpNotification("~INPUT_CONTEXT~ Претърси")

                        if IsControlJustPressed(0, 38) then
                            TriggerEvent('animations:client:chat:EmoteCommandStart', 'bumbin')
                            TriggerServerEvent("nocore-police:server:CreateFingerDrop", pedCo)
                            TriggerServerEvent('nocore-heists:rockerHeist:server:syncrobs', k, true)
                            Framework.Functions.Progressbar("searching", "Претърсване..", math.random(40000, 50000), false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                                disableInventory = true,
                            }, {}, {}, {}, function() -- Done         
                                TriggerEvent('animations:client:EmoteCancelAdmin')
                                Framework.Functions.TriggerCallback('nocore-heists:rockerHeist:housedrop', function(func)
                                end, v['loc'])
                            end, function() -- Cancel
                                TriggerEvent('animations:client:EmoteCancelAdmin')
                                Framework.Functions.Notify("Отказано...", "error")
                                TriggerServerEvent('nocore-heists:rockerHeist:server:syncrobs', k, false)
                            end, 'fa-solid fa-sack-dollar')
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('nocore-heists:rockerHeist:client:resetheist', function()
    for k, v in pairs(Shared['RockerHeist']['robs']) do
        TriggerServerEvent('nocore-heists:rockerHeist:server:syncrobs', k, false)
        RockerHeist['inMission'] = false
    end
end)

RegisterNetEvent('nocore-heists:rockerHeist:client:syncrobs')
AddEventHandler('nocore-heists:rockerHeist:client:syncrobs', function(x, bool)
    Shared['RockerHeist']['robs'][x]['taken'] = bool
end)

CreateThread(function()
    exports['nocore-eye']:AddBoxZone("ResetRockerHeist", vector3(2441.36, 4971.35, 46.83), 0.55, 0.9, {
        name="ResetRockerHeist",
        heading = 315.0,
        debugPoly=false,
        minZ=46.03,
        maxZ=48.03
    }, {
        options = { {
            type = "server",
            event = "nocore-heists:rockerHeist:server:reset",
            icon = "fas fa-dot-circle",
            label = "Обяви код 4",
            job = 'police'
        }, },
        distance = 1.5
    })
end)