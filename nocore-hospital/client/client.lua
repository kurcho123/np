local BedData = nil
local BedCam = nil
local onDuty = false
--[[ local CurrentGarage = nil ]]
isLoggedIn = false
Framework = nil

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1250, function()
            TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)
            Citizen.Wait(250)
            SetPedMaxHealth(PlayerPedId(), 200)
            Framework.Functions.GetPlayerData(function(PlayerData)
                -- print(PlayerData.metadata["isdead"])
                -- SetEntityHealth(PlayerPedId(), PlayerData.metadata["health"])
                SetPedArmour(PlayerPedId(), PlayerData.metadata["armor"])
                if PlayerData.metadata["isdead"] then
                    SetState('death', true)
                end
                isLoggedIn = true
                onDuty = PlayerData.job.onduty 
                PlayerJob = PlayerData.job
                -- TriggerServerEvent("nocore-police:server:UpdateBlips")
            end)
        end)
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        TriggerEvent("Framework:GetObject", function(obj)Framework = obj end)
        Citizen.Wait(250)
        Framework.Functions.GetPlayerData(function(PlayerData)
            -- print(PlayerData.metadata["isdead"])
            -- SetEntityHealth(PlayerPedId(), PlayerData.metadata["health"])
            SetPedArmour(PlayerPedId(), PlayerData.metadata["armor"])
            if PlayerData.metadata["isdead"] then
                SetState('death', true)
            end
            isLoggedIn = true
            onDuty = PlayerData.job.onduty
            PlayerJob = PlayerData.job
            -- TriggerServerEvent("nocore-police:server:UpdateBlips")
        end)
    end)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    TriggerServerEvent('hospital:saveStatus', GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()))
    isLoggedIn = false
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    -- TriggerServerEvent("nocore-police:server:UpdateBlips")
    onDuty = Onduty
end)

-- // Loops \\ --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if isLoggedIn then
            Citizen.Wait(20000)
            TriggerServerEvent('hospital:saveStatus', GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()))
        else
            Citizen.Wait(1500)
        end
    end
end)


