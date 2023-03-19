local Framework = exports['no-core']:GetCoreObject()
local CheckingPress = false
local PlayerJob = {}
local onDuty = false
local JobBlip = nil
local TowLocation
local Multiplier = 1

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Framework.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            if PlayerData.job.onduty then
                if PlayerData.job.name == "mechanic" then
                    TriggerServerEvent("Framework:ToggleDuty", false)
                end
            end
            Wait(300)
            Framework.Functions.TriggerCallback("nocore-tow:server:get:Mechanic", function(Mechanic)
                Mechanic = Mechanic
            end)
        end)
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "mechanic" then
                TriggerServerEvent("Framework:ToggleDuty", false)
            end
        end
        Wait(300)
        Framework.Functions.TriggerCallback("nocore-tow:server:get:Mechanic", function(Mechanic)
            Mechanic = Mechanic
        end)
    end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(duty)
    onDuty = duty
end)

CreateThread(function ()
    for k, v in pairs(Mechanic.Polys) do
        local MechanicPolys = BoxZone:Create(v.coords, v.length, v.width, {
            name="mechanicpoly".. k,
            heading=v.heading,
            debugPoly=Mechanic.Debug,
            minZ=v.coords.z - 4,
            maxZ=v.coords.z + 4
        })
        MechanicPolys:onPlayerInOut(function(isPointInside)
            if isPointInside then
                if IsPedInAnyVehicle(PlayerPedId()) then
                    exports['okokTextUI']:Open('<b>[E] Прибери МПС</b>', 'purple', 'right')
                    CheckForPress()
                end
            else
                exports['okokTextUI']:Close()
                CheckingPress = false
            end
        end)
    end
    exports['nocore-eye']:AddBoxZone("MechanicDuty", vector3(-687.87, -790.19, 32.77), 0.8, 0.8, {
        name = "MechanicDuty",
        heading = 180,
        debugPoly = Mechanic.Debug,
        minZ = 32.0,
        maxZ = 33.6
    }, {
        options = {
            {
                event = "nocore-police:client:ToggleDuty",
                icon = "fas fa-dot-circle",
                label = "Влез/Излез от смяна",
                job = 'mechanic'
            },
            {
                event = "nocore-mechanicjob:client:open:vehicle:menu",
                icon = "fas fa-key",
                label = "Ключове",
                job = 'mechanic',
            },
            {
                type = 'server',
                event = 'nocore-tow:server:recieve:payment',
                icon = 'fas fa-money-bill-1',
                label = 'Вземи заплата',
                job = 'mechanic',
                canInteract = function ()
                    return Mechanic.JobData[Framework.Functions.GetPlayerData().citizenid] and Mechanic.JobData[Framework.Functions.GetPlayerData().citizenid]['Payment'] > 0
                end
            }
        },
        distance = 1.5
    })
end)

function CheckForPress()
    CheckingPress = true
    CreateThread(function()
        while CheckingPress do
            Wait(1)
            if IsControlJustReleased(0, 38) then
                exports['okokTextUI']:Close()
                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                CheckingPress = false
                return
            end
        end
    end)
end

local function TowLoop(bool)
    while bool do
        Wait(4)
        if LocalPlayer.state.isLoggedIn then
            if PlayerJob.name == 'mechanic' then
                NearAnything = false
                local PlayerCoords = GetEntityCoords(PlayerPedId())
                if Mechanic.CurrentNpc ~= nil then
                    local Distance = #(PlayerCoords - vector3(Mechanic.TowLocations[Mechanic.CurrentNpc]['Coords']['X'], Mechanic.TowLocations[Mechanic.CurrentNpc]['Coords']['Y'], Mechanic.TowLocations[Mechanic.CurrentNpc]['Coords']['Z']))
                    if Distance <= 100.0 and not HasVehicleSpawned then
                        NearAnything = true
                        HasVehicleSpawned = true
                        SpawnTowVehicle(Mechanic.TowLocations[Mechanic.CurrentNpc]['Coords'], Mechanic.TowLocations[Mechanic.CurrentNpc]['Model'])
                    end
                end
                if not NearAnything then
                    Wait(1500)
                end
            else
                Wait(1500)
            end
        else
            Wait(1500)
        end
    end
