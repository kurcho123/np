Framework = exports['no-core']:GetCoreObject()


PlayerJob = {}
local debug = false

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "catcoffee" then
                TriggerServerEvent("Framework:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    PlayerJob.onduty = Onduty
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		Framework.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
		end)
    end
end)

Citizen.CreateThread(function()
    catcafeblip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(catcafeblip, 89)
    SetBlipDisplay(catcafeblip, 3)
    SetBlipColour(catcafeblip, 48)
    SetBlipAsShortRange(catcafeblip, true)
    SetBlipScale(catcafeblip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(catcafeblip)
end)

Citizen.CreateThread(function()
    storage = AddBlipForCoord(585.78302, 2782.3591, 43.481185)
    SetBlipSprite(storage, 289)
    SetBlipDisplay(storage, 3)
    SetBlipColour(storage, 48)
	SetBlipAsShortRange(storage, true)
    SetBlipScale(storage, 0.5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Склад за продукти")
    EndTextCommandSetBlipName(storage)
end)


--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
-- CreateThread(function()
-- 	JobLocation = PolyZone:Create({
-- 		vector2(-622.73, -1173.48),
-- 		vector2(-622.73, -964.39),
-- 		vector2(-555.30, -966.67),
-- 		vector2(-553.79, -1102.27),
-- 		vector2(-567.42, -1162.12)
-- 	   }, {
-- 		name="catcafe",
-- 		--minZ=0,
-- 		--maxZ=800
-- 	   })
-- 	JobLocation:onPlayerInOut(function(isPointInside) 
-- 		if LocalPlayer.state.isLoggedIn and not isPointInside and Framework.Functions.GetPlayerData().job.onduty and PlayerJob.name == "catcoffee" then 
-- 			Framework.Functions.Notify("Отдалечи се твърде много от работното си място!", "error")
-- 			TriggerEvent("nocore-police:client:ToggleDuty") 
-- 		end 
-- 	end)		
-- end)

Citizen.CreateThread(function()
--Stashes
	exports['nocore-eye']:AddBoxZone("CatPrepared", vector3(-587.4, -1059.6, 23.45), 2.0, 2.5, { name="CatPrepared", heading = 270.0, debugPoly=debug, minZ=21.45, maxZ=23.45 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-box-open", label = "Храна", stash = "Shelf" }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("CatMenu", vector3(-584.2647, -1060.404, 22.408178), 1.0, 1.5, { name="CatMenu", heading = 270.0, debugPoly=debug, minZ=21.45, maxZ=23.45 },
	{ options = {
		{
			type = 'server',
			event = 'nocore-printer:restaurantMenus',
			icon = "fas fa-file-lines",
			label = "Вземи меню",
			menu = 'cat-menu',
			give = true
		},
		{
			type = 'server',
			event = 'nocore-printer:restaurantMenus',
			icon = 'fas fa-file-lines',
			label = "Виж меню",
			menu = 'cat-menu',
			give = false
		}
	},
	  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("BossMenu", vector3(-578.4069, -1066.969, 27.115188), 2.0, 2.5, { name="BossMenu", heading = 270.0, debugPoly=debug, minZ=26.45, maxZ=27.45 },
	{ options = { {  event = "nocore-bossmenu:client:OpenMenu", icon = "fas fa-box-open", label = "Шеф", job = "catcoffee" }, },
	  distance = 2.0
	})
	--FRIDGE
	exports['nocore-eye']:AddBoxZone("CatFridge", vector3(-588.06, -1067.1, 22.34), 3.5, 0.5, { name="CatFridge", heading = 0, debugPoly=debug, minZ=19.84, maxZ=23.84 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-temperature-low", label = "Хладилник", stash = "Fridge", job = "catcoffee", max = 10000000, slots = 100 }, },
		  distance = 1.0
	})
	exports['nocore-eye']:AddBoxZone("CatFridge2", vector3(-590.67, -1068.1, 22.34), 2.0, 0.6, { name="HenFridge2", heading = 0, debugPoly=debug, minZ=19.84, maxZ=23.84 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-temperature-low", label = "Хладилник", stash = "Fridge", job = "catcoffee", max = 10000000, slots = 100  }, },
		  distance = 1.0
	})

	--WARESTORAGE


	--Sinks
	exports['nocore-eye']:AddBoxZone("CatWash1", vector3(-587.89, -1062.58, 22.36), 0.7, 0.7, { name="CatWash1", heading = 0, debugPoly=debug, minZ=19.11, maxZ=23.11 },
		{ options = { { event = "nocore-catcafe:washHands", icon = "fas fa-hand-holding-water", label = "Мивка" }, },
		  distance = 1.5
	})
	exports['nocore-eye']:AddBoxZone("CatWash2", vector3(-570.23, -1051.41, 22.34), 0.5, 0.5, { name="CatWash2", heading = 0, debugPoly=debug, minZ=21.74, maxZ=22.94, },
		{ options = { { event = "nocore-catcafe:washHands", icon = "fas fa-hand-holding-water", label = "Мивка" }, },
		  distance = 1.2
	})
	exports['nocore-eye']:AddBoxZone("CatWash3", vector3(-570.25, -1056.98, 22.34), 0.5, 0.5, { name="CatWash3", heading = 0, debugPoly=debug, debugPoly=debug, minZ=21.74, maxZ=22.94, },
		{ options = { { event = "nocore-catcafe:washHands", icon = "fas fa-hand-holding-water", label = "Мивка" }, },
		  distance = 1.2
	})

	--Clockin
	exports['nocore-eye']:AddBoxZone("CatClockin", vector3(-594.34, -1053.35, 22.34), 3.5, 0.5, { name="CatClockin", heading = 0, debugPoly=debug, minZ=22.19, maxZ=23.79 },
		{ options = { { event = "nocore-police:client:ToggleDuty", icon = "fas fa-user-check", label = "Влез на/Излез от смяна", job = "catcoffee" }, },
		  distance = 2.0
	})

	--Oven
	exports['nocore-eye']:AddBoxZone("CatOven", vector3(-590.66, -1059.13, 22.34), 2.5, 0.6, { name="CatOven", heading = 0, debugPoly=debug, minZ = 19.84, maxZ = 23.84, },
		{ options = { { event = "nocore-catcafe:Menu:Oven", icon = "fas fa-temperature-high", label = "Печка", job = "catcoffee" }, },
		  distance = 2.0
	})

	--Oven
	exports['nocore-eye']:AddBoxZone("CatHob", vector3(-591.02, -1056.56, 22.36), 1.5, 0.6, { name="CatHob", heading = 0, debugPoly=debug, minZ = 19.84, maxZ = 23.84, },
		{ options = { { event = "nocore-catcafe:Menu:Hob", icon = "fas fa-temperature-high", label = "Котлон", job = "catcoffee" }, },
		  distance = 2.0
	})

	--Trays
	exports['nocore-eye']:AddBoxZone("CatCounter", vector3(-584.01, -1059.27, 22.34), 0.6, 0.6, { name="CatCounter", heading = 0, debugPoly=debug, minZ=19.04, maxZ=23.04 },
		{ options = { { event = "nocore-catcafe:Stash", icon = "fas fa-hamburger", label = "Поръчка", stash = "Counter" }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("CatCounter2", vector3(-584.04, -1062.05, 22.34), 0.6, 0.6, { name="CatCounter2", heading = 0, debugPoly=debug, minZ=19.04, maxZ=23.04 },
		{ options = { { event = "nocore-catcafe:Stash", icon = "fas fa-hamburger", label = "Поръчка", stash = "Counter2" }, },
		  distance = 2.0
	})

	--Coffee
	exports['nocore-eye']:AddBoxZone("CatCoffee", vector3(-586.8, -1061.89, 22.34), 0.7, 0.5, { name="CatCoffee", heading = 0, debugPoly=debug, minZ=21.99, maxZ=23.19 },
		{ options = { { event = "nocore-catcafe:Menu:Coffee", icon = "fas fa-mug-hot", label = "Кафе", job = "catcoffee" }, },
		  distance = 2.0
	})
	--Chopping Board
	exports['nocore-eye']:AddBoxZone("CatBoard", vector3(-590.94, -1063.16, 22.36), 1.5, 0.6, { name="CatBoard", heading = 0, debugPoly=debug, minZ=18.96, maxZ=22.96, },
		{ options = { { event = "nocore-catcafe:Menu:ChoppingBoard", icon = "fas fa-utensils", label = "Приготви храна", job = "catcoffee" }, },
		  distance = 2.0
	})
	--Tables
	exports['nocore-eye']:AddBoxZone("CatTable", vector3(-573.43, -1059.76, 22.49), 1.9, 1.0, { name="CatTable", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-box-open", label = "Маса", stash = "Table_1" }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("CatTable2", vector3(-573.44, -1063.45, 22.34), 1.9, 1.0, { name="CatTable2", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-box-open", label = "Маса", stash = "Table_2" }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("CatTable3", vector3(-573.41, -1067.09, 22.49), 1.9, 1.0, { name="CatTable3", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-box-open", label = "Маса", stash = "Table_3" }, },
		  distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("CatTable4", vector3(-578.68, -1051.09, 22.35), 1.2, 0.9, { name="CatTable4", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "nocore-catcafe:Stash", icon = "fas fa-box-open", label = "Маса", stash = "Table_4" }, },
		  distance = 2.0
	})

end)

RegisterNetEvent('nocore-catcafe:washHands')
AddEventHandler('nocore-catcafe:washHands',function()
    Framework.Functions.Progressbar('washing_hands', 'Миене на ръце', 5000, false, true, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
		disableInventory = true,
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 8,
	}, {}, {}, function()
		StopAnimTask(PlayerPedId(), 'mp_arresting', "a_uncuff", 1.0)
		TriggerEvent('Framework:Notify', "Измихте си ръцете!", 'success')
	end, function()
		StopAnimTask(PlayerPedId(), 'mp_arresting', "a_uncuff", 1.0)
		TriggerEvent('Framework:Notify', "Отказано", 'error')
    end, 'fas fa-hand-holding-water')
end)


RegisterNetEvent('nocore-catcafe:MakeItem')
AddEventHandler('nocore-catcafe:MakeItem', function(data)
	if not Framework.Functions.GetPlayerData().job.onduty then TriggerEvent('Framework:Notify', "Не сте на смяна", 'error') else
		if data.item == "bmochi" or data.item == "gmochi" or data.item == "omochi" or data.item == "pmochi" or data.item == "riceball" or data.item == "bento" then
			Framework.Functions.TriggerCallback('nocore-catcafe:get:'..data.item, function(amount)
				if not amount then TriggerEvent('Framework:Notify', "Нямате нужните съставки", 'error') else FoodProgress(data.item) end
			end)
		elseif data.item == "nekocookie" or data.item == "nekodonut" or data.item == "cake" or data.item == "miso" then
			Framework.Functions.TriggerCallback('nocore-catcafe:get:'..data.item, function(amount)
				if not amount then TriggerEvent('Framework:Notify', "Нямате нужните съставки", 'error') else FoodProgress(data.item) end
			end)
		elseif data.item == "bobatea" or data.item == "bbobatea" or data.item == "gbobatea" or data.item == "pbobatea" or data.item == "obobatea" then
			Framework.Functions.TriggerCallback('nocore-catcafe:get:'..data.item, function(amount)
				if not amount then TriggerEvent('Framework:Notify', "Нямате нужните съставки", 'error') else FoodProgress(data.item) end
			end)
		elseif data.item == "cakepop" or data.item == "pizza" or data.item == "pancake" or data.item == "purrito" or data.item == "mocha" or data.item == "noodlebowl" or data.item == "ramen" then
			Framework.Functions.TriggerCallback('nocore-catcafe:get:'..data.item, function(amount)
				if not amount then TriggerEvent('Framework:Notify', "Нямате нужните съставки", 'error') else FoodProgress(data.item) end
			end)
		end
	end
end)

RegisterNetEvent('nocore-catcafe:Stash')
AddEventHandler('nocore-catcafe:Stash',function(data)
	id = data.stash
	maxWeight = data.max or 100000
	invSlots = data.slots or 10
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "CatCafe_"..id,{
		maxweight = maxWeight,
		slots =invSlots
	})
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "CatCafe_"..id)
end)

RegisterNetEvent('nocore-catcafe:Shop')
AddEventHandler('nocore-catcafe:Shop',function()
TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "catcafe", Config.Items)
end)

RegisterNetEvent('nocore-catcafe:catmenu')
AddEventHandler('nocore-catcafe:catmenu',function()
	TriggerEvent('Framework:Notify', "Ти си взе меню!", 'info')
	TriggerServerEvent('nocore-printer:server:addcat-menu', source)
end)

RegisterNetEvent('nocore-catcafe:ShopV')
AddEventHandler('nocore-catcafe:ShopV',function()
TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "catcafe", Config.ItemsV)
end)



-- // Functions \\

function FoodProgress(ItemMake)
	if ItemMake == "purrito" or ItemMake == "bmochi" or ItemMake == "pmochi" or ItemMake == "gmochi" or ItemMake == "omochi" or ItemMake == "riceball" or ItemMake == "bento" then
		bartext = "Приготвяне на "..Framework.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	elseif ItemMake == "cakepop" or ItemMake == "pancake" or ItemMake == "pizza" or ItemMake == "nekocookie" or ItemMake == "nekodonut" or ItemMake == "cake" or ItemMake == "miso" or ItemMake == "noodlebowl" or ItemMake == "ramen" then
		bartext = "Приготвяне на "..Framework.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	elseif ItemMake == "mocha" or ItemMake == "burger-coffee" or ItemMake == "nekolatte" or ItemMake == "obobatea" or ItemMake == "pbobatea" or ItemMake == "gbobatea" or ItemMake == "bbobatea" or ItemMake == "bobatea" then
		bartext = "Наливане на "..Framework.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
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
		TriggerServerEvent('nocore-catcafe:GetFood', ItemMake)
		StopAnimTask(PlayerPedId(), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('nocore-inventory:client:busy:status', false)
		TriggerEvent('Framework:Notify', "Отказано!", 'error')
	end, 'fa-solid fa-mug-saucer')
end

-- // Utilities \\ 

RegisterNetEvent('nocore-catcafe:Menu:ChoppingBoard', function()
    exports['nocore-context']:openMenu({
        { id = 1, header = "Chopping Board", isMenuHeader = true },
        { id = 2, header = "Blue Mochi", txt = "Захар - Брашно - Боровинка", params = { event = "nocore-catcafe:MakeItem", args = { item = 'bmochi' } } },
        { id = 3, header = "Green Mochi", txt = "Захар - Брашно - Matcha", params = { event = "nocore-catcafe:MakeItem", args = { item = 'gmochi' } } },
        { id = 4, header = "Orange Mochi", txt = "Захар - Брашно - Портокал", params = { event = "nocore-catcafe:MakeItem", args = { item = 'omochi' } } },
        { id = 5, header = "Pink Mochi", txt = "Захар - Брашно - Starberry", params = { event = "nocore-catcafe:MakeItem", args = { item = 'pmochi' } } },
        { id = 6, header = "Neko Onigiri", txt = "Rice - Nori", params = { event = "nocore-catcafe:MakeItem", args = { item = 'riceball' } } },
        { id = 7, header = "Bento Box", txt = "Rice - Nori - Tofu", params = { event = "nocore-catcafe:MakeItem", args = { item = 'bento' } } },
        { id = 8, header = "Purrito", txt = "Брашно - Rice - Onion", params = { event = "nocore-catcafe:MakeItem", args = { item = 'purrito' } } },
    })
end)

RegisterNetEvent('nocore-catcafe:Menu:Oven', function()
    exports['nocore-context']:openMenu({
        { id = 1, header = "Food Menu", isMenuHeader = true },
        { id = 2, header = "Neko Cookie", txt = "Брашно - Мляко", params = { event = "nocore-catcafe:MakeItem", args = { item = 'nekocookie' } } },
        { id = 3, header = "Neko Donut", txt = "Брашно - Мляко", params = { event = "nocore-catcafe:MakeItem", args = { item = 'nekodonut' } } },
        { id = 4, header = "Neko Cake", txt = "Брашно - Мляко - Ягода", params = { event = "nocore-catcafe:MakeItem", args = { item = 'cake' } } },
        { id = 5, header = "Cat Cake-Pop", txt = "Брашно - Мляко - Захар", params = { event = "nocore-catcafe:MakeItem", args = { item = 'cakepop' } } },
        { id = 6, header = "Pawcake", txt = "Брашно - Мляко - Ягода", params = { event = "nocore-catcafe:MakeItem", args = { item = 'pancake' } } },
        { id = 7, header = "Kitty Pizza", txt = "Брашно - Мляко ", params = { event = "nocore-catcafe:MakeItem", args = { item = 'pizza' } } },
    })
end)

RegisterNetEvent('nocore-catcafe:Menu:Coffee', function()
    exports['nocore-context']:openMenu({
        { id = 1, header = "Напитки", isMenuHeader = true },
        { id = 2, header = "Кафе", txt = "", params = { event = "nocore-catcafe:JustGive", args = { item = 'burger-coffee' } } },
        { id = 3, header = "Neko Latte", txt = "", params = { event = "nocore-catcafe:JustGive", args = { item = 'nekolatte' } } },
        { id = 4, header = "Boba Tea", txt = "Boba - Мляко", params = { event = "nocore-catcafe:MakeItem", args = { item = 'bobatea' } } },
        { id = 5, header = "Blue Boba Tea", txt = "Boba - Мляко - Боровинка", params = { event = "nocore-catcafe:MakeItem", args = { item = 'bbobatea' } } },
        { id = 6, header = "Green Boba Tea", txt = "Boba - Мляко - Matcha", params = { event = "nocore-catcafe:MakeItem", args = { item = 'gbobatea' } } },
        { id = 7, header = "Pink Boba Tea", txt = "Boba - Мляко - Ягода", params = { event = "nocore-catcafe:MakeItem", args = { item = 'pbobatea' } } },
        { id = 8, header = "Orange Boba Tea", txt = "Boba - Мляко - Портокал", params = { event = "nocore-catcafe:MakeItem", args = { item = 'obobatea' } } },
        { id = 9, header = "Mocha Meow", txt = "Мляко - Захар", params = { event = "nocore-catcafe:MakeItem", args = { item = 'mocha' } } },
    })
end)

RegisterNetEvent('nocore-catcafe:Menu:Hob', function()
    exports['nocore-context']:openMenu({
        { id = 1, header = "Котлон", isMenuHeader = true },
        { id = 2, header = "Miso Soup", txt = "Nori - Tofu - Onion", params = { event = "nocore-catcafe:MakeItem", args = { item = 'miso' } } },
        { id = 3, header = "Bowl of Noodles", txt = "Noodles", params = { event = "nocore-catcafe:MakeItem", args = { item = 'noodlebowl' } } },
        { id = 4, header = "Bowl of Ramen", txt = "Noodles - Onion", params = { event = "nocore-catcafe:MakeItem", args = { item = 'ramen' } } },
    })
end)



RegisterNetEvent('nocore-catcafe:JustGive', function(data)
	if not Framework.Functions.GetPlayerData().job.onduty then TriggerEvent('Framework:Notify', "Не сте на смяна", 'error') else
		FoodProgress(data.item)
	end
end)