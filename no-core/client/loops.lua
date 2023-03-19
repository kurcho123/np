Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
		if NetworkIsSessionStarted() then
			Citizen.Wait(10)
			TriggerServerEvent('Framework:PlayerJoined')
			return
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
		if isLoggedIn then
			Citizen.Wait((1000 * 60) * 7)
			TriggerEvent("Framework:Player:UpdatePlayerData")
		else
			Citizen.Wait(5000)
		end
	end
end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(7)
-- 		if isLoggedIn then
-- 			Citizen.Wait((500 * 60) * 60)
-- 			TriggerEvent("Framework:Player:Salary")
-- 		else
-- 			Citizen.Wait(5000)
-- 		end
-- 	end
-- end)

--[[ Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
		if isLoggedIn then
			Citizen.Wait(30000)
			local position = Framework.Functions.GetCoords(PlayerPedId())
			TriggerServerEvent('Framework:UpdatePlayerPosition', position)
		else
			Citizen.Wait(5000)
		end
	end
end) ]]

-- // Food Enz \\ --
local Effected = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(20000)
		if isLoggedIn then
			if Framework.Functions.GetPlayerData().metadata["hunger"] <= 1 or Framework.Functions.GetPlayerData().metadata["thirst"] <= 1 then
				if not Framework.Functions.GetPlayerData().metadata["isdead"] and not Effected then
					Effected = true
					TriggerEvent("nocore-items:client:fell")
					SetTimeout((1000*60)*5, function()
						Effected = false
						ExecuteCommand('walk reset')
					end)
				end
			end
		end
	end
end)