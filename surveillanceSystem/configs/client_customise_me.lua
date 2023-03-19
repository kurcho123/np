function HideMinimap() --This is triggered when the user is inside the camera. Use this to disable your hud stuff.
    DisplayRadar(false)
    TriggerEvent("nocore-hud:client:toggle", false)
end

function ShowMinimap() --This is triggered when the user left the camera. You can use this to re-enable your hud stuff.
    DisplayRadar(true)
    TriggerEvent("nocore-hud:client:toggle", true)
end

RegisterNetEvent('cameraSystem:client:startHacking')
AddEventHandler('cameraSystem:client:startHacking', function(looper) --Calls this event when you want to start hacking.

    if(Config.HackLocations[looper].type == "computer")then
        DoComputerHacking(looper)
    elseif(Config.HackLocations[looper].type == "thermite")then
        DoThermiteHacking(looper)
    elseif(Config.HackLocations[looper].type == "mhacking")then
        DoMHacking(looper)
    end

end)

RegisterNetEvent('cameraSystem:client:startRestoring')
AddEventHandler('cameraSystem:client:startRestoring', function(looper) --Calls this event when you want to start restoring.

    if(Config.HackLocations[looper].type == "computer")then
        DoComputerRestoring(looper)
    elseif(Config.HackLocations[looper].type == "thermite")then
        DoThermiteRestoring(looper)
    elseif(Config.HackLocations[looper].type == "mhacking")then
        DoMHackingRestoring(looper)
    end

end)

function DoComputerHacking(looper) --This is the computer hacking minigame. Looks kinda ugly on code but works. If you need any help changing anything write me on discord.
    local dict = "anim@heists@prison_heiststation@cop_reactions"
    local anim = "cop_b_idle"
    local flag = 0
    hacking = true

    LoadAnimationDict(dict)
    Citizen.CreateThread(function()
        while hacking do
            if(not IsEntityPlayingAnim(globalPed, dict, anim, 3))then
                TaskPlayAnim(globalPed, dict, anim, 8.0, 8.0, -1, flag, 0, false, false, false)
            end
            Citizen.Wait(10)
        end
    end)
    SetEntityHeading(globalPed, Config.HackLocations[looper].location.h)

    local stage = 1
    local text = "None"
    local finished = false
    local randomiser = math.random(1,100)

        while(stage <= 4)do

            local timer = 0

            while(timer <= 5000)do
                Citizen.Wait(5)
                if(stage == 1)then
                    text = Config.HackStage1
                    timer = timer + randomFloat(4.5, 8.2)
                    DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                    DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                elseif(stage == 2)then
                    text = Config.HackStage2
                    timer = timer + randomFloat(6.1, 10.3)
                    DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                    DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                elseif(stage == 3)then
                    if(randomiser < Config.HackChance)then
                        text = Config.HackStage3
                        timer = timer + randomFloat(4.9, 9.4)
                        DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                        DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                    else
                        text = Config.HackStage2Fail
                        stage = 5
                        hacking = false
                        finished = false
                        Citizen.CreateThread(function()
                            while timer <= 2000 do
                                Citizen.Wait(1)
                                timer = timer + 5
                                DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, text)
                            end
                        end)

                        Citizen.Wait(1000)
                        ClearPedTasks(globalPed)
                    end
                elseif(stage == 4)then
                    text = Config.HackStage4
                    timer = timer + randomFloat(4.5, 8.2)
                    DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                    DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                end

                if IsControlJustPressed(1, Config.AbortHackButton) then
                    timer = 5000
                    stage = 6
                    finished = false
                    hacking = false
                    ClearPedTasks(globalPed)

                    Citizen.Wait(100)
                    text = Config.HackAborted
                    Citizen.CreateThread(function()
                        while timer <= 6000 do
                            Citizen.Wait(1)
                            timer = timer + 5
                            DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, text)
                        end
                    end)


                end

            end
            stage = stage + 1
        end

    if(stage == 5)then
        finished = true
    end

    if(finished)then
            TriggerEvent("cameraSystem:client:OpenCamera", Config.HackLocations[looper].cameras)
            Citizen.Wait(1000)
            TriggerServerEvent("cameraSystem:server:updateState", Config.HackLocations[looper].cameras, false)
            while(inCamera)do
                Citizen.Wait(200)
            end
    end


    hacking = false
    ClearPedTasks(globalPed)
