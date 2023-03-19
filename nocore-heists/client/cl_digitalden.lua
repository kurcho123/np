local Framework = exports['no-core']:GetCoreObject()
local robberyAlert = false
local smashing = false
local Targets = {}

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

CreateThread(function()
    for k, v in pairs(Shared["DigitalDen"].Locations) do
        Targets["DigitalDen-" ..k] = exports['nocore-eye']:AddBoxZone(v.pzname, v.coords, 0.8, 1.7, {
            name = v.pzname,
            heading = v.heading,
            debugPoly = false,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 1
        }, {
            options = {{
                icon = "fas fa-money-bill-1",
                label = "Обери",
                canInteract = function()
                    return IsPedArmed(PlayerPedId(), 1) and not Shared["DigitalDen"].Locations[k].isBusy and not Shared["DigitalDen"].Locations[k].isOpened
                end,
                action = function()
                    if CurrentCadets >= 4 then
                        if not robberyAlert then
                            TriggerEvent('nocore-dispatch:alerts:digitaldenrobbery')
                            robberyAlert = true
                        end
                        smashVitrine(k) 
                    else
                        Framework.Functions.Notify("Няма достатъчно куки", "error")
                    end
                end
            }},
            distance = 1.2
        })
    end
end)

local function loadParticle()
    if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
        RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
        Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(3)
    end
end

function smashVitrine(k)
    local animDict = "missheist_jewel"
    local animName = "smash_case"
    local ped = PlayerPedId()
    local Skillbar = exports['nocore-skillbar']:GetSkillbarObject()
    local NeededAttempts = 2
    local SucceededAttempts = 0
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)

    smashing = true

    if not Framework.Functions.IsWearingHandshoes(ped) and (math.random(1, 10) > 8) then
        TriggerServerEvent('nocore-police:server:CreateBloodDrop', GetEntityCoords(ped))
        Framework.Functions.Notify('Порязахте се на съклото и пуснахте кръв', 'error', 4500)
    end

    setVitrineState("isBusy", true, k)

    Skillbar.Start({
        duration = math.random(1500, 3000),
        pos = math.random(10, 30),
        width = math.random(10, 20)
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            -- Finish
            Framework.Functions.Progressbar("smash_vitrine", "Разбиване..", math.random(8000,12000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function() -- Done
        
                Skillbar.Start({
                    duration = math.random(1500, 3000),
                    pos = math.random(10, 30),
                    width = math.random(10, 20)
                }, function()
                    if SucceededAttempts + 1 >= NeededAttempts then
                        -- Finish
                        setVitrineState("isBusy", false, k)
                        Framework.Functions.TriggerCallback('nocore-digitalden:vitrineReward', function() end, Shared["DigitalDen"].Locations[k].Rewards, k)
                        Framework.Functions.TriggerCallback('nocore-digitalden:server:setTimeout', function() end)
        
                        TaskPlayAnim(ped, animDict, "exit", 0.5, 0.5, -1, 2, 0, 0, 0, 0)
                        smashing = false
                    else
                        -- Repeat
                        Skillbar.Repeat({
                            duration = math.random(500, 1250),
                            pos = math.random(10, 40),
                            width = math.random(8, 13)
                        })
                        SucceededAttempts = SucceededAttempts + 1
                    end
                end, function()
                    -- Fail
                    setVitrineState("isBusy", false, k)
        
                    TaskPlayAnim(ped, animDict, "exit", 0.5, 0.5, -1, 2, 0, 0, 0, 0)
                    smashing = false
                end)
            end, function() -- Cancel
                setVitrineState("isBusy", false, k)
        
                TaskPlayAnim(ped, animDict, "exit", 0.5, 0.5, -1, 2, 0, 0, 0, 0)
                smashing = false
            end)
        else
            -- Repeat
            Skillbar.Repeat({
                duration = math.random(500, 1250),
                pos = math.random(10, 40),
                width = math.random(8, 13)
            })
            SucceededAttempts = SucceededAttempts + 1
        end
    end, function()
        -- Fail
        setVitrineState("isBusy", false, k)

        TaskPlayAnim(ped, animDict, "exit", 0.5, 0.5, -1, 2, 0, 0, 0, 0)
        smashing = false
    end)

    

    Citizen.CreateThread(function()
        while smashing do
            loadAnimDict(animDict)
            TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0)
            Citizen.Wait(500)
            TriggerServerEvent("nocore-sound:server:play:source", "breaking_vitrine_glass", 0.25)
            TriggerServerEvent('nocore-sound:server:play:distance', 5.0, "breaking_vitrine_glass", 0.25)
            loadParticle()
            StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
            Citizen.Wait(2500)
        end
    end)
end

-- Events

RegisterNetEvent('nocore-digitalden:client:setVitrineState')
AddEventHandler('nocore-digitalden:client:setVitrineState', function(stateType, state, k)
    Shared["DigitalDen"].Locations[k][stateType] = state
end)

RegisterNetEvent('nocore-digitalden:client:setAlertState')
AddEventHandler('nocore-digitalden:client:setAlertState', function(bool)
    robberyAlert = bool
end)

function setVitrineState(stateType, state, k)
    Framework.Functions.TriggerCallback('nocore-digitalden:server:setVitrineState', function(result)
    end, stateType, state, k)
end

CreateThread(function()
    Dealer = AddBlipForCoord(vector3(1133.814, -470.2375, 66.483787))

    SetBlipSprite(Dealer, 617)
    SetBlipDisplay(Dealer, 4)
    SetBlipScale(Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("DigitalDen")
    EndTextCommandSetBlipName(Dealer)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
      for k, v in pairs(Targets) do
        exports['nocore-eye']:RemoveZone(k)
      end
    end
end)