--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if isLoggedIn then
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            NearSomething = false
          --  if onDuty then

                if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                    Config.Locations["Shop"][1]['X'], Config.Locations["Shop"][1]['Y'],
                    Config.Locations["Shop"][1]['Z'], true) < 1.5) then
                   -- if (Framework.Functions.GetPlayerData().job.name == "ambulance") then
                        Framework.Functions.DrawText3D(Config.Locations["Shop"][1]['X'],
                            Config.Locations["Shop"][1]['Y'], Config.Locations["Shop"][1]['Z'] + 0.15, _U("emscloset"))
                            DrawMarker(2, Config.Locations["Shop"][1]['X'], Config.Locations["Shop"][1]['Y'],
                            Config.Locations["Shop"][1]['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255,
                            255, 255, false, false, false, 1, false, false, false)
                        NearSomething = true
                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "hospital", Config.Items)
                        end
                 --   end
               -- end

                if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                    Config.Locations["Storage"][1]['X'], Config.Locations["Storage"][1]['Y'],
                    Config.Locations["Storage"][1]['Z'], true) < 1.5) then
                    if (Framework.Functions.GetPlayerData().job.name == "ambulance") then
                        Framework.Functions.DrawText3D(Config.Locations["Storage"][1]['X'],
                            Config.Locations["Storage"][1]['Y'], Config.Locations["Storage"][1]['Z'] + 0.15,
                            _U("emsstash"))
                        DrawMarker(2, Config.Locations["Storage"][1]['X'], Config.Locations["Storage"][1]['Y'],
                            Config.Locations["Storage"][1]['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255,
                            255, 255, false, false, false, 1, false, false, false)
                        NearSomething = true
                        if IsControlJustReleased(0, 38) then
                            local Other = {
                                maxweight = 2000000,
                                slots = 200
                            }
                            TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "hospital", Other)
                            TriggerEvent("nocore-inventory:client:SetCurrentStash", "hospital")
                        end
                    end
                end

            end

            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Locations["CheckIn"]['X'], Config.Locations["CheckIn"]['Y'], Config.Locations["CheckIn"]['Z'], true) < 1.5) then
                Framework.Functions.DrawText3D(Config.Locations["CheckIn"]['X'], Config.Locations["CheckIn"]['Y'],
                    Config.Locations["CheckIn"]['Z'] + 0.15, _U("checkin"))
                DrawMarker(2, Config.Locations["CheckIn"]['X'], Config.Locations["CheckIn"]['Y'],
                    Config.Locations["CheckIn"]['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255,
                    false, false, false, 1, false, false, false)
                NearSomething = true
                if IsControlJustReleased(0, 38) then
                    local BedSomething = GetAvailableBed()
                    if BedSomething ~= nil or BedSomething ~= false then
                        Framework.Functions.TriggerCallback('nocore-hospital:server:GetAvailableAmbulance',
                            function(ambulance)
                                if ambulance < Config.MaxAmbulanceToUseAutoRevive then
                                    Framework.Functions.TriggerCallback("nocore-hospital:server:pay:hospital",
                                        function(HasPaid)
                                            if HasPaid then
                                                TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
                                                Framework.Functions
                                                    .Progressbar("lockpick-door", _U("checkinprogres"), 2500, false,
                                                    false, {
                                                        disableMovement = true,
                                                        disableCarMovement = true,
                                                        disableMouse = false,
                                                        disableCombat = true
                                                    }, {}, {}, {}, function() -- Done
                                                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                                        TriggerEvent('nocore-hospital:client:send:to:bed', BedSomething)
                                                    end, function() -- Cancel
                                                        Framework.Functions.Notify(_U("cancel"), "error")
                                                    end)
                                            end
                                        end)
                                else
                                    Framework.Functions.Notify(
                                        'Има налични медици! Моля обърнете се към тях на номер 112',
                                        nil, 6000)
                                end
                            end)
                    else
                        Framework.Functions.Notify(_U("allbedstaken"), 'error')
                    end
                end
            end

            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                Config.Locations['Teleporters']['ToHeli']['X'], Config.Locations['Teleporters']['ToHeli']['Y'],
                Config.Locations['Teleporters']['ToHeli']['Z'], true) < 1.5) then
                Framework.Functions.DrawText3D(Config.Locations['Teleporters']['ToHeli']['X'],
                    Config.Locations['Teleporters']['ToHeli']['Y'],
                    Config.Locations['Teleporters']['ToHeli']['Z'] + 0.15, _U("upstairs"))
                DrawMarker(2, Config.Locations['Teleporters']['ToHeli']['X'],
                    Config.Locations['Teleporters']['ToHeli']['Y'], Config.Locations['Teleporters']['ToHeli']['Z'], 0.0,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false,
                    false)
                NearSomething = true
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(450)
                    Citizen.Wait(450)
                    TriggerEvent("nocore-sound:client:play", "hospital-elevator", 0.25)
                    SetEntityCoords(PlayerPedId(), Config.Locations['Teleporters']['ToHospitalFirst']['X'],
                        Config.Locations['Teleporters']['ToHospitalFirst']['Y'],
                        Config.Locations['Teleporters']['ToHospitalFirst']['Z'])
                    Citizen.Wait(250)
                    DoScreenFadeIn(450)
                end
            end

            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                Config.Locations['Teleporters']['ToHospitalFirst']['X'],
                Config.Locations['Teleporters']['ToHospitalFirst']['Y'],
                Config.Locations['Teleporters']['ToHospitalFirst']['Z'], true) < 1.5) then
                Framework.Functions.DrawText3D(Config.Locations['Teleporters']['ToHospitalFirst']['X'],
                    Config.Locations['Teleporters']['ToHospitalFirst']['Y'],
                    Config.Locations['Teleporters']['ToHospitalFirst']['Z'] + 0.15, _U("downstairs"))
                DrawMarker(2, Config.Locations['Teleporters']['ToHospitalFirst']['X'],
                    Config.Locations['Teleporters']['ToHospitalFirst']['Y'],
                    Config.Locations['Teleporters']['ToHospitalFirst']['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1,
                    0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                NearSomething = true
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(450)
                    Citizen.Wait(450)
                    TriggerEvent("nocore-sound:client:play", "hospital-elevator", 0.25)
                    SetEntityCoords(PlayerPedId(), Config.Locations['Teleporters']['ToHeli']['X'],
                        Config.Locations['Teleporters']['ToHeli']['Y'], Config.Locations['Teleporters']['ToHeli']['Z'])
                    Citizen.Wait(250)
                    DoScreenFadeIn(450)
                end
            end

            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                Config.Locations['Teleporters']['ToLower']['X'], Config.Locations['Teleporters']['ToLower']['Y'],
                Config.Locations['Teleporters']['ToLower']['Z'], true) < 1.5) then
                Framework.Functions.DrawText3D(Config.Locations['Teleporters']['ToLower']['X'],
                    Config.Locations['Teleporters']['ToLower']['Y'],
                    Config.Locations['Teleporters']['ToLower']['Z'] + 0.15, _U("upstairs"))
                DrawMarker(2, Config.Locations['Teleporters']['ToLower']['X'],
                    Config.Locations['Teleporters']['ToLower']['Y'], Config.Locations['Teleporters']['ToLower']['Z'],
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false,
                    false, false)
                NearSomething = true
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(450)
                    Citizen.Wait(450)
                    TriggerEvent("nocore-sound:client:play", "hospital-elevator", 0.25)
                    SetEntityCoords(PlayerPedId(), Config.Locations['Teleporters']['ToHospitalSecond']['X'],
                        Config.Locations['Teleporters']['ToHospitalSecond']['Y'],
                        Config.Locations['Teleporters']['ToHospitalSecond']['Z'])
                    Citizen.Wait(250)
                    DoScreenFadeIn(450)
                end
            end

            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
                Config.Locations['Teleporters']['ToHospitalSecond']['X'],
                Config.Locations['Teleporters']['ToHospitalSecond']['Y'],
                Config.Locations['Teleporters']['ToHospitalSecond']['Z'], true) < 1.5) then
                Framework.Functions.DrawText3D(Config.Locations['Teleporters']['ToHospitalSecond']['X'],
                    Config.Locations['Teleporters']['ToHospitalSecond']['Y'],
                    Config.Locations['Teleporters']['ToHospitalSecond']['Z'] + 0.15, _U("downstairs"))
                DrawMarker(2, Config.Locations['Teleporters']['ToHospitalSecond']['X'],
                    Config.Locations['Teleporters']['ToHospitalSecond']['Y'],
                    Config.Locations['Teleporters']['ToHospitalSecond']['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1,
                    0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                NearSomething = true
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(450)
                    Citizen.Wait(450)
                    TriggerEvent("nocore-sound:client:play", "hospital-elevator", 0.25)
                    SetEntityCoords(PlayerPedId(), Config.Locations['Teleporters']['ToLower']['X'],
                        Config.Locations['Teleporters']['ToLower']['Y'], Config.Locations['Teleporters']['ToLower']['Z'])
                    Citizen.Wait(250)
                    DoScreenFadeIn(450)
                end
            end

            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
            Config.Locations['Teleporters']['ToCourtUP']['X'], Config.Locations['Teleporters']['ToCourtUP']['Y'],
            Config.Locations['Teleporters']['ToCourtUP']['Z'], true) < 1.5) then
            Framework.Functions.DrawText3D(Config.Locations['Teleporters']['ToCourtUP']['X'],
                Config.Locations['Teleporters']['ToCourtUP']['Y'],
                Config.Locations['Teleporters']['ToCourtUP']['Z'] + 0.15, _U("upstairs"))
            DrawMarker(2, Config.Locations['Teleporters']['ToCourtUP']['X'],
                Config.Locations['Teleporters']['ToCourtUP']['Y'], Config.Locations['Teleporters']['ToCourtUP']['Z'], 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false,
                false)
            NearSomething = true
            if IsControlJustReleased(0, 38) then
                DoScreenFadeOut(450)
                Citizen.Wait(450)
                TriggerEvent("nocore-sound:client:play", "hospital-elevator", 0.25)
                SetEntityCoords(PlayerPedId(), Config.Locations['Teleporters']['ToCourtDOWN']['X'],
                    Config.Locations['Teleporters']['ToCourtDOWN']['Y'],
                    Config.Locations['Teleporters']['ToCourtDOWN']['Z'])
                Citizen.Wait(250)
                DoScreenFadeIn(450)
            end
        end

        if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z,
            Config.Locations['Teleporters']['ToCourtDOWN']['X'],
            Config.Locations['Teleporters']['ToCourtDOWN']['Y'],
            Config.Locations['Teleporters']['ToCourtDOWN']['Z'], true) < 1.5) then
            Framework.Functions.DrawText3D(Config.Locations['Teleporters']['ToCourtDOWN']['X'],
                Config.Locations['Teleporters']['ToCourtDOWN']['Y'],
                Config.Locations['Teleporters']['ToCourtDOWN']['Z'] + 0.15, _U("downstairs"))
            DrawMarker(2, Config.Locations['Teleporters']['ToCourtDOWN']['X'],
                Config.Locations['Teleporters']['ToCourtDOWN']['Y'],
                Config.Locations['Teleporters']['ToCourtDOWN']['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1,
                0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
            NearSomething = true
            if IsControlJustReleased(0, 38) then
                DoScreenFadeOut(450)
                Citizen.Wait(450)
                TriggerEvent("nocore-sound:client:play", "hospital-elevator", 0.25)
                SetEntityCoords(PlayerPedId(), Config.Locations['Teleporters']['ToCourtUP']['X'],
                    Config.Locations['Teleporters']['ToCourtUP']['Y'], Config.Locations['Teleporters']['ToCourtUP']['Z'])
                Citizen.Wait(250)
                DoScreenFadeIn(450)
            end
        end

            if not NearSomething then
                Citizen.Wait(1500)
            end

        end
    end
end)
]]
-- // Events \\ --

