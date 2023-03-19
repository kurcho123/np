local Framework = exports['no-core']:GetCoreObject()
--========================================================== 
local Config = {}
Config.Positions = {
    {x = -1155.54, y = -2008.372, z = 13.180264, dis = 6},
    {x = 1178.5489, y = 2638.5847, z =37.753868, dis = 10},
	{x= 107.69361, y = 6625.7167, z = 31.787284, dis = 10},
	{x = 831.88, y = -812.57, z = 26.22, dis = 15},
	{x = -696.75, y = -802.84, z = 33.03, dis = 20}, -- Kolev
	{x = 1133.89, y = -793.34, z= 57.09, dis = 20}, -- Mirror
	{x = 539.6, y = -180.98, z= 54.89, dis = 25}, -- FixIt
	{x = 568.33, y = -2798.69,z = 5.62, dis = 15},
	{x = 144.79, y = -3029.79, z= 6.04, dis = 20},
	{x = -66.96, y = -1828.93, z= 26.94, dis = 20},
}

RegisterNetEvent('jarhead:client:applyFolio', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		local vehicle = nil
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		if DoesEntityExist(vehicle) then
			-- local vehpos = GetEntityCoords(vehicle)
			-- local nearPoint = false
			-- for i = 1, #Config.Positions, 1 do
			-- 	local tempPos = Config.Positions[i]
			-- 	local tempDist = #(vehpos - vector3(tempPos.x, tempPos.y, tempPos.z))
			-- 	if tempDist <= tempPos.dis then
			-- 		nearPoint = true

			-- 		break
			-- 	end
			-- end
			nearPoint = true
			if nearPoint then
				playAnim("mini@repair", "fixing_a_ped", 35000)
				SetVehicleEngineOn(vehicle, false, false, true)
				for i = 0, 5 do
					SetVehicleDoorOpen(vehicle, i, false, true) -- will open every door from 0-5
				end
				time = math.random(7000,10000)
				exports['nocore-progressbar']:Progress({
					duration = time,
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					},
					label = 'Слагане на фолиото'
				}, function(cancelled2)
					if (not cancelled2) then						
						for i = 0, 5 do
							SetVehicleDoorShut(vehicle, i, false) -- will open every door from 0-5
						end
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, true)
						SetVehicleEngineOn(vehicle, true, true)
						openColorPicker(vehicle)
						TriggerServerEvent('jarhead:server:removeFolio')
					else
						Framework.Functions.Notify("Прекратено слагане на фолио", "error", 3500)
						ClearPedTasks(playerPed)
					end

				
				end)
			end
		end
	else
		Framework.Functions.Notify("Няма кола наблизо", "error", 3500)
	end
end)

RegisterNetEvent('jarhead:client:applyLivery', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		local vehicle = nil
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		if DoesEntityExist(vehicle) then
			-- local vehpos = GetEntityCoords(vehicle)
			-- local nearPoint = false
			-- for i = 1, #Config.Positions, 1 do
			-- 	local tempPos = Config.Positions[i]
			-- 	local tempDist = #(vehpos - vector3(tempPos.x, tempPos.y, tempPos.z))
			-- 	if tempDist <= tempPos.dis then
			-- 		nearPoint = true

			-- 		break
			-- 	end
			-- end
			nearPoint = true
			if nearPoint then
				playAnim("mini@repair", "fixing_a_ped", 35000)
				SetVehicleEngineOn(vehicle, false, false, true)
				for i = 0, 5 do
					SetVehicleDoorOpen(vehicle, i, false, true) -- will open every door from 0-5
				end
				time = math.random(7000,10000)
				exports['nocore-progressbar']:Progress({
					duration = time,
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					},
					label = 'Слагане на фолиото'
				}, function(cancelled2)
					if (not cancelled2) then
						for i = 0, 5 do
							SetVehicleDoorShut(vehicle, i, false) -- will open every door from 0-5
						end
						ClearPedTasks(playerPed)
						SetVehicleEngineOn(vehicle, true, true)
						OpenLiveryContext()
						TriggerServerEvent('jarhead:server:removeLiveryFolio')
					else
						Framework.Functions.Notify("Прекратено слагане на фолио", "error", 3500)
						ClearPedTasks(playerPed)
					end
				end)
			end
		end
	else
		Framework.Functions.Notify("Няма кола наблизо", "error", 3500)
	end
end)

