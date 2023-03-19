local Framework = exports['no-core']:GetSharedObject()

--------------------------------------------------------------------------------
local Shipments, PickupBlip, GatePoint
local PlayerData = {}
local JobStarted,Gate,work,haspackage,TrunkOpen = false,false,false,false,false
local custormersdone = 0
local NpcPed

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1250, function()
			if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
				courierblip()
			end
			SpawnCourierNPC()
        end)
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
	PlayerData = Framework.Functions.GetPlayerData()
	Framework.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
			courierblip()
		end
		SpawnCourierNPC()
	end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(job)
	PlayerData.job = job
	if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
        courierblip()
    end
	SpawnCourierNPC()
end)

RegisterNetEvent('nocore-courier:start')
AddEventHandler('nocore-courier:start', function()
	if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
		if not JobStarted then
			Framework.Functions.Notify('Вие започнахте работа, отидете в станцията за товарене!', 'info')
			JobStarted = true
		else
			Framework.Functions.Notify('Не може да започнете', 'error')
		end
	else
		Framework.Functions.Notify('Не сте куриер!', 'error')
	end
end)

RegisterNetEvent('nocore-courier:stop')
AddEventHandler('nocore-courier:stop', function()
	if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
		if JobStarted then
			Framework.Functions.Notify('Работата е свършена', 'success')
			Framework.Functions.DeleteVehicle(Vehicle)
			JobStarted = false
			Gate = false
			haspackage = false
			TrunkOpen = false
			Shipments = nil
			PickupBlip = nil
			GatePoint = nil
			Vehicle = nil
			custormersdone = 0
			RemoveBlip(PickupBlip)
			RemoveBlip(GateBlip)
			for i, v in pairs(Courier.Config['Customers']) do
				RemoveBlip(v.blip)
				v.done = false
				ClearPedTasksImmediately(v.ped)
				DeletePed(v.ped)
			end

			ClearPedTasks(ped)
			DeleteEntity(pack)
			DeleteEntity(pack2)
		end
	else
		Framework.Functions.Notify('Не сте куриер!', 'error')
	end
end)

RegisterNetEvent('nocore-courier:getkeys')
AddEventHandler('nocore-courier:getkeys', function()
	if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
		if JobStarted and not Shipments then
			if Framework.Functions.IsSpawnPointClear(Courier.Config['Carspawn'].Pos, 2) then	
				Shipments = Courier.Config['Shipments']
				Framework.Functions.Notify('Доставки за днес - '..Shipments, 'info')
				RemoveBlip(PickupBlip)
				SpawnVehicle()		
			end
		end
	else
		Framework.Functions.Notify('Не сте куриер!', 'error')
	end
end)

function SpawnCourierNPC()
	exports['nocore-assets']:RequestModelHash('cs_floyd')
    NpcPed = CreatePed(4, GetHashKey('cs_floyd'), -439.18, -2792.080, 6.00 - 0.95, 79.70, false, false)
    FreezeEntityPosition(NpcPed, true)
    SetEntityInvincible(NpcPed, true)
    SetBlockingOfNonTemporaryEvents(NpcPed, true)
    SetPedConfigFlag(NpcPed, 410, true)

    exports['nocore-eye']:AddTargetEntity(NpcPed, {
        options = {
            {
                event = "nocore-courier:start",
                icon = "fas fa-dot-circle",
                label = "Започни работа",
                job = "courier",
            },
            {
                event = "nocore-courier:getkeys",
                icon = "fas fa-dot-circle",
                label = "Вземи МПС",
                job = "courier",
				canInteract = function ()
					if JobStarted then
						return true
					end
					return false
				end
            },
            {
                event = "nocore-courier:stop",
                icon = "fas fa-dot-circle",
                label = "Завърши работа",
                job = "courier",
				canInteract = function ()
					if JobStarted then
						return true
					end
					return false
				end
            },
        },
        distance = 3
    })
end