end

RegisterNetEvent('nocore-mechanicjob:client:open:vehicle:menu', function(data)
    local sendMenu = {}
    sendMenu[#sendMenu+1] = {
        id = 1,
        header = "Работни Коли",
        txt = "",
        isMenuHeader = true
    }
    for k, v in pairs(Mechanic.AllowedVehicles) do
        sendMenu[#sendMenu+1] = {
            id = #sendMenu+1,
            header = v.label,
            txt = '',
            params = { 
                event = "nocore-mechanicjob:client:SpawnCar",
                args = {
                    car = k,
                    serviz = data.serviz
                }
            }
        }
    end
    sendMenu[#sendMenu+1] = {
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        params = { 
            event = "nocore-mechanicjob:client:fakeevent",
            args = {}
        }
    }
    exports['nocore-context']:openMenu(sendMenu)
end)

RegisterNetEvent('nocore-mechanicjob:client:SpawnCar', function(data)
    for k, v in pairs(Mechanic.Services) do
        if PlayerJob.name == tostring(k) then
            local coords = v.vehicleSpawn
            if Framework.Functions.IsSpawnPointClear(coords, 4) then
                Framework.Functions.SpawnVehicle(Mechanic.AllowedVehicles[data.car].model, function(veh)
                    SetVehicleNumberPlateText(veh, "MEH"..tostring(math.random(1000, 9999)))
                    SetEntityHeading(veh, coords.h)
                    exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(veh), true)
                    exports['nocore-fuel']:SetFuelLevel(veh, GetVehicleNumberPlateText(veh), 100.0, false)
                    SetVehicleEngineOn(veh, true, true)
                    dutyPlate = GetVehicleNumberPlateText(veh)
                    SetVehicleExtra(veh, 2, true)
                    SetVehicleLivery(veh, 2)
                    Framework.Functions.Notify('Изкарахте репатрак', 'success', 5000)
                end, coords, false)
            else
                Framework.Functions.Notify('На мястото за изкарване има кола, моля отместете я!', 'error', 5000)
            end
        end
    end
end)

RegisterNetEvent('nocore-mechanic:client:open:stash', function()
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "Autocare")
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "Autocare", {
        maxweight = 4000000,
        slots = 500,
    })
    TriggerEvent("nocore-sound:client:play", "stash-open", 0.4)
end)

RegisterNetEvent('nocore-tow:client:add:towed', function(CitizenId, Payment, Type)
    if Type == 'Add' then
        if Mechanic.JobData[CitizenId] ~= nil then
            Mechanic.JobData[CitizenId]['Payment'] = Mechanic.JobData[CitizenId]['Payment'] + Payment
        else
            Mechanic.JobData[CitizenId] = {
                ['Payment'] = 0 + Payment
            }
        end
    elseif Type == 'Set' then
        Mechanic.JobData[CitizenId]['Payment'] = Payment
    end
end)

RegisterNetEvent('nocore-tow:client:toggle:npc', function()
    if not Mechanic.IsDoingNpc then
        Mechanic.IsDoingNpc = true
        SetRandomPickupVehicle()

        local playerCoords = GetEntityCoords(PlayerPedId())

        local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, TowLocation['X'],
                                TowLocation['Y'], TowLocation['Z'])

        if distance <= 1000 then
            Multiplier = 1
        elseif distance > 1000 and distance <= 2000 then
            Multiplier = 2
        elseif distance > 2000 and distance <= 5000 then
            Multiplier = 3
        elseif distance > 5000 and distance <= 7500 then
            Multiplier = 4
        else
            Multiplier = 5
        end
        
        Framework.Functions.Notify("Започнахте работа. Карайте до мястото, за да вземете автомобила", 'success', 5500)
    else
        if Mechanic.CurrentTowedVehicle ~= nil then
            Framework.Functions.Notify("Все още работите по автомобила", 'error', 5500)
        else
            DeleteWaypoint()
            RemoveBlip(JobBlip)
            ResetAll()
            Framework.Functions.Notify("Спря поръчката", 'error', 5500)
        end
    end
