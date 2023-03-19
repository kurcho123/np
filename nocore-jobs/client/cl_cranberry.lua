local Framework = exports['no-core']:GetCoreObject()
local Targets = {}
local PlayerData = {}

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1000, function()
            PlayerData = Framework.Functions.GetPlayerData()
        end)
    end
end)

AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1000, function()
        PlayerData = Framework.Functions.GetPlayerData()
    end)
end)

AddEventHandler('Framework:Client:SetDuty', function(duty)
    PlayerData.job.onduty = duty
end)

AddEventHandler('nocore-cranberry:client:open:stash', function()
    TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Cranberry')
    TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Cranberry', {
        maxweight = 400000,
        slots = 40,
    })
end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
	TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('nocore-cranberry:client:open:store')
AddEventHandler('nocore-cranberry:client:open:store', function()
    if PlayerData.job.name ~= "cranberry" then
        return
    end
    if not PlayerData.job.onduty then
        return
    end
    local items = {
        label = "Cranberry",
        slots = 10,
        items = {}
    }
    local index = 1
    for k,v in pairs(Cranberry.Items.items) do
            items.items[index] = v
            items.items[index].slot = v.slot
            index = index + 1
    end
    TriggerServerEvent('nocore-inventory:server:OpenInventory', 'shop', 'cranberry', Cranberry.Items)
    TriggerEvent('nocore-sound:client:play', 'stash-open', 0.4)
end)


--[[ Eye Exports ]]
CreateThread(function()
	Targets['Stash'] = exports['nocore-eye']:AddBoxZone("cr-stash", vector3(-1074.4, -312.83, 37.81), 1.3, 0.4, {
		name = "cr-stash",
		heading = 354,
		minZ = 36.80,
		maxZ = 39.3
	}, {
		options = {{
			event = "nocore-cranberry:client:open:stash",
			icon = "fas fa-cocktail",
			label = "Отвори склад",
			job = 'cranberry',
			duty = true,
		}},
		distance = 1.5
	})
	
	Targets['Cocktails'] = exports['nocore-eye']:AddCircleZone('cr-cocktails', vector3(-1076.15, -316.64, 37.81), 0.3, {
		name="kokteil",
		useZ=false,
	}, {
		options = {
			{
				event = "nocore-cranberry:client:open:store",
				icon = "fas fa-shopping-cart",
				label = "Приготви храна",
				job = "cranberry",
				canInteract = function(entity)
					if PlayerData.job.isboss then
						return true
					else
						return false
					end
				end
			}
		},
		distance = 1.0
	})

	Targets['Bossmenu'] = exports['nocore-eye']:AddBoxZone("cr-bossmenu", vector3(-1075.76, -315.68, 37.81), 0.6, 0.3, {
			name = "cr-bossmenu",
			heading = 355,
			minZ = 37.60,
			maxZ = 38.00
		}, {
		options = {
			{
				event = "nocore-bossmenu:client:OpenMenu",
				icon = "fas fa-address-book",
				label = "Шефско меню",
				job = "cranberry",
				canInteract = function ()
					return Framework.Functions.GetPlayerData().job.isboss
				end
			}
		},
		distance = 1.0
	})

	Targets['DrinksMenu'] = exports['nocore-eye']:AddBoxZone("CranCrafting", vector3(-1074.37, -310.81, 37.81), 0.25, 0.2, {
		name="CranCrafting",
		heading = 359.0,
		minZ=37.81,
		maxZ=38.81
	}, {
		options = {
			{
				event = "nocore-cranberry:Crafting",
				icon = "fas fa-cocktail",
				label = "Приготви напитка",
				job = "cranberry",
				craftable = Cranberry.Crafting.Drinks,
				header = "Напитки"
			}
		},
		distance = 2.0
	})

	Targets['Menu'] = exports['nocore-eye']:AddTargetModel({-1096792232}, {
		options = {
			{
				icon = "fas fa-archive",
				label = "Меню",
                action = function()
                    exports['nocore-ui']:ShowImage('https://cdn.discordapp.com/attachments/902663901848686693/918563424018001980/png_20211209_200251_0000.png')
                end
			}
		},
		distance = 2.0
	})
end)

