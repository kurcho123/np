local Framework = exports['no-core']:GetCoreObject()

local Base = Gardener.Config.Base
local Garage = Gardener.Config.Garage
local Type = nil
local AmountPayout = 0
local done = 0
local PlayerData = {}
-- local salary = nil

local onDuty = false
local hasCar = false
local inMenu = false
local wasTalked = false
local appointed = false
local waitingDone = false
local CanWork = false
local Paycheck = false

local hasOpenDoor = false
local hasBlower = false
local hasTrimmer = false
local hasLawnMower = false
local hasBackPack = false

local inReturnZone = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1250, function()
			if PlayerData.job ~= nil and PlayerData.job.name == 'gardener' then
				gardenjobblip()
			end
        end)
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
	Framework.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.job ~= nil and PlayerData.job.name == 'gardener' then
			gardenjobblip()
		end
	end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(job)
	PlayerData.job = job
	if PlayerData.job ~= nil and PlayerData.job.name == 'gardener' then
        gardenjobblip()
    end
end)

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

RegisterNetEvent('nocore-gardenjob:npc')
AddEventHandler('nocore-gardenjob:npc', function()
    if PlayerData.job ~= nil and PlayerData.job.name == 'gardener' then
        if not onDuty then
            Framework.Functions.Notify("Започна работа!")
            onDuty = true
            addGarageBlip()
            Framework.Functions.Notify("За да отвориш работното меню <b>[DEL]</b>")
        elseif onDuty then
            Framework.Functions.Notify("Приключи работа!")
            exports['okokTextUI']:Close()
            onDuty = false
            removeGarageBlip()
        end
    end
end)

RegisterNetEvent('nocore-gardenjob:npcgaraj')
AddEventHandler('nocore-gardenjob:npcgaraj', function()
    if onDuty then
        if not hasCar then
            Framework.Functions.TriggerCallback('nocore-gardenjob:checkMoney', function(hasMoney)
            if hasMoney then
                local gar = Gardener.Config.GarageSpawnPoint
                Framework.Functions.SpawnVehicle(Gardener.CompanyVehicle, function(vehicle)
                    SetVehicleNumberPlateText(vehicle, "GARD"..tostring(math.random(1000, 9999)))
                    SetVehicleEngineOn(vehicle, true, true)
                    Framework.Functions.Notify('Ти плати ' ..Gardener.DepositPrice.. '$ за автомобил')
                    hasCar = true
                    Plate = GetVehicleNumberPlateText(vehicle)
                    exports['nocore-vehiclekeys']:SetVehicleKey(Plate, true)
                    exports['nocore-fuel']:SetFuelLevel(vehicle, Plate, 100, false)
                end, gar.Pos1, true, false)
            else
                Framework.Functions.Notify("Нямаш достатъчно пари!")
            end
        end)
        elseif hasCar then
            Framework.Functions.Notify("Първо прибери колата която си изкарал")
        end
    end
end)