end)

RegisterNetEvent('nocore-tow:client:hook:car', function()
    local TowVehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if IsVehicleValid(TowVehicle) then
        local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
        if Mechanic.CurrentTowedVehicle == nil and Mechanic.CitizenTowedVehicle == nil then
            if Distance <= 4.0 then
                if Vehicle ~= TowVehicle then
                    Framework.Functions.Progressbar("towing-vehicle", "Качване на репатрак", 5000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_ped",
                        flags = 16
                    }, {}, {}, function() -- Done
                        local distance
                        local isNpcCarModelValid

                        if Mechanic.IsDoingNpc then
                            local playerCoords = GetEntityCoords(PlayerPedId())

                            distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, TowLocation['X'],
                                TowLocation['Y'], TowLocation['Z'])

                            isNpcCarModelValid = joaat(Mechanic.TowLocations[Mechanic.CurrentNpc]['Model']) == GetEntityModel(Vehicle)
                        end

                        if Mechanic.IsDoingNpc and isNpcCarModelValid and distance <= 4 then
                            Mechanic.CurrentTowedVehicle = Vehicle

                            AttachVehicleToTow(Vehicle, TowVehicle)
                            SetNewWaypoint(391.41015, -1619.082)
                        else
                            Mechanic.CitizenTowedVehicle = Vehicle

                            AttachVehicleToTow(Vehicle, TowVehicle)
                        end
                    end, function() -- Cancel
                        Mechanic.CurrentTowedVehicle = nil
                        Mechanic.CitizenTowedVehicle = nil
                        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
                        Framework.Functions.Notify("Ти се провали", "error")
                    end)
                else
                    Framework.Functions.Notify("Не можете да закачите репатрак.", 'error', 5500)
                end
            else
                Framework.Functions.Notify("Няма автомобил?", 'error', 5500)
            end
        else
            Framework.Functions.Progressbar("untowing_vehicle", "Разкачане на автомобил", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 16
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)

                if Mechanic.CitizenTowedVehicle ~= nil then
                    FreezeEntityPosition(Mechanic.CitizenTowedVehicle, false)
                    Wait(250)
                    AttachEntityToEntity(Mechanic.CitizenTowedVehicle, TowVehicle, 20, -0.0, -15.0, 1.0, 0.0, 0.0, 0.0,
                        false, false, false, false, 20, true)

                    DetachEntity(Mechanic.CitizenTowedVehicle, true, true)
                    Mechanic.CitizenTowedVehicle = nil
                elseif exports['nocore-garages']:IsNearDepot() and Mechanic.CurrentTowedVehicle ~= nil and
                    Mechanic.IsDoingNpc then

                    FreezeEntityPosition(Mechanic.CurrentTowedVehicle, false)
                    Wait(250)
                    AttachEntityToEntity(Mechanic.CurrentTowedVehicle, TowVehicle, 20, -0.0, -15.0, 1.0, 0.0, 0.0, 0.0,
                        false, false, false, false, 20, true)
                    DetachEntity(Mechanic.CurrentTowedVehicle, true, true)
                    Framework.Functions.Notify("Автомобилът е доставен", 'success')
                    Framework.Functions.DeleteVehicle(Mechanic.CurrentTowedVehicle)

                    TriggerServerEvent('nocore-tow:server:add:towed', Multiplier)
                    ResetAll()
                    Mechanic.CurrentTowedVehicle = nil
                end
                Framework.Functions.Notify("Премахване на автомобил")
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
                Framework.Functions.Notify("Ти се провали", "error")
            end)
        end
        -- end
    else
        Framework.Functions.Notify("Не си на репатрак", 'error', 5500)
    end
end)

function AttachVehicleToTow(Vehicle, TowVehicle)
    StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
    AttachEntityToEntity(Vehicle, TowVehicle, GetEntityBoneIndexByName(TowVehicle, 'bodyshell'), 0.0, -1.5 + -0.85,
        0.0 + 1.15, 0, 0, 0, 1, 1, 0, 1, 0, 1)
    Wait(150)
    RemoveBlip(JobBlip)
    FreezeEntityPosition(Vehicle, true)
    Framework.Functions.Notify("Автомобилът е закачен, карайте го към депото", "success")