end

function DoComputerRestoring(looper) --Works the same way just doesn't fail you and restored cameras.
    local dict = "anim@heists@prison_heiststation@cop_reactions"
    local anim = "cop_b_idle"
    local flag = 0
    hacking = true

    LoadAnimationDict(dict)
    Citizen.CreateThread(function()
        while hacking do
            if(not IsEntityPlayingAnim(globalPed, dict, anim, 3))then
                TaskPlayAnim(globalPed, dict, anim, 8.0, 8.0, -1, flag, 0, false, false, false)
            end
            Citizen.Wait(10)
        end
    end)
    SetEntityHeading(globalPed, Config.HackLocations[looper].location.h)

    local stage = 1
    local text = "None"
    local finished = false
    local randomiser = math.random(1,100)

        while(stage <= 4)do

            local timer = 0

            while(timer <= 5000)do
                Citizen.Wait(5)
                if(stage == 1)then
                    text = Config.HackStage1
                    timer = timer + randomFloat(4.5, 8.2)
                    DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                    DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                elseif(stage == 2)then
                    text = Config.HackStage2
                    timer = timer + randomFloat(6.1, 10.3)
                    DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                    DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                elseif(stage == 3)then
                        text = Config.HackStage3
                        timer = timer + randomFloat(4.9, 9.4)
                        DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                        DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                elseif(stage == 4)then
                    text = Config.ReactivateComputerHacking
                    timer = timer + randomFloat(4.5, 8.2)
                    DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, text .. " - %" .. round(timer / 50, 1))
                    DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)
                end

                if IsControlJustPressed(1, Config.AbortHackButton) then
                    timer = 5000
                    stage = 6
                    finished = false
                    hacking = false
                    ClearPedTasks(globalPed)

                    Citizen.Wait(100)
                    text = Config.HackAborted
                    Citizen.CreateThread(function()
                        while timer <= 6000 do
                            Citizen.Wait(1)
                            timer = timer + 5
                            DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, text)
                        end
                    end)


                end

            end
            stage = stage + 1
        end

    if(stage == 5)then
        finished = true
    end

    if(finished)then
            TriggerEvent("cameraSystem:client:OpenCamera", Config.HackLocations[looper].cameras)
            Citizen.Wait(2500)
            TriggerServerEvent("cameraSystem:server:updateState", Config.HackLocations[looper].cameras, true)
            Citizen.Wait(500)
            TriggerEvent("cameraSystem:client:OpenCamera", Config.HackLocations[looper].cameras)
            Citizen.Wait(500)
            while(inCamera)do
                Citizen.Wait(200)
            end
            Citizen.Wait(2000)
    end


    hacking = false
    ClearPedTasks(globalPed)
end

function DoThermiteHacking(looper) --YOU NEED THERMITE MINIGAME. If you have any other minigame you want to use feel free to write the code here.

    if(exports['thermite']:doMinigame(30,5,5,400))then
        local cameraIdentifier = Config.HackLocations[looper].cameras
        if(type(cameraIdentifier) == "number")then
            TriggerServerEvent("cameraSystem:server:updateState", cameraIdentifier, false)
        else
            for k, v in pairs(Config.MultipleCameraHackingLocations[cameraIdentifier]) do
                TriggerServerEvent("cameraSystem:server:updateState", v, false)
            end
        end
    else
        exports['thermite']:doExplosion(globalPedPos, 1, 10)
        exports['thermite']:doFire(globalPedPos, 45, 5, false, true)
    end

    local disableE = true

    Citizen.CreateThread(function()
        while disableE do
            DisableControlAction(0, 38)
            Citizen.Wait(0)
        end
    end)
    

    Citizen.Wait(1500)
    disableE = false
