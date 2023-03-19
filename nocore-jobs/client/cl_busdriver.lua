local Framework = exports['no-core']:GetSharedObject()

--------------------------------------------------------------------------------
local PlayerData = {}
local clothes = false
local Plate, Vehicle, MechanicPed, Route = nil,nil,nil,nil
local inspection = false
local Passengers = 0
local number = 1
local close = false
local WorkBlip = nil

local inBusDriverInspectionZone = false
local inMarshrutZone = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1250, function()
			if PlayerData.job ~= nil and PlayerData.job.name == 'busdriver' then
				CreateBusStartBlip()
			end
        end)
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
	PlayerData = Framework.Functions.GetPlayerData()
	Framework.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.job ~= nil and PlayerData.job.name == 'busdriver' then
			CreateBusStartBlip()
		end
	end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(job)
	PlayerData.job = job
	if PlayerData.job ~= nil and PlayerData.job.name == 'busdriver' then
        CreateBusStartBlip()
    end
end)

function CreateBusStartBlip()
	local StartJobBlip = AddBlipForCoord(BusDriver.Config['Jobstart'].Pos.x, BusDriver.Config['Jobstart'].Pos.y, BusDriver.Config['Jobstart'].Pos.z)
	
	SetBlipSprite (StartJobBlip, 408)
	SetBlipDisplay(StartJobBlip, 4)
	SetBlipScale  (StartJobBlip, 0.8)
	SetBlipColour (StartJobBlip, 0)
	SetBlipAsShortRange(StartJobBlip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Bus Driver')
	EndTextCommandSetBlipName(StartJobBlip)
end

RegisterNetEvent('nocore-busdriver:stow')
AddEventHandler('nocore-busdriver:stow', function()
	local ped = PlayerPedId()

	if inspection then
		if IsPedInAnyVehicle(ped, false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
			if GetVehicleNumberPlateText(vehicle) == Plate then
				Framework.Functions.DeleteVehicle(Vehicle)
				Vehicle = nil
				Plate = nil
				for i, v in pairs(BusDriver.Config['Coaches']) do
					RemoveBlip(v.blip)
				end
				DeletePed(MechanicPed)
				inspection = false
				RemoveBlip(InspectionBlip)
				RemoveBlip(RouteSelection)
				MechanicPed = nil

				number = 0
				for i, v in pairs(BusDriver.First) do
					v.done = false
				end
				for i, v in pairs(BusDriver.Second) do
					v.done = false
				end
				Route = nil
				close = false
				clothes = false
				RemoveBlip(DepositBlip)
				Passengers = 0	
				Framework.Functions.Notify("Ти върна автобуса!")
				CreateSpawnBusBlip()
			else
				Framework.Functions.Notify("Това не е твоят автобус", 'error')
			end
		end
	end
end)


RegisterNetEvent('nocore-busdriver:start')
AddEventHandler('nocore-busdriver:start', function()
	local ped = PlayerPedId()
	
	if PlayerData.job ~= nil and PlayerData.job.name == 'busdriver' then
		if not clothes then
			if not IsPedInAnyVehicle(ped, false) then
				clothes = true
				CreateSpawnBusBlip()
				Framework.Functions.Notify('Ти започна работа, изкарай автобус', 'info')				
			elseif IsPedInAnyVehicle(ped, false) then
				Framework.Functions.Notify('Излезте от автобуса!', 'error')
			end
		else
			if IsPedInAnyVehicle(ped, false) then
				clothes = false
				Framework.Functions.DeleteVehicle(Vehicle)
				Vehicle = nil
				Plate = nil
				for i, v in pairs(BusDriver.Config['Coaches']) do
					RemoveBlip(v.blip)
				end
				DeletePed(MechanicPed)
				inspection = false
				RemoveBlip(InspectionBlip)
				RemoveBlip(RouteSelection)
				RemoveBlip(DepositBlip)
				MechanicPed = nil

				number = 0
				for i, v in pairs(BusDriver.First) do
					v.done = false
				end
				for i, v in pairs(BusDriver.Second) do
					v.done = false
				end
				Route = nil
				close = false
				Passengers = 0
				Framework.Functions.Notify('Справи се страхотно!', 'success')
			elseif IsPedInAnyVehicle(ped, false) then
				Framework.Functions.Notify('Излез от автобуса!', 'error')
			end
		end
	else
		Framework.Functions.Notify('Не сте шофьор на автобус!', 'error')	
	end	
end)

function CreateSpawnBusBlip()
	for i, v in pairs(BusDriver.Config['Coaches']) do
		v.blip = AddBlipForCoord(v.x, v.y, v.z)
	
		SetBlipSprite (v.blip, 513)
		SetBlipDisplay(v.blip, 4)
		SetBlipScale  (v.blip, 0.5)
		SetBlipColour (v.blip, 0)
		SetBlipAsShortRange(v.blip, true)
	
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Bus spawn')
		EndTextCommandSetBlipName(v.blip)
	end
end

RegisterNetEvent('nocore-busdriver:bus')
AddEventHandler('nocore-busdriver:bus', function()
		local ped = PlayerPedId()
		if clothes and not Plate then
			if not IsPedInAnyVehicle(ped, false) then
			local pos = {x = 460.5, y = -618.38, z = 28.48, a = 214,02}
			Framework.Functions.SpawnVehicle('bus', function(vehicle)
				SetVehicleNumberPlateText(vehicle, "BUS"..tostring(math.random(10000, 99999)))
				TaskWarpPedIntoVehicle(ped, vehicle, -1)
				SetVehicleEngineOn(vehicle, true, true)
				CreateInspectionBlip()
				Plate = GetVehicleNumberPlateText(vehicle)
				Vehicle = vehicle
				exports['nocore-vehiclekeys']:SetVehicleKey(Plate, true)
				exports['nocore-fuel']:SetFuelLevel(vehicle, Plate, 100, false)
				for i, v in pairs(BusDriver.Config['Coaches']) do
					RemoveBlip(v.blip)
				end
				Framework.Functions.Notify("Ходи си провери автобуса вляво")
			end, pos, true, false)
		end
	end
end)

RegisterNetEvent('nocore-busdriver:gotoinspection')
AddEventHandler('nocore-busdriver:gotoinspection', function()
	local ped = PlayerPedId()

	if Plate and not inspection then
		if IsPedInAnyVehicle(ped, false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
			if GetVehicleNumberPlateText(vehicle) == Plate then
				if Framework.Functions.IsSpawnPointClear(vector3(BusDriver.Config['Inspection'].PosCar.x, BusDriver.Config['Inspection'].PosCar.y, BusDriver.Config['Inspection'].PosCar.z), 4) then	
					Vehicle = vehicle
					SetEntityCoords(vehicle, BusDriver.Config['Inspection'].PosCar.x, BusDriver.Config['Inspection'].PosCar.y, BusDriver.Config['Inspection'].PosCar.z, false, false, false, true)
					SetEntityHeading(vehicle, BusDriver.Config['Inspection'].PosCar.h)
					SetEntityCoords(ped, 457.28,-556.22,27.5, false, false, false, true)
					SetEntityHeading(ped, 86.45)
					FreezeEntityPosition(vehicle, true)
					TaskLeaveVehicle(ped, vehicle, 0)
					Framework.Functions.Notify("Ходи си провери автобуса отпред", 'info')
					local ped_hash = GetHashKey('mp_m_waremech_01')
					RequestModel(ped_hash)
					while not HasModelLoaded(ped_hash) do
						Citizen.Wait(1)
					end
					MechanicPed = CreatePed(1, ped_hash, BusDriver.Config['Inspection'].PosPed.x, BusDriver.Config['Inspection'].PosPed.y, BusDriver.Config['Inspection'].PosPed.z-1.0, BusDriver.Config['Inspection'].PosPed.h, false, true)
					SetBlockingOfNonTemporaryEvents(MechanicPed, true)
					SetPedDiesWhenInjured(MechanicPed, false)
					SetPedCanPlayAmbientAnims(MechanicPed, true)
					SetPedCanRagdollFromPlayerImpact(MechanicPed, false)
					SetEntityInvincible(MechanicPed, true)
					FreezeEntityPosition(MechanicPed, true)
					exports['nocore-eye']:AddTargetEntity(MechanicPed, {
						options = {
							{
								event = "nocore-busdriver:inspection",
								icon = "fas fa-circle",
								label = "Инспектирай",
							}
						},
						distance = 2
					})
				else
					Framework.Functions.Notify("Някой проверява автобуса", 'info')
				end			
			else
				Framework.Functions.Notify("Не е твоят автобус", 'error')
			end
		end
	end
end)

RegisterNetEvent('nocore-busdriver:inspection')
AddEventHandler('nocore-busdriver:inspection', function()
	local ped = PlayerPedId()

	if MechanicPed then
		if not IsPedInAnyVehicle(ped, false) then
			FreezeEntityPosition(MechanicPed, false)
			TaskGoToCoordAnyMeans(MechanicPed, BusDriver.Config['Inspection'].FirstWheel.x, BusDriver.Config['Inspection'].FirstWheel.y, BusDriver.Config['Inspection'].FirstWheel.z, 1.3)
			while true do
				Citizen.Wait(0)
				local PedCoords = GetEntityCoords(MechanicPed)
				if(GetDistanceBetweenCoords(PedCoords,BusDriver.Config['Inspection'].FirstWheel.x, BusDriver.Config['Inspection'].FirstWheel.y, BusDriver.Config['Inspection'].FirstWheel.z, true) < 0.5) then
					SetEntityHeading(MechanicPed,266.31)
					startAnim(MechanicPed, 'anim@gangops@morgue@table@', 'player_search')
					Citizen.Wait(5000)
					ClearPedTasks(MechanicPed)
					break
				end
			end
			TaskGoToCoordAnyMeans(MechanicPed, BusDriver.Config['Inspection'].SecondWheel.x, BusDriver.Config['Inspection'].SecondWheel.y, BusDriver.Config['Inspection'].SecondWheel.z, 1.3)
			while true do
				Citizen.Wait(0)
				local PedCoords = GetEntityCoords(MechanicPed)
				if(GetDistanceBetweenCoords(PedCoords,BusDriver.Config['Inspection'].SecondWheel.x, BusDriver.Config['Inspection'].SecondWheel.y, BusDriver.Config['Inspection'].SecondWheel.z, true) < 0.5) then
					SetEntityHeading(MechanicPed,266.31)
					startAnim(MechanicPed, 'anim@gangops@morgue@table@', 'player_search')
					Citizen.Wait(5000)
					ClearPedTasks(MechanicPed)
					break
				end
			end					
			TaskGoToCoordAnyMeans(MechanicPed, BusDriver.Config['Inspection'].PosPed.x, BusDriver.Config['Inspection'].PosPed.y, BusDriver.Config['Inspection'].PosPed.z, 1.3)
			FreezeEntityPosition(Vehicle, false)
			FreezeEntityPosition(MechanicPed, false)	
			CreateRouteSelection()	
			RemoveBlip(InspectionBlip)		
			Framework.Functions.Notify("Автобуса е перфектен, може да си хващаш маршрута", 'success')
			local displaying = true
			DepositB()
			Citizen.CreateThread(function()
				Wait(5000)
				displaying = false
			end)
			inspection = true
			Citizen.Wait(5000)
			DeletePed(MechanicPed)
			MechanicPed = nil
		end
	end
end)

RegisterNetEvent('nocore-busdriver:route')
AddEventHandler('nocore-busdriver:route', function()
	local ped = PlayerPedId()

	if inspection and not Route then
		if IsPedInAnyVehicle(ped, false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
			if GetVehicleNumberPlateText(vehicle) == Plate then
				Framework.Functions.Notify("Избра маршрут, можеш да тръгваш към първата спирка", 'info')
				Route = Randomize(BusDriver.Locations)
				RemoveBlip(RouteSelection)
				CreateRoute(Route.name)
			else
				Framework.Functions.Notify("Това не е твоят автобус", 'error')
			end
		end	
	end
end)

function CreateRoute(type)
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			if type == 'first' then
				CreateWorkBlip(type,number) 
				sleep = 5
				for i, v in pairs(BusDriver.First) do
					if i == number then 
						if(GetDistanceBetweenCoords(coords,BusDriver.First[number].x, BusDriver.First[number].y, BusDriver.First[number].z, true) < 20.0) and not v.done then
							DrawMarker(20, BusDriver.First[number].x, BusDriver.First[number].y, BusDriver.First[number].z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							if(GetDistanceBetweenCoords(coords,BusDriver.First[number].x, BusDriver.First[number].y, BusDriver.First[number].z, true) < 3.5) then
								DrawText3Ds(BusDriver.First[number].x, BusDriver.First[number].y, BusDriver.First[number].z+1.4, 'Спри и качи хората [~g~E~w~]')
								if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
								local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
									if GetVehicleNumberPlateText(vehicle) == Plate then
										SetEntityCoords(vehicle,BusDriver.First[number].x, BusDriver.First[number].y, BusDriver.First[number].z, false, false, false, true)
										SetEntityHeading(vehicle,BusDriver.First[number].h)
										FreezeEntityPosition(vehicle, true)
										
										SetVehicleDoorOpen(vehicle, 1, false, true)
										if Passengers == 3 then
											for i, v in pairs(BusDriver.First[number].Peds['Peds']) do
												CordsV = GetEntityCoords(vehicle)
												local ped_hash = GetHashKey(BusDriver.Config['Peds'][math.random(1,#BusDriver.Config['Peds'])].ped)
												RequestModel(ped_hash)
												while not HasModelLoaded(ped_hash) do
													Citizen.Wait(1)
												end
												v.ped = CreatePed(1, ped_hash, BusDriver.First[number].dx, BusDriver.First[number].dy, BusDriver.First[number].dz-0.5, 0.0, false, true)
												SetBlockingOfNonTemporaryEvents(v.ped, true)
												SetPedDiesWhenInjured(v.ped, false)
												SetPedCanPlayAmbientAnims(v.ped, true)
												SetPedCanRagdollFromPlayerImpact(v.ped, false)
												SetEntityInvincible(v.ped, true)
												TaskGoToCoordAnyMeans(v.ped, CordsV.x-10, CordsV.y+2, CordsV.z, 1.3)
												Passengers = 0
											end
											Citizen.Wait(3000)
											for i, v in pairs(BusDriver.First[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
										end
										
										for i, v in pairs(BusDriver.First[number].Peds['Peds']) do
											local ped_hash = GetHashKey(BusDriver.Config['Peds'][math.random(1,#BusDriver.Config['Peds'])].ped)
											RequestModel(ped_hash)
											while not HasModelLoaded(ped_hash) do
												Citizen.Wait(1)
											end
											v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.5, v.h, false, true)
											SetBlockingOfNonTemporaryEvents(v.ped, true)
											SetPedDiesWhenInjured(v.ped, false)
											SetPedCanPlayAmbientAnims(v.ped, true)
											SetPedCanRagdollFromPlayerImpact(v.ped, false)
											SetEntityInvincible(v.ped, true)
											TaskGoToCoordAnyMeans(v.ped, BusDriver.First[number].dx, BusDriver.First[number].dy, BusDriver.First[number].dz, 1.3)
											Passengers = 3
										end
										v.done = true
										Framework.Functions.Progressbar("plant-weed", "Качване на пътници..", 1500, false, true, {
											disableMovement = false,
											disableCarMovement = false,
											disableMouse = false,
											disableCombat = true,
											disableInventory = true,
										}, {}, {}, {}, function() -- Done
											for i, v in pairs(BusDriver.First[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
											RemoveBlip(WorkBlip)
											WorkBlip = nil
											SetVehicleDoorShut(vehicle, 1, false)

											FreezeEntityPosition(vehicle, false)
											
											-- v.done = true
											print(number)
											if number >= #BusDriver.First then
												close = true
												RemoveBlip(WorkBlip)
												WorkBlip = nil
											else
												Framework.Functions.TriggerCallback('nocore-busdriver:payout', function(money)
													Framework.Functions.Notify('Изкара '..money..'$, тръгвай към следващата спирка!', 'success')
												end)
												number = number + 1
											end
											LocalPlayer.state:set("inv_busy", false, true)
										end, function()
											LocalPlayer.state:set("inv_busy", false, true)
											Framework.Functions.Notify("Canceled..", "error")
											v.done = false
											FreezeEntityPosition(vehicle, false)
											for i, v in pairs(BusDriver.First[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
										end)
									else
										Framework.Functions.Notify("Това не е твоят автобус", 'error')
									end
								end
							end
						end
					end
				end
			elseif type == 'second' then
				CreateWorkBlip(type,number) 
				sleep = 5
				for i, v in pairs(BusDriver.Second) do
					if i == number then 
						if(GetDistanceBetweenCoords(coords,BusDriver.Second[number].x, BusDriver.Second[number].y, BusDriver.Second[number].z, true) < 20.0) and not v.done then
							DrawMarker(20, BusDriver.Second[number].x, BusDriver.Second[number].y, BusDriver.Second[number].z+0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
							if(GetDistanceBetweenCoords(coords,BusDriver.Second[number].x, BusDriver.Second[number].y, BusDriver.Second[number].z, true) < 3.5) then
								DrawText3Ds(BusDriver.Second[number].x, BusDriver.Second[number].y, BusDriver.Second[number].z+1.4, 'Спри и качи хората [~g~E~w~]')
								if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
								local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
									if GetVehicleNumberPlateText(vehicle) == Plate then
										SetEntityCoords(vehicle,BusDriver.Second[number].x, BusDriver.Second[number].y, BusDriver.Second[number].z, false, false, false, true)
										SetEntityHeading(vehicle,BusDriver.Second[number].h)
										FreezeEntityPosition(vehicle, true)
											
										SetVehicleDoorOpen(vehicle, 1, false, true)
										if Passengers == 3 then
											for i, v in pairs(BusDriver.Second[number].Peds['Peds']) do
												CordsV = GetEntityCoords(vehicle)
												local ped_hash = GetHashKey(BusDriver.Config['Peds'][math.random(1,#BusDriver.Config['Peds'])].ped)
												RequestModel(ped_hash)
												while not HasModelLoaded(ped_hash) do
													Citizen.Wait(1)
												end
												v.ped = CreatePed(1, ped_hash, BusDriver.Second[number].dx, BusDriver.Second[number].dy, BusDriver.Second[number].dz-0.5, 0.0, false, true)
												SetBlockingOfNonTemporaryEvents(v.ped, true)
												SetPedDiesWhenInjured(v.ped, false)
												SetPedCanPlayAmbientAnims(v.ped, true)
												SetPedCanRagdollFromPlayerImpact(v.ped, false)
												SetEntityInvincible(v.ped, true)
												TaskGoToCoordAnyMeans(v.ped, CordsV.x-10, CordsV.y+2, CordsV.z, 1.3)
												Passengers = 0
											end
											Citizen.Wait(3000)
											for i, v in pairs(BusDriver.Second[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
										end
											
										for i, v in pairs(BusDriver.Second[number].Peds['Peds']) do
											local ped_hash = GetHashKey(BusDriver.Config['Peds'][math.random(1,#BusDriver.Config['Peds'])].ped)
											RequestModel(ped_hash)
											while not HasModelLoaded(ped_hash) do
												Citizen.Wait(1)
											end
											v.ped = CreatePed(1, ped_hash, v.x, v.y, v.z-0.5, v.h, false, true)
											SetBlockingOfNonTemporaryEvents(v.ped, true)
											SetPedDiesWhenInjured(v.ped, false)
											SetPedCanPlayAmbientAnims(v.ped, true)
											SetPedCanRagdollFromPlayerImpact(v.ped, false)
											SetEntityInvincible(v.ped, true)
											TaskGoToCoordAnyMeans(v.ped, BusDriver.Second[number].dx, BusDriver.Second[number].dy, BusDriver.Second[number].dz, 1.3)
											Passengers = 3
										end
										v.done = true
										Framework.Functions.Progressbar("plant-weed", "Качване на пътници..", 1500, false, true, {
											disableMovement = false,
											disableCarMovement = false,
											disableMouse = false,
											disableCombat = true,
											disableInventory = true,
										}, {}, {}, {}, function() -- Done
											for i, v in pairs(BusDriver.Second[number].Peds['Peds']) do
												DeletePed(v.ped)
											end

											RemoveBlip(WorkBlip)
											WorkBlip = nil
											SetVehicleDoorShut(vehicle, 1, false)
	
											FreezeEntityPosition(vehicle, false)
												
											-- v.done = true
											if number >= #BusDriver.Second then
												close = true
												RemoveBlip(WorkBlip)
												WorkBlip = nil
											else
												Framework.Functions.TriggerCallback('nocore-busdriver:payout', function(money)
													Framework.Functions.Notify('Изкара '..money..'$, тръгвай към следващата спирка', 'success')
												end)
												number = number + 1
											end
											LocalPlayer.state:set("inv_busy", false, true)
										end, function()
											LocalPlayer.state:set("inv_busy", false, true)
											ClearPedTasks(PlayerPedId())
											Framework.Functions.Notify("Прекратено..", "error")
											v.done = false
											FreezeEntityPosition(vehicle, false)
											for i, v in pairs(BusDriver.Second[number].Peds['Peds']) do
												DeletePed(v.ped)
											end
										end)
									else
										Framework.Functions.Notify("Не си в твоят автобус", 'error')
									end
								end
							end
						end
					end
				end
			end
			if close then
				Framework.Functions.TriggerCallback('nocore-busdriver:payout', function(money)
					Framework.Functions.Notify('Изкара '..money..'$', 'success')
				end)
				number = 1
				for i, v in pairs(BusDriver.First) do
					v.done = false
				end
				for i, v in pairs(BusDriver.Second) do
					v.done = false
				end
				Route = nil
				close = false
				Passengers = 0
				RemoveBlip(WorkBlip)
				WorkBlip = nil
				CreateRouteSelection()
				break
			end
		Citizen.Wait(sleep)
	end
end

function CreateWorkBlip(type,number)
	if not WorkBlip then
		if type == 'first' then
			WorkBlip = AddBlipForCoord(BusDriver.First[number].x, BusDriver.First[number].y, BusDriver.First[number].z)
			
			SetBlipSprite (WorkBlip, 162)
			SetBlipDisplay(WorkBlip, 4)
			SetBlipScale  (WorkBlip, 0.8)
			SetBlipColour (WorkBlip, 0)
			SetBlipAsShortRange(WorkBlip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Метростанция')
			EndTextCommandSetBlipName(WorkBlip)
			SetBlipRoute(WorkBlip, true)
		elseif type == 'second' then
			WorkBlip = AddBlipForCoord(BusDriver.Second[number].x, BusDriver.Second[number].y, BusDriver.Second[number].z)
			
			SetBlipSprite (WorkBlip, 162)
			SetBlipDisplay(WorkBlip, 4)
			SetBlipScale  (WorkBlip, 0.8)
			SetBlipColour (WorkBlip, 0)
			SetBlipAsShortRange(WorkBlip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Метростанция')
			EndTextCommandSetBlipName(WorkBlip)
			SetBlipRoute(WorkBlip, true)
		end
	end
end

function CreateRouteSelection()
	RouteSelection = AddBlipForCoord(BusDriver.Config['RouteSelection'].Pos.x, BusDriver.Config['RouteSelection'].Pos.y, BusDriver.Config['RouteSelection'].Pos.z)
	
	SetBlipSprite (RouteSelection, 459)
	SetBlipDisplay(RouteSelection, 4)
	SetBlipScale  (RouteSelection, 0.8)
	SetBlipColour (RouteSelection, 0)
	SetBlipAsShortRange(RouteSelection, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Маршрут')
	EndTextCommandSetBlipName(RouteSelection)
end

function DepositB()
	DepositBlip = AddBlipForCoord(443.43, -591.79, 28.49551)
	
	SetBlipSprite (DepositBlip, 68)
	SetBlipDisplay(DepositBlip, 4)
	SetBlipScale  (DepositBlip, 0.8)
	SetBlipColour (DepositBlip, 0)
	SetBlipAsShortRange(DepositBlip, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Връщане на МПС')
	EndTextCommandSetBlipName(DepositBlip)
end

function CreateInspectionBlip()
	InspectionBlip = AddBlipForCoord(BusDriver.Config['Inspection'].Pos.x, BusDriver.Config['Inspection'].Pos.y, BusDriver.Config['Inspection'].Pos.z)
	
	SetBlipSprite (InspectionBlip, 464)
	SetBlipDisplay(InspectionBlip, 4)
	SetBlipScale  (InspectionBlip, 0.8)
	SetBlipColour (InspectionBlip, 0)
	SetBlipAsShortRange(InspectionBlip, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Инспекция')
	EndTextCommandSetBlipName(InspectionBlip)
end

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function startAnim(ped, dictionary, anim)
	Citizen.CreateThread(function()
	  RequestAnimDict(dictionary)
	  while not HasAnimDictLoaded(dictionary) do
		Citizen.Wait(0)
	  end
		TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
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

local inspectZone = BoxZone:Create(vector3(468.51, -580.82, 28.5), 10.8, 8.8, {
	name="busdriverinspect",
	heading=355,
	--debugPoly=true
  })

local marshrutZone = BoxZone:Create(vector3(471.27, -612.09, 28.5), 18.0, 4.2, {
	name="busdriverstow",
	heading=355,
	--debugPoly=true
  })

inspectZone:onPlayerInOut(function(isPointInside, point)
	inBusDriverInspectionZone = isPointInside and Plate and not inspection

	if isPointInside then
		if Plate and not inspection then
			exports['okokTextUI']:Open('[Radial Menu] Инспектирай', 'purple', 'left')
		end
	else
		exports['okokTextUI']:Close()
	end
end)
marshrutZone:onPlayerInOut(function(isPointInside, point)
	inMarshrutZone = isPointInside and Plate and inspection

	if isPointInside then
		if Plate and inspection then
			exports['okokTextUI']:Open('[Radial Menu] Маршрут', 'purple', 'left')
		end
	else
		exports['okokTextUI']:Close()
	end
end)

exports('inInspectZone', function()
	return inBusDriverInspectionZone
end)

exports('inMarshrutZone', function ()
	return inMarshrutZone
end)