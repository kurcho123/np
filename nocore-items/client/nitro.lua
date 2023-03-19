local Framework = exports['no-core']:GetCoreObject()
local NitrousActivated = false
local NitrousBoost = 35.0
local VehicleNitrous = {}
local Fxs = {}
local particleId
local second
local Particles = {}
local function trim(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.TriggerCallback('nitrous:GetNosLoadedVehs', function(vehs)
        VehicleNitrous = vehs
    end)
end)

RegisterNetEvent('smallresource:client:LoadNitrous', function()
    local IsInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local platesend = GetVehicleNumberPlateText(veh)
    Framework.Functions.TriggerCallback('nitrous:HasSystem', function(system)
        if system then
            if not NitrousActivated then
                if IsInVehicle and not IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped))) then
                    if GetPedInVehicleSeat(veh, -1) == ped then
                        Framework.Functions.Progressbar("use_nos", "Инсталиране на нитро..", 15000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                            disableInventory = true,
                        }, {}, {}, {}, function() -- Done
                            TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['nitrous'], "remove")
                            TriggerServerEvent("Framework:Server:RemoveItem", 'nitrous', 1)
                            TriggerServerEvent('nitrous:server:LoadNitrous', trim(GetVehicleNumberPlateText(veh)))
                        end, function()
                            -- сложено само за да има иконка
                        end, 'fa-solid fa-meteor')
                    else
                        Framework.Functions.Notify("Трябва да сте на шофьорското място", "error")
                    end
                else
                    Framework.Functions.Notify('Трябва да сте в МПС', 'error')
                end
            else
                Framework.Functions.Notify('Вече имате активирано нитро', 'error')
            end
        else
            Framework.Functions.Notify('Тази кола няма нитро система', 'error')
        end
    end, exports['nocore-fakeplate']:GetRealPlate(platesend))
end)

local nosupdated = false