function courierblip()
	local StartJobBlip = AddBlipForCoord(Courier.Config['Jobstart'].Pos.x, Courier.Config['Jobstart'].Pos.y, Courier.Config['Jobstart'].Pos.z)
	
  
	SetBlipSprite (StartJobBlip, 408)
	SetBlipDisplay(StartJobBlip, 4)
	SetBlipScale  (StartJobBlip, 0.8)
	SetBlipColour (StartJobBlip, 0)
	SetBlipAsShortRange(StartJobBlip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Courier')
	EndTextCommandSetBlipName(StartJobBlip)
end

function SpawnVehicle()
	Wait(1500)
	if not Vehicle then
		Framework.Functions.SpawnVehicle(Courier.Config['Carspawn'].Model, function(vehicle)
			Vehicle = vehicle
			exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
			exports['nocore-fuel']:SetFuelLevel(vehicle, GetVehicleNumberPlateText(vehicle), 100, false)
			Framework.Functions.Notify("Вашето превозно средство Ви очаква, заредете пратките от склада.", 'info')
			CreateGate()
		end, Courier.Config['Carspawn'].Pos, true, false)
	else
		CreateGate()
	end
end


function CreateGate()
	Gate = true
	GatePoint = Randomize(Courier.Config['Gate'])
	
	GateBlip = AddBlipForCoord(GatePoint.x, GatePoint.y, GatePoint.z)
	SetBlipSprite (GateBlip, 478)
	SetBlipDisplay(GateBlip, 4)
	SetBlipScale  (GateBlip, 0.8)
	SetBlipColour (GateBlip, 0)
	SetBlipAsShortRange(GateBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Gate')
	EndTextCommandSetBlipName(GateBlip)
end

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		
		if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
			if Gate and JobStarted then
				if(GetDistanceBetweenCoords(coords, GatePoint.x, GatePoint.y, GatePoint.z, true) < 12.0) then
					sleep = 5

					DrawMarker(20, GatePoint.x, GatePoint.y, GatePoint.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					if(GetDistanceBetweenCoords(coords, GatePoint.x, GatePoint.y, GatePoint.z, true) < 3.0) then
						DrawText3Ds(GatePoint.x, GatePoint.y, GatePoint.z+1.4, '~p~[E]~w~ - Товарене')
						if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
							local veh = GetVehiclePedIsIn(ped, false)
							local vheading = GetEntityHeading(veh)
							local namecar = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
							
							if namecar == 'RUMPO' then
								if (GatePoint.h<361 and GatePoint.h>340) or (GatePoint.h<21 and GatePoint.h>=0) then 
									if (vheading<361 and vheading>340) or (vheading<21 and vheading>=0) then
										Gate = false
										TrunkOpen = true
										--[[exports.rprogress:Custom({
											Duration = Shipments*1500,
											Label = "Loading parcels into the vehicle...",
											Animation = {
												scenario = "", -- https://pastebin.com/6mrYTdQv
												animationDictionary = "", -- https://alexguirre.github.io/animations-list/
											},
											DisableControls = {
												Mouse = false,
												Player = true,
												Vehicle = true
											}
										}) ]]
										Framework.Functions.Progressbar("plant-weed", "Зареждане на автомобила..", Shipments*1500, false, true, {
											disableMovement = true,
											disableCarMovement = true,
											disableMouse = false,
											disableCombat = true,
											disableInventory = true,
										}, {}, {}, {}, function() -- Done
											Framework.Functions.Notify('Автомобилът е натоварен, тръгвай по адреси!', 'info')
											RemoveBlip(GateBlip)
											StartWork()
											LocalPlayer.state:set("inv_busy", false, true)
										end, function()
											LocalPlayer.state:set("inv_busy", false, true)
											ClearPedTasks(PlayerPedId())
											Framework.Functions.Notify("Canceled..", "error")
										end)
									else
										Framework.Functions.Notify('Паркирай на задна', 'info')
									end
								else
									if (vheading<GatePoint.h and vheading>GatePoint.h-20.0) or (vheading>GatePoint.h and vheading<GatePoint.h+20.0) then
										Gate = false
										TrunkOpen = true
										Framework.Functions.Progressbar("plant-weed", "Зареждане на автомобила..", (Shipments*1500), false, true, {
											disableMovement = true,
											disableCarMovement = true,
											disableMouse = false,
											disableCombat = true,
											disableInventory = true,
										}, {}, {}, {}, function() -- Done
											Framework.Functions.Notify('Автомобилът е натоварен, тръгвай по адреси!', 'info')
											RemoveBlip(GateBlip)
											StartWork()	
											LocalPlayer.state:set("inv_busy", false, true)
										end, function()
											LocalPlayer.state:set("inv_busy", false, true)
											ClearPedTasks(PlayerPedId())
											Framework.Functions.Notify("Canceled..", "error")
										end)					
									else
										Framework.Functions.Notify('Паркирай на задна!', 'info')
									end
								end
							else
								Framework.Functions.Notify('Това не е вашият автомобил!', 'error')
							end
						elseif IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
							Framework.Functions.Notify('Влез в автомобила!')
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

function StartWork()
	for i, v in pairs(Courier.Config['Customers']) do
		if Shipments and i > Shipments then break end
		v.blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (v.blip, 128)
		SetBlipDisplay(v.blip, 4)
		SetBlipScale  (v.blip, 0.8)
		SetBlipColour (v.blip, 5)
		SetBlipAsShortRange(v.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Customer')
		EndTextCommandSetBlipName(v.blip)

		local ped_hash = GetHashKey(Courier.Config['Peds'][math.random(1,#Courier.Config['Peds'])].ped)
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
  		FreezeEntityPosition(v.ped, true)
	end
	work = true
end

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
				if Vehicle and not IsPedInAnyVehicle(ped, false) and JobStarted and Shipments and TrunkOpen then
					local trunkpos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, -3.8, 0)
						if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, trunkpos.x, trunkpos.y, trunkpos.z, true) < 2.5 then
							sleep = 5
							if not haspackage then
								DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.15, "~p~[E]~w~ - Вземете пратка")
							else
								DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.15, "~p~[E]~w~ - Оставете пратка")
							end
							if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, trunkpos.x, trunkpos.y, trunkpos.z, true) < 1.5 then
								if IsControlJustReleased(0, Keys["E"]) and not haspackage then
									SetVehicleDoorOpen(Vehicle, 2, false, false)
									SetVehicleDoorOpen(Vehicle, 3, false, false)
									Framework.Functions.Progressbar('name_here', 'Взимане на пратка...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
										disableMovement = true,
										disableCarMovement = true,
										disableMouse = false,
										disableCombat = true,
										disableInventory = true,
									}, {
										animDict = 'mini@repair',
										anim = 'fixing_a_ped',
										flags = 16,
									}, {}, {}, function() -- Play When Done
										ClearPedTasks(PlayerPedId())
										haspackage = true
										SetVehicleDoorsLocked(Vehicle, 2)
										RequestAnimDict("anim@heists@box_carry@")
										while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
											Citizen.Wait(7)
										end
										TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
										pack = CreateObject(GetHashKey('prop_cs_cardbox_01'), coords.x, coords.y, coords.z,  true,  true, true)
										AttachEntityToEntity(pack, ped, GetPedBoneIndex(ped, 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
										SetVehicleDoorsShut(Vehicle, false)
									end, function() -- Play When Cancel
										ClearPedTasks(PlayerPedId())
									end)
								elseif IsControlJustReleased(0, Keys["E"]) and haspackage then
									haspackage = false
									SetVehicleDoorsLocked(Vehicle, 1)
									ClearPedTasks(ped)
									TaskPlayAnim(ped, 'anim@heists@box_carry@', "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0)
									DeleteEntity(pack)
									Citizen.Wait(500)
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
		if AnimLoop then
			sleep = 5
			TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
		end
	Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			if PlayerData.job ~= nil and PlayerData.job.name == 'courier' then
				if work then
					sleep = 5
					for i, v in ipairs(Courier.Config['Customers']) do
						if Shipments and i > Shipments then break end
						if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 2) and not v.done then
							DrawText3Ds(v.x, v.y, v.z+0.5, '~p~[E]~w~ - Доставете пратката')
							if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5) and not v.done then
								if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and haspackage then
									v.done = true
									time = math.random(1000,2100)
									Framework.Functions.Progressbar("plant-weed", "Подаване на пратка..", time, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = true,
										disableInventory = true,
                                    }, {}, {}, {}, function() -- Done
                                        haspackage = false
										SetVehicleDoorsLocked(Vehicle, 1)
										ClearPedTasks(ped)
										TaskPlayAnim(ped, 'anim@heists@box_carry@', "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0)
										DeleteEntity(pack)

										FreezeEntityPosition(v.ped, false)
										TaskTurnPedToFaceEntity(v.ped, PlayerPedId(), 0.2)
										local coordsPED = GetEntityCoords(v.ped)
										startAnim(v.ped, 'anim@heists@box_carry@', 'idle')
										pack2 = CreateObject(GetHashKey('prop_cs_cardbox_01'), coordsPED.x, coordsPED.y, coordsPED.z,  true,  true, true)
										AttachEntityToEntity(pack2, v.ped, GetPedBoneIndex(v.ped, 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
										Citizen.Wait(1000)

										TaskGoStraightToCoord(v.ped, v.gotoX, v.gotoY, v.gotoZ, 1.0, 1.0, v.gotoH, 1)
										local displaying = true
										local RandomText = Courier.Config['Text'][math.random(1,#Courier.Config['Text'])].text
										while displaying do
											Wait(0)
											local coordsPed = GetEntityCoords(v.ped, false)
											local coords = GetEntityCoords(PlayerPedId(), false)
											local dist = Vdist2(coordsPed, coords)
											if dist < 15 then                
												DrawText3Ds(coordsPed['x'], coordsPed['y'], coordsPed['z'] + 1.2, RandomText)
											end
											Citizen.SetTimeout(6000, function()
												displaying = false
											end)
										end														
										ClearPedTasksImmediately(v.ped)
										DeleteEntity(pack2)
										DeletePed(v.ped)
										RemoveBlip(v.blip)
										Framework.Functions.TriggerCallback('nocore-courier:payout', function(money)
											Framework.Functions.Notify('Ти изкара '..money..'$', 'success')
										end)
										
										custormersdone = custormersdone + 1
										if custormersdone >= Shipments then
											haspackage = false
											ClearPedTasks(ped)
											DeleteEntity(pack)
											work = false
											custormersdone = 0

											RemoveBlip(PickupBlip)
											RemoveBlip(GateBlip)
											for i, v in pairs(Courier.Config['Customers']) do
												RemoveBlip(v.blip)
												v.done = false
											end
				
											Shipments = nil
											Gate = false
											TrunkOpen = false
											Citizen.Wait(1000)
											Framework.Functions.Notify('Всичко е доставено', 'success')
										else
											Citizen.Wait(1000)
											Framework.Functions.Notify('Тръгвай към следващият адрес ('..custormersdone..'/'..Shipments..')', 'info')
										end
                                        LocalPlayer.state:set("inv_busy", false, true)
                                    end, function()
                                        LocalPlayer.state:set("inv_busy", false, true)
                                        ClearPedTasks(PlayerPedId())
                                        Framework.Functions.Notify("Отказано..", "error")
                                    end)
								elseif IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and not haspackage then
									Framework.Functions.Notify('Вземи пратката от автомобила', 'info')
								end
							end
						end
					end
				end
			end
		Citizen.Wait(sleep)
	end
end)

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

function mojedapravineshto()
    if JobStarted and Vehicle then
        return true
    end
end

exports('mojedapravineshto', mojedapravineshto)