function OpenLiveryContext()
        local sendMenu = {}
        table.insert(sendMenu,{
            id = 1,
            header = "Вариации на стикерите",
            txt = "",
            isMenuHeader = true
        })
		local vehicle = nil
		local coords = GetEntityCoords(PlayerPedId())
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		SetVehicleModKit(vehicle, 0)
        local count = GetNumVehicleMods(vehicle, 48) - 1
        for i=0, count, 1 do     
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = "Приложи стикери "..i,
                txt = "",
                params = { 
                    event = "livery",
                    args = {
                        vehicle = vehicle,
                        livery = i
                    }
                }
            })
        end 
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Откажи",
            txt = "",
            params = { 
                event = "fakeevent",
                args = {}
            }
        })
        exports['nocore-context']:openMenu(sendMenu)
end

AddEventHandler('livery',function(data)
    SetVehicleMod(data.vehicle, 48, data.livery)
    OpenLiveryContext()
end)

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function openColorPicker(vehicle)
	DisplayHud(false)
	SetNuiFocus(true, false)
	SetNuiFocusKeepInput(true)
	TriggerEvent('nocore-hud:toggleHud', false)
    SendNUIMessage({
        type = 'open',
        what = 'colorPicker',
        isOpenByAdmin = 0,
        isCustom = 1,
        defaultValue = 0,
        title = 'Избери си цвят',
        priceMult = 0,
        price = 0,
        whitelistJobName = nil,
		vehicle = vehicle
    })
end

RegisterNUICallback('handle', function(data)
    if (data.type == 'close') then
		TriggerEvent('nocore-hud:toggleHud', true)
		DisplayHud(true)
		SetNuiFocus(false, false)
		SetNuiFocusKeepInput(false)
		SendNUIMessage({
			type = 'close'
		})
		FreezeEntityPosition(PlayerPedId(), false)
    elseif (data.type == 'update') then
        if (data.what == 'menu') then
			if (data.user == 'hover') then
				SetVehicleModColor_1(data.vehicle,0,0,0)
				SetVehicleMod(data.vehicle, 48, -1, false)
				SetVehicleCustomPrimaryColour(data.vehicle, tonumber(data.color[1]), tonumber(data.color[2]), tonumber(data.color[3]))
				SetVehicleCustomSecondaryColour(data.vehicle, tonumber(data.color[1]), tonumber(data.color[2]), tonumber(data.color[3]))
			elseif(data.user == 'enter') then
				SetVehicleMod(data.vehicle, 48, -1, false)
				SetVehicleModColor_1(data.vehicle,0,0,0)
				SetVehicleCustomPrimaryColour(data.vehicle, tonumber(data.color[1]), tonumber(data.color[2]), tonumber(data.color[3]))
				SetVehicleCustomSecondaryColour(data.vehicle, tonumber(data.color[1]), tonumber(data.color[2]), tonumber(data.color[3]))
				playCustomSound('spray')
				TriggerEvent('nocore-hud:toggleHud', true)
				DisplayHud(true)
				SetNuiFocus(false, false)
				SetNuiFocusKeepInput(false)
				FreezeEntityPosition(PlayerPedId(), false)
					SendNUIMessage({
						type = 'close'
					})
				
			end
        end
    end
end)
-- VEHICLE
function playCustomSound(soundName)
	SendNUIMessage({
		type = 'playSound',
		soundName = soundName,
		volume = (GetProfileSetting(300) / 10)
	})
end

local items = {
	label = "Fraud Garage",
	slots = 5,
	items = {
		[1] = {
			name = "dobawkagoriwo",
			price = 4000,
			amount = 100,
			type = "item",
			slot = 1,
		},
		[2] = {
			name = "folio",
			price = 2000,
			amount = 100,
			type = "item",
			slot = 2,
		},
		[3] = {
			name = "livery-folio",
			price = 3000,
			amount = 100,
			type = "item",
			slot = 3,
		},
		[4] = {
			name = "nosenergy",
			price = 75,
			amount = 50,
			type = "item",
			slot = 4,
		},
		[5] = {
			name = "watermelon",
			price = 60,
			amount = 50,
			type = "item",
			slot = 5,
		}
	}
}

