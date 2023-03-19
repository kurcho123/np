local Framework = exports['no-core']:GetCoreObject()
local ArtHeist = {
    ['cuting'] = false,
    ['inMission'] = false,
    ['cut'] = 0,
    ['objects'] = {},
    ['scenes'] = {},
    ['painting'] = {}
}

local function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function policeAlert()
    local SendData = {
        dispatchCode = "10-90H",
        dispatchMessage = "Обир на VIP имот",
        firstStreet = Framework.Functions.GetStreetLabel(),
       -- heading = getCardinalDirectionFromHeading(),
        priority = 2, -- Priority
        origin = {
            x = 1398.1761,
            y = 1147.1656,
            z = 114.33356
        },
        randomizeBlipLocation = true, -- Randomize Blip Location
        job = {"police", "swat"},
        BlipData = {
            sprite = 96,
            color = 17,
            scale = 1.0,
            shortrange = false,
            time = 60,
        },
        ZoneData = {
            color = 67,
            time = 60,
            radius = 55,
        }
    }
    TriggerServerEvent("erp-dispatch:sendAlert", SendData)
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local sleep = 1000

        if ArtHeist['inMission'] then
            for k, v in pairs(Shared['ArtHeist']['robs']) do
                local dist = #(pedCo - v['scenePos2'])
                if dist <= 1.0 then
                    sleep = 1
                    if not v['taken'] then
                        ShowHelpNotification("~INPUT_CONTEXT~ Претърси")

                        if IsControlJustPressed(0, 38) then
                            if not Framework.Functions.IsWearingHandshoes(ped) and (math.random(1, 10) > 8) then
                                TriggerServerEvent("nocore-police:server:CreateFingerDrop", pedCo)
                            end
                            TriggerServerEvent('artheist:server:syncrobs', k, true)
                            Framework.Functions.Progressbar("freezen", "Претърсваш..", 11000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                                disableInventory = true,
                            }, {
                                animDict = "missexile3",
                                anim = "ex03_dingy_search_case_a_michael",
                                flags = 0,
                            }, {}, {}, function() -- Done                                
                                StopAnimTask(ped, "missexile3", "ex03_dingy_search_case_a_michael", 1.0)
                                Framework.Functions.TriggerCallback('nocore-art:housedrop')
                            end, function() -- Cancel
                                StopAnimTask(ped, "missexile3", "ex03_dingy_search_case_a_michael", 1.0)
                                Framework.Functions.Notify("Отказано...", "error")
                            end, 'fa-solid fa-sack-dollar')
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local sleep = 1000

        if ArtHeist['inMission'] then
            for k, v in pairs(Shared['ArtHeist']['painting']) do
                local dist = #(pedCo - v['scenePos'])
                if dist <= 1.0 then
                    sleep = 1
                    if not v['taken'] then
                        ShowHelpNotification('Натисни ~INPUT_CONTEXT~, за да вземеш картината')
                        if IsControlJustPressed(0, 38) then
                            local weapon = GetSelectedPedWeapon(ped)
                            if weapon == `WEAPON_SWITCHBLADE` then
                                if not ArtHeist['cuting'] then
                                    HeistAnimation(k)
                                else
                                    Framework.Functions.Notify('Вече срязваш', 'error')
                                end
                            else
                                Framework.Functions.Notify('Трябва да имаш switchblade в ръката си!')
                            end
                        end
                    else
                        ShowHelpNotification("Картината е срязана")
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('artheist:client:syncrobs')
AddEventHandler('artheist:client:syncrobs', function(x, bool)
    Shared['ArtHeist']['robs'][x]['taken'] = bool
end)

RegisterNetEvent('artheist:client:syncPaintings')
AddEventHandler('artheist:client:syncPaintings', function(x, bool)
    Shared['ArtHeist']['painting'][x]['taken'] = bool
end)

RegisterNetEvent('artheist:client:syncAllPainting')
AddEventHandler('artheist:client:syncAllPainting', function(x)
    for k, v in pairs(Shared['ArtHeist']['painting']) do
        v['taken'] = false
    end
end)

