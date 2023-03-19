local Framework = exports['no-core']:GetCoreObject()
local playerJob = nil
local garbageVehicle = nil
local hasBag = false
local currentStop = 0
local deliveryBlip = nil
local amountOfBags = 0
local garbageObject = nil
local endBlip = nil
local garbageBlip = nil
local canTakeBag = true
local currentStopNum = 0
local PZone = nil
local listen = false

-- Handlers

local function setupClient()
    garbageVehicle = nil
    hasBag = false
    currentStop = 0
    deliveryBlip = nil
    amountOfBags = 0
    garbageObject = nil
    endBlip = nil
    currentStopNum = 0
    if playerJob.name == "garbage" then
        garbageBlip = AddBlipForCoord(Garbage.Locations["main"].coords.x, Garbage.Locations["main"].coords.y, Garbage.Locations["main"].coords.z)
        SetBlipSprite(garbageBlip, 318)
        SetBlipDisplay(garbageBlip, 4)
        SetBlipScale(garbageBlip, 1.0)
        SetBlipAsShortRange(garbageBlip, true)
        SetBlipColour(garbageBlip, 39)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Garbage.Locations["main"].label)
        EndTextCommandSetBlipName(garbageBlip)
    end
end

-- Functions

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function DrawText3D2(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function LoadAnimation(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
end

local function BringBackCar()
    DeleteVehicle(garbageVehicle)
    if endBlip then
        RemoveBlip(endBlip)
    end
    if deliveryBlip then
        RemoveBlip(deliveryBlip)
    end
    garbageVehicle = nil
    hasBag = false
    currentStop = 0
    deliveryBlip = nil
    amountOfBags = 0
    garbageObject = nil
    endBlip = nil
    currentStopNum = 0
end

local function SetRouteBack()
    local inleverpunt = Garbage.Locations["vehicle"]
    endBlip = AddBlipForCoord(inleverpunt.coords.x, inleverpunt.coords.y, inleverpunt.coords.z)
    SetBlipSprite(endBlip, 1)
    SetBlipDisplay(endBlip, 2)
    SetBlipScale(endBlip, 1.0)
    SetBlipAsShortRange(endBlip, false)
    SetBlipColour(endBlip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Garbage.Locations["vehicle"].name)
    EndTextCommandSetBlipName(endBlip)
    SetBlipRoute(endBlip, true)
end

local function AnimCheck()
    CreateThread(function()
        while hasBag do
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 3) then
                ClearPedTasksImmediately(ped)
                LoadAnimation('missfbi4prepp1')
                TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
            end
            Wait(200)
        end
    end)
end

local function TakeAnim()
    local ped = PlayerPedId()
    LoadAnimation('missfbi4prepp1')
    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
    garbageObject = CreateObject(`prop_cs_rub_binbag_01`, 0, 0, 0, true, true, true)
    AttachEntityToEntity(garbageObject, ped, GetPedBoneIndex(ped, 57005), 0.12, 0.0, -0.05, 220.0, 120.0, 0.0, true, true, false, true, 1, true)
    AnimCheck()
end

local function DeliverAnim()
    local ped = PlayerPedId()
    LoadAnimation('missfbi4prepp1')
    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_throw_garbage_man', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, GetEntityHeading(garbageVehicle))
    canTakeBag = false
    SetTimeout(1250, function()
        DetachEntity(garbageObject, 1, false)
        DeleteObject(garbageObject)
        TaskPlayAnim(ped, 'missfbi4prepp1', 'exit', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
        FreezeEntityPosition(ped, false)
        garbageObject = nil
        canTakeBag = true
    end)
end

local function RunWorkLoop()
    CreateThread(function()
        local GarbText = false
        while listen do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local DeliveryData = Garbage.Locations["trashcan"][currentStop]
            local Distance = #(pos - vector3(DeliveryData.coords.x, DeliveryData.coords.y, DeliveryData.coords.z))
            if Distance < 15 or hasBag then
                LoadAnimation('missfbi4prepp1')
                DrawMarker(2, DeliveryData.coords.x, DeliveryData.coords.y, DeliveryData.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 105, 53, 189, 255, false, false, false, false, false, false, false)

                if not hasBag and canTakeBag then
                    if Distance < 1.5 then
                        if not GarbText then
                            GarbText = true
                            exports['okokTextUI']:Open("[E] Вземи", 'purple', 'right')
                        end
                        if IsControlJustPressed(0, 51) then
                            hasBag = true
                            exports['okokTextUI']:Close()
                            TakeAnim()
                        end
                    elseif Distance < 10 then
                        if GarbText then
                            GarbText = false
                            exports['okokTextUI']:Close()
                        end
                        DrawText3D2(DeliveryData.coords, "Застанете тук, за да вземете торба за боклук")
                    end
                else
                    if DoesEntityExist(garbageVehicle) then
                        local Coords = GetOffsetFromEntityInWorldCoords(garbageVehicle, 0.0, -4.5, 0.0)
                        local TruckDist = #(pos - Coords)
                        local TrucText = false

                        if Distance < 10 then
                            DrawText3D2(DeliveryData.coords, "Поставете чантата в камиона си.")
                        end

                        if TruckDist < 2 then
                            if not TrucText then
                                TrucText = true
                                exports['okokTextUI']:Open("[E] Хвърли", 'purple', 'right')
                            end
                            if IsControlJustPressed(0, 51) and hasBag then
                                Framework.Functions.Progressbar("deliverbag", "Хвърляне..", 1000, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                        disableInventory = true
                                    }, {}, {}, {}, function() -- Done
                                        hasBag = false
                                        -- Looks if you have delivered all bags
                                        if (amountOfBags - 1) <= 0 then
                                            Framework.Functions.TriggerCallback('garbagejob:server:NextStop', function(hasMoreStops, nextStop, newBagAmount)
                                                    if hasMoreStops and nextStop ~= 0 then
                                                        -- Here he puts your next location and you are not finished working yet.
                                                        currentStop = nextStop
                                                        currentStopNum = currentStopNum + 1
                                                        amountOfBags = newBagAmount
                                                        SetGarbageRoute()
                                                        Framework.Functions.Notify("Всички торби за боклук са готови, преминете към следващото място")
                                                        listen = false
                                                    else
                                                        if hasMoreStops and nextStop == currentStop then
                                                            Framework.Functions.Notify("Имаше проблем в депото, моля, върнете се незабавно!")
                                                            amountOfBags = 0
                                                        else
                                                            -- You are done with work here.
                                                            Framework.Functions.Notify("Приключили сте работа! Върнете се в депото.")
                                                            RemoveBlip(deliveryBlip)
                                                            SetRouteBack()
                                                            amountOfBags = 0
                                                            listen = false
                                                        end
                                                    end
                                                end, currentStop, currentStopNum, pos)
                                            hasBag = false
                                        else
                                            -- You haven't delivered all bags here
                                            amountOfBags = amountOfBags - 1
                                            if amountOfBags > 1 then
                                                Framework.Functions.Notify("Остават "..amountOfBags.." торби")
                                            else
                                                Framework.Functions.Notify("Остава "..amountOfBags.." торба")
                                            end
                                            hasBag = false
                                        end

                                        DeliverAnim()
                                        Wait(1500)
                                        if TrucText then
                                            exports['okokTextUI']:Close()
                                            TrucText = false
                                        end
                                    end, function() -- Cancel
                                    Framework.Functions.Notify("Отказано..", "error")
                                end)

                            end
                        elseif TruckDist < 10 then
                            DrawText3D(Coords.x, Coords.y, Coords.z, "Застанете тук")
                        end
                    else
                        Framework.Functions.Notify("Нямате камион", "error")
                        DeliverAnim()
                        hasBag = false
                    end
                end
            end
            Wait(1)
        end
    end)
end

local function CreateZone(x, y, z)
    CreateThread(function()
        PZone = CircleZone:Create(vector3(x, y, z), 15.0, {
            name = "NewRouteWhoDis",
            debugPoly = false,
        })

        PZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                listen = true
                RunWorkLoop()
            else
                exports['okokTextUI']:Close()
                listen = false
            end
        end)
    end)