RegisterNetEvent('nocore-cranberry:client:set:table', function(table, set, oldset)
    if oldset then
        RemoveSet(table, oldset)
        SetTable(table, set)
    else
        SetTable(table, set)
    end
end)

RegisterNetEvent('nocore-cranberry:client:clear:table', function(table, set)
    RemoveSet(table, set)
end)

function SetTable(table, set)
	if Cranberry.Tables[table][set] ~= nil then
		for k, v in pairs(Cranberry.Tables[table][set]) do
			local object = CreateObject(v['Prop'], v['X'], v['Y'], v['Z'], true, true, false)
			SetEntityHeading(object, v['H'])
		end
    end
end

function RemoveSet(table, set)
	if Cranberry.Tables[table][set] ~= nil then
		for k, v in pairs(Cranberry.Tables[table][set]) do
			local object = GetClosestObjectOfType(vector3(v['X'], v['Y'], v['Z']), 2.0, v['Prop'], false, false, false)-- 1st Right
			if object then
				while not NetworkHasControlOfEntity(object) do
					Citizen.Wait(1)
					NetworkRequestControlOfEntity(object)
				end
				SetEntityAsMissionEntity(object, true, true)
				DeleteEntity(object)
			end
		end
    end
end


RegisterNetEvent("nocore-cranberry:opentables", function()
	if #(GetEntityCoords(PlayerPedId()) - vector3(-1075.09, -314.6364, 37.807849)) > 15 then
		return
	end
    if PlayerData.job.name ~= "cranberry" then
        return
    end
	TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openTables",
    })
end)

RegisterNUICallback("SetupTable", function(data)
    TriggerServerEvent('nocore-cranberry:server:SetUpTable', {
		data.table,
		data.set
    })
end)

RegisterNUICallback("ClearTable", function(data)
    TriggerServerEvent('nocore-cranberry:server:ClearTable', {
		data.table
    })
end)

AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then
	  for k, v in pairs(Targets) do
		exports['nocore-eye']:RemoveZone(k)
	  end
	end
end)

RegisterNetEvent('nocore-cranberry:Crafting', function(data)
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://nocore-inventory/html/images"..Framework.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..Framework.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				if true then
					local p = promise.new()
					Framework.Functions.TriggerCallback('nocore-cranberry:Crafting:get', function(cb) p:resolve(cb) end, k, data.craftable[i])
					if Citizen.Await(p) then setheader = setheader.." ✅" end
				end
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..Framework.Shared.Items[l].label..number.."<br>"
					settext = text
				end
				Menu[#Menu + 1] = { icon = k, header = setheader, txt = settext, params = { event = "nocore-cranberry:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end Wait(0)
		end
	end
	Menu[#Menu + 1] = { icon = "fas fa-xmark", header = "", txt = "Затвори", params = { event = "nocore-cranberry:client:Menu:Close" } }
	exports['nocore-context']:openMenu(Menu)
end)

RegisterNetEvent('nocore-cranberry:Crafting:MakeItem', function(data)
	Framework.Functions.TriggerCallback('nocore-cranberry:Crafting:get', function(amount) 
		if not amount then TriggerEvent('Framework:Notify', "You don't have the correct ingredients", 'error') else TriggerEvent('nocore-cranberry:Crafting:ItemProgress', data) end		
	end, data.item, data.craft)
end)

RegisterNetEvent('nocore-cranberry:Crafting:ItemProgress', function(data)
	Framework.Functions.Progressbar('making_food', "Приготвяне "..Framework.Shared.Items[data.item].label, 5000, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, disableInventory = true }, 
	{ animDict = "mp_ped_interaction", anim = "handshake_guy_a", flags = 8, },
	{}, {}, function()  
		TriggerServerEvent('nocore-cranberry:Crafting:GetItem', data.item, data.craft)
		TriggerEvent("nocore-cranberry:Crafting", data)
	end, function() -- Cancel
		TriggerEvent('nocore-inventory:client:busy:status', false)
	end, data.item)
end)