local function StartHeist()
    if ArtHeist['inMission'] then Framework.Functions.Notify('Вече си започнал') return end

    local paintingList = {}
    for k, v in pairs(Shared['ArtHeist']['painting']) do
        paintingList[#paintingList+1] = {
            v['object']
        }
    end
    Wait(3000)
    ArtHeist['inMission'] = true
    Framework.Functions.Notify('Влез в имението и започвай да обираш!')
    repeat
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local dist = #(pedCo - Shared['ArtHeist']['painting'][1]['scenePos'])
        Wait(1)
    until dist <= 100.0
    for k, v in pairs(Shared['ArtHeist']['painting']) do
        exports['nocore-assets']:RequestModelHash(v['object'])
        ArtHeist['painting'][k] = CreateObjectNoOffset(joaat(v['object']), v['objectPos'], 1, 1, 0)
        SetEntityRotation(ArtHeist['painting'][k], 0, 0, v['objHeading'], 2, true)
    end
    exports['nocore-eye']:AddBoxZone("ArtHeistVault", vector3(1397.12, 1162.02, 114.37), 0.7, 0.2, {
        name = "ArtHeistVault",
        heading = 0,
        debugPoly = Shared.Debug,
        minZ=114.37,
        maxZ=115.57
    },{
        options =
        {
            {
                event = "nocore-heists:ArtHeist:openVault",
                icon = 'fa-solid fa-vault',
                label = 'Разбий сейфа',
            },
        },
        distance = 1.5
    })
end