end

local function DeleteZone()
    listen = false
    PZone:destroy()
end

function SetGarbageRoute()
    local CurrentLocation = Garbage.Locations["trashcan"][currentStop]
    if deliveryBlip then
        RemoveBlip(deliveryBlip)
    end
    deliveryBlip = AddBlipForCoord(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipDisplay(deliveryBlip, 2)
    SetBlipScale(deliveryBlip, 1.0)
    SetBlipAsShortRange(deliveryBlip, false)
    SetBlipColour(deliveryBlip, 27)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Garbage.Locations["trashcan"][currentStop].name)
    EndTextCommandSetBlipName(deliveryBlip)
    SetBlipRoute(deliveryBlip, true)

    if PZone then
        DeleteZone()
        Wait(500)
        CreateZone(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    else
        CreateZone(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    end
end

local pedsSpawned = false
local function spawnPeds()
    if not Garbage.Peds or not next(Garbage.Peds) or pedsSpawned then return end
    for i = 1, #Garbage.Peds do
        local current = Garbage.Peds[i]
        current.model = type(current.model) == 'string' and GetHashKey(current.model) or current.model
        RequestModel(current.model)
        while not HasModelLoaded(current.model) do
            Wait(0)
        end
        local ped = CreatePed(0, current.model, current.coords, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        current.pedHandle = ped

        exports['nocore-eye']:AddTargetEntity(ped, {
            options = {
                {
                    type = "client",
                    event = "nocore-garbagejob:client:MainMenu",
                    label = 'Говори с Човек',
                    icon = 'fa-solid fa-recycle',
                    job = "garbage",
                }
            },
            distance = 2.0
        })
    end
    pedsSpawned = true
end

local function deletePeds()
    if not Garbage.Peds or not next(Garbage.Peds) or not pedsSpawned then return end
    for i = 1, #Garbage.Peds do
        local current = Garbage.Peds[i]
        if current.pedHandle then
            DeletePed(current.pedHandle)
        end
    end
end

-- Events

RegisterNetEvent('garbagejob:client:SetWaypointHome', function()
    SetNewWaypoint(Garbage.Locations["main"].coords.x, Garbage.Locations["main"].coords.y)
end)

RegisterNetEvent('nocore-garbagejob:client:RequestRoute', function()
    Framework.Functions.TriggerCallback('garbagejob:server:NewShift', function(shouldContinue, firstStop, totalBags)
        if shouldContinue then

            local coords = Garbage.Locations["vehicle"].coords
            Framework.Functions.TriggerCallback('Framework:Server:SpawnVehicle', function(netId)
                local veh = NetToVeh(netId)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- hopefully this fixes an issue if something is delayed they'll get crushed
                SetVehicleEngineOn(veh, true, true)
                garbageVehicle = veh
                SetVehicleNumberPlateText(veh, "GARB" .. tostring(math.random(1000, 9999)))
                SetEntityHeading(veh, coords.w)
                exports['nocore-fuel']:SetFuelLevel(veh, GetVehicleNumberPlateText(veh), 100, true)
                SetVehicleFixed(veh)
                SetEntityAsMissionEntity(veh, true, true)
                exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(veh), true)
                currentStop = firstStop
                currentStopNum = 1
                amountOfBags = totalBags
                SetGarbageRoute()
                Framework.Functions.Notify("Вие заплатихте "..Garbage.TruckPrice.." за камион")
                Framework.Functions.Notify("Започнахте работа, местоположението е отбелязано в GPS!")
            end, Garbage.Vehicle, coords, true)
        else
            Framework.Functions.Notify("Нямате достатъчно пари (Необходими "..Garbage.TruckPrice.."$")
        end
    end)
end)

RegisterNetEvent('nocore-garbagejob:client:RequestPaycheck', function()
    if garbageVehicle then
        BringBackCar()
        Framework.Functions.Notify("Камионът е върнат, вземете фиша си, за да получите заплатата и депозита си обратно!")
    end

    TriggerServerEvent('garbagejob:server:PayShift')
end)

RegisterNetEvent('nocore-garbagejob:client:MainMenu', function()
    local MainMenu = {
        {
            isMenuHeader = true,
            header = "Меню"
        },
        {
            header = "Събиране на заплата",
            txt = "Върнете камиона и вземете заплатата си тук!",
            params = {
                event = 'nocore-garbagejob:client:RequestPaycheck',
            }
        },
        {
            header = "Вземете маршрут",
            txt = "Поискайте маршрут за събиране на боклук",
            params = {
                event = 'nocore-garbagejob:client:RequestRoute',
            }
        }
    }

    exports['nocore-context']:openMenu(MainMenu)
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    playerJob = Framework.Functions.GetPlayerData().job
    setupClient()
    deletePeds()
    spawnPeds()
end)

RegisterNetEvent('Framework:Client:OnJobUpdate', function(JobInfo)
    playerJob = JobInfo
    if garbageBlip then
        RemoveBlip(garbageBlip)
    end
    setupClient()
    spawnPeds()
end)

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        if garbageObject then
            DeleteEntity(garbageObject)
            garbageObject = nil
        end
        deletePeds()
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        playerJob = Framework.Functions.GetPlayerData().job
        setupClient()
        spawnPeds()
    end
end)
