local Framework = exports['no-core']:GetCoreObject()

local PlayerJob = {}
local canDo = false

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
            if PlayerData.job.name == "beanlegion" then
                TriggerServerEvent("Framework:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
	PlayerJob = JobInfo
end) 

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		Framework.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
		end)
    end
end)

local function jobCheck()
	canDo = true
	if not Framework.Functions.GetPlayerData().job.onduty then TriggerEvent('Framework:Notify', "Не сте на смяна!", 'error') canDo = false end
	return canDo
end

CreateThread(function()
	local bossroles = {}
	for k, v in pairs(Framework.Shared.Jobs["beanlegion"].grades) do
		if Framework.Shared.Jobs["beanlegion"].grades[k].isboss == true then
			if bossroles["beanlegion"] ~= nil then
				if bossroles["beanlegion"] > tonumber(k) then bossroles["beanlegion"] = tonumber(k) end
			else bossroles["beanlegion"] = tonumber(k)	end
		end
	end
	-- for k, v in pairs(BeanLegion.Locations) do
	-- 	JobLocation = PolyZone:Create({
	-- 		vector2(96.59, -983.33),
	-- 		vector2(212.12, -1024.24),
	-- 		vector2(192.05, -1120.83),
	-- 		vector2(27.65, -1121.97)
	-- 	   }, {
	-- 		name = BeanLegion.Locations[k].label,
	-- 		debugPoly = BeanLegion.Debug
	-- 		--minZ=0,
	-- 		--maxZ=800
	-- 	   })
	-- 	JobLocation:onPlayerInOut(function(isPointInside) 
	-- 		if LocalPlayer.state.isLoggedIn and not isPointInside and Framework.Functions.GetPlayerData().job.onduty and PlayerJob.name == "beanlegion" then 
	-- 			Framework.Functions.Notify("Отдалечи се твърде много от работното си място!", "error")
	-- 			TriggerEvent("nocore-police:client:ToggleDuty") 
	-- 		end
	-- 	end)
	-- end
	for k, v in pairs(BeanLegion.Locations) do
		if BeanLegion.Locations[k].blip ~= nil then
			blip = AddBlipForCoord(BeanLegion.Locations[k].blip)
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 106)
			SetBlipColour(blip, BeanLegion.Locations[k].blipcolor)
			SetBlipScale(blip, 0.7)
			SetBlipDisplay(blip, 6)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("Legion Bean Machine")
			EndTextCommandSetBlipName(blip)
		end
	end

	exports['nocore-eye']:AddBoxZone("BeanWash", vector3(123.73, -1039.24, 29.28), 1.2, 0.6, {
		name="BeanWash",
		heading = 340.0,
		debugPoly=BeanLegion.Debug,
		minZ=28.88,
		maxZ=29.68
	}, {
		options = {
			{
				event = "nocore-beanmachine:washHands",
				icon = "fas fa-hand-holding-water",
				label = "Мивка",
				job = "beanlegion"
			},
		},
		distance = 1.5
	})
	exports['nocore-eye']:AddBoxZone("BeanCounter", vector3(120.54, -1040.74, 29.28), 0.6, 0.4, {
		name="BeanCounter",
		heading = 340.0,
		debugPoly=BeanLegion.Debug,
		minZ=29.08,
		maxZ=29.88 
	}, {
		options = {
			{
				event = "nocore-beanmachine:Stash",
				icon = "fas fa-mug-saucer",
				label = "Поръчка",
				stash = "Counter"
			},
		},
		distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("BeanCounter2", vector3(121.85, -1037.08, 29.28), 0.6, 0.4, { name="BeanCounter2", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=29.88 }, 
		{ options = { { event = "nocore-beanmachine:Stash", icon = "fas fa-mug-saucer", label = "Поръчка", stash = "Counter2" }, }, distance = 2.0 })

	exports['nocore-eye']:AddBoxZone("BeanFridge", vector3(124.51, -1037.97, 29.28), 0.85, 0.6, { name="BeanFridge", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.28, maxZ=30.08 }, 
	{ options = { { event = "nocore-beanmachine:Stash", icon = "fas fa-archive", label = "Склад", job = "beanlegion", stash = "Storage" }, }, distance = 1.5 })
	exports['nocore-eye']:AddBoxZone("BeanFridge2", vector3(123.5, -1040.74, 29.28), 0.9, 0.6, { name="BeanFridge2", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.28, maxZ=30.08 },  
	{ options = { { event = "nocore-beanmachine:Stash", icon = "fas fa-archive", label = "Склад", job = "beanlegion", stash = "Storage" }, }, distance = 1.5 })

	exports['nocore-eye']:AddBoxZone("BeanDrink", vector3(124.56, -1036.88, 29.28), 0.7, 0.4, { name="BeanDrink", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=29.88 }, 
		{ options = { { event = "nocore-beanmachine:Crafting", craftable = Crafting.Drinks, header = "Напитки", icon = "fas fa-mug-hot", label = "Приготви кафе", job = "beanlegion" }, }, distance = 2.0 })
	exports['nocore-eye']:AddBoxZone("BeanDrink2", vector3(122.93, -1041.68, 29.28), 0.7, 0.6, { name="BeanDrink2", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=29.88 }, 
		{ options = { { event = "nocore-beanmachine:Crafting", craftable = Crafting.Drinks, header = "Напитки", icon = "fas fa-mug-hot", label = "Приготви кафе", job = "beanlegion" }, }, distance = 2.0 })

	exports['nocore-eye']:AddBoxZone("BeanSlush", vector3(126.07, -1036.59, 29.28), 0.6, 0.6, { name="BeanSlush", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=30.08 }, 
		{ options = { { event = "nocore-beanmachine:Crafting", craftable = Crafting.Slush, header = "Напитки", icon = "fas fa-cocktail", label = "Приготви напитка", job = "beanlegion" }, }, distance = 2.0 })

	exports['nocore-eye']:AddBoxZone("BeanSoda", vector3(123.56, -1042.75, 29.28), 0.6, 1.4, { name="BeanSoda", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=29.88 }, 
		{ options = { { event = "nocore-beanmachine:Shop", shop = BeanLegion.SodaItems, icon = "fas fa-cocktail", label = "Вземи сода", job = "beanlegion" }, }, distance = 2.0 })

	exports['nocore-eye']:AddBoxZone("donut", vector3(121.4, -1038.43, 29.28), 1.45, 0.6, { name="donut", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.28, maxZ=29.88 }, 
		{ options = { { event = "nocore-beanmachine:Shop", shop = BeanLegion.DesertItems, icon = "fa-solid fa-cheese", label = "Вземи храна", job = "beanlegion" }, }, distance = 2.0 })
		
	exports['nocore-eye']:AddBoxZone("beanmenu", vector3(119.62, -1043.25, 29.28), 0.6, 0.55, {
		name="beanmenu",
		heading = 330.0,
		debugPoly=BeanLegion.Debug,
		minZ=29.08,
		maxZ=29.88
	}, { options = { 
		{
			type = 'server',
			event = 'nocore-printer:restaurantMenus',
			icon = "fas fa-file-lines",
			label = "Вземи меню",
			menu = 'bean-menu',
			give = true
		},
		{
			type = 'server',
			event = 'nocore-printer:restaurantMenus',
			icon = 'fas fa-file-lines',
			label = "Виж меню",
			menu = 'bean-menu',
			give = false
		}
	},
		distance = 2.0
	})
	exports['nocore-eye']:AddBoxZone("BeanClockin", vector3(126.94, -1035.84, 29.28), 1.2, 0.2, {
		name="BeanClockin",
		heading = 340.0,
		debugPoly=BeanLegion.Debug,
		minZ=29.28,
		maxZ=31.28
	}, { options = {
		{
			event = "nocore-police:client:ToggleDuty",
			icon = "fas fa-user-check",
			label = "Влез на/Излез от смяна",
			job = "beanlegion"
		},
		{
			type = "client",
			event = "nocore-bossmenu:client:OpenMenu",
			icon = "fas fa-sign-in-alt",
			label = "Шефско меню",
			job = "beanlegion",
			canInteract = function()
				return Framework.Functions.GetPlayerData().job.name == "beanlegion" and Framework.Functions.GetPlayerData().job.isboss
			end
		},
	},
		distance = 2.0
	})
	
	exports['nocore-eye']:AddBoxZone("BeanReceipt", vector3(120.73, -1040.09, 29.28), 0.6, 0.6, { name="BeanReceipt", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=29.88 },
		{ options = { { event = "nocore-billing:openCreateInvoiceMenu", icon = "fas fa-credit-card", label = "Каса", job = "beanlegion", animation = 'type' } }, distance = 1.5 })

	exports['nocore-eye']:AddBoxZone("BeanReceipt2",vector3(122.0, -1036.51, 29.28), 0.6, 0.6, { name="BeanReceipt2", heading = 340.0, debugPoly=BeanLegion.Debug, minZ=29.08, maxZ=29.88 }, 
		{ options = { { event = "nocore-billing:openCreateInvoiceMenu", icon = "fas fa-credit-card", label = "Каса", job = "beanlegion", animation = 'type' } }, distance = 1.5 })

end)

RegisterNetEvent('nocore-beanmachine:washHands', function()
    Framework.Functions.Progressbar('washing_hands', 'Миене на ръце', 5000, false, true, { 
		disableMovement = true, 
		disableCarMovement = true, 
		disableMouse = false, 
		disableCombat = false, 
		disableInventory = true, 
	},
	{
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

RegisterNetEvent('nocore-beanmachine:MakeItem', function(data)
	Framework.Functions.TriggerCallback('nocore-beanmachine:get:'..data.item, function(amount) 
		if not amount then
			TriggerEvent('Framework:Notify', "Нямате нужните съставки", 'error')
		else
			TriggerEvent("nocore-beanmachine:FoodProgress", data.item)
		end		
	end)
end)

RegisterNetEvent('nocore-beanmachine:Crafting', function(data)
	if not jobCheck() then return end
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", icon = data.icon, isMenuHeader = true }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = Framework.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				if BeanLegion.CheckMarks then
					local p = promise.new()
					Framework.Functions.TriggerCallback('nocore-beanmachine:Crafting:get', function(cb) p:resolve(cb) end, k, data.craftable[i])
					if Citizen.Await(p) then setheader = setheader.." ✅" end
				end
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..Framework.Shared.Items[l].label..number.."<br>"
					settext = text
				end
				Menu[#Menu + 1] = { icon = k, header = setheader, txt = settext, params = { event = "nocore-beanmachine:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end Wait(0)
		end
	end
	Menu[#Menu + 1] = { icon = "fa-solid fa-xmark", header = "Затвори", txt = "", params = { event = "nocore-beanmachine:client:Menu:Close" } }
	exports['nocore-context']:openMenu(Menu)
end)

RegisterNetEvent('nocore-beanmachine:Crafting:MakeItem', function(data)
	Framework.Functions.TriggerCallback('nocore-beanmachine:Crafting:get', function(amount) 
		if not amount then TriggerEvent('Framework:Notify', "You don't have the correct ingredients", 'error') else TriggerEvent('nocore-beanmachine:Crafting:ItemProgress', data) end		
	end, data.item, data.craft)
end)


RegisterNetEvent('nocore-beanmachine:Crafting:ItemProgress', function(data)
	Framework.Functions.Progressbar('making_food', "Making "..Framework.Shared.Items[data.item].label, 5000, false, true, 
	{ disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, disableInventory = true, },
	{ animDict = "mp_ped_interaction", anim = "handshake_guy_a", flags = 8, },
	{}, {}, function()  
		TriggerServerEvent('nocore-beanmachine:Crafting:GetItem', data.item, data.craft)
		TriggerEvent("nocore-beanmachine:Crafting", data)
	end, function() -- Cancel
		TriggerEvent('Framework:Notify', "Отказано!", 'error')
	end, data.item)
end)

RegisterNetEvent('nocore-beanmachine:FoodProgress', function(ItemMake, tablenumber, craftable)
	if craftable then
		for k, v in pairs(craftable[tablenumber]) do
			if ItemMake == k then
				bartext = "Правене на "
				bartime = 5000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	elseif craftable == nil then	
		bartext = "Взимане на "
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	Framework.Functions.Progressbar('making_food', bartext..Framework.Shared.Items[ItemMake].label, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, disableInventory = true, }, 
	{ animDict = animDictNow, anim = animNow, flags = 16, }, {}, {}, function()  
		TriggerServerEvent('nocore-beanmachine:GetFood', ItemMake, tablenumber, craftable)
		StopAnimTask(PlayerPedId(), animDictNow, animNow, 1.0)
	end, function()
		TriggerEvent('Framework:Notify', "Отказано!", 'error')
	end, ItemMake)
end)

RegisterNetEvent('nocore-beanmachine:JustGive', function(data)
	if not jobCheck() then return end
	Framework.Functions.TriggerCallback('nocore-beanmachine:checkmoney', function(amount)
		if not amount then
			Framework.Functions.Notify("Нямате достатъчно пари", "error")
		else
			TriggerEvent("nocore-beanmachine:FoodProgress", data.id, nil, nil)
		end
	end)
end)

RegisterNetEvent('nocore-beanmachine:Stash', function(data)
	TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "beanmachine_"..data.stash)
	TriggerEvent("nocore-inventory:client:SetCurrentStash", "beanmachine_"..data.stash)
end)

RegisterNetEvent('nocore-beanmachine:Shop', function(data)
	if not jobCheck() then return end
	TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "beanmachine", data.shop)
end)

AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then 
		exports['nocore-eye']:RemoveZone("BeanClockin") 
		exports['nocore-eye']:RemoveZone("donut") 
		exports['nocore-eye']:RemoveZone("BeanSoda") 
		exports['nocore-eye']:RemoveZone("BeanSlush") 
		exports['nocore-eye']:RemoveZone("BeanDrink") 
		exports['nocore-eye']:RemoveZone("BeanDrink2") 
		exports['nocore-eye']:RemoveZone("BeanFridge") 
		exports['nocore-eye']:RemoveZone("BeanFridge2") 
		exports['nocore-eye']:RemoveZone("BeanCounter") 
		exports['nocore-eye']:RemoveZone("BeanCounter2") 
		exports['nocore-eye']:RemoveZone("BeanWash")
	end
end)