local mechanicItems = {
	label = "Fraud Garage",
	slots = 3,
	items = {
		[1] = {
			name = "pistol-ammo",
			price = 1500,
			amount = 20,
			type = "item",
			slot = 1,
		},
		[2] = {
			name = "smg-ammo",
			price = 3000,
			amount = 20,
			type = "item",
			slot = 2,
		},
		[3] = {
			name = "repairkit",
			price = 500,
			amount = 20,
			type = "item",
			slot = 3,
		},
		[4] = {
			name = "fakeplate",
			price = 2000,
			amount = 1,
			type = "item",
			slot = 4,
		},
		[5] = {
			name = "armor",
			price = 3000,
			amount = 10,
			type = "item",
			slot = 5,
		},
		[6] = {
			name = "advanced_repairkit",
			price = 650,
			amount = 20,
			type = "item",
			slot = 6,
		},
		[7] = {
			name = "nitrous",
			price = 15000,
			amount = 5,
			type = "item",
			slot = 7,
		},
		[8] = {
			name = "lsd-strip",
			price = 250,
			amount = 20,
			type = "item",
			slot = 8,
		},
		[9] = {
			name = "joint",
			price = 25,
			amount = 100,
			type = "item",
			slot = 9,
		},
		[10] = {
			name = "coke-bag",
			price = 1500,
			amount = 20,
			type = "item",
			slot = 10,
		},
		[11] = {
			name = "napkin",
			price = 50,
			amount = 100,
			type = "item",
			slot = 11,
		},
		[12] = {
			name = "arthbp",
			price = 5000,
			amount = 10,
			type = "item",
			slot = 12,
		},
		[13] = {
			name = "explosive_lv1",
			price = 20000,
			amount = 10,
			type = "item",
			slot = 13,
		},
		[14] = {
			name = "explosive_lv2",
			price = 20000,
			amount = 10,
			type = "item",
			slot = 14,
		},
		[15] = {
			name = "explosive_lv3",
			price = 20000,
			amount = 10,
			type = "item",
			slot = 15,
		},
		[16] = {
			name = "explosive_lv4",
			price = 50000,
			amount = 10,
			type = "item",
			slot = 16,
		},
		[17] = {
			name = "racing-laptop",
			price = 25000,
			amount = 10,
			type = "item",
			slot = 17,
		},
		[18] = {
			name = "racing-tablet",
			price = 25000,
			amount = 10,
			type = "item",
			slot = 18,
		},
		[19] = {
			name = "trojan_usb",
			price = 20000,
			amount = 1,
			type = "item",
			slot = 19,
		},
		[20] = {
			name = "pistol_flashlight01",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 20,
		},
		[21] = {
			name = "pistol_flashlight02",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 21,
		},
		[22] = {
			name = "pistol_suppressor01",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 22,
		},
		[23] = {
			name = "pistol_suppressor02",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 23,
		},
		[24] = {
			name = "pistol_extendedclip01",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 24,
		},
		[25] = {
			name = "pistol_flashlight03",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 25,
		},
		[26] = {
			name = "pistol_compensator01",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 26,
		},
		[27] = {
			name = "pistol_scope01",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 27,
		},
		[28] = {
			name = "pistol_scope02",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 28,
		},
		[29] = {
			name = "rifle_suppressor02",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 29,
		},
		[30] = {
			name = "weapon_snspistol_mk2",
			price = 15000,
			amount = 1,
			type = "item",
			slot = 30,
		},
	}
}