RegisterNetEvent('nocore-hospital:client:revive')
AddEventHandler('nocore-hospital:client:revive', function(UseAnim, IsAdmin)
    if Config.IsDeath then
        SetState('death', false)
        SetEntityInvincible(PlayerPedId(), false)
        NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId(), true), true, true, false)
        TriggerEvent('nocore-deathscreen:updateState', 0, 300)
    end
    ResetBodyHp()
    ClearPedTasks(PlayerPedId())
    SetEntityHealth(PlayerPedId(), 200)
    ClearPedBloodDamage(PlayerPedId())
    SetPlayerSprint(PlayerId(), true)

    TriggerServerEvent("Framework:Server:SetMetaData", "thirst",
        Framework.Functions.GetPlayerData().metadata["thirst"] + 25)
    TriggerServerEvent("Framework:Server:SetMetaData", "hunger",
        Framework.Functions.GetPlayerData().metadata["hunger"] + 25)
    TriggerServerEvent("Framework:Server:SetMetaData", "drunk",
        Framework.Functions.GetPlayerData().metadata["drunk"] - 65)

        TriggerServerEvent('hud:server:RelieveStress', 100)
    TriggerEvent('nocore-police:client:set:escort:status:false')
    Framework.Functions.Notify("Ти беше излекуван", 'success')
