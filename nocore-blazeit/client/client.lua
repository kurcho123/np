Framework = exports['no-core']:GetCoreObject()

local debug = false

Citizen.CreateThread(function()
    blazeblip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(blazeblip, 140)
    SetBlipDisplay(blazeblip, 3)
    SetBlipColour(blazeblip, 2)
    SetBlipAsShortRange(blazeblip, true)
    SetBlipScale(blazeblip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(blazeblip)
end)

Citizen.CreateThread(function()
	exports['nocore-eye']:AddBoxZone("blazefridge", vector3(360.22, -1255.17, 32.52), 3.5, 0.5, { name="blazefridge", heading = 0, debugPoly=debug, minZ=30.84, maxZ=33.84 },
		{ options = { {  event = "nocore-blaze:Stash", icon = "fas fa-temperature-low", label = "Склад", stash = "Fridge", job = "blazeit", max = 10000000, slots = 100 }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("blazefridge2", vector3(365.81, -1268.81, 31.81), 0.6, 0.6, { name="blazefridge2", heading = 60, debugPoly=debug, minZ=30.84, maxZ=33.84 },
		{ options = { {  event = "nocore-blaze:Stash", icon = "fas fa-temperature-low", label = "Хладилник", stash = "Fridge2", job = "blazeit", max = 10000000, slots = 10  }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("blazetable", vector3(369.57, -1269.2, 32.59), 0.65, 1.0, { name="blazetable", heading = 320, debugPoly=debug, minZ=32.19, maxZ=33.99 },
		{ options = { {  event = "nocore-blaze:Stash", icon = "fas fa-circle", label = "Табла", stash = "Table" }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("BlazeHob", vector3(364.68, -1254.87, 31.64), 2.5, 0.6, { name="BlazeHob", heading = 0, debugPoly=debug, minZ = 30.84, maxZ = 35.84, },
		{ options = {
			{
			event = "nocore-blaze:Menu:Hob",
			icon = "fas fa-temperature-high",
			label = "Маса",
			job = "blazeit"
			},
		},
		  distance = 2.0
	})

	exports['nocore-eye']:AddBoxZone("blazemenu", vector3(368.08, -1268.13, 32.59), 2.6, 1.0, {
		name="blazemenu",
		heading=230,
		debugPoly=debug,
		minZ=31.79,
		maxZ=33.79
	}, { options = {
		{
			type = 'server',
			event = 'nocore-printer:restaurantMenus',
			icon = "fas fa-file-lines",
			label = "Вземи меню",
			menu = 'blaze-menu',
			give = true
		},
		{
			type = 'server',
			event = 'nocore-printer:restaurantMenus',
			icon = 'fas fa-file-lines',
			label = "Виж меню",
			menu = 'blaze-menu',
			give = false
		}
	},
		distance = 2.0
	})
end)

RegisterNetEvent('nocore-blaze:MakeItem')
AddEventHandler('nocore-blaze:MakeItem', function(data)
	if not Framework.Functions.GetPlayerData().job.onduty then TriggerEvent('Framework:Notify', "Не сте на смяна", 'error') else
		if data.item == "blaze_water" or data.item == "blaze_cake" or data.item == "blaze_biscuits" or data.item == "blaze_fresh" or data.item == "blaze_cappuccino" or data.item == "blaze_tost" then
			Framework.Functions.TriggerCallback('nocore-blaze:get:'..data.item, function(amount)
				if not amount then TriggerEvent('Framework:Notify', "Нямате нужните съставки", 'error') else FoodProgress(data.item) end
			end)
		end
	end
end)

RegisterNetEvent('nocore-blaze:Stash')
AddEventHandler('nocore-blaze:Stash',function(data)
	id = data.stash
	maxWeight = data.max or 100000
	invSlots = data.slots or 10
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "blaze_"..id,{
		maxweight = maxWeight,
		slots =invSlots
	})
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "blaze_"..id)
end)

function FoodProgress(ItemMake)
	if ItemMake == "blaze_water" or ItemMake == "blaze_cake" or ItemMake == "blaze_biscuits" or ItemMake == "blaze_fresh" or ItemMake == "blaze_cappuccino" or ItemMake == "blaze_tost" then
		bartext = "Приготвяне на "..Framework.Shared.Items[ItemMake].label
		bartime = 5000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	end
	Framework.Functions.Progressbar('makingpizzafood', bartext, bartime, false, false, {
		disableMovement = true, --
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = 8,
	}, {}, {}, function()
		TriggerServerEvent('nocore-blaze:GetFood', ItemMake)
		StopAnimTask(PlayerPedId(), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('nocore-inventory:client:busy:status', false)
		TriggerEvent('Framework:Notify', "Отказано!", 'error')
	end, 'fa-solid fa-mug-saucer')
end

RegisterNetEvent('nocore-blaze:Menu:Hob', function()
    exports['nocore-context']:openMenu({
        { id = 1, header = "BlazeIt", isMenuHeader = true },
        { id = 2, header = "Кексче", txt = "Брашно <br> Дестилирана вода <br> Яйце", params = { event = "nocore-blaze:MakeItem", args = { item = 'blaze_cake' } } },
        { id = 3, header = "Бисквити", txt = "Брашно <br> Дестилирана вода", params = { event = "nocore-blaze:MakeItem", args = { item = 'blaze_biscuits' } } },
        { id = 4, header = "Газирана Вода", txt = "Дестилирана вода", params = { event = "nocore-blaze:MakeItem", args = { item = 'blaze_water' } } },
		{ id = 5, header = "Портокалов Фреш", txt = "Портокал <br> Дестилирана вода", params = { event = "nocore-blaze:MakeItem", args = { item = 'blaze_fresh' } } },
		{ id = 6, header = "Капучино", txt = "Дестилирана вода <br> Зърна", params = { event = "nocore-blaze:MakeItem", args = { item = 'blaze_cappuccino' } } },
		{ id = 7, header = "Тост", txt = "Питка <br> Шунка <br> Маруля <br> Моцарела", params = { event = "nocore-blaze:MakeItem", args = { item = 'blaze_tost' } } },
    })
end)

RegisterNetEvent('nocore-blaze:JustGive', function(data)
	if not Framework.Functions.GetPlayerData().job.onduty then TriggerEvent('Framework:Notify', "Не сте на смяна", 'error') else
		FoodProgress(data.item)
	end
end)