end

function IsVehicleValid(TowVehicle)
    if GetEntityModel(TowVehicle) == joaat(Mechanic.TowVehicle) then
        return true
    else
        return false
    end
end

function SetRandomPickupVehicle()
    local RandomVehicle = math.random(1, #Mechanic.TowLocations)

    TowLocation = Mechanic.TowLocations[RandomVehicle]['Coords']
    CreateTowBlip(TowLocation)

    Mechanic.CurrentNpc = RandomVehicle
    TowLoop(true)
end

function SpawnTowVehicle(Coords, Model)
    local CoordsTable = {
        x = Coords['X'],
        y = Coords['Y'],
        z = Coords['Z'],
        a = Coords['H']
    }
    Framework.Functions.SpawnVehicle(Model, function(Vehicle)
        Wait(150)
        exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 0.0, false)
        DoCarDamage(Vehicle)
    end, CoordsTable, true, false)
end

function CreateTowBlip(Coords)
    local TowBlip = AddBlipForCoord(Coords['X'], Coords['Y'], Coords['Z'])
    SetBlipSprite(TowBlip, 595)
    SetBlipDisplay(TowBlip, 4)
    SetBlipScale(TowBlip, 0.48)
    SetBlipAsShortRange(TowBlip, true)
    SetBlipColour(TowBlip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Репатрак")
    EndTextCommandSetBlipName(TowBlip)
    SetNewWaypoint(Coords['X'], Coords['Y'])
    JobBlip = TowBlip
end

function ResetAll()
    Mechanic.CurrentNpc = nil
    Mechanic.IsDoingNpc = false
    Mechanic.IsDointCitizenJob = false
    Mechanic.CurrentTowedVehicle = nil
    Mechanic.CitizenTowedVehicle = nil
    HasVehicleSpawned = false
    Multiplier = 1
    TowLoop(false)
end

function GetTowVehicle()
    HasOwnTowVehicle = true
    Framework.Functions.SpawnVehicle(Mechanic.TowVehicle, function(Vehicle)
        SetVehicleNumberPlateText(Vehicle, "TOWR" .. tostring(math.random(1000, 9999)))
        exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(Vehicle), true)
        Wait(100)
        exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 100, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
    end, nil, true, true)
end

function DoCarDamage(Vehicle)
    smash = false
    damageOutside = false
    damageOutside2 = false
    local engine = 199.0
    local body = 149.0
    if engine < 200.0 then
        engine = 200.0
    end

    if engine > 1000.0 then
        engine = 950.0
    end
    if body < 150.0 then
        body = 150.0
    end
    if body < 950.0 then
        smash = true
    end
    if body < 920.0 then
        damageOutside = true
    end
    if body < 920.0 then
        damageOutside2 = true
    end
    Wait(100)
    SetVehicleEngineHealth(Vehicle, engine)
    if smash then
        SmashVehicleWindow(Vehicle, 0)
        SmashVehicleWindow(Vehicle, 1)
        SmashVehicleWindow(Vehicle, 2)
        SmashVehicleWindow(Vehicle, 3)
        SmashVehicleWindow(Vehicle, 4)
    end
    if damageOutside then
        SetVehicleDoorBroken(Vehicle, 1, true)
        SetVehicleDoorBroken(Vehicle, 6, true)
        SetVehicleDoorBroken(Vehicle, 4, true)
    end
    if damageOutside2 then
        SetVehicleTyreBurst(Vehicle, 1, false, 990.0)
        SetVehicleTyreBurst(Vehicle, 2, false, 990.0)
        SetVehicleTyreBurst(Vehicle, 3, false, 990.0)
        SetVehicleTyreBurst(Vehicle, 4, false, 990.0)
    end
    if body < 1000 then
        SetVehicleBodyHealth(Vehicle, 985.1)
    end
end