end)

RegisterNetEvent('nocore-hospital:client:heal:closest')
AddEventHandler('nocore-hospital:client:heal:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    local RandomTime = math.random(10000, 15000)
    if Player ~= -1 and Distance < 1.5 then
        if not IsTargetDead(GetPlayerServerId(Player)) then
            TriggerEvent('animations:client:EmoteCommandStart', {"inspect"})
            Framework.Functions.Progressbar("healing-citizen", _U("healcitizen"), PlayerJob.name == 'ambulance' and RandomTime or math.random(30000, 60000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('nocore-hospital:server:heal:player', GetPlayerServerId(Player))
                Framework.Functions.Notify(_U("healciti"), "success")
                if PlayerJob.name == 'emergency' then
                    TriggerServerEvent('nocore-hospital:taxEmergency', 'heal')
                end
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                Framework.Functions.Notify(_U("cancel"), "error")
            end)
        else
            Framework.Functions.Notify(_U("citizenc"), "error")
        end
    end
end)

local cabinetReviveLocations = {
    vector3(810.24, -494.76, 30.688)
}

RegisterNetEvent('nocore-hospital:client:revive:closest')
AddEventHandler('nocore-hospital:client:revive:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    local RandomTime = math.random(10000, 15000)
    if Player ~= -1 and Distance < 2.5 then
        if IsTargetDead(GetPlayerServerId(Player)) then
            if PlayerJob.name == 'emergency' then
                for index, data in ipairs(cabinetReviveLocations) do
                    if #(GetEntityCoords(PlayerPedId()) - data) < 20 then
                        TriggerEvent('animations:client:EmoteCommandStart', {"cpr"})
                        Framework.Functions.Progressbar("hospital_revive", _U("healcitizen"), 300000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                            disableInventory = true
                        }, {}, {}, {}, function() -- Done
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            TriggerServerEvent('nocore-hospital:server:revive:player', GetPlayerServerId(Player))
                            TriggerServerEvent('nocore-hospital:taxEmergency', 'revive')
                            Framework.Functions.Notify(_U("citizenc"))
                        end, function() -- Cancel
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            Framework.Functions.Notify(_U("failed"), "error")
                        end)
                    end
                end
            elseif PlayerJob.name == 'ambulance' then
                TriggerEvent('animations:client:EmoteCommandStart', {"cpr"})
                Framework.Functions.Progressbar("hospital_revive", _U("healcitizen"), RandomTime, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                    disableInventory = true
                }, {}, {}, {}, function() -- Done
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    TriggerServerEvent('nocore-hospital:server:revive:player', GetPlayerServerId(Player))
                    Framework.Functions.Notify(_U("citizenc"))
                end, function() -- Cancel
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    Framework.Functions.Notify(_U("failed"), "error")
                end)
            end
        else
            Framework.Functions.Notify(_U("citizenc"), "error")
        end
    end
