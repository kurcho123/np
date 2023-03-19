exports['nocore-eye']:AddBoxZone("Hospital Elevator 01", vector3(345.55, -1408.16, 32.51), 0.4, 0.2, {
	name="Hospital Elevator 01",
	heading = 320,
    minZ=32.11,
    maxZ=33.51,
	debugPoly = false
}, {
	options = {{
		event = "nocore-hospital:client:OpenElevator",
		icon = "fas fa-angle-double-up",
		label = "Aсансьор",
		level = 1,
        elevator = 1
	}},
	distance = 2.5
})
exports['nocore-eye']:AddBoxZone("Hospital Elevator 02", vector3(345.56, -1408.17, 36.52), 0.2, 0.4, {
	name="Hospital Elevator 02",
	heading=50,
    minZ=36.07,
    maxZ=37.47,
	debugPoly = false
}, {
	options = {{
		event = "nocore-hospital:client:OpenElevator",
		icon = "fas fa-angle-double-up",
		label = "Aсансьор",
		level = 2,
        elevator = 1
	}},
	distance = 2.5
})
exports['nocore-eye']:AddBoxZone("Hospital Elevator 03", vector3(340.35, -1426.65, 46.51), 0.2, 0.4, {
	name="Hospital Elevator 03",
	heading=320,
    minZ=46.01,
    maxZ=47.41,
	debugPoly = false
}, {
	options = {{
		event = "nocore-hospital:client:OpenElevator",
		icon = "fas fa-angle-double-up",
		label = "Aсансьор",
		level = 3,
        elevator = 1
	}},
	distance = 2.5
})

exports['nocore-eye']:AddBoxZone("Hospital Elevator 04", vector3(347.38, -1406.07, 32.51), 0.4, 0.2, {
	name="Hospital Elevator 04",
	heading = 320,
    minZ=32.06,
    maxZ=33.46,
	debugPoly = false
}, {
	options = {{
		event = "nocore-hospital:client:OpenElevator",
		icon = "fas fa-angle-double-up",
		label = "Aсансьор",
		level = 1,
        elevator = 2
	}},
	distance = 2.5
})
exports['nocore-eye']:AddBoxZone("Hospital Elevator 05", vector3(347.37, -1406.05, 36.52), 0.4, 0.2, {
	name="Hospital Elevator 05",
	heading=320,
    minZ=36.07,
    maxZ=37.47,
	debugPoly = false
}, {
	options = {{
		event = "nocore-hospital:client:OpenElevator",
		icon = "fas fa-angle-double-up",
		label = "Aсансьор",
		level = 2,
        elevator = 2
	}},
	distance = 2.5
})
exports['nocore-eye']:AddBoxZone("Hospital Elevator 06", vector3(338.2, -1424.87, 46.51), 0.4, 0.2, {
	name="Hospital Elevator 06",
	heading=50,
    minZ=46.01,
    maxZ=47.41,
	debugPoly = false
}, {
	options = {{
		event = "nocore-hospital:client:OpenElevator",
		icon = "fas fa-angle-double-up",
		label = "Aсансьор",
		level = 3,
        elevator = 2
	}},
	distance = 2.5
})

RegisterNetEvent("nocore-hospital:client:OpenElevator")
AddEventHandler("nocore-hospital:client:OpenElevator", function(data)
	local sendMenu = {}
	sendMenu[#sendMenu+1] = {
		id = 1,
		header = "Aсансьор",
		txt = "",
		isMenuHeader = true
	}
	for k, v in pairs(Config.Elevators) do
		sendMenu[#sendMenu+1] = {
			id = #sendMenu+1,
			header = 'Етаж '..k,
			txt = '',
			disabled = k == data.level,
			params = { 
				event = "nocore-hospital:client:UseElevator",
				args = {
					elevator = data.elevator,
					spawn = Config.Elevators[k][data.elevator].Spawn,
					level = k
				}
			}
		}
	end
	sendMenu[#sendMenu+1] = {
		id = #sendMenu+1,
		header = "Затвори",
		txt = "",
		params = { 
			event = "fakeevnettt",
			args = {}
		}
	}
	exports['nocore-context']:openMenu(sendMenu)
end)

RegisterNetEvent("nocore-hospital:client:UseElevator")
AddEventHandler("nocore-hospital:client:UseElevator", function(data)
	etape2(data.spawn)
end)

function etape2(coords)
	Wait(250)
	teleport(coords)
	FreezeEntityPosition(PlayerPedId(),false)
	Wait(500)
	DoScreenFadeIn(500)
end

function teleport(pos)
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
 
        NetworkFadeOutEntity(ped, true, false)
        Citizen.Wait(250)

        SetEntityCoords(ped, pos.x, pos.y, pos.z-0.5, 1, 0, 0, 1)
        NetworkFadeInEntity(ped, 0)

    end)
end