local privateItems = {
	label = "Fraud Garage",
	slots = 3,
	items = {
		[1] = {
			name = "pistol-ammo",
			price = 50,
			amount = 100,
			type = "item",
			slot = 1,
		},
		[2] = {
			name = "smg-ammo",
			price = 50,
			amount = 100,
			type = "item",
			slot = 2,
		},
		[3] = {
			name = "shotgun-ammo",
			price = 50,
			amount = 100,
			type = "item",
			slot = 3,
		},
		[4] = {
			name = "rifle-ammo",
			price = 50,
			amount = 100,
			type = "item",
			slot = 4,
		},
		[5] = {
			name = "fakeplate",
			price = 50,
			amount = 100,
			type = "item",
			slot = 5,
		},
		[6] = {
			name = "armor",
			price = 50,
			amount = 100,
			type = "item",
			slot = 6,
		},
		[7] = {
			name = "repairkit",
			price = 50,
			amount = 100,
			type = "item",
			slot = 7,
		},
		[8] = {
			name = "advanced_repairkit",
			price = 50,
			amount = 100,
			type = "item",
			slot = 8,
		},
		[9] = {
			name = "nitrous",
			price = 50,
			amount = 100,
			type = "item",
			slot = 9,
		},
		[10] = {
			name = "ecu",
			price = 50,
			amount = 100,
			type = "item",
			slot = 10,
		},
		[11] = {
			name = "lsd-strip",
			price = 1,
			amount = 100,
			type = "item",
			slot = 11,
		},
		[12] = {
			name = "joint",
			price = 1,
			amount = 100,
			type = "item",
			slot = 12,
		},
		[13] = {
			name = "bandage",
			price = 50,
			amount = 100,
			type = "item",
			slot = 13,
		},
		[14] = {
			name = "coke-bag",
			price = 50,
			amount = 100,
			type = "item",
			slot = 14,
		},
		[15] = {
			name = "plqva_weed",
			price = 50,
			amount = 100,
			type = "item",
			slot = 15,
		},
		[16] = {
			name = "napkin",
			price = 50,
			amount = 100,
			type = "item",
			slot = 16,
		},
		[17] = {
			name = "arthbp",
			price = 50,
			amount = 100,
			type = "item",
			slot = 17,
		},
		[18] = {
			name = "explosive_lv1",
			price = 50,
			amount = 100,
			type = "item",
			slot = 18,
		},
		[19] = {
			name = "explosive_lv2",
			price = 50,
			amount = 100,
			type = "item",
			slot = 19,
		},
		[20] = {
			name = "explosive_lv3",
			price = 50,
			amount = 100,
			type = "item",
			slot = 20,
		},
		[21] = {
			name = "explosive_lv4",
			price = 50,
			amount = 100,
			type = "item",
			slot = 21,
		},
		[22] = {
			name = "racing-laptop",
			price = 50,
			amount = 100,
			type = "item",
			slot = 22,
		},
		[23] = {
			name = "racing-tablet",
			price = 50,
			amount = 100,
			type = "item",
			slot = 23,
		},
		[24] = {
			name = "trojan_usb",
			price = 50,
			amount = 100,
			type = "item",
			slot = 24,
		},
		[25] = {
			name = "pistol_suppressor01",
			price = 50,
			amount = 100,
			type = "item",
			slot = 25,
		},
		[26] = {
			name = "pistol_suppressor02",
			price = 50,
			amount = 100,
			type = "item",
			slot = 26,
		},
		[27] = {
			name = "pistol_extendedclip01",
			price = 50,
			amount = 100,
			type = "item",
			slot = 27,
		},
		[28] = {
			name = "pistol_compensator01",
			price = 50,
			amount = 100,
			type = "item",
			slot = 28,
		},
		[29] = {
			name = "rifle_suppressor02",
			price = 50,
			amount = 100,
			type = "item",
			slot = 29,
		},
		[30] = {
			name = "weapon_snspistol_mk2",
			price = 50,
			amount = 1,
			type = "item",
			slot = 30,
		},
		[31] = {
			name = "weapon_pistol50",
			price = 50,
			amount = 1,
			type = "item",
			slot = 31,
		},
		[32] = {
			name = "weapon_heavypistol",
			price = 50,
			amount = 1,
			type = "item",
			slot = 32,
		},
		[33] = {
			name = "weapon_combatpistol",
			price = 50,
			amount = 1,
			type = "item",
			slot = 33,
		},
		[34] = {
			name = "weapon_vintagepistol",
			price = 50,
			amount = 1,
			type = "item",
			slot = 34,
		},
		[35] = {
			name = "weapon_pistol",
			price = 50,
			amount = 1,
			type = "item",
			slot = 35,
		},
		[36] = {
			name = "weapon_ceramicpistol",
			price = 50,
			amount = 1,
			type = "item",
			slot = 36,
		},
	}
}
	
RegisterNetEvent('nocore-jar:client:open:store')
AddEventHandler('nocore-jar:client:open:store', function()
	TriggerServerEvent('nocore-inventory:server:OpenInventory', 'shop', 'racemonkey', items)
end)

RegisterNetEvent('nocore-jar:client:open:privateStore')
AddEventHandler('nocore-jar:client:open:privateStore', function()
	TriggerServerEvent('nocore-inventory:server:OpenInventory', 'shop', 'racemonkeyprivate', privateItems)
end)

RegisterNetEvent('nocore-jar:client:open:mechanicStore')
AddEventHandler('nocore-jar:client:open:mechanicStore', function()
	TriggerServerEvent('nocore-inventory:server:OpenInventory', 'shop', 'racemonkeymechanic', mechanicItems)
end)