end)

RegisterNetEvent('nocore-hospital:client:take:blood:closest')
AddEventHandler('nocore-hospital:client:take:blood:closest', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    local RandomTime = math.random(7500, 10500)
    if Player ~= -1 and Distance < 1.5 then
        TriggerEvent('animations:client:EmoteCommandStart', {"inspect"})
        Framework.Functions.Progressbar("healing-citizen", _U("takebsample"), RandomTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('nocore-hospital:server:take:blood:player', GetPlayerServerId(Player))
            Framework.Functions.Notify(_U("samplerecieved"), "success")
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Framework.Functions.Notify(_U("cancel"), "error")
        end)
    end
end)

RegisterNetEvent('nocore-hospital:client:heal:target')
AddEventHandler('nocore-hospital:client:heal:target', function(data)
    local Player = NetworkGetPlayerIndexFromPed(data.entity)
    local RandomTime = math.random(10000, 15000)
    if Player ~= -1 then
        if not IsTargetDead(GetPlayerServerId(Player)) then
            TriggerEvent('animations:client:EmoteCommandStart', {"inspect"})
            Framework.Functions.Progressbar("healing-citizen", _U("healcitizen"), RandomTime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('nocore-hospital:server:heal:player', GetPlayerServerId(Player))
                Framework.Functions.Notify(_U("healciti"), "success")
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                Framework.Functions.Notify(_U("cancel"), "error")
            end)
        else
            Framework.Functions.Notify(_U("citizenc"), "error")
        end
    end
end)

