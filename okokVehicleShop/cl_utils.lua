local QBCore = exports["no-core"]:GetCoreObject()

function QBCoref()
	return exports["no-core"]:GetCoreObject()
end

RegisterNetEvent(Config.EventPrefix..":giveKeys")
AddEventHandler(Config.EventPrefix..":giveKeys", function(vehicle)
	exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
	-- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end)

RegisterNetEvent(Config.EventPrefix..":giveKeysTestDrive")
AddEventHandler(Config.EventPrefix..":giveKeysTestDrive", function(vehicle)
	exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
	-- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end)

RegisterNetEvent(Config.EventPrefix..":giveKeysTowTruck")
AddEventHandler(Config.EventPrefix..":giveKeysTowTruck", function(vehicle)
	exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
	-- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end)

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(notifyName, text)
	local data = Config.NotificationsText[notifyName]

	QBCore.Functions.Notify(text, data.type, data.time, data.title)
end)

RegisterNetEvent(Config.EventPrefix..":onMenuOpen")
AddEventHandler(Config.EventPrefix..":onMenuOpen", function()
	TriggerEvent('togglehud', true)
	-- Code to execute when the player opens the vehicle shop
end)

RegisterNetEvent(Config.EventPrefix..":onMenuClose")
AddEventHandler(Config.EventPrefix..":onMenuClose", function()
	TriggerEvent('togglehud', false)
	-- Code to execute when the player leaves the vehicle shop
end)

RegisterNetEvent(Config.EventPrefix..":onStartTestDrive")
AddEventHandler(Config.EventPrefix..":onStartTestDrive", function()
	TriggerEvent('togglehud', false)
	-- Code to execute when the player starts the test drive
end)

RegisterNetEvent(Config.EventPrefix..":onFinishTestDrive")
AddEventHandler(Config.EventPrefix..":onFinishTestDrive", function(vehicle)
	TriggerEvent('togglehud', true)
	-- Code to execute when the player finishes the test drive
end)

RegisterNetEvent(Config.EventPrefix..":createVehicleAfterBuying")
AddEventHandler(Config.EventPrefix..":createVehicleAfterBuying", function(vehicle_id, vehicle_name, id, vehicleColor, spawnLocationID)
	Citizen.Wait(1300)

	local playerPed = PlayerPedId()
	local spawnPos = {x = -9.728793, y = -1095.846, z = 26.740125, h = 68.664154}

	QBCore.Functions.SpawnVehicle(vehicle_id, function(vehicle_tests)
		while not DoesEntityExist(vehicle_tests) do
			Citizen.Wait(20)
		end

		if vehicleColor == nil then
			if Config.UseColorID then
				SetVehicleColours(vehicle_tests, Config.colors["color1"]["id"], Config.colors["color1"]["id"])
			else
				SetVehicleCustomPrimaryColour(vehicle_tests, Config.colors["color1"][1], Config.colors["color1"][2], Config.colors["color1"][3])
				SetVehicleCustomSecondaryColour(vehicle_tests, Config.colors["color1"][1], Config.colors["color1"][2], Config.colors["color1"][3])
			end
		else
			if Config.UseColorID then
				SetVehicleColours(vehicle_tests, vehicleColor["id"], vehicleColor["id"])
			else
				SetVehicleCustomPrimaryColour(vehicle_tests, vehicleColor[1], vehicleColor[2], vehicleColor[3])
				SetVehicleCustomSecondaryColour(vehicle_tests, vehicleColor[1], vehicleColor[2], vehicleColor[3])
			end
		end
			
		local newPlate = GeneratePlate()
		local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle_tests)
		
		vehicleProps.plate = newPlate
		SetVehicleDirtLevel(vehicle, 0.0)
		SetVehicleNumberPlateText(vehicle_tests, newPlate)
		SetEntityHeading(vehicle_tests, Config.ShowVehicle[id].vehicleSpawn[spawnLocationID].h)
		TriggerEvent(Config.EventPrefix..":giveKeys", vehicle_tests)
		while not DoesEntityExist(vehicle_tests) do
			Citizen.Wait(0)
		end
		
		TaskWarpPedIntoVehicle(playerPed, vehicle_tests, -1)
		TriggerServerEvent(Config.EventPrefix..':setVehicleOwned', vehicleProps, vehicle_id, id)
	end, spawnPos, true)
end)



-- Plate generation


local NumberCharset = {}
local Charset = {}

for i = 48,	57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,	90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(0)
		math.randomseed(GetGameTimer())
		if Config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. ' ' .. GetRandomNumber(Config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))
		end

		QBCore.Functions.TriggerCallback(Config.EventPrefix..':isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end