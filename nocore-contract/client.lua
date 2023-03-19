Framework = exports['no-core']:GetCoreObject()

RegisterNetEvent('nocore-contract:GetVehicleInfo')
AddEventHandler('nocore-contract:GetVehicleInfo', function(source_playername, date, description, price, source)
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local closestPlayer, playerDistance = Framework.Functions.GetClosestPlayer()
	local sellerID = source
	target = GetPlayerServerId(closestPlayer)

	if closestPlayer ~= -1 and playerDistance <= 3.0 then
		local vehicle = Framework.Functions.GetClosestVehicle(coords)
		local vehiclecoords = GetEntityCoords(vehicle)
		local vehDistance = GetDistanceBetweenCoords(coords, vehiclecoords, true)
		if DoesEntityExist(vehicle) and (vehDistance <= 3) then
			local vehProps = Framework.Functions.GetVehicleProperties(vehicle)
			Framework.Functions.TriggerCallback("nocore-contract:GetTargetName", function(targetName)
				SetNuiFocus(true, true)
				SendNUIMessage({
					action = 'openContractSeller',
					plate = vehProps.plate,
					model = GetDisplayNameFromVehicleModel(vehProps.model),
					source_playername = source_playername,
					sourceID = sellerID,
					target_playername = targetName,
					targetID = target,
					date = date,
					description = description,
					price = price
				})
			end, target)
		else
			ClearPedTasks(PlayerPedId())
			Framework.Functions.Notify('Трябва да си близо до автомобил.', 'error')
		end
	else
		ClearPedTasks(PlayerPedId())
		Framework.Functions.Notify('Няма никой около теб', 'error')
	end
end)

RegisterNetEvent('nocore-contract:OpenContractInfo')
AddEventHandler('nocore-contract:OpenContractInfo', function()
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'openContractInfo'
	})
end)

RegisterNetEvent('nocore-contract:OpenContractOnBuyer')
AddEventHandler('nocore-contract:OpenContractOnBuyer', function(data)
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'openContractOnBuyer',
		plate = data.plateNumber,
		model = data.vehicleModel,
		source_playername = data.sourceName,
		sourceID = data.sourceID,
		target_playername = data.targetName,
		targetID = data.targetID,
		date = data.date,
		description = data.description,
		price = data.price
	})
end)

RegisterNUICallback("action", function(data, cb)
	if data.action == "submitContractInfo" then
		TriggerServerEvent("nocore-contract:SendVehicleInfo", data.vehicle_description, data.vehicle_price)
		SetNuiFocus(false, false)
	elseif data.action == "signContract1" then
		TriggerServerEvent("nocore-contract:SendContractToBuyer", data)
		ClearPedTasks(PlayerPedId())
		SetNuiFocus(false, false)
	elseif data.action == "signContract2" then
		TriggerServerEvent("nocore-contract:changeVehicleOwner", data)
		ClearPedTasks(PlayerPedId())
		SetNuiFocus(false, false)
	elseif data.action == "close" then
		ClearPedTasks(PlayerPedId())
		SetNuiFocus(false, false)
	end
end)

RegisterNetEvent('nocore-contract:startContractAnimation')
AddEventHandler('nocore-contract:startContractAnimation', function(player)
	loadAnimDict('anim@amb@nightclub@peds@')
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, false)
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end