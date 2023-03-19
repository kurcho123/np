local Framework = exports['no-core']:GetCoreObject()
local plyCoords = GetEntityCoords(PlayerPedId())
local Object = {}

-- // BASIC
local InUse = false
local IsTextInUse = false
local PlyLastPos = 0

-- // ANIMATION
local Anim = 'sit'

RegisterNetEvent('ChairBedSystem:Client:Lay')
AddEventHandler('ChairBedSystem:Client:Lay', function(data)
    local Entity = data.entity
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    local objectCoords = GetEntityCoords(Entity)
    if #(objectCoords - plyCoords) < 2 and not InUse then
        Anim = data.anim
        local element = Config.objects.locations[GetEntityModel(Entity)]
        Object = {
            fObject = Entity,
            fObjectCoords = objectCoords,
            fObjectcX = element.verticalOffsetX,
            fObjectcY = element.verticalOffsetY,
            fObjectcZ = element.verticalOffsetZ,
            fObjectDir = element.direction
        }
        TriggerServerEvent('ChairBedSystem:Server:Enter', Object, Object.fObjectCoords) 
    end
end)

RegisterNetEvent('ChairBedSystem:Client:Animation')
AddEventHandler('ChairBedSystem:Client:Animation', function(v, coords)
    local object = v.fObject
    local vertx = v.fObjectcX
    local verty = v.fObjectcY
    local vertz = v.fObjectcZ
    local dir = v.fObjectDir
    local objectcoords = coords
    
    local ped = PlayerPedId()
    PlyLastPos = GetEntityCoords(ped)
    FreezeEntityPosition(object, true)
    FreezeEntityPosition(ped, true)
    InUse = true

    if Anim == 'back' then
        if Config.objects.BedBackAnimation.dict ~= nil then
            SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.objects.BedBackAnimation.dict
            local anim = Config.objects.BedBackAnimation.anim
            
            Animation(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.objects.BedBackAnimation.anim, objectcoords.x + vertx, objectcoords.y + verty, objectcoords.z - vertz, GetEntityHeading(object) + dir, 0, true, true
        )
        end
    elseif Anim == 'stomach' then
        if Config.objects.BedStomachAnimation.dict ~= nil then
            SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.objects.BedStomachAnimation.dict
            local anim = Config.objects.BedStomachAnimation.anim
            
            Animation(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.objects.BedStomachAnimation.anim, objectcoords.x + vertx, objectcoords.y + verty, objectcoords.z - vertz, GetEntityHeading(object) + dir, 0, true, true)
        end
    elseif Anim == 'sit' then
        if Config.objects.BedSitAnimation.dict ~= nil then
            SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.objects.BedSitAnimation.dict
            local anim = Config.objects.BedSitAnimation.anim
            
            Animation(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.objects.BedSitAnimation.anim, objectcoords.x + vertx, objectcoords.y + verty, objectcoords.z - vertz, GetEntityHeading(object) + 180.0, 0, true, true)
        end
    end
    
    Framework.Functions.Notify("Натисни [F], за да станеш!", "info", 10000, 'Как да станеш?')

    CreateThread(function()
        while InUse do
            Wait(Config.Healing * 1000)
            local ply = PlayerPedId()
            local health = GetEntityHealth(ply)
            if health <= 199 then
                SetEntityHealth(ply, health + 1)
            end
        end
    end)
end)

function Animation(dict, anim, ped)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    
    TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 1, 0, 0, 0, 0)
end


RegisterCommand('standupbed', function()
    if not InUse then return end
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    InUse = false
    TriggerServerEvent('ChairBedSystem:Server:Leave', Object.fObjectCoords)
    ClearPedTasksImmediately(ply)
    FreezeEntityPosition(ply, false)
    
    if #(PlyLastPos - plyCoords) < 10 then
        SetEntityCoords(ply, PlyLastPos)
    end
end, false)

RegisterKeyMapping('standupbed', 'Stand up of bed', 'keyboard', 'F')

TriggerEvent('chat:removeSuggestion', '/standupbed')