RegisterNetEvent('nocore-gardenjob:priberikola')
AddEventHandler('nocore-gardenjob:priberikola', function()
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, false) then
        if hasCar then
            Framework.Functions.TriggerCallback('nocore-gardenjob:returnVehicle', function(func)
            end)
            ReturnVehicle()
            Framework.Functions.Notify('Ти получи ' ..Gardener.DepositPrice.. '$ за връщането на автомобила')
            hasCar = false
            Plate = nil
        else
            Framework.Functions.Notify("Не си платил депозит за този автомобил!")
        end
    else
        Framework.Functions.Notify("Трябва да си в колата за да я прибереш", 'error')
    end
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

            if PlayerData.job ~= nil and PlayerData.job.name == 'gardener' then
                if onDuty then
                    if not inMenu then
                        sleep = 2
                        if IsControlJustPressed(0, Keys["DEL"]) then
                            inMenu = true
                        end
                    elseif inMenu then
                        sleep = 2
                        exports['okokTextUI']:Open('[G] - Търси работа<br>[H] - Прекрати работа', 'purple', 'left')
                        if IsControlJustPressed(0, Keys["DEL"]) then
                            inMenu = false
                            exports['okokTextUI']:Close()
                        elseif IsControlJustPressed(0, Keys["G"]) then
                            if Type == nil then
                                inMenu = false
                                exports['okokTextUI']:Close()
                                Framework.Functions.Notify("Търсиш клиент...")
                                Citizen.Wait(15000)
                                Gardens = Randomize(Gardener.Gardens)
                                CreateWork(Gardens.StreetHouse)
                                Framework.Functions.Notify("GPS-а е зададен, карай натам " ..Gardens.StreetHouse)
                                -- salary = math.random(65, 85)
                                if Type == "Rockford Hills" then
                                    for i, v in ipairs(Gardener.RockfordHills) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                elseif Type == "West Vinewood" then
                                    for i, v in ipairs(Gardener.WestVinewood) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                elseif Type == "Vinewood Hills" then
                                    for i, v in ipairs(Gardener.VinewoodHills) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                elseif Type == "El Burro Heights" then
                                    for i, v in ipairs(Gardener.ElBurroHeights) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                elseif Type == "Richman" then
                                    for i, v in ipairs(Gardener.Richman) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                elseif Type == "Mirror Park" then
                                    for i, v in ipairs(Gardener.MirrorPark) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                elseif Type == "East Vinewood" then
                                    for i, v in ipairs(Gardener.EastVinewood) do
                                        SetNewWaypoint(v.x, v.y, v.z)
                                    end
                                end
                            else
                                Framework.Functions.Notify("Вече имаш клиент!")
                            end
                        elseif IsControlJustPressed(0, Keys["H"]) then
                            if Type then
                                CancelWork()
                                DeleteWaypoint()
                                Framework.Functions.Notify("Прекрати сделката")
                            elseif not Type then
                                Framework.Functions.Notify("В момента нямаш работа")
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

