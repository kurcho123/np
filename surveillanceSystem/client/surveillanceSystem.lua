local cameraActive = false
local currentCameraIndex = 0
local currentCameraIndexIndex = 0
createdCamera = 0
local currentTimecycle = nil
local offline = false
local canrotate = false
local authorised = true
globalPed = nil
globalPedPos = {x=0.0,y=0.0,z=0.0}
globalCamera = 0
hacking = false
inCamera = false
low = "CAMERA_secuirity"
offlineCam = "Broken_camera_fuzz"
Citizen.CreateThread(function()
    while true do
        globalPed = GetPlayerPed(PlayerId())
        globalPedPos = GetEntityCoords(globalPed, false)
        Citizen.Wait(1000)
    end
end)
Citizen.CreateThread(function()
    while true do
        if(authorised)then
            if createdCamera ~= 0 then
                local instructions = CreateInstuctionScaleform("instructional_buttons")
                DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
                SetTimecycleModifierStrength(1.0)
                if Config.HideMinimap then
                    HideMinimap()
                end
                -- CLOSE CAMERAS
                if IsControlJustPressed(1, Config.Disconnect) then
                    DoScreenFadeOut(250)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(0)
                    end
                    CloseSecurityCamera()
                    SendNUIMessage({
                        type = "disablecam",
                    })
                    DoScreenFadeIn(250)
                    createdCamera = 0
                    inCamera = false
                end
                ---------------------------------------------------------------------------
                -- CAMERA ROTATION CONTROLS
                ---------------------------------------------------------------------------
                if canrotate and not offline then
                    local getCameraRot = GetCamRot(createdCamera, 2)
                    -- ROTATE UP
                    if IsControlPressed(0, Config.RotateUp) then
                        if getCameraRot.x <= 0.0 then
                            SetCamRot(createdCamera, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
                        end
                    end
                    -- ROTATE DOWN
                    if IsControlPressed(0, Config.RotateDown) then
                        if getCameraRot.x >= -50.0 then
                            SetCamRot(createdCamera, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
                        end
                    end
                    -- ROTATE LEFT
                    if IsControlPressed(0, Config.RotateLeft) then
                        SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
                    end
                    -- ROTATE RIGHT
                    if IsControlPressed(0, Config.RotateRight) then
                        SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
                    end
                end
            else
                Citizen.Wait(100)
            end
        end
        Citizen.Wait(9)
    end
end)
RegisterNetEvent('cameraSystem:client:OpenCamera')
AddEventHandler('cameraSystem:client:OpenCamera', function(cameraId)
    if(authorised)then
        if Config.SecurityCameras.cameras[cameraId] ~= nil then
            if IsPedInAnyVehicle(globalPed) and GetPedInVehicleSeat(GetVehiclePedIsIn(globalPed), -1) == globalPed then
                FreezeEntityPosition(globalPed, false)
            else
                FreezeEntityPosition(globalPed, true)
            end
            globalCamera = cameraId
            inCamera = true
            DoScreenFadeOut(250)
            while not IsScreenFadedOut() do
                Citizen.Wait(0)
            end
            SendNUIMessage({
                type = "enablecam",
                label = Config.SecurityCameras.cameras[cameraId].label,
                id = cameraId,
                connected = Config.SecurityCameras.cameras[cameraId].isOnline,
                time = GetCurrentTime(),
            })
            if(Config.SecurityCameras.cameras[cameraId].isOnline)then
            if(Config.SecurityCameras.cameras[cameraId].quality == "brown")then
                    currentTimecycle = "phone_cam6"
            elseif(Config.SecurityCameras.cameras[cameraId].quality == "medium")then
                    currentTimecycle = "CAMERA_BW"
            elseif(Config.SecurityCameras.cameras[cameraId].quality == "low")then
                    currentTimecycle = "CAMERA_secuirity"
            elseif(Config.SecurityCameras.cameras[cameraId].quality == "blackandwhite")then
                    currentTimecycle = "phone_cam2"
            elseif(Config.SecurityCameras.cameras[cameraId].quality == "blurred")then
                    currentTimecycle = "helicamfirst"
            elseif(Config.SecurityCameras.cameras[cameraId].quality == "nightvision")then
                    currentTimecycle = "MP_heli_cam"
                elseif(Config.SecurityCameras.cameras[cameraId].quality == "offline")then
                    currentTimecycle = "Broken_camera_fuzz"
            else
                    currentTimecycle = "Broken_camera_fuzz"
            end
                
            SetTimecycleModifier(currentTimecycle)
            offline = false
            Citizen.Wait(200)
            else
                currentTimecycle = "Broken_camera_fuzz"
                SetTimecycleModifier(currentTimecycle)
                offline = true
                Citizen.Wait(200)
            end

            canrotate = Config.SecurityCameras.cameras[cameraId].canRotate
            local firstCamx = Config.SecurityCameras.cameras[cameraId].x
            local firstCamy = Config.SecurityCameras.cameras[cameraId].y
            local firstCamz = Config.SecurityCameras.cameras[cameraId].z
            local firstCamr = Config.SecurityCameras.cameras[cameraId].r

            
            --[[ local entity = CreateObject(GetHashKey("v_serv_securitycam_1a"), 0, 0, 0, true, true, true) -- Create head bag object!
            SetEntityCoords(entity, firstCamx, firstCamy, firstCamz, false, false, false, false)
            RequestCollisionAtCoord(firstCamx, firstCamy, firstCamz)
		    local timeout = 0

		    -- we can get stuck here if any of the axies are "invalid"
		    while not HasCollisionLoadedAroundEntity(entity) and timeout < 2000 do
		    	Citizen.Wait(0)
		    	timeout = timeout + 1
		    end
            DeleteEntity(entity) ]]
            SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
            ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
            currentCameraIndex = a
            currentCameraIndexIndex = 1
            DoScreenFadeIn(250)
        elseif cameraId == 0 then
            globalCamera = cameraId
            if(Config.RecordFootage)then
                StopRecordingAndSaveClip()
            end
            DoScreenFadeOut(250)
            while not IsScreenFadedOut() do
                Citizen.Wait(0)
            end
            CloseSecurityCamera()
            SendNUIMessage({
                type = "disablecam",
            })
            DoScreenFadeIn(250)
            inCamera = false
        else
            TriggerServerEvent("cameraSystem:server:notification", GetPlayerServerId(PlayerId()), "no_camera")
        end
    end
end)
RegisterNetEvent('cameraSystem:client:DisableAllCameras')
AddEventHandler('cameraSystem:client:DisableAllCameras', function()
    if(authorised)then
        for k, v in pairs(Config.SecurityCameras.cameras) do 
            Config.SecurityCameras.cameras[k].isOnline = false
        end
        Citizen.Wait(500)
        
        if(globalCamera ~= 0)then
            TriggerEvent("cameraSystem:client:OpenCamera", globalCamera)
        end
    end
end)
RegisterNetEvent('cameraSystem:client:EnableAllCameras')
AddEventHandler('cameraSystem:client:EnableAllCameras', function()
    if(authorised)then
        for k, v in pairs(Config.SecurityCameras.cameras) do 
            Config.SecurityCameras.cameras[k].isOnline = true
        end
        Citizen.Wait(500)
        
        if(globalCamera ~= 0)then
            TriggerEvent("cameraSystem:client:OpenCamera", globalCamera)
        end
    end
end)
RegisterNetEvent('cameraSystem:client:updateState')
AddEventHandler('cameraSystem:client:updateState', function(key, state)
    if(authorised)then
        Config.SecurityCameras.cameras[key].isOnline = state
        
        Citizen.Wait(500)
        
        if(inCamera)then
            if(key == globalCamera)then
                    SetTimecycleModifier(low)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(currentTimecycle)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(low)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(currentTimecycle)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(offlineCam)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(low)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(currentTimecycle)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(offlineCam)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(low)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(currentTimecycle)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(low)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(currentTimecycle)
                    Citizen.Wait(math.random(50,300))
                    SetTimecycleModifier(low)
                    Citizen.Wait(500)
                    TriggerEvent("cameraSystem:client:OpenCamera", globalCamera)
            end
        end
    end
end)
RegisterCommand("camtest", function(source, args, rawCommand)
    if(args[1] ~= nil)then
        TriggerEvent("cameraSystem:client:updateState", tonumber(args[1]), false)
    else
        TriggerServerEvent("cameraSystem:server:notification", source, "no_arguments")
    end
end, false)
---------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------
function GetCurrentTime()
    if(authorised)then
        local hours = GetClockHours()
        local minutes = GetClockMinutes()
        if hours < 10 then
            hours = tostring(0 .. GetClockHours())
        end
        if minutes < 10 then
            minutes = tostring(0 .. GetClockMinutes())
        end
        return tostring(hours .. ":" .. minutes)
    end
end
function ChangeSecurityCamera(x, y, z, r)
    if(authorised)then
        if createdCamera ~= 0 then
            DestroyCam(createdCamera, 0)
            createdCamera = 0
        end
        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(cam, x, y, z)
        SetCamRot(cam, r.x, r.y, r.z, 2)
        RenderScriptCams(1, 0, 0, 1, 1)
        Citizen.Wait(250)
        createdCamera = cam
    end
end
function CloseSecurityCamera()
    if(authorised)then
        DestroyCam(createdCamera, 0)
        RenderScriptCams(0, 0, 1, 1, 1)
        createdCamera = 0
        ClearTimecycleModifier(currentTimecycle)
        SetFocusEntity(globalPed)
        if Config.HideMinimap then
            ShowMinimap() 
        end
        FreezeEntityPosition(globalPed, false)
    end
end
function CreateInstuctionScaleform(scaleform)
    if(authorised)then
        if(createdCamera ~= 0)then
            local scaleform = RequestScaleformMovie(scaleform)
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
            PopScaleformMovieFunctionVoid()
            if(canrotate and not offline)then
                PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
                PushScaleformMovieFunctionParameterInt(4)
                InstructionButton(GetControlInstructionalButton(1, Config.CameraUpDown, true))
                InstructionButtonMessage(Config.CameraUpDownText)
                PopScaleformMovieFunctionVoid()
                
                PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
                PushScaleformMovieFunctionParameterInt(2)
                InstructionButton(GetControlInstructionalButton(2, Config.CameraRightLeft, true))
                InstructionButtonMessage(Config.CameraRightLeftText)
                PopScaleformMovieFunctionVoid()
                
                PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
                PushScaleformMovieFunctionParameterInt(200)
                PopScaleformMovieFunctionVoid()
            
                PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
                PushScaleformMovieFunctionParameterInt(1)
                InstructionButton(GetControlInstructionalButton(1, Config.CameraDisconnect, true))
                InstructionButtonMessage(Config.CameraEnabledDisconnectText)
                PopScaleformMovieFunctionVoid()
            else
                PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
                PushScaleformMovieFunctionParameterInt(200)
                PopScaleformMovieFunctionVoid()
                PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
                PushScaleformMovieFunctionParameterInt(1)
                InstructionButton(GetControlInstructionalButton(1, Config.CameraDisconnect, true))
                InstructionButtonMessage(Config.CameraDisabledDisconnectText)
                PopScaleformMovieFunctionVoid()
            end
            PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
            PopScaleformMovieFunctionVoid()
            PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieFunctionParameterInt(80)
            PopScaleformMovieFunctionVoid()
            return scaleform
        else
            return false
        end
    end
end
function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end
function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end
Citizen.CreateThread(function()
        while Config.RecordFootage do
            if(authorised)then
                if(createdCamera ~= 0 and not offline)then
                    if(not IsRecording())then
                        StartRecording(1)
                    end
                else
                    StopRecordingAndSaveClip()
                end
                    
            end
            Citizen.Wait(7) 
        end
end)

local found = false
Citizen.CreateThread(function()
        while Config.EnableHacking do
            if(authorised)then
                found = false
                for k, v in pairs(Config.HackLocations) do
                    if(globalPedPos ~= nil)then
                        if (GetDistanceBetweenCoords(globalPedPos.x, globalPedPos.y, globalPedPos.z, Config.HackLocations[k].location.x, Config.HackLocations[k].location.y, Config.HackLocations[k].location.z, true) <= Config.HackDistance) then
                            found = true
                            if(not hacking)then
                                cameraIdentifier = Config.HackLocations[k].cameras
                                if(type(cameraIdentifier) == "number")then
                                        if(Config.SecurityCameras.cameras[cameraIdentifier].isOnline)then
                                            DrawText3D(Config.HackLocations[k].location.x, Config.HackLocations[k].location.y, Config.HackLocations[k].location.z, Config.HackMessage)
                                            if (IsControlJustPressed(1, Config.HackButton)) then
                                                TriggerEvent("cameraSystem:client:startHacking", k, Config.HackLocations[k].isHacked)
                                            end
                                        else
                                            DrawText3D(Config.HackLocations[k].location.x, Config.HackLocations[k].location.y, Config.HackLocations[k].location.z, Config.RestoreMessage)
                                            if (IsControlJustPressed(1, Config.HackButton)) then
                                                TriggerEvent("cameraSystem:client:startRestoring", k, Config.HackLocations[k].isHacked)
                                            end
                                        end
                                    
                                else
                                    local checker = true
                                    for k, v in pairs(Config.MultipleCameraHackingLocations[cameraIdentifier]) do
                                        if(not Config.SecurityCameras.cameras[v].isOnline)then
                                            checker = false
                                        end
                                    end
                                    if(checker)then
                                        DrawText3D(Config.HackLocations[k].location.x, Config.HackLocations[k].location.y, Config.HackLocations[k].location.z, Config.HackMessage)
                                        if (IsControlJustPressed(1, Config.HackButton)) then
                                            TriggerEvent("cameraSystem:client:startHacking", k)
                                        end
                                    else
                                        DrawText3D(Config.HackLocations[k].location.x, Config.HackLocations[k].location.y, Config.HackLocations[k].location.z, Config.RestoreMessage)
                                        if (IsControlJustPressed(1, Config.HackButton)) then
                                            TriggerEvent("cameraSystem:client:startRestoring", k)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if not found then
                    Citizen.Wait(1000)
                end
            end
            Citizen.Wait(7)
        end
end)