function HeistAnimation(sceneId)
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
    local scenes = {false, false, false, false}
    local animDict = "anim_heist@hs3f@ig11_steal_painting@male@"
    local scene = Shared['ArtHeist']['painting'][sceneId]
    TriggerServerEvent('artheist:server:syncPaintings', sceneId, true)
    exports['nocore-assets']:RequestAnimationDict(animDict)

    for k, v in pairs(Shared['ArtHeist']['objects']) do
        exports['nocore-assets']:RequestModelHash(v)
        ArtHeist['objects'][k] = CreateObject(joaat(v), pedCo, 1, 1, 0)
    end

    ArtHeist['objects'][3] = ArtHeist['painting'][sceneId]

    for i = 1, 10 do
        ArtHeist['scenes'][i] = NetworkCreateSynchronisedScene(scene['scenePos']['x'], scene['scenePos']['y'], scene['scenePos']['z'], scene['sceneRot'], 2, true, false, 1065353216, 0, 1065353216)
        NetworkAddPedToSynchronisedScene(ped, ArtHeist['scenes'][i], animDict, 'ver_01_'..Shared['ArtHeist']['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(ArtHeist['objects'][3], ArtHeist['scenes'][i], animDict, 'ver_01_'..Shared['ArtHeist']['animations'][i][3], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(ArtHeist['objects'][1], ArtHeist['scenes'][i], animDict, 'ver_01_'..Shared['ArtHeist']['animations'][i][4], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(ArtHeist['objects'][2], ArtHeist['scenes'][i], animDict, 'ver_01_'..Shared['ArtHeist']['animations'][i][5], 1.0, -1.0, 1148846080)
    end

    cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, 0, 3000, 1, 0)

    ArtHeist['cuting'] = true
    FreezeEntityPosition(ped, true)
    NetworkStartSynchronisedScene(ArtHeist['scenes'][1])
    PlayCamAnim(cam, 'ver_01_top_left_enter_cam_ble', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(ArtHeist['scenes'][2])
    PlayCamAnim(cam, 'ver_01_cutting_top_left_idle_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    repeat
        ShowHelpNotification('Натисни ~INPUT_CONTEXT~, за да срежеш надясно')
        if IsControlJustPressed(0, 38) then
            scenes[1] = true
        end
        Wait(1)
    until scenes[1] == true
    NetworkStartSynchronisedScene(ArtHeist['scenes'][3])
    PlayCamAnim(cam, 'ver_01_cutting_top_left_to_right_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(ArtHeist['scenes'][4])
    PlayCamAnim(cam, 'ver_01_cutting_top_right_idle_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    repeat
        ShowHelpNotification('Натисни ~INPUT_CONTEXT~, за да срежеш надолу')
        if IsControlJustPressed(0, 38) then
            scenes[2] = true
        end
        Wait(1)
    until scenes[2] == true
    NetworkStartSynchronisedScene(ArtHeist['scenes'][5])
    PlayCamAnim(cam, 'ver_01_cutting_right_top_to_bottom_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(ArtHeist['scenes'][6])
    PlayCamAnim(cam, 'ver_01_cutting_bottom_right_idle_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    repeat
        ShowHelpNotification('Натисни ~INPUT_CONTEXT~, за да срежеш наляво')
        if IsControlJustPressed(0, 38) then
            scenes[3] = true
        end
        Wait(1)
    until scenes[3] == true
    NetworkStartSynchronisedScene(ArtHeist['scenes'][7])
    PlayCamAnim(cam, 'ver_01_cutting_bottom_right_to_left_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    Wait(3000)
    repeat
        ShowHelpNotification('Натисни ~INPUT_CONTEXT~, за да срежеш надолу')
        if IsControlJustPressed(0, 38) then
            scenes[4] = true
        end
        Wait(1)
    until scenes[4] == true
    NetworkStartSynchronisedScene(ArtHeist['scenes'][9])
    PlayCamAnim(cam, 'ver_01_cutting_left_top_to_bottom_cam', animDict, scene['scenePos'], scene['sceneRot'], 0, 2)
    Wait(1500)
    NetworkStartSynchronisedScene(ArtHeist['scenes'][10])
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    Wait(7500)
    Framework.Functions.TriggerCallback('nocore-heists:ArtHeist:rewardItem', function(func)
    end, false, scene)
    ClearPedTasks(ped)
	FreezeEntityPosition(ped, false)
    RemoveAnimDict(animDict)
    for k, v in pairs(ArtHeist['objects']) do
        DeleteObject(v)
    end
    DeleteObject(ArtHeist['painting'][sceneId])
    ArtHeist['objects'] = {}
    ArtHeist['scenes'] = {}
    ArtHeist['cuting'] = false
    ArtHeist['cut'] = ArtHeist['cut'] + 1
    scenes = {false, false, false, false}
    if ArtHeist['cut'] == #Shared['ArtHeist']['painting'] then
        TriggerServerEvent('artheist:server:syncAllPainting')
        RemoveBlip(stealBlip)
        ArtHeist['cut'] = 0
    end
end


local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

CreateThread(function()
    exports['nocore-eye']:AddBoxZone("ArtHeist", vector3(1392.9559, 1127.9041, 114.33437), 1, 5, {
        name = "ArtHeist",
        heading = 180,
        debugPoly = Shared.Debug,
        minZ = 113.5,
        maxZ = 125
    },{
        options =
        {
            {
                event = "nocore-storages:openstorageart",
                id = "arth",
                icon = 'fas fa-hand-paper',
                label = 'Отключи Таблото',
            },
            {
                type = 'server',
                event = "nocore-heists:artheist:kod4",
                icon = 'fas fa-hand-paper',
                label = 'Код 4',
                job = 'police'
            },
        },
        distance = 1.5
    })
    
end)

local currentFires = {}

local function doFire()
    local coords = GetEntityCoords(PlayerPedId())
    local maxChildren = 5
    local isGasFire = false
    local isBig = false
    local k = math.random(10, 15)
    
    for i = 1, k, 1 do
        TriggerServerEvent("thermite:StartServerFire", coords, maxChildren, isGasFire, isBig)
    end
    for i = 518, 507, -1 do
        TriggerServerEvent('nui_doorlock:updateState', i, false, nil, true)
        Wait(1500)
    end
    Wait(45 * 1000)
    TriggerServerEvent("thermite:StopFires")
end

AddEventHandler('artheist:client:password', function()
    if not ArtHeist['inMission'] then
        policeAlert()
        StartHeist()
        doFire()
    end
end)

RegisterNetEvent('nocore-storages:openstorageart', function()
    local input = lib.inputDialog('Електрическа кутия', {
        { type = "input", label = "Password", password = true, icon = 'lock' },
    })
    local hasItems = Framework.Functions.HasItem({
        ['explosive_lv1'] = 1,
        ['arthbp'] = 1,
    })
    if not input then
        return
    end
    if tostring(input[1]) ~= "Abandon all hope, ye who enter here." then
        Framework.Functions.Notify('Въведохте грешен пин код', 'error')
        return
    end
    local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
    if haveGlobalCooldown then
        return
    end
    if CurrentCops < 6 then
        Framework.Functions.Notify("Няма куки", "error", 7000)
        return
    end
    if ArtHeist['inMission'] then
        Framework.Functions.Notify("Не ти ли стига един път да го гръмнеш?", "error", 7000)
        return
    end
    if not hasItems then
        Framework.Functions.Notify('Нещо ти липсва', 'error')
        return
    end
    TriggerServerEvent('nocore-heists:ArtHeist:removeBomb')
    Framework.Functions.Notify('Обърка нещо по жичките, по-добре бягай', 'info', 10000)
    TriggerServerEvent('nocore-police:ActivateCooldown', 2, "Art Heist")
    Wait(15000)
    TriggerEvent('artheist:client:password')
end)

AddEventHandler('nocore-heists:ArtHeist:openVault', function()
    local hasLockpick = Framework.Functions.HasItem('advancedlockpick')
    if not hasLockpick then
        Framework.Functions.Notify("С голи ръце ли ще го разбиваш?", 'error', 5000)
        return
    end
    exports['nocore-ui']:Circle(function(success)
        if success then
            exports['nocore-assets']:RequestAnimationDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
            TaskPlayAnim(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3.0, 3.0, -1, 16, 0, false, false, false)
            Framework.Functions.Progressbar('art_vaultRob', 'Разбиване..', math.random(10000, 25000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                exports['nocore-eye']:RemoveZone("ArtHeistVault")
                StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                Framework.Functions.TriggerCallback('nocore-heists:ArtHeist:rewardItem', function(func)
                end, true)
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                Framework.Functions.Notify("Прекратено..", "error")
            end, 'fa-solid fa-vault')
        else
            return Framework.Functions.Notify("Неуспешно!", "error")
        end
    end, 8, 20) -- NumberOfCircles, MS
end)

RegisterNetEvent("thermite:StartFire") --Starts the fire here.
AddEventHandler("thermite:StartFire", function(coords, maxChildren, isGasFire, isBig)
    local pos = {
        x = 1393.0509,
        y = 1127.4698,
        z = 114.33437,
    }
    pos.z = pos.z - 0.9
    
    local fire = StartScriptFire(pos.x, pos.y, pos.z, maxChildren, isGasFire)
    currentFires[#currentFires+1] = fire
end)

RegisterNetEvent("thermite:StopFires") --Stops the fires.
AddEventHandler("thermite:StopFires", function()
    for k, v in ipairs(currentFires) do
        RemoveScriptFire(v)
    end
end)

RegisterNetEvent('nocore-heists:artheist:kod4', function ()
    for i = 518, 507, -1 do
        TriggerServerEvent('nui_doorlock:updateState', i, true, nil, true)
        Wait(5000)
    end
    for k, v in pairs(Shared['ArtHeist']['painting']) do
        v['taken'] = false
    end
    for k, v in pairs(Shared['ArtHeist']['robs']) do
        TriggerServerEvent('artheist:server:syncrobs', k, false)
    end
    for k, v in pairs(ArtHeist['painting']) do
        DeleteObject(v)
    end
    for k, v in pairs(ArtHeist['objects']) do
        DeleteObject(v)
    end
    exports['nocore-eye']:RemoveZone("ArtHeistVault")
    ArtHeist['inMission'] = false
end)

AddEventHandler('onResourceStop', function (resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(ArtHeist['painting']) do
            DeleteObject(v)
        end
        for k, v in pairs(ArtHeist['objects']) do
            DeleteObject(v)
        end
        for i = 518, 507, -1 do
            TriggerServerEvent('nui_doorlock:updateState', i, true, nil, true)
            Wait(3000)
        end
        exports['nocore-eye']:RemoveZone("ArtHeistVault")
    end
end)