-- OPENING VAN DOORS
Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

            if hasCar then
                if not IsPedInAnyVehicle(ped, false) then
                    if Plate == GetVehicleNumberPlateText(vehicle) then
                        local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.0, 0)
                        if (GetDistanceBetweenCoords(coords.x, coords.y, coords.z, trunkpos.x, trunkpos.y, trunkpos.z, true) < 2) then
                            if not hasOpenDoor then
                                sleep = 5
                                DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.4, "~p~[G]~s~ - Отвори вратите")
                                if IsControlJustReleased(0, Keys["G"]) then
                                    LocalPlayer.state:set("inv_busy", true, true)
                                    Framework.Functions.Progressbar("plant-weed", "Отваряш вратите..", 1500, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = true,
                                        disableInventory = true,
                                    }, {}, {}, {}, function() -- Done
                                        SetVehicleDoorOpen(vehicle, 3, false, false)
                                        SetVehicleDoorOpen(vehicle, 2, false, false)
                                        hasOpenDoor = true
                                        LocalPlayer.state:set("inv_busy", false, true)
                                    end, function()
                                        LocalPlayer.state:set("inv_busy", false, true)
                                        ClearPedTasks(PlayerPedId())
                                        Framework.Functions.Notify("Прекратено..", "error")
                                    end)
                                end
                            elseif hasOpenDoor then
                                if not hasBlower and not hasLawnMower and not hasTrimmer and not hasBackPack then
                                    sleep = 5
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.7, "~p~[E]~s~ - Духалка за листа | ~p~[K]~s~ Раница за поливане")
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.5, "~p~[Z]~s~ - Тример | ~p~[X]~s~ - Косачка")
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.3, "~r~[G]~s~ - Затвори вратите")
                                    if IsControlJustReleased(0, Keys["G"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Затваряш вратите..", 1500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            SetVehicleDoorShut(vehicle, 3, false)
                                            SetVehicleDoorShut(vehicle, 2, false)
                                            hasOpenDoor = false
                                            LocalPlayer.state:set("inv_busy", false, true)
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    elseif IsControlJustReleased(0, Keys["E"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Взимаш духалката..", 1500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            addLeafBlower()
                                            hasBlower = true
                                            LocalPlayer.state:set("inv_busy", false, true)
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    elseif IsControlJustReleased(0, Keys["K"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Взимаш раницата..", 1500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            addBackPack()
                                            hasBackPack = true
                                            LocalPlayer.state:set("inv_busy", false, true)
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    elseif IsControlJustReleased(0, Keys["Z"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Взимаш тримера..", 1500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            addTrimmer()
                                            hasTrimmer = true
                                            LocalPlayer.state:set("inv_busy", false, true)
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    elseif IsControlJustReleased(0, Keys["X"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Взимаш косачката..", 1500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            addLawnMower()
                                            hasLawnMower = true
                                            DisableControlAction(0, 21)
                                            LocalPlayer.state:set("inv_busy", false, true)
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    end
                                elseif hasLawnMower or hasBlower or hasBackPack or hasTrimmer then
                                    sleep = 5
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.5, "~p~[E]~s~ - Прибери инструмента")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Прибираш инструментите..", 1500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {}, {}, {}, function() -- Done
                                            removeLawnMower()
                                            removeBackPack()
                                            removeLeafBlower()
                                            removeTrimmer()
                                            hasLawnMower = false
                                            hasBlower = false
                                            hasTrimmer = false
                                            hasBackPack = false
                                            EnableControlAction(0, 21, true)
                                            ClearPedTasks(ped)
                                            LocalPlayer.state:set("inv_busy", false, true)
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

            if Type == 'Rockford Hills' then
                for i, v in ipairs(Gardener.RockfordHills) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, 'Здрасти, искаш ли да ми почистиш градината?')
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Изчисти от плевели")
                                    BlipsWorkingRH()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Ок , ще си намеря друг градинар!")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Супер! Като си готов ще те чакам пред вратата")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Не си изчистил всичко")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Изглежда супер , ето ти парите")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports['okokTextUI']:Close()
                                                TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                    Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                end)
                                                RequestAnimDict('mp_common')
                                                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                RequestAnimDict('mp_common')
                                                TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                Citizen.Wait(3500)
                                                ClearPedTasks(ped)
                                                CancelWork()
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.RockfordHillsWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        Framework.Functions.Progressbar("plant-weed", "Изкореняваш плевели...", 3500, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {
                                            animDict = "amb@world_human_gardener_plant@male@enter",
                                            anim = "enter",
                                            flags = 16,
                                        }, {}, {}, function() -- Done
                                            v.taked = true
                                            RemoveBlip(v.blip)
                                            done = done + 1
                                            ClearPedTasks(ped)
                                            if done == #Gardener.RockfordHillsWork then
                                                Paycheck = true
                                                done = 0
                                                AmountPayout = AmountPayout + 1
                                                Framework.Functions.Notify("Градината е чиста , вземи си парите!")
                                            end                                        
                                        end, function()
                                            TriggerEvent('pepe-inventory:client:set:busy', false)
                                            StopAnimTask(PlayerPedId(), "amb@world_human_gardener_plant@male@base", "base", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "West Vinewood" then
                for i, v in ipairs(Gardener.WestVinewood) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, 'Здрасти, искаш ли да ми посадиш малко растения?')
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Разгледай къде може да съдиш")
                                    BlipsWorkingWV()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Окей, не ми трябваш повече!")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Ще те чакам отпред с парите")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Не си посадил всичко")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Now just wait until they grow up! keep your paycheck")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports['okokTextUI']:Close()
                                                TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                    Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                end)
                                                RequestAnimDict('mp_common')
                                                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                RequestAnimDict('mp_common')
                                                TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                Citizen.Wait(3500)
                                                ClearPedTasks(ped)
                                                CancelWork()
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.WestVinewoodWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        Framework.Functions.Progressbar('planting', 'Засаждаш дърво...', 5000, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {
                                            animDict = 'amb@world_human_gardener_plant@male@enter',
                                            anim = 'enter',
                                            flags = 16,
                                        }, {}, {}, function() -- Play When Done
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(ped)
                                            v.taked = true
                                            RemoveBlip(v.blip)
                                            done = done + 1
                                            if done == #Gardener.WestVinewoodWork then
                                                Paycheck = true
                                                done = 0
                                                AmountPayout = AmountPayout + 1
                                                Framework.Functions.Notify("Всички дървета са засъдени, вземи си парите", 'success')
                                            end
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(ped)
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "Vinewood Hills" then
                for i, v in ipairs(Gardener.VinewoodHills) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, 'Добро утро, искаш ли да изкараш бързи кинти?')
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Изкарай духалката за листа и почисти")
                                    BlipsWorkingVH()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Разкарай се!")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Чакам те отпред с парите като приключиш")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Не си изчистил")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Well done, grab the money")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                if not hasBlower then
                                                    exports['okokTextUI']:Close()
                                                    TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                    Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                        Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                    end)
                                                    RequestAnimDict('mp_common')
                                                    TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    RequestAnimDict('mp_common')
                                                    TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(3500)
                                                    ClearPedTasks(ped)
                                                    CancelWork()
                                                elseif hasBlower then
                                                    Framework.Functions.Notify("Прибери духалката в буса")
                                                end
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.VinewoodHillsWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        if hasBlower then
                                            Framework.Functions.Progressbar("plant-weed", "Издухване на листата..", 5000, false, true, {
                                                disableMovement = true,
                                                disableCarMovement = false,
                                                disableMouse = false,
                                                disableCombat = true,
                                                disableInventory = true,
                                            }, {
                                                animDict = "amb@world_human_gardener_leaf_blower@idle_a",
                                                anim = "idle_a",
                                                flags = 16,
                                            }, {}, {}, function() -- Done
                                                LocalPlayer.state:set("inv_busy", false, true)
                                                ClearPedTasks(ped)
                                                v.taked = true
                                                RemoveBlip(v.blip)
                                                done = done + 1
                                                if done == #Gardener.VinewoodHillsWork then
                                                    Paycheck = true
                                                    done = 0
                                                    AmountPayout = AmountPayout + 1
                                                    Framework.Functions.Notify("Всичко е изчистено, вземи си парите")
                                                end
                                            end, function()
                                                LocalPlayer.state:set("inv_busy", false, true)
                                                StopAnimTask(PlayerPedId(), "amb@world_human_gardener_plant@male@base", "base", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                                                Framework.Functions.Notify("Прекратено..", "error")
                                            end)
                                        elseif not hasBlower then
                                            Framework.Functions.Notify("Нямаш духалка", 'error')
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "El Burro Heights" then
                for i, v in ipairs(Gardener.ElBurroHeights) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, 'Е, кво става луд, искаш ли да изкараш бързи кинти?')
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Махни тревата")
                                    BlipsWorkingEBH()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Разкарай се от тук!")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Като си говов ми кажи ...")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "You haven't pulled all the grass out!")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Hold the money, good job ...")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            -- DrawText3Ds(coords.x, coords.y, coords.z + 1.0, '~p~[E]~s~ - Take the money')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports['okokTextUI']:Close()
                                                TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                    Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                end)
                                                RequestAnimDict('mp_common')
                                                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                RequestAnimDict('mp_common')
                                                TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                Citizen.Wait(3500)
                                                ClearPedTasks(ped)
                                                CancelWork()
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.ElBurroHeightsWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    -- DrawText3Ds(v.x, v.y, v.z + 0.4, "~p~[E]~s~ - Pull up the grass")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        LocalPlayer.state:set("inv_busy", true, true)
                                        Framework.Functions.Progressbar("plant-weed", "Чистиш тревата...", 5000, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                            disableInventory = true,
                                        }, {
                                            animDict = "amb@world_human_gardener_plant@male@idle_a",
                                            anim = "idle_c",
                                            flags = 16,
                                        }, {}, {}, function() -- Done
                                            ClearPedTasks(PlayerPedId())
                                            v.taked = true
                                            RemoveBlip(v.blip)
                                            done = done + 1
                                            if done == #Gardener.ElBurroHeightsWork then
                                                Paycheck = true
                                                done = 0
                                                AmountPayout = AmountPayout + 1
                                                Framework.Functions.Notify("Работата ти тук приключи, вземи си парите")
                                            end
                                        end, function()
                                            LocalPlayer.state:set("inv_busy", false, true)
                                            ClearPedTasks(PlayerPedId())
                                            --StopAnimTask(PlayerPedId(), "amb@world_human_gardener_plant@male@base", "base", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                                            Framework.Functions.Notify("Прекратено..", "error")
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "Richman" then
                for i, v in ipairs(Gardener.Richman) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, 'zdr kpr iskash li pari?')
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                -- DrawText3Ds(coords.x, coords.y, coords.z + 1.0, '~p~[G]~s~ - Okay | ~r~[H]~s~ - I have no time')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Изкарай тримера и подравни храстите")
                                    BlipsWorkingRM()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    exports['okokTextUI']:Close()
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Няма проблеми, чао братле.")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    exports['okokTextUI']:Close()
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Ще те чакам на вратата")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Не си подрязал всички храсти")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Ето ти парите, мерси за работата.")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                if not hasTrimmer then
                                                    exports['okokTextUI']:Close()
                                                    TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                    Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                        Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                    end)
                                                    RequestAnimDict('mp_common')
                                                    TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    RequestAnimDict('mp_common')
                                                    TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(3500)
                                                    ClearPedTasks(ped)
                                                    CancelWork()
                                                elseif hasTrimmer then
                                                    Framework.Functions.Notify("Остави си тримера в багажника")
                                                end
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.RichmanWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        if hasTrimmer then
                                            LocalPlayer.state:set("inv_busy", true, true)
                                            Framework.Functions.Progressbar("plant-weed", "Подрязваш храстите...", 5000, false, true, {
                                                disableMovement = true,
                                                disableCarMovement = false,
                                                disableMouse = false,
                                                disableCombat = true,
                                                disableInventory = true,
                                            }, {
                                                animDict = "anim@mp_radio@garage@high",
                                                anim = "idle_a",
                                                flags = 16,
                                            }, {}, {}, function() -- Done
                                                ClearPedTasks(ped)
                                                v.taked = true
                                                RemoveBlip(v.blip)
                                                done = done + 1
                                                if done == #Gardener.RichmanWork then
                                                    Paycheck = true
                                                    done = 0
                                                    AmountPayout = AmountPayout + 1
                                                    Framework.Functions.Notify("Подрязването е готово, вземи си парите.")
                                                end
                                                LocalPlayer.state:set("inv_busy", false, true)
                                            end, function()
                                                LocalPlayer.state:set("inv_busy", false, true)
                                                StopAnimTask(PlayerPedId(), "amb@world_human_gardener_plant@male@base", "base", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                                                Framework.Functions.Notify("Прекратено..", "error")
                                            end)
                                        elseif not hasTrimmer then
                                            Framework.Functions.Notify("Нямаш тример", 'error')
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "Mirror Park" then
                for i, v in ipairs(Gardener.MirrorPark) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Еее, сакаш ли кеш?")
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Изкарай косачката и започвай да косиш")
                                    BlipsWorkingMP()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Хубаво е че има и други градинари...")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Като си готов ела да ти платя")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Не си окосил тревата")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Сега изглежда много по-добре, ето ти парите")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                if not hasLawnMower then
                                                    exports['okokTextUI']:Close()
                                                    TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                    Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                        Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                    end)
                                                    RequestAnimDict('mp_common')
                                                    TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    RequestAnimDict('mp_common')
                                                    TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(3500)
                                                    ClearPedTasks(ped)
                                                    CancelWork()
                                                elseif hasLawnMower then
                                                    Framework.Functions.Notify("Прибери косачката")
                                                end
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.MirrorParkWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    -- DrawText3Ds(v.x, v.y, v.z + 0.4, "~p~[E] - lawn?")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        if hasLawnMower then
                                            v.taked = true
                                            RemoveBlip(v.blip)
                                            done = done + 1
                                            if done == #Gardener.MirrorParkWork then
                                                Paycheck = true
                                                done = 0
                                                AmountPayout = AmountPayout + 1
                                                Framework.Functions.Notify("Тревата е готова, вземи си парите")
                                            end
                                        elseif not hasLawnMower then
                                            Framework.Functions.Notify("Нямаш косачка")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "East Vinewood" then
                for i, v in ipairs(Gardener.EastVinewood) do
                    local coordsNPC = GetEntityCoords(v.ped, false)
                    sleep = 5
                    if not IsPedInAnyVehicle(ped, false) then
                        if not wasTalked then
                            if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Yo, you don't want to water my plants for cash?")
                                -- DrawText3Ds(coords.x, coords.y, coords.z + 1.0, "~p~[G]~s~ - I'm interested | ~r~[H]~s~ - I'm not interested")
                                exports['okokTextUI']:Open('[G] - Приеми<br>[H] - Откажи', 'purple', 'left')
                                if IsControlJustReleased(0, Keys["G"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = true
                                    CanWork = true
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                    Framework.Functions.Notify("Изкарай чантата за поливане и полей градината")
                                    BlipsWorkingEV()
                                elseif IsControlJustReleased(0, Keys["H"]) then
                                    exports['okokTextUI']:Close()
                                    wasTalked = true
                                    appointed = false
                                    FreezeEntityPosition(v.ped, false)
                                    TaskGoToCoordAnyMeans(v.ped, v.houseX, v.houseY, v.houseZ, 1.3)
                                end
                            else
                                exports['okokTextUI']:Close()
                            end
                        elseif wasTalked then
                            if not appointed then
                                if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 3.5) then
                                    DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Ами твой избор, ще съжаляваш.")
                                elseif (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                    CancelWork()
                                end
                            elseif appointed then
                                if not waitingDone then
                                    if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                        DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 1.05, "Като си готов ела да ти платя.")
                                    end
                                    if (GetDistanceBetweenCoords(coordsNPC, v.houseX, v.houseY, v.houseZ, true) < 0.35) then
                                        ClearPedTasksImmediately(v.ped)
                                        FreezeEntityPosition(v.ped, true)
                                        SetEntityCoords(v.ped, v.houseX, v.houseY, v.houseZ - 1.0)
                                        SetEntityHeading(v.ped, v.houseH)
                                        waitingDone = true
                                    end
                                elseif waitingDone then
                                    if not Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 2.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "Не си полял всичко")
                                        end
                                    elseif Paycheck then
                                        if (GetDistanceBetweenCoords(coords, coordsNPC.x, coordsNPC.y, coordsNPC.z, true) < 1.5) then
                                            DrawText3Ds(coordsNPC.x, coordsNPC.y, coordsNPC.z + 0.95, "They'll grow any minute... Hold your cash")
                                            exports['okokTextUI']:Open('[E] - Вземете си парите', 'purple', 'left')
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                if not hasBackPack then
                                                    exports['okokTextUI']:Close()
                                                    TaskTurnPedToFaceEntity(v.ped, ped, 0.2)
                                                    Framework.Functions.TriggerCallback('nocore-gardenjob:Payout', function(money)
                                                        Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
                                                    end)
                                                    RequestAnimDict('mp_common')
                                                        TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    RequestAnimDict('mp_common')
                                                        TaskPlayAnim(v.ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(3500)
                                                    ClearPedTasks(ped)
                                                    CancelWork()
                                                elseif hasBackPack then
                                                    Framework.Functions.Notify('Прибери раницата в камиона')
                                                end
                                            end
                                        else
                                            exports['okokTextUI']:Close()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if CanWork then
                    for i, v in ipairs(Gardener.EastVinewoodWork) do
                        if not v.taked then
                            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 8) then
                                sleep = 5
                                DrawMarker(20, v.x, v.y, v.z - 0.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 113, 41, 196, 80, false, true, 2, false, false, false, false)
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 5
                                    -- DrawText3Ds(v.x, v.y, v.z + 0.4, "~p~[E]~s~ - Поливайте")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        if hasBackPack then
                                            RequestAnimDict('missarmenian3_gardener')
                                            TaskPlayAnim(ped, 'missarmenian3_gardener', 'blower_idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                            LocalPlayer.state:set("inv_busy", true, true)
                                            Framework.Functions.Progressbar("plant-weed", "Поливане на цветята..", 5000, false, true, {
                                                disableMovement = true,
                                                disableCarMovement = false,
                                                disableMouse = false,
                                                disableCombat = true,
                                                disableInventory = true,
                                            }, {
                                                animDict = "missarmenian3_gardener",
                                                anim = "blower_idle_a",
                                                flags = 16,
                                            }, {}, {}, function() -- Done
                                                ClearPedTasks(ped)
                                                v.taked = true
                                                RemoveBlip(v.blip)
                                                done = done + 1
                                                if done == #Gardener.EastVinewoodWork then
                                                    Paycheck = true
                                                    done = 0
                                                    AmountPayout = AmountPayout + 1
                                                    Framework.Functions.Notify("Всички цветя изглеждат напоени, вземи си парите")
                                                end
                                                LocalPlayer.state:set("inv_busy", false, true)
                                            end, function()
                                                LocalPlayer.state:set("inv_busy", false, true)
                                                ClearPedTasks(PlayerPedId())
                                                Framework.Functions.Notify("Прекратено..", "error")
                                            end)
                                        elseif not hasBackPack then
                                            Framework.Functions.Notify("Нямаш раница", 'error')
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

function CreateWork(type)

    if type == "Rockford Hills" then
        for i, v in ipairs(Gardener.RockfordHills) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    elseif type == "West Vinewood" then
        for i, v in ipairs(Gardener.WestVinewood) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    elseif type == "Vinewood Hills" then
        for i, v in ipairs(Gardener.VinewoodHills) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    elseif type == "El Burro Heights" then
        for i, v in ipairs(Gardener.ElBurroHeights) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    elseif type == "Richman" then
        for i, v in ipairs(Gardener.Richman) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    elseif type == "Mirror Park" then
        for i, v in ipairs(Gardener.MirrorPark) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    elseif type == "East Vinewood" then
        for i, v in ipairs(Gardener.EastVinewood) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 205)
            SetBlipColour(v.blip, 27)
            SetBlipScale(v.blip, 0.5)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Gardener] Клиент')
            EndTextCommandSetBlipName(v.blip)

            local ped_hash = GetHashKey(Gardener.NPC['Peds'][math.random(1,#Gardener.NPC['Peds'])].ped)
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Citizen.Wait(1)
            end
            v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.96, v.h, false, true)
            SetBlockingOfNonTemporaryEvents(v.ped, true)
            SetPedDiesWhenInjured(v.ped, false)
            SetPedCanPlayAmbientAnims(v.ped, true)
            SetPedCanRagdollFromPlayerImpact(v.ped, false)
            SetEntityInvincible(v.ped, true)
            FreezeEntityPosition(v.ped, true)
        end
    end
    Type = type
end

function CancelWork()

    if Type == "Rockford Hills" then
        for i, v in ipairs(Gardener.RockfordHills) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.RockfordHillsWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    elseif Type == "West Vinewood" then
        for i, v in ipairs(Gardener.WestVinewood) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.WestVinewoodWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    elseif Type == "Vinewood Hills" then
        for i, v in ipairs(Gardener.VinewoodHills) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.VinewoodHillsWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    elseif Type == "El Burro Heights" then
        for i, v in ipairs(Gardener.ElBurroHeights) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.ElBurroHeightsWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    elseif Type == "Richman" then
        for i, v in ipairs(Gardener.Richman) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.RichmanWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    elseif Type == "Mirror Park" then
        for i, v in ipairs(Gardener.MirrorPark) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.MirrorParkWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    elseif Type == "East Vinewood" then
        for i, v in ipairs(Gardener.EastVinewood) do
            RemoveBlip(v.blip)
            DeletePed(v.ped)
        end
        for i, v in ipairs(Gardener.EastVinewoodWork) do
            v.taked = false
            RemoveBlip(v.blip)
        end
    end
    Type = nil
    appointed = false
    wasTalked = false
    waitingDone = false
    CanWork = false
    Paycheck = false
    salary = nil
    AmountPayout = 0
    done = 0
end

function BlipsWorkingRH()
    for i, v in ipairs(Gardener.RockfordHillsWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Weeds')
        EndTextCommandSetBlipName(v.blip)
    end
end

function BlipsWorkingWV()
    for i, v in ipairs(Gardener.WestVinewoodWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Trees')
        EndTextCommandSetBlipName(v.blip)
    end
end

function BlipsWorkingVH()
    for i, v in ipairs(Gardener.VinewoodHillsWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Leaves')
        EndTextCommandSetBlipName(v.blip)
    end
end

function BlipsWorkingEBH()
    for i, v in ipairs(Gardener.ElBurroHeightsWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Grass')
        EndTextCommandSetBlipName(v.blip)
    end
end

function BlipsWorkingRM()
    for i, v in ipairs(Gardener.RichmanWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Hedge')
        EndTextCommandSetBlipName(v.blip)
    end
end

function BlipsWorkingMP()
    for i, v in ipairs(Gardener.MirrorParkWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Grass to mow')
        EndTextCommandSetBlipName(v.blip)
    end
end

function BlipsWorkingEV()
    for i, v in ipairs(Gardener.EastVinewoodWork) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 7)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Gardener] Watering plants')
        EndTextCommandSetBlipName(v.blip)
    end
end

function addBackPack()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    backpack = CreateObject(GetHashKey('prop_spray_backpack_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(backpack, ped, GetPedBoneIndex(ped, 56604), 0.0, -0.12, 0.28, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeBackPack()
    local ped = PlayerPedId()

    DeleteEntity(backpack)
end

function addLawnMower()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    lawnmower = CreateObject(GetHashKey('prop_lawnmower_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(lawnmower, ped, GetPedBoneIndex(ped, 56604), -0.05, 1.0, -0.85, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeLawnMower()
    local ped = PlayerPedId()

    DeleteEntity(lawnmower)
end

function addTrimmer()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    trimmer = CreateObject(GetHashKey('prop_hedge_trimmer_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(trimmer, ped, GetPedBoneIndex(ped, 57005), 0.09, 0.02, 0.01, -121.0, 181.0, 187.0, true, true, false, true, 1, true)
end

function removeTrimmer()
    local ped = PlayerPedId()

    DeleteEntity(trimmer)
end

function addLeafBlower()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    leafblower = CreateObject(GetHashKey('prop_leaf_blower_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(leafblower, ped, GetPedBoneIndex(ped, 57005), 0.14, 0.02, 0.0, -40.0, -40.0, 0.0, true, true, false, true, 1, true)
end

function removeLeafBlower()
    local ped = PlayerPedId()

    DeleteEntity(leafblower)
end

-- RETURNING VEHICLE
function ReturnVehicle()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)

    Framework.Functions.DeleteVehicle(vehicle)
end

-- MAIN BLIP
function gardenjobblip()
    baseBlip = AddBlipForCoord(Base.Pos.x, Base.Pos.y, Base.Pos.z)
    SetBlipSprite(baseBlip, Base.BlipSprite)
    SetBlipDisplay(baseBlip, 4)
    SetBlipScale(baseBlip, Base.BlipScale)
    SetBlipAsShortRange(baseBlip, true)
    SetBlipColour(baseBlip, 50)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Base.BlipLabel)
    EndTextCommandSetBlipName(baseBlip)
end

-- ADDING GARAGES BLIPS
function addGarageBlip()
    garageBlip = AddBlipForCoord(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z)
    SetBlipSprite(garageBlip, Garage.BlipSprite)
    SetBlipDisplay(garageBlip, 4)
    SetBlipScale(garageBlip, Garage.BlipScale)
    SetBlipAsShortRange(garageBlip, true)
    SetBlipColour(garageBlip, 50)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Garage.BlipLabel)
    EndTextCommandSetBlipName(garageBlip)
end

-- REMOVING GARAGES BLIPS
function removeGarageBlip()
    RemoveBlip(garageBlip)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function DrawText3DMenu(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.02+0.0125, -0.14+ factor, 0.08, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function DrawText3Dss(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.008+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local returnZone = BoxZone:Create(vector3(-1739.97, -720.46, 10.44), 6.2, 6.0, {
    name="gardenervurnimps",
    heading=50,
    --debugPoly=true
  })

returnZone:onPlayerInOut(function(isPointInside, point)
	inReturnZone = isPointInside and onDuty and hasCar and IsPedInAnyVehicle(PlayerPedId(), false)

	if isPointInside then
		if onDuty and hasCar and IsPedInAnyVehicle(PlayerPedId(), false) then
			exports['okokTextUI']:Open('[Radial Menu] Върни МПС', 'purple', 'left')
		end
	else
		exports['okokTextUI']:Close()
	end
end)

exports('inGardenerReturnZone', function()
    return inReturnZone
end)