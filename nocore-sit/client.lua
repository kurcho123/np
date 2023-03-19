Framework = nil
local debugProps, sitting, lastPos, currentSitCoords, currentScenario = {}
local disableControls = false
local currentObj = nil


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		for k,v in pairs(Config.Sitable) do
			Config.SitableHashes[GetHashKey(k)] = v
		end
		TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
        Citizen.Wait(200)
        LoggedIn = true
	end
end)


RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1000, function()
		for k,v in pairs(Config.Sitable) do
			Config.SitableHashes[GetHashKey(k)] = v
		end
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
        Citizen.Wait(250)
        LoggedIn = true
    end)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    LoggedIn = false
end)


if Config.Debug then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)

			for i=1, #debugProps, 1 do
				local coords = GetEntityCoords(debugProps[i])
				local hash = GetEntityModel(debugProps[i])
				local id = coords.x .. coords.y .. coords.z
				local model = 'unknown'

				for i=1, #Config.Interactables, 1 do
					local seat = Config.Interactables[i]

					if hash == GetHashKey(seat) then
						model = seat
						break
					end
				end

				local text = ('ID: %s~n~Hash: %s~n~Model: %s'):format(id, hash, model)

				Framework.Functions.DrawText3D(
					 coords.x,
					 coords.y,
					 coords.z + 2.0
				, text, 0.5)
			end

			if #debugProps == 0 then
				Citizen.Wait(500)
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
			print(2)
			wakeup()
		end

		if IsControlJustPressed(0, 73) and IsInputDisabled(0) and IsPedOnFoot(playerPed) then
			if sitting then
				wakeup()
			end			
		end
	end
end)

Citizen.CreateThread(function()
	local Sitables = {}

	for k,v in pairs(Config.Interactables) do
		local model = GetHashKey(v)
		table.insert(Sitables, model)
	end
	Wait(100)
	exports['nocore-eye']:AddTargetModel(Sitables, {
        options = {
            {
                event = "nocore-sit:client:sitchair",
                icon = "fas fa-chair",
                label = "Седни",
            },
        },
        job = {"all"},
        distance = Config.MaxDistance
    })
end)

RegisterNetEvent("nocore-sit:client:sitchair")
AddEventHandler("nocore-sit:client:sitchair", function(data)
	local playerPed = PlayerPedId()
	if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
		print(1)
		wakeup()
	end
	local object = data.entity
	local hash = GetEntityModel(object)
	sit(object, Config.SitableHashes[hash])
end)

function wakeup()
	print('wakeup')
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())

	TaskStartScenarioAtPosition(playerPed, currentScenario, 0.0, 0.0, 0.0, 180.0, 2, true, false)
	while IsPedUsingScenario(PlayerPedId(), currentScenario) do
		Wait(100)
	end
	ClearPedTasks(playerPed)

	FreezeEntityPosition(playerPed, false)
	FreezeEntityPosition(currentObj, true)

	TriggerServerEvent('nocore-sit:leavePlace', currentSitCoords)
	currentSitCoords, currentScenario = nil, nil
	sitting = false
	disableControls = false
end

function sit(object, data)
	-- Fix for sit on chairs behind walls
	if not HasEntityClearLosToEntity(PlayerPedId(), object, 17) then
		return
	end
	disableControls = true
	currentObj = object
	FreezeEntityPosition(object, true)

	PlaceObjectOnGroundProperly(object)
	local pos = GetEntityCoords(object)
	local playerPos = GetEntityCoords(PlayerPedId())
	local objectCoords = pos.x .. pos.y .. pos.z

	Framework.Functions.TriggerCallback('nocore-sit:getPlace', function(occupied)
		if occupied then
			Framework.Functions.Notify('Някой е седнал тук!')
		else
			local playerPed = PlayerPedId()
			lastPos, currentSitCoords = GetEntityCoords(playerPed), objectCoords

			TriggerServerEvent('nocore-sit:takePlace', objectCoords)
			
			local animationcoords = GetOffsetFromEntityInWorldCoords(object, data.leftOffset, data.forwardOffset, data.verticalOffset)
			
			
			currentScenario = data.scenario
			TaskStartScenarioAtPosition(playerPed, currentScenario, animationcoords.x, animationcoords.y , animationcoords.z + (playerPos.z - animationcoords.z)/2 , GetEntityHeading(object) + 180.0, 0, true, false)

			Citizen.Wait(2500)
			if not IsPedUsingScenario(playerPed, currentScenario) then
				ClearPedTasks(PlayerPedId())
				TaskStartScenarioAtPosition(playerPed, currentScenario, animationcoords.x, animationcoords.y , animationcoords.z + (playerPos.z - animationcoords.z)/2 , GetEntityHeading(object) + 180.0, 0, true, true)
			end

			Citizen.Wait(1000)
			sitting = true
		end
	end, objectCoords)
end