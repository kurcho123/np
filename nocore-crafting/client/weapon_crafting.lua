--[[ 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(4)
		if LoggedIn then
			NearLocation = false
			local PlayerCoords = GetEntityCoords(PlayerPedId())
			local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Locations['Weapons']['X'], Config.Locations['Weapons']['Y'], Config.Locations['Weapons']['Z'], true)
			if Distance < 2 then
				NearLocation = true
				Framework.Functions.DrawText3D(2, Config.Locations['Weapons']['X'], Config.Locations['Weapons']['Y'], Config.Locations['Weapons']['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
				if IsControlJustReleased(0, 38) then
					local Crating = {}
					Crating.label = "Weapon Workbench"
					Crating.items = GetThresholdWeapons()
					TriggerServerEvent('nocore-inventory:server:set:inventory:disabled', true)
					TriggerServerEvent("nocore-inventory:server:OpenInventory", "crafting_weapon", math.random(1, 99), Crating)
				end
			end
			if not NearLocation then
				Citizen.Wait(1500)
			end
		end
	end
end)


function GetThresholdWeapons()
	local items = {}
	for k, item in pairs(Config.CraftingWeapons) do
		items[k] = Config.CraftingWeapons[k]
	end
	return items
end

function SetupWeaponInfo()
	local items = {}
	for k, item in pairs(Config.CraftingWeapons) do
		local itemInfo = Framework.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = item.description,
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.CraftingWeapons = items
end ]]