RegisterNetEvent('nocore-hospital:client:revive:target')
AddEventHandler('nocore-hospital:client:revive:target', function(data)
    local Player = NetworkGetPlayerIndexFromPed(data.entity)
    local RandomTime = math.random(10000, 15000)
    if Player ~= -1 then
        if IsTargetDead(GetPlayerServerId(Player)) then
            TriggerEvent('animations:client:EmoteCommandStart', {"cpr"})
            Framework.Functions.Progressbar("hospital_revive", _U("healcitizen"), RandomTime, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('nocore-hospital:server:revive:player', GetPlayerServerId(Player))
                Framework.Functions.Notify(_U("citizenc"))
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                Framework.Functions.Notify(_U("failed"), "error")
            end)
        else
            Framework.Functions.Notify(_U("citizenc"), "error")
        end
    end
end)

RegisterNetEvent('nocore-hospital:client:take:blood:target')
AddEventHandler('nocore-hospital:client:take:blood:target', function(data)
    local Player = NetworkGetPlayerIndexFromPed(data.entity)
    local RandomTime = math.random(7500, 10500)
    if Player ~= -1 then
        TriggerEvent('animations:client:EmoteCommandStart', {"inspect"})
        Framework.Functions.Progressbar("healing-citizen", _U("takebsample"), RandomTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('nocore-hospital:server:take:blood:player', GetPlayerServerId(Player))
            Framework.Functions.Notify(_U("samplerecieved"), "success")
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Framework.Functions.Notify(_U("cancel"), "error")
        end)
    end
end)

RegisterNetEvent('nocore-hospital:client:heal')
AddEventHandler('nocore-hospital:client:heal', function()
    local CurrentHealth = GetEntityHealth(PlayerPedId())
    local NewHealth = CurrentHealth + 15.0
    if CurrentHealth + 15.0 > 100.0 then
        NewHealth = 100.0
    end
    ResetBodyHp()
    ClearPedTasks(PlayerPedId())
    ClearPedBloodDamage(PlayerPedId())
    SetEntityHealth(PlayerPedId(), NewHealth)
end)

RegisterNetEvent('nocore-hospital:client:revive:anim')
AddEventHandler('nocore-hospital:client:revive:anim', function()
    exports['nocore-assets']:RequestAnimationDict("random@crash_rescue@help_victim_up")
    TaskPlayAnim(PlayerPedId(), "random@crash_rescue@help_victim_up", "helping_victim_to_feet_victim", 8.0, 1.0, -1, 49,
        0, 0, 0, 0)
    Citizen.Wait(1850)
    ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('nocore-hospital:client:set:bed:state')
AddEventHandler('nocore-hospital:client:set:bed:state', function(BedData, bool)
    Config.Beds[BedData]['Busy'] = bool
end)

RegisterNetEvent('nocore-hospital:client:send:to:bed')
AddEventHandler('nocore-hospital:client:send:to:bed', function(BedId)
    Citizen.SetTimeout(50, function()
        EnterBedCam(BedId)
        TriggerEvent('nocore-deathscreen:updateState', 0, 300)
        Framework.Functions.Notify(_U("recieving"), 'info')
        Citizen.Wait(25000)
        TriggerEvent('nocore-hospital:client:revive', false, false)
        TriggerServerEvent('nui_doorlock:updateState', 105, false, nil, true) -- Broadcast new state of the door to everyone
        LeaveBed()
    end)
end)

local HaveSpawnedHelicopter = false
RegisterNetEvent('nocore-hospital:client:spawn:heli')
AddEventHandler('nocore-hospital:client:spawn:heli', function()
    if (Framework.Functions.GetPlayerData().job.name == "ambulance") and (Framework.Functions.GetPlayerData().job.grade.level >= 2) then
        if Framework.Functions.IsSpawnPointClear(Config.Locations['Helipad']['Spawn'], 5) and not HaveSpawnedHelicopter then
            local CoordTable = Config.Locations['Helipad']['Spawn']
            Framework.Functions.SpawnVehicle('supervolito', function(Vehicle)
                Citizen.Wait(25)
                exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(Vehicle), true)
                exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 100, false)
                Framework.Functions.Notify(_U("helilanded"), 'info')
            end, CoordTable, true, false)
            HaveSpawnedHelicopter = true
            SetTimeout((1000*60)*30, function()
                HaveSpawnedHelicopter = false
            end)
        else
            Framework.Functions.Notify('Вече има фърчикоптер', 'info')
        end
    else
        Framework.Functions.Notify('Слабо, слабо', 'info')
    end
