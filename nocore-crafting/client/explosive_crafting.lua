AddEventHandler('nocore-crafting:openexplosivetable', function()
	if exports["nocore-progressbar"]:GetTaskBarStatus() then Framework.Functions.Notify("Самоубий се", "error", 5000, "ABUSER") return end
	local Crating = {}
	Crating.label = "Explosive Workbench"
	Crating.items = GetThresholdExplosive()
	TriggerServerEvent('nocore-inventory:server:set:inventory:disabled', true)
	TriggerServerEvent("nocore-inventory:server:OpenInventory", "crafting_explosive", math.random(1, 99), Crating)
end)

function GetThresholdExplosive()
	local items = {}
	for k, item in pairs(Config.CraftingExplosive) do
		if Framework.Functions.GetPlayerData().metadata["explosivecraftingrep"] >= Config.CraftingExplosive[k].threshold then
			items[k] = Config.CraftingExplosive[k]
		end
	end
	return items
end