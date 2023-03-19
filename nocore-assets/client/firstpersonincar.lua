local Framework = exports['no-core']:GetCoreObject()

local disableV = false -- Prevents cam management
local wasInVehicle = false -- A check for if they were in the vehicle.
local disableAim = false -- Variable used to check if their aim should be disabled whilst in a vehicle.
local changeCooldown, lastView = 0, 0

local function setViewMode(viewmode)
    for i = 1, 7 do
        SetCamViewModeForContext(i, viewmode)
    end
    SetFollowPedCamViewMode(viewmode)
    SetFollowVehicleCamViewMode(viewmode)
end

local shouldDisable = false;

local function forceFp(plyId)
    SetCamEffect(0)
    local currCam, currVehCam = GetFollowPedCamViewMode(), GetFollowVehicleCamViewMode()
    if currCam ~= 4 or currVehCam ~= 4 then
        lastView = GetFollowPedCamViewMode()
        setViewMode(4)
        changeCooldown = GetGameTimer() + 2500
        shouldDisable = true
    elseif currCam == 0 then
        SetPlayerCanDoDriveBy(plyId, false)
        disableAim = true
    end

    if GetCamViewModeForContext(GetCamActiveViewModeContext()) ~= 4 then 
        SetPlayerCanDoDriveBy(plyId, false)
        disableAim = true
    elseif disableAim then
        disableAim = false
        SetPlayerCanDoDriveBy(plyId, true)
    end

    disableV = true
end



local function exitFp(plyId)
    shouldDisable = true;
    local currCam = GetFollowPedCamViewMode()
    if currCam == 1 or currCam == 2 then
        if wasInVehicle then 
            SetFollowPedCamViewMode(0)
            SetFollowVehicleCamViewMode(0)
            while GetFollowPedCamViewMode() ~= 0 do
                Wait(0)
                SetFollowPedCamViewMode(0)
                SetFollowVehicleCamViewMode(0)
            end
        else
            setViewMode(4)
            shouldDisable = true
        end
    end
    if disableAim then SetPlayerCanDoDriveBy(plyId, true) disableAim = false end;
    wasInVehicle = false
end

CreateThread(function() Wait(250)
    local plyId = PlayerId()

   
    SetPlayerLockon(plyId, false)
    
    while true do
        Wait(0)

        local plyPed = PlayerPedId()
        local isArmed, isAiming = IsPedArmed(plyPed, 4) and GetSelectedPedWeapon(plyPed) ~= -1569615261, IsPlayerFreeAiming(plyId)

        if not isAiming then
            isAiming = IsAimCamActive()
        end

        if isArmed then
            if disableV then DisableControlAction(1, 0, true) end
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end

        if isAiming and isArmed then
            local inVehicle = GetVehiclePedIsIn(plyPed, false) ~= 0
            if inVehicle and isAiming then
                wasInVehicle = true
                if shouldDisable and not disableAim then
                    SetPlayerCanDoDriveBy(plyId, false)
                    shouldDisable = false;
                    disableAim = true;
                    while IsAimCamActive() do Wait(100) end
                    Wait(300)
                end
                forceFp(plyId)
            else
                disableV = false
                exitFp(plyId)
            end
        else
            if changeCooldown ~= 0 then
                if changeCooldown < GetGameTimer() then
                    changeCooldown = 0
                    setViewMode(lastView)
                end
            end
            local currCam = GetFollowPedCamViewMode()
            local currVehCam = GetFollowVehicleCamViewMode()
            if currCam == 2 or currVehCam == 2 then 
                setViewMode(4)
                shouldDisable = true
            end
            if disableAim then 
                SetPlayerCanDoDriveBy(plyId, true) 
                disableAim = false 
            end
            disableV = false
        end

    end
end)

local vehicleHoodFp = false;
local wideScreen = false;

CreateThread(function()
    while true do
        Wait(2500)
        if GetProfileSetting(243) == 1 then
            if not vehicleHoodFp then
                exports['okokTextUI']:Open('<b>Изключи "First Person Vehicle Hood" от настройките.</b>', 'purple', 'right')
                vehicleHoodFp = true;
                FreezeEntityPosition(PlayerPedId(), vehicleHoodFp)
            end
        elseif vehicleHoodFp then
            vehicleHoodFp = false;
            FreezeEntityPosition(PlayerPedId(), vehicleHoodFp)
            Framework.Functions.Notify('Благодаря :)', 'info', 5000)
            exports['okokTextUI']:Close()
        end
    end
end)

CreateThread(function()
    while true do
        Wait(2500)
        if not GetIsWidescreen() then
            if not wideScreen then
                exports['okokTextUI']:Open('<b>Сложи си widescreen резолюция, като 5:3, 16:9, 16:10 и т.н. :)</b>', 'purple', 'right')
                wideScreen = true;
                FreezeEntityPosition(PlayerPedId(), wideScreen)
            end
        elseif wideScreen then
            wideScreen = false;
            FreezeEntityPosition(PlayerPedId(), wideScreen)
            Framework.Functions.Notify('Благодаря :)', 'info', 5000)
            exports['okokTextUI']:Close()
        end
    end
end)