end)


-- // Functions \\ --

--[[ function NearGarage()
  for k, v in pairs(Config.Locations['Garage']) do
      local PlayerCoords = GetEntityCoords(PlayerPedId())
      if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['X'], v['Y'], v['Z'], true) < 10.0) then
          CurrentGarage = k
          return true
      end
  end
end ]]

function EnterBedCam(BedId)
    Config.IsInBed = true
    BedData = BedId
    TriggerServerEvent('nocore-hospital:server:set:bed:state', BedData, true)
    DoScreenFadeOut(1000)
    while not IsScreenFadedOut() do
        Citizen.Wait(100)
    end
    BedObject = GetClosestObjectOfType(Config.Beds[BedData]['X'], Config.Beds[BedData]['Y'], Config.Beds[BedData]['Z'],
        1.0, Config.Beds[BedData]['Hash'], false, false, false)
    SetEntityCoords(PlayerPedId(), Config.Beds[BedData]['X'], Config.Beds[BedData]['Y'],
        Config.Beds[BedData]['Z'] + 0.02)
    Citizen.Wait(500)
    FreezeEntityPosition(PlayerPedId(), true)
    exports['nocore-assets']:RequestAnimationDict("misslamar1dead_body")
    TaskPlayAnim(PlayerPedId(), "misslamar1dead_body", "dead_idle", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
    SetEntityHeading(PlayerPedId(), Config.Beds[BedData]['H'])
    BedCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamActive(BedCam, true)
    RenderScriptCams(true, false, 1, true, true)
    AttachCamToPedBone(BedCam, PlayerPedId(), 31085, 0, 1.0, 1.0, true)
    SetCamFov(BedCam, 100.0)
    SetCamRot(BedCam, -45.0, 0.0, GetEntityHeading(PlayerPedId()) + 180, true)
    DoScreenFadeIn(1000)
end

function LeaveBed()
    exports['nocore-assets']:RequestAnimationDict('switch@franklin@bed')
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityInvincible(PlayerPedId(), false)
    SetEntityHeading(PlayerPedId(), Config.Beds[BedData]['H'] + 90)
    TaskPlayAnim(PlayerPedId(), 'switch@franklin@bed', 'sleep_getup_rubeyes', 100.0, 1.0, -1, 8, -1, 0, 0, 0)
    Citizen.Wait(4000)
    ClearPedTasks(PlayerPedId())
    RenderScriptCams(0, true, 200, true, true)
    DestroyCam(BedCam, false)
    TriggerServerEvent('nocore-hospital:server:set:bed:state', BedData, false)
end

function HealAnim(time)
    time = time / 1000
    exports['nocore-assets']:RequestAnimationDict("weapons@first_person@aim_rng@generic@projectile@thermal_charge@")
    TaskPlayAnim(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 3.0,
        3.0, -1, 16, 0, false, false, false)
    Healing = true
    Citizen.CreateThread(function()
        while Healing do
            TaskPlayAnim(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
                "plant_floor", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            if time <= 0 then
                Healing = false
                StopAnimTask(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
                    "plant_floor", 1.0)
            end
        end
    end)
end

function ResetScreenAndWalk()
    Citizen.SetTimeout(1500, function()
        SetFlash(false, false, 450, 3000, 450)
        Citizen.Wait(350)
        ClearTimecycleModifier()
        ResetPedMovementClipset(PlayerPedId(), 0)
    end)
end

function GetAvailableBed()
    for k, v in pairs(Config.Beds) do
        if not v['Busy'] then
            return k
        end
    end
end

function IsTargetDead(playerId)
    local IsDead = false
    Framework.Functions.TriggerCallback('nocore-police:server:is:player:dead', function(result)
        IsDead = result
    end, playerId)
    Citizen.Wait(100)
    return IsDead
end

RegisterCommand('cleanme', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"shakeoff"})
    Wait(3000)
    ClearPedBloodDamage(PlayerPedId())
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end, false)