end

function DoThermiteRestoring(looper) --Restores the thermite selected cameras. 
    local timer = 0
    hacking = true
    local restored = true
    TaskStartScenarioInPlace(globalPed, "PROP_HUMAN_ATM", 0, true)
    Citizen.Wait(2000)

    while(timer <= 5000)do
        Citizen.Wait(5)
        timer = timer + randomFloat(5.2, 8.2)
        DrawText3D(Config.HackLocations[looper].location.x, Config.HackLocations[looper].location.y, Config.HackLocations[looper].location.z, Config.RestoringMessage .. " - %" .. round(timer / 50, 1))
        DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)

        if IsControlJustPressed(1, Config.AbortHackButton) then
            timer = 5000
            restored = false
            ClearPedTasks(globalPed)
            Citizen.Wait(100)
            Citizen.CreateThread(function()
                while timer <= 6000 do
                    Citizen.Wait(1)
                    timer = timer + 5
                end
            end)


        end
    end
    
    ClearPedTasks(globalPed)

    if(restored)then
        local cameraIdentifier = Config.HackLocations[looper].cameras
        if(type(cameraIdentifier) == "number")then
            TriggerServerEvent("cameraSystem:server:updateState", cameraIdentifier, true)
        else
            for k, v in pairs(Config.MultipleCameraHackingLocations[cameraIdentifier]) do
                TriggerServerEvent("cameraSystem:server:updateState", v, true)
            end
        end
    end
    hacking = false

end


MHacking = false
MHackingLooper = nil

function DoMHacking(looper) --Starts the Mhacking sequence minigame. Download the script if you don't have it.
    MHackingLooper = looper
    TaskStartScenarioInPlace(globalPed, "PROP_HUMAN_ATM", 0, true)
    Citizen.Wait(2000)

    exports['mhacking']:ShowHack()
    exports['mhacking']:StartHack( math.random(5, 9), math.random(10, 15), OnMHackingDone)

end

function OnMHackingDone(success, timeremaining) --Idk why the fuck MHacking works like this but it does. You need a second function lul.
    if success then
        exports['mhacking']:HideHack()
        ClearPedTasks(globalPed)
        TriggerServerEvent("cameraSystem:server:updateState", Config.HackLocations[MHackingLooper].cameras, false)
    else
		exports['mhacking']:HideHack()
	end
end

function DoMHackingRestoring(looper) --Restores Mhacking camera selected
    local timer = 0
    hacking = true
    local restored = true
    TaskStartScenarioInPlace(globalPed, "PROP_HUMAN_ATM", 0, true)
    Citizen.Wait(2000)

    while(timer <= 5000)do
        Citizen.Wait(5)
        timer = timer + randomFloat(5.2, 8.2)
        DrawText3D(Config.HackLocations[MHackingLooper].location.x, Config.HackLocations[MHackingLooper].location.y, Config.HackLocations[MHackingLooper].location.z, Config.RestoringMessage .. " - %" .. round(timer / 50, 1))
        DrawText3D(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.AbortMessage)

        if IsControlJustPressed(1, Config.AbortHackButton) then
            timer = 5000
            restored = false
            ClearPedTasks(globalPed)
            Citizen.Wait(100)
            Citizen.CreateThread(function()
                while timer <= 6000 do
                    Citizen.Wait(1)
                    timer = timer + 5
                end
            end)


        end
    end
    
    ClearPedTasks(globalPed)

    if(restored)then
        TriggerServerEvent("cameraSystem:server:updateState", Config.HackLocations[MHackingLooper].cameras, true)
    end
    hacking = false

end

function SurveillanceSystemGetCams()
    return Config.SecurityCameras.cameras
end
