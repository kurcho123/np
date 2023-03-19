local Framework = exports['no-core']:GetCoreObject()
local TrainHeist = {
    ['startPeds'] = {},
    ['guardPeds'] = {},
    ['containers'] = {},
    ['collisions'] = {},
    ['locks'] = {},
    ['desks'] = {},
    ['attachments'] = {}
}


RegisterNetEvent('nocore-train:client:start')
AddEventHandler('nocore-train:client:start', function()
    StartTrainHeist()
end)

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

local function policeNotify()
    local SendData = {
        dispatchCode = "10-71",
        dispatchMessage = "Масова стрелба",
        firstStreet = Framework.Functions.GetStreetLabel(),
        priority = 2, -- Priority
        origin = {
            x = 2872.028,
            y = 4544.253,
            z = 47.758
        },
        randomizeBlipLocation = true, -- Randomize Blip Location
        job = {"police", "swat"},
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

    for k, v in pairs(Shared['TrainHeist']['guardPeds']) do
        loadModel(v['model'])
        TrainHeist['guardPeds'][k] = CreatePed(26, GetHashKey(v['model']), v['coords'], v['heading'], true, true)
        NetworkRegisterEntityAsNetworked(TrainHeist['guardPeds'][k])
        networkID = NetworkGetNetworkIdFromEntity(TrainHeist['guardPeds'][k])
        SetNetworkIdCanMigrate(networkID, true)
        SetNetworkIdExistsOnAllMachines(networkID, true)
        SetPedRandomComponentVariation(TrainHeist['guardPeds'][k], 0)
        SetPedRandomProps(TrainHeist['guardPeds'][k])
        SetEntityAsMissionEntity(TrainHeist['guardPeds'][k])
        SetEntityVisible(TrainHeist['guardPeds'][k], true)
        SetPedRelationshipGroupHash(TrainHeist['guardPeds'][k], GetHashKey("GuardPeds"))
        SetPedAccuracy(TrainHeist['guardPeds'][k], 80)
        --SetPedArmour(TrainHeist['guardPeds'][k], 100)
        SetPedCanSwitchWeapon(TrainHeist['guardPeds'][k], true)
        SetPedDropsWeaponsWhenDead(TrainHeist['guardPeds'][k], false)
		SetPedFleeAttributes(TrainHeist['guardPeds'][k], 0, false)
        GiveWeaponToPed(TrainHeist['guardPeds'][k], GetHashKey('WEAPON_CARBINERIFLE_MK2'), 255, false, false)
        SetPedCanRagdoll(TrainHeist['guardPeds'][k], false)
        SetPedSuffersCriticalHits(TrainHeist['guardPeds'][k], false)
        local random = math.random(1, 2)
        if random == 2 then
            TaskGuardCurrentPosition(TrainHeist['guardPeds'][k], 10.0, 10.0, 1)
        end
    end

    SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
end

local function SetupTrain()
    loadModel('freight')
    loadModel('freightcar')
    loadModel('tr_prop_tr_container_01a')
    loadModel('prop_ld_container')
    loadModel('tr_prop_tr_lock_01a')
    loadModel('xm_prop_lab_desk_02')
    mainTrain = CreateVehicle(GetHashKey('freight'), Shared['TrainHeist']['setupTrain']['pos'], Shared['TrainHeist']['setupTrain']['heading'], 1, 0)
    trainPart = CreateVehicle(GetHashKey('freightcar'), Shared['TrainHeist']['setupTrain']['part'], Shared['TrainHeist']['setupTrain']['heading'], 1, 0)
    FreezeEntityPosition(mainTrain, true)
    FreezeEntityPosition(trainPart, true)
    for k, v in pairs(Shared['TrainHeist']['setupTrain']['containers']) do
        TrainHeist['containers'][k] = CreateObject(GetHashKey('tr_prop_tr_container_01a'), v['pos'], 1, 1, 0)
        SetEntityHeading(TrainHeist['containers'][k], v['heading'])
        FreezeEntityPosition(TrainHeist['containers'][k], true)
        Wait(math.random(100, 500))
        TrainHeist['collisions'][k] = CreateObject(GetHashKey('prop_ld_container'), v['pos'], 1, 1, 0)
        SetEntityHeading(TrainHeist['collisions'][k], v['heading'])
        SetEntityVisible(TrainHeist['collisions'][k], false)
        FreezeEntityPosition(TrainHeist['collisions'][k], true)
        Wait(math.random(100, 500))
        TrainHeist['locks'][k] = CreateObject(GetHashKey('tr_prop_tr_lock_01a'), v['lock']['pos'], 1, 1, 0)
        SetEntityHeading(TrainHeist['locks'][k], v['heading'])
        TrainHeist['desks'][k] = CreateObject(GetHashKey('xm_prop_lab_desk_02'), v['table'], 1, 1, 0)
        SetEntityHeading(TrainHeist['desks'][k], v['heading'])
        Wait(math.random(1000, 2000))
    end
    for k, v in pairs(Shared['TrainHeist']['setupTrain']['containers']) do
        local tableattachments = 0
        for x, y in pairs(v['attachments']) do
            if math.random(1,2) == 1 and tableattachments < Shared['TrainHeist']['MaxAttachmentsOnTable'] then
                tableattachments = tableattachments + 1
                local model = Shared['TrainHeist']['AttachmentModels'][math.random(1, #Shared['TrainHeist']['AttachmentModels'])]
                loadModel(model) -- y['object']
                TrainHeist['attachments'][k..x] = CreateObject(GetHashKey(model), y['pos'], 1, 1, 0)
                SetEntityRotation(TrainHeist['attachments'][k..x], y['rot'][1], y['rot'][2], y['rot'][3])
                if y['forcedrop'] then
                    ApplyForceToEntity(TrainHeist['attachments'][k..x])
                else
                    PlaceObjectOnGroundProperly(TrainHeist['attachments'][k..x])
                end
                Wait(250)
                local objCoords = GetEntityCoords(TrainHeist['attachments'][k..x])
                local objHeading = GetEntityHeading(TrainHeist['attachments'][k..x])
                local data = {
                    name = 'Trianloot'..k..x,
                    objCoords = objCoords,
                    objHeading = objHeading,
                    object = model,
                }
                TriggerServerEvent("trainheist:server:spawn:attachment", data)
            end
        end
    end
end

function StartTrainHeist()
    Framework.Functions.TriggerCallback('trainheist:server:get:cooldown', function(time)
        local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
        if haveGlobalCooldown then
            return
        end
        if time and CurrentCops >= Shared['TrainHeist']['requiredPoliceCount'] and #(GetEntityCoords(PlayerPedId()) - Shared['TrainHeist']['setupTrain']['pos']) >= 200.0 then
            TriggerServerEvent('trainheist:server:StartHeist')
            Framework.Functions.Notify("Тръгвай към GPS локацията. Избий пазачите, намери Merryweather контейнерите и събери нещата вътре.", 'info', 10000)
            ambushBlip = addBlip(Shared['TrainHeist']['setupTrain']['pos'], 570, 1, "GPS локация")
            repeat
                local ped = PlayerPedId()
                local pedCo = GetEntityCoords(ped)
                local dist = #(pedCo - Shared['TrainHeist']['setupTrain']['pos'])
                Wait(1)
            until dist <= 150.0
            SpawnGuards()
            SetupTrain()
            TriggerServerEvent('trainheist:server:trainLoop')
            policeNotify()
            TriggerServerEvent('nocore-police:ActivateCooldown', 2, "Обир на влак")
        else
            TriggerEvent("nocore-tilifon:client:train")
            Framework.Functions.Notify('Нещо се обърка, опитай отново по-късно.', 'error', 6000, 'Error')
        end
    end, true)
end

RegisterNetEvent('trainheist:client:trainLoop')
AddEventHandler('trainheist:client:trainLoop', function()
    trainLoop = true
    robber = false
    while trainLoop do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)

        if robber then
            local trainDist = #(pedCo - Shared['TrainHeist']['setupTrain']['pos'])
            if trainDist >= 50.0 then
                TriggerServerEvent('trainheist:server:resetHeist')
                FinishHeist()
                break
            end
        end

        if IsEntityDead(ped) then
            break
        end

        for k, v in pairs(Shared['TrainHeist']['setupTrain']['containers']) do
            local dist = #(pedCo - v['lock']['pos'])
            if dist <= 1.5 and not v['lock']['taken'] then
                ShowHelpNotification("Натисни ~INPUT_CONTEXT~ за да срежеш")
                if IsControlJustPressed(0, 38) then
                    if CurrentCops >= Shared['TrainHeist']['requiredPoliceCount'] then
                       OpenContainer(k) 
                    else
                        Framework.Functions.Notify("Май, вече няма куки", "info")
                    end
                end
            end
        end
        Wait(1)
    end
end)

function FinishHeist()
    RemoveBlip(ambushBlip)
    TriggerEvent('persistent-vehicles/forget-vehicle', mainTrain)
    TriggerEvent('persistent-vehicles/forget-vehicle', trainPart)
    DeleteVehicle(mainTrain)
    DeleteVehicle(trainPart)
    DeleteObject(TrainHeist['desks'][1])
    DeleteObject(TrainHeist['desks'][2])
    DeleteObject(TrainHeist['containers'][1])
    DeleteObject(TrainHeist['containers'][2])
    DeleteObject(TrainHeist['locks'][1])
    DeleteObject(TrainHeist['locks'][2])
    TriggerServerEvent('nocore-train:finish')
end

RegisterNetEvent('trainheist:client:resetHeist')
AddEventHandler('trainheist:client:resetHeist', function() 
    DeleteObject(clientContainer)
    DeleteObject(clientLock)
    DeleteObject(clientContainer2)
    DeleteObject(clientLock2)
    clientContainer, clientContainer2, clientLock, clientLock2 = nil, nil, nil, nil
    ClearArea(2885.97, 4560.83, 48.0551, 50.0)
    trainLoop = false
    RemoveBlip(ambushBlip)
    DeleteVehicle(mainTrain)
    DeleteVehicle(trainPart)
    DeleteObject(TrainHeist['desks'][1])
    DeleteObject(TrainHeist['desks'][2])
    DeleteObject(TrainHeist['containers'][1])
    DeleteObject(TrainHeist['containers'][2])
    DeleteObject(TrainHeist['locks'][1])
    DeleteObject(TrainHeist['locks'][2])
    TriggerServerEvent('nocore-train:finish')
end)


function OpenContainer(index)
    Framework.Functions.TriggerCallback('trainheist:server:usedrill', function(hasItem)
        if hasItem then
            exports["memorygame"]:thermiteminigame(10, 3, 3, 10,
            function()-- success
                local ped = PlayerPedId()
                local pedCo = GetEntityCoords(ped)
                local pedRotation = GetEntityRotation(ped)
                local animDict = 'anim@scripted@player@mission@tunf_train_ig1_container_p1@male@'
                loadAnimDict(animDict)
                loadPtfxAsset('scr_tn_tr')
                TriggerServerEvent('trainheist:server:lockSync', index)
                
                for i = 1, #TrainAnimation['objects'] do
                    loadModel(TrainAnimation['objects'][i])
                    TrainAnimation['sceneObjects'][i] = CreateObject(GetHashKey(TrainAnimation['objects'][i]), pedCo, 1, 1, 0)
                end

                sceneObject = GetClosestObjectOfType(pedCo, 2.5, GetHashKey('tr_prop_tr_container_01a'), 0, 0, 0)
                lockObject = GetClosestObjectOfType(pedCo, 2.5, GetHashKey('tr_prop_tr_lock_01a'), 0, 0, 0)
                NetworkRegisterEntityAsNetworked(sceneObject)
                NetworkRegisterEntityAsNetworked(lockObject)

                scene = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1065353216)

                NetworkAddPedToSynchronisedScene(ped, scene, animDict, TrainAnimation['animations'][1][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
                NetworkAddEntityToSynchronisedScene(sceneObject, scene, animDict, TrainAnimation['animations'][1][2], 1.0, -1.0, 1148846080)
                NetworkAddEntityToSynchronisedScene(lockObject, scene, animDict, TrainAnimation['animations'][1][3], 1.0, -1.0, 1148846080)
                NetworkAddEntityToSynchronisedScene(TrainAnimation['sceneObjects'][1], scene, animDict, TrainAnimation['animations'][1][4], 1.0, -1.0, 1148846080)
                NetworkAddEntityToSynchronisedScene(TrainAnimation['sceneObjects'][2], scene, animDict, TrainAnimation['animations'][1][5], 1.0, -1.0, 1148846080)

                SetEntityCoords(ped, GetEntityCoords(sceneObject))
                NetworkStartSynchronisedScene(scene)
                Wait(4000)
                UseParticleFxAssetNextCall('scr_tn_tr')
                sparks = StartParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", TrainAnimation['sceneObjects'][1], 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 1)
                Wait(1000)
                StopParticleFxLooped(sparks, 1)
                Wait(GetAnimDuration(animDict, 'action') * 1000 - 5000)
                TriggerServerEvent('trainheist:server:containerSync', GetEntityCoords(sceneObject), GetEntityRotation(sceneObject))
                TriggerServerEvent('trainheist:server:objectSync', NetworkGetNetworkIdFromEntity(sceneObject))
                TriggerServerEvent('trainheist:server:objectSync', NetworkGetNetworkIdFromEntity(lockObject))
                DeleteObject(TrainAnimation['sceneObjects'][1])
                DeleteObject(TrainAnimation['sceneObjects'][2])
                ClearPedTasks(ped)
            end,
            function()-- failure
                Framework.Functions.Notify("Не успяхте..", "error")
            end)
        else
            ShowNotification('Ще ти трябва: Флекс')
        end
    end)
end

function playerAnim()
	exports['nocore-assets']:RequestAnimationDict( "pickup_object" )
    TaskPlayAnim( PlayerPedId(), "pickup_object", "putdown_low", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

RegisterNetEvent('trainheist:client:spawn:attachment')
AddEventHandler('trainheist:client:spawn:attachment', function(data)
    exports['nocore-eye']:AddBoxZone(data.name, vector3(data.objCoords.x, data.objCoords.y, data.objCoords.z), 0.2, 0.2, {
        name = data.name,
        heading = data.objHeading,
        debugPoly = false,
        minZ = data.objCoords.z - 0.2,
        maxZ = data.objCoords.z + 0.2
    }, {
        options = {
          {
            event = "trainheist:client:get:attachment",
            icon = "fas fa-handshake",
            object = data.object,
            name = data.name,
            objCoords = data.objCoords,
            objHeading = data.objHeading,
            label = "Вземи"
          }
        },
        distance = 2.5
    })
end)


RegisterNetEvent('trainheist:client:get:attachment')
AddEventHandler('trainheist:client:get:attachment', function(data)
    local Data = data
    TriggerServerEvent('trainheist:server:remove:attachment', data.name)
    playerAnim()
    Framework.Functions.Progressbar('pickup', 'Взимате предмета..', math.random(1000, 3000), false, false, {
     disableMovement = true,
     disableCarMovement = true,
     disableMouse = false,
     disableCombat = true,
     disableInventory = true,
    }, {}, {}, {}, function() -- Done
        local entity = GetClosestObjectOfType(data.objCoords.x, data.objCoords.y, data.objCoords.z, 1.0, GetHashKey(data.object))
        if entity == 0 then print('Prop does not exist') return end
        Framework.Functions.TriggerCallback('trainheist:server:GetRreward', function(cb)
            if cb then
                NetworkRequestControlOfEntity(entity)
                while not NetworkHasControlOfEntity(entity) do Citizen.Wait(1) end
                DeleteEntity(entity)
                robber = true
            else
                TriggerServerEvent("trainheist:server:spawn:attachment", Data)
                Framework.Functions.Notify('Нямате достатъчно място.', 'error', 5000, 'Error')
            end
        end, data.object)
    end, function() -- Cancel
    end)
end)

RegisterNetEvent('trainheist:client:remove:attachment')
AddEventHandler('trainheist:client:remove:attachment', function(name)
    exports['nocore-eye']:RemoveZone(name)
end)

RegisterNetEvent('trainheist:client:lockSync')
AddEventHandler('trainheist:client:lockSync', function(index)
    Shared['TrainHeist']['setupTrain']['containers'][index]['lock']['taken'] = not Shared['TrainHeist']['setupTrain']['containers'][index]['lock']['taken']
end)

RegisterNetEvent('trainheist:client:objectSync')
AddEventHandler('trainheist:client:objectSync', function(e)
    local entity = NetworkGetEntityFromNetworkId(e)
    DeleteEntity(entity)
    DeleteObject(entity)
end)

RegisterNetEvent('trainheist:client:containerSync')
AddEventHandler('trainheist:client:containerSync', function(coords, rotation)
    animDict = 'anim@scripted@player@mission@tunf_train_ig1_container_p1@male@'
    exports['nocore-assets']:RequestAnimationDict(animDict)

    if clientContainer and clientLock then
        clientContainer2 = CreateObject(GetHashKey('tr_prop_tr_container_01a'), coords, 0, 0, 0)
        clientLock2 = CreateObject(GetHashKey('tr_prop_tr_lock_01a'), coords, 0, 0, 0)
        
        clientScene = CreateSynchronizedScene(coords, rotation, 2, true, false, 1065353216, 0, 1065353216)
        PlaySynchronizedEntityAnim(clientContainer2, clientScene, TrainAnimation['animations'][1][2], animDict, 1.0, -1.0, 0, 1148846080)
        ForceEntityAiAndAnimationUpdate(clientContainer2)
        PlaySynchronizedEntityAnim(clientLock2, clientScene, TrainAnimation['animations'][1][3], animDict, 1.0, -1.0, 0, 1148846080)
        ForceEntityAiAndAnimationUpdate(clientLock2)

        SetSynchronizedScenePhase(clientScene, 0.99)
        SetEntityCollision(clientContainer2, false, true)
        FreezeEntityPosition(clientContainer2, true)
    else
        clientContainer = CreateObject(GetHashKey('tr_prop_tr_container_01a'), coords, 0, 0, 0)
        clientLock = CreateObject(GetHashKey('tr_prop_tr_lock_01a'), coords, 0, 0, 0)
        
        clientScene = CreateSynchronizedScene(coords, rotation, 2, true, false, 1065353216, 0, 1065353216)
        PlaySynchronizedEntityAnim(clientContainer, clientScene, TrainAnimation['animations'][1][2], animDict, 1.0, -1.0, 0, 1148846080)
        ForceEntityAiAndAnimationUpdate(clientContainer)
        PlaySynchronizedEntityAnim(clientLock, clientScene, TrainAnimation['animations'][1][3], animDict, 1.0, -1.0, 0, 1148846080)
        ForceEntityAiAndAnimationUpdate(clientLock)

        SetSynchronizedScenePhase(clientScene, 0.99)
        SetEntityCollision(clientContainer, false, true)
        FreezeEntityPosition(clientContainer, true)
    end
end)

function addBlip(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end

function loadPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        RequestNamedPtfxAsset(dict)
        Citizen.Wait(50)
	end
end

function loadModel(model)
    if type(model) ~= 'number' then
        model = GetHashKey(model)
    end
    
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end

RegisterNetEvent('trainheist:client:showNotification')
AddEventHandler('trainheist:client:showNotification', function(str)
    ShowNotification(str)
end)

--Thanks to d0p3t
function PlayCutscene(cut, coords)
    while not HasThisCutsceneLoaded(cut) do 
        RequestCutscene(cut, 8)
        Wait(0) 
    end
    CreateCutscene(false, coords)
    Finish(coords)
    RemoveCutscene()
    DoScreenFadeIn(500)
end

function CreateCutscene(change, coords)
    local ped = PlayerPedId()
        
    local clone = ClonePedEx(ped, 0.0, false, true, 1)
    local clone2 = ClonePedEx(ped, 0.0, false, true, 1)
    local clone3 = ClonePedEx(ped, 0.0, false, true, 1)
    local clone4 = ClonePedEx(ped, 0.0, false, true, 1)
    local clone5 = ClonePedEx(ped, 0.0, false, true, 1)

    SetBlockingOfNonTemporaryEvents(clone, true)
    SetEntityVisible(clone, false, false)
    SetEntityInvincible(clone, true)
    SetEntityCollision(clone, false, false)
    FreezeEntityPosition(clone, true)
    SetPedHelmet(clone, false)
    RemovePedHelmet(clone, true)
    
    if change then
        SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
        RegisterEntityForCutscene(ped, 'MP_2', 0, GetEntityModel(ped), 64)
        
        SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
        RegisterEntityForCutscene(clone2, 'MP_1', 0, GetEntityModel(clone2), 64)
    else
        SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
        RegisterEntityForCutscene(ped, 'MP_1', 0, GetEntityModel(ped), 64)

        SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
        RegisterEntityForCutscene(clone2, 'MP_2', 0, GetEntityModel(clone2), 64)
    end

    SetCutsceneEntityStreamingFlags('MP_3', 0, 1)
    RegisterEntityForCutscene(clone3, 'MP_3', 0, GetEntityModel(clone3), 64)
    
    SetCutsceneEntityStreamingFlags('MP_4', 0, 1)
    RegisterEntityForCutscene(clone4, 'MP_4', 0, GetEntityModel(clone4), 64)
    
    SetCutsceneEntityStreamingFlags('MP_5', 0, 1)
    RegisterEntityForCutscene(clone5, 'MP_5', 0, GetEntityModel(clone5), 64)
    
    Wait(10)
    if coords then
        StartCutsceneAtCoords(coords, 0)
    else
        StartCutscene(0)
    end
    Wait(10)
    ClonePedToTarget(clone, ped)
    Wait(10)
    DeleteEntity(clone)
    DeleteEntity(clone2)
    DeleteEntity(clone3)
    DeleteEntity(clone4)
    DeleteEntity(clone5)
    Wait(50)
    DoScreenFadeIn(250)
end

function Finish(coords)
    if coords then
        local tripped = false
        repeat
            Wait(0)
            if (timer and (GetCutsceneTime() > timer))then
                DoScreenFadeOut(250)
                tripped = true
            end
            if (GetCutsceneTotalDuration() - GetCutsceneTime() <= 250) then
            DoScreenFadeOut(250)
            tripped = true
            end
        until not IsCutscenePlaying()
        if (not tripped) then
            DoScreenFadeOut(100)
            Wait(150)
        end
        return
    else
        Wait(18500)
        StopCutsceneImmediately()
    end
end

function IsAbleToStartTrainHeist()
    local IsAbleToStart = nil
    if CurrentCops >= Shared['TrainHeist']['requiredPoliceCount'] then
        Framework.Functions.TriggerCallback('trainheist:server:get:cooldown', function(cb)
            IsAbleToStart = cb
        end)
        IsAbleToStart = not exports['nocore-police']:checkGlobalCooldown(2)
    else
        IsAbleToStart = false
    end
    while IsAbleToStart == nil do Wait(0) end
    return IsAbleToStart
end

exports("IsAbleToStartTrainHeist", IsAbleToStartTrainHeist)

AddEventHandler('onResourceStop', function (resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('persistent-vehicles/forget-vehicle', mainTrain)
        TriggerEvent('persistent-vehicles/forget-vehicle', trainPart)
        DeleteVehicle(mainTrain)
        DeleteVehicle(trainPart)
        ClearArea(2885.97, 4560.83, 48.0551, 50.0)
    end
end)

CreateThread(function()
    exports['nocore-eye']:AddBoxZone("TrainKod4", vector3(2943.6, 4627.21, 48.72), 0.55, 0.4, {
        name="TrainKod4",
        heading=46,
        debugPoly=false,
        minZ=48.67,
        maxZ=49.67
    }, {
        options = { {
            type = "server",
            event = "trainheist:server:resetHeist",
            icon = "fas fa-dot-circle",
            label = "Обяви код 4",
            job = 'police'
        }, },
        distance = 1.5
    })
end)