RegisterNetEvent('nocore-hospital:client:checkIn', function()
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    if #(PlayerCoords - Config.Locations["CheckIn"]) < 1.5 then
        local BedSomething = GetAvailableBed()
        if BedSomething then
            --Framework.Functions.TriggerCallback('nocore-hospital:server:GetAvailableAmbulance', function(ambulance)
                --if ambulance < Config.MaxAmbulanceToUseAutoRevive then
                    Framework.Functions.TriggerCallback("nocore-hospital:server:pay:hospital", function(HasPaid)
                        if HasPaid then
                            TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
                            Framework.Functions.Progressbar("lockpick-door", 'Чекиране..', 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                                disableInventory = true
                            }, {}, {}, {}, function() -- Done
                                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                TriggerEvent('nocore-hospital:client:send:to:bed', BedSomething)
                            end, function() -- Cancel
                                Framework.Functions.Notify('Отказано', "error")
                            end)
                        end
                    end)
                --else
                    --Framework.Functions.Notify('Има налични медици! Моля обърнете се към тях на номер 112', nil, 6000)
                --end
            --end)
        else
            Framework.Functions.Notify('Няма свободни легла за теб ¯\\_(ツ)_/¯', 'error')
        end
    end
end)

RegisterNetEvent('nocore-hospital:client:OpenShop', function()
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "hospital", Config.Items)
end)


local toggleKit = true
local medkit = nil


RegisterNetEvent('nocore-hospital:client:bagprop')
AddEventHandler('nocore-hospital:client:bagprop', function(UseAnim, IsAdmin)
    if toggleKit then
    medkit = CreateObject(GetHashKey("prop_cs_shopping_bag"), 0, 0, 0, true, true, true) -- creates object
    AttachEntityToEntity(medkit, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
    toggleKit = false
    elseif not toggleKit then
        DeleteEntity(medkit) -- deletes medkit
        toggleKit = true
    end
end, false)

RegisterNetEvent('nocore-hospital:client:lifepack')
AddEventHandler('nocore-hospital:client:lifepack', function(UseAnim, IsAdmin)
    if toggleKit then
    medkit = CreateObject(GetHashKey("prop_ld_case_01"), 0, 0, 0, true, true, true) -- creates object
    AttachEntityToEntity(medkit, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.1, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
    toggleKit = false
    elseif not toggleKit then
        DeleteEntity(medkit) -- deletes medkit
        toggleKit = true
    end
end, false)

exports['nocore-eye']:AddBoxZone("Apteka sklad", vector3(357.63, -1401.02, 32.5), 3.2, 0.4, {
    name="Apteka sklad",
    heading=140,
    --debugPoly=true,
    minZ=31.5,
    maxZ=33.7
}, {
	options = {{
		job = "ambulance",
		event = "nocore-hospital:client:OpenApteka",
		icon = "fas fa-credit-card",
		label = "Склад",
        citizenid = {["QSZ17326"] = true, ["IDD25687"] = true}
	}},
	distance = 2.5
})

RegisterNetEvent('nocore-hospital:client:OpenApteka') 
AddEventHandler('nocore-hospital:client:OpenApteka', function()
    local Player = Framework.Functions.GetPlayerData()
    if not exports['nocore-hospital']:GetDeathStatus() then
		Other = {maxweight = 500000, slots = 60, label = 'Аптека Склад'}
		TriggerEvent("nocore-inventory:client:SetCurrentStash", 'aptekaskuad')
		TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", 'aptekaskuad', Other)
		TriggerEvent("nocore-sound:client:play", "stash-open", 0.4)
    end
end)