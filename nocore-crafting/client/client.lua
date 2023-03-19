LoggedIn = false
Framework = exports['no-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		Citizen.SetTimeout(1250, function()
			Framework.Functions.TriggerCallback('nocore-crafting:server:get:config', function(ConfigData)
				Config.Locations = ConfigData
			end)
			SetupItemsExplosive()
			SetupItems()
			LoggedIn = true
		end)	
	end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
		ShutdownLoadingScreenNui()
		print('loadscreen shutdown')
		Framework.Functions.TriggerCallback('nocore-crafting:server:get:config', function(ConfigData)
			Config.Locations = ConfigData
		end)
		SetupItemsExplosive()
		SetupItems()
        LoggedIn = true
    end)
end)

function SetupItemsExplosive()
	local items = {}
	for k, item in pairs(Config.CraftingExplosive) do
		local ItemInfo
		local description = ''
		local i = 1
		for k, v in pairs(item.costs) do
			if i == 1 then
				description = description .. Framework.Shared.Items[k]["label"] .. ': '..v..'x'
			else
				description = description ..', '.. Framework.Shared.Items[k]["label"] .. ': '..v..'x'
			end
			i = i + 1
		end 
		i = 1
		ItemInfo = {costs = description}
		local itemInfo = Framework.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = ItemInfo,
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
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
	Config.CraftingExplosive = items
end

function SetupItems() -- sex
	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		local ItemInfo
		local description = ''
		local i = 1
		for k, v in pairs(item.costs) do
			if i == 1 then
				description = description .. Framework.Shared.Items[k]["label"] .. ': '..v..'x'
			else
				description = description ..', '.. Framework.Shared.Items[k]["label"] .. ': '..v..'x'
			end
			i = i + 1
		end 
		i = 1
		ItemInfo = {costs = description}
		local itemInfo = Framework.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = ItemInfo,
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
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
	Config.CraftingItems = items
end

