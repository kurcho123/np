


--[[ Thread ]]
RegisterNetEvent('nocore-crafting:opentable')
AddEventHandler('nocore-crafting:opentable', function()
	if exports["nocore-progressbar"]:GetTaskBarStatus() then Framework.Functions.Notify("Самоубий се", "error", 5000, "ABUSER") return end
	local Crating = {}
	Crating.label = _U("craftlabel")
	Crating.items = GetThresholdItems()
	TriggerServerEvent('nocore-inventory:server:set:inventory:disabled', true)
	TriggerServerEvent("nocore-inventory:server:OpenInventory", "crafting", math.random(1, 99), Crating)
end)
--[[ Functions ]]

function GetThresholdItems()
	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		if Framework.Functions.GetPlayerData().metadata["craftingrep"] >= Config.CraftingItems[k].threshold then
			items[k] = Config.CraftingItems[k]
		end
	end
	return items
end