CreateThread(function()
    while true do
        local IsInVehicle = IsPedInAnyVehicle(PlayerPedId())
        local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
        if IsInVehicle then
            local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
            if VehicleNitrous[Plate] ~= nil then
                if VehicleNitrous[Plate].hasnitro then
                    if IsControlJustPressed(0, 36) and GetPedInVehicleSeat(CurrentVehicle, -1) == PlayerPedId() then
                        SetVehicleEnginePowerMultiplier(CurrentVehicle, NitrousBoost)
                        -- SetVehicleEngineTorqueMultiplier(CurrentVehicle, NitrousBoost)
                         SetEntityMaxSpeed(CurrentVehicle, 150.0)
                        NitrousActivated = true

                        CreateThread(function()
                            while NitrousActivated do
                                if VehicleNitrous[Plate].level - 0.5 ~= 0 then
                                    TriggerServerEvent('nitrous:server:UpdateNitroLevel', Plate, (VehicleNitrous[Plate].level - 0.5))
                                    TriggerEvent('hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, true)
                                    particleId = CreateVehicleLightTrail(CurrentVehicle, GetEntityBoneIndexByName(CurrentVehicle, "taillight_l"), 1.0)
                                    Particles[#Particles+1] = particleId
                                    second = CreateVehicleLightTrail(CurrentVehicle, GetEntityBoneIndexByName(CurrentVehicle, "taillight_r"), 1.0)
                                    Particles[#Particles+1] = second
                                else
                                    TriggerServerEvent('nitrous:server:UnloadNitrous', Plate)
                                    NitrousActivated = false
                                    SetVehicleBoostActive(CurrentVehicle, 0)
                                    SetVehicleEnginePowerMultiplier(CurrentVehicle, LastEngineMultiplier)
                                    SetVehicleEngineTorqueMultiplier(CurrentVehicle, 1.0)
                                    StopScreenEffect("RaceTurbo")
                                    for index,_ in pairs(Fxs) do
                                        StopParticleFxLooped(Fxs[index], 1)
                                        TriggerServerEvent('nitrous:server:StopSync', trim(GetVehicleNumberPlateText(CurrentVehicle)))
                                        Fxs[index] = nil
                                    end
                                    for k,v in pairs(Particles) do
                                        StopVehicleLightTrail(v, math.random(250,500))
                                    end
                                end
                                Wait(100)
                            end
                        end)
                    end

                    if IsControlJustReleased(0, 36) and GetPedInVehicleSeat(CurrentVehicle, -1) == PlayerPedId() then
                        if NitrousActivated then
                            local veh = GetVehiclePedIsIn(PlayerPedId())
                            SetVehicleBoostActive(veh, 0)
                            SetVehicleEnginePowerMultiplier(veh, LastEngineMultiplier)
                            SetVehicleEngineTorqueMultiplier(veh, 1.0)
                            for index,_ in pairs(Fxs) do
                                StopParticleFxLooped(Fxs[index], 1)
                                TriggerServerEvent('nitrous:server:StopSync', trim(GetVehicleNumberPlateText(veh)))
                                Fxs[index] = nil
                            end
                            StopScreenEffect("RaceTurbo")
                            TriggerEvent('hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, false)
                            NitrousActivated = false
                            for k,v in pairs(Particles) do
                                StopVehicleLightTrail(v, math.random(250,500))
                            end
                        end
                    end
                end
            else
                if not nosupdated then
                    TriggerEvent('hud:client:UpdateNitrous', false, nil, false)
                    nosupdated = true
                end
                StopScreenEffect("RaceTurbo")
            end
        else
            if nosupdated then
                nosupdated = false
            end
            StopScreenEffect("RaceTurbo")
            Wait(1500)
        end
        Wait(3)
    end
end)

p_flame_location = {
	"exhaust",
	"exhaust_2",
	"exhaust_3",
	"exhaust_4",
	"exhaust_5",
	"exhaust_6",
	"exhaust_7",
	"exhaust_8",
	"exhaust_9",
	"exhaust_10",
	"exhaust_11",
	"exhaust_12",
	"exhaust_13",
	"exhaust_14",
	"exhaust_15",
	"exhaust_16",
}

ParticleDict = "veh_xs_vehicle_mods"
ParticleFx = "veh_nitrous"
ParticleSize = 1.4

CreateThread(function()
    while true do
        if NitrousActivated then
            local veh = GetVehiclePedIsIn(PlayerPedId())
            if veh ~= 0 then
                TriggerServerEvent('nitrous:server:SyncFlames', VehToNet(veh))
                SetVehicleBoostActive(veh, 1)
                StartScreenEffect("RaceTurbo", 0.0, 0)

                for _,bones in pairs(p_flame_location) do
                    if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                        if Fxs[bones] == nil then
                            RequestNamedPtfxAsset(ParticleDict)
                            while not HasNamedPtfxAssetLoaded(ParticleDict) do
                                Wait(0)
                            end
                            SetPtfxAssetNextCall(ParticleDict)
                            UseParticleFxAssetNextCall(ParticleDict)
                            Fxs[bones] = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.02, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)
                        end
                    end
                end
            end
        end
        Wait(0)
    end
end)

function CreateVehicleLightTrail(vehicle, bone, scale)
    UseParticleFxAssetNextCall('core')
    local ptfx = StartParticleFxLoopedOnEntityBone('veh_light_red_trail', vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, scale, false, false, false)
    SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)
    return ptfx
end
  
function StopVehicleLightTrail(ptfx, duration)
    CreateThread(function()
      local startTime = GetGameTimer()
      local endTime = GetGameTimer() + duration
      while GetGameTimer() < endTime do 
        Wait(0)
        local now = GetGameTimer()
        local scale = (endTime - now) / duration
        SetParticleFxLoopedScale(ptfx, scale)
        SetParticleFxLoopedAlpha(ptfx, scale)
      end
      StopParticleFxLooped(ptfx)
      particleId = nil
      second = nil
    end)
end

local NOSPFX = {}

RegisterNetEvent('nitrous:client:SyncFlames', function(netid, nosid)
    local veh = NetToVeh(netid)
    if veh ~= 0 then
        local myid = GetPlayerServerId(PlayerId())
        if NOSPFX[trim(GetVehicleNumberPlateText(veh))] == nil then
            NOSPFX[trim(GetVehicleNumberPlateText(veh))] = {}
        end
        if myid ~= nosid then
            for _,bones in pairs(p_flame_location) do
                if NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones] == nil then
                    NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones] = {}
                end
                if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                    if NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones].pfx == nil then
                        RequestNamedPtfxAsset(ParticleDict)
                        while not HasNamedPtfxAssetLoaded(ParticleDict) do
                            Wait(0)
                        end
                        SetPtfxAssetNextCall(ParticleDict)
                        UseParticleFxAssetNextCall(ParticleDict)
                        NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones].pfx = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.05, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)

                    end
                end
            end
        end
    end
end)

RegisterNetEvent('nitrous:client:StopSync', function(plate)
    for k, v in pairs(NOSPFX[plate]) do
        StopParticleFxLooped(v.pfx, 1)
        NOSPFX[plate][k].pfx = nil
    end
end)

RegisterNetEvent('nitrous:client:UpdateNitroLevel', function(Plate, level)
    VehicleNitrous[Plate].level = level
end)

RegisterNetEvent('nitrous:client:LoadNitrous', function(Plate)
    VehicleNitrous[Plate] = {
        hasnitro = true,
        level = 100,
    }
    local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local CPlate = trim(GetVehicleNumberPlateText(CurrentVehicle))
    if CPlate == Plate then
        TriggerEvent('hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, false)
    end
end)

RegisterNetEvent('nitrous:client:UnloadNitrous', function(Plate)
    VehicleNitrous[Plate] = nil
    local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local CPlate = trim(GetVehicleNumberPlateText(CurrentVehicle))
    if CPlate == Plate then
        NitrousActivated = false
        TriggerEvent('hud:client:UpdateNitrous', false, nil, false)
    end
end)


RegisterCommand('putnitrous',function()
	local veh = GetVehiclePedIsIn(PlayerPedId())
	local plate = GetVehicleNumberPlateText(veh)
    if veh then
	    TriggerServerEvent('nitrous:Install', plate)
    end
end)