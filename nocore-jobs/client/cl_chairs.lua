local Framework = exports['no-core']:GetCoreObject()

local pseat = 0
Jobs = {}
local Chairs = {}
local chairDebug = false

CreateThread(function()
	for k, v in pairs(Jobs.Chairs) do
		Chairs["Chair"..k] =
		exports['nocore-eye']:AddBoxZone("Chair"..k, v.location, v.width, v.depth, { name="Chair"..k, heading = v.heading, debugPoly=chairDebug, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "nocore-jobs:Chair", icon = "fas fa-chair", label = "Седни", loc = v.location, head = v.heading, seat = v.seat }, },
			  distance = v.distance+0.4
		})
	end
end)

RegisterNetEvent('nocore-jobs:Chair', function(data)
	local canSit = true
	local sitting = false
	for k, v in pairs(Framework.Functions.GetPlayersFromCoords(data.loc, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc)
		if dist <= 0.4 then TriggerEvent("Framework:Notify", "Някой вече седи на този стол..") canSit = false end
	end
	if canSit then
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head + 0.0, 0, 1, true)
		pseat = data.seat
		sitting = true
	end
	while sitting do
		local ped = PlayerPedId()
		if sitting then 
			if (IsControlJustReleased(0, 202) or IsControlJustReleased(0, 73)) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				-- // Bean Machine Legion Square \\ --
				if pseat == 1 then SetEntityCoords(ped, vector3(124.7, -1031.93, 29.28-0.5)) end
				if pseat == 2 then SetEntityCoords(ped, vector3(122.79, -1031.92, 29.28-0.5)) end
				if pseat == 3 then SetEntityCoords(ped, vector3(121.61, -1033.26, 29.28-0.5)) end
				if pseat == 4 then SetEntityCoords(ped, vector3(121.31, -1034.31, 29.28-0.5)) end
				if pseat == 5 then SetEntityCoords(ped, vector3(118.58, -1041.51, 29.28-0.5)) end
				if pseat == 6 then SetEntityCoords(ped, vector3(118.33, -1042.5, 29.28-0.5)) end
				if pseat == 7 then SetEntityCoords(ped, vector3(118.27, -1044.17, 29.28-0.5)) end
				if pseat == 8 then SetEntityCoords(ped, vector3(119.69, -1045.51, 29.28-0.5)) end
				if pseat == 9 then SetEntityCoords(ped, vector3(121.35, -1048.28, 29.28-0.5)) end
				if pseat == 10 then SetEntityCoords(ped, vector3(125.21, -1029.64, 29.28-0.5)) end
				if pseat == 11 then SetEntityCoords(ped, vector3(123.35, -1029.11, 29.28-0.5)) end
				-- // Pizza This \\ --
				if pseat == 12 then SetEntityCoords(ped, vector3(808.69, -751.55, 26.78-0.5)) end
				if pseat == 13 then SetEntityCoords(ped, vector3(805.09, -751.64, 26.78-0.5)) end
				if pseat == 14 then SetEntityCoords(ped, vector3(801.11, -751.54, 26.78-0.5)) end
				if pseat == 15 then SetEntityCoords(ped, vector3(797.26, -751.56, 26.78-0.5)) end
				if pseat == 16 then SetEntityCoords(ped, vector3(799.7, -748.8, 26.78-0.5)) end
				if pseat == 17 then SetEntityCoords(ped, vector3(796.46, -748.66, 26.78-0.5)) end
				if pseat == 18 then SetEntityCoords(ped, vector3(795.42, -749.88, 26.78-0.5)) end
				if pseat == 19 then SetEntityCoords(ped, vector3(795.34, -753.39, 26.78-0.5)) end
				if pseat == 20 then SetEntityCoords(ped, vector3(799.53, -753.53, 26.78-0.5)) end
				if pseat == 21 then SetEntityCoords(ped, vector3(798.94, -756.07, 26.78-0.5)) end
				
				if pseat == 22 then SetEntityCoords(ped, vector3(808.29, -753.46, 26.78-0.5)) end
				if pseat == 23 then SetEntityCoords(ped, vector3(807.06, -753.62, 26.78-0.5)) end
				if pseat == 24 then SetEntityCoords(ped, vector3(806.31, -753.61, 26.78-0.5)) end
				if pseat == 25 then SetEntityCoords(ped, vector3(804.93, -753.63, 26.78-0.5)) end
				if pseat == 26 then SetEntityCoords(ped, vector3(804.14, -753.59, 26.78-0.5)) end
				if pseat == 27 then SetEntityCoords(ped, vector3(802.9, -753.61, 26.78-0.5)) end
				if pseat == 28 then SetEntityCoords(ped, vector3(802.11, -753.59, 26.78-0.5)) end
				if pseat == 29 then SetEntityCoords(ped, vector3(800.74, -753.63, 26.78-0.5)) end
				if pseat == 30 then SetEntityCoords(ped, vector3(798.24, -757.15, 26.78-0.5)) end
				if pseat == 31 then SetEntityCoords(ped, vector3(798.36, -758.28, 26.78-0.5)) end
				if pseat == 32 then SetEntityCoords(ped, vector3(798.32, -759.04, 26.78-0.5)) end
				if pseat == 33 then SetEntityCoords(ped, vector3(798.36, -760.38, 26.78-0.5)) end
				
				if pseat == 34 then SetEntityCoords(ped, vector3(796.12, -747.16, 26.78-0.5)) end
				if pseat == 35 then SetEntityCoords(ped, vector3(799.78, -747.05, 26.78-0.5)) end
				
				if pseat == 36 then SetEntityCoords(ped, vector3(796.33, -741.25, 26.78-0.5)) end
				if pseat == 37 then SetEntityCoords(ped, vector3(800.3, -741.5, 26.78-0.5)) end
				
				if pseat == 38 then SetEntityCoords(ped, vector3(802.65, -741.44, 26.78-0.5)) end
				if pseat == 39 then SetEntityCoords(ped, vector3(806.46, -741.27, 26.78-0.5)) end
				
				if pseat == 40 then SetEntityCoords(ped, vector3(808.05, -741.27, 26.78-0.5)) end
				if pseat == 41 then SetEntityCoords(ped, vector3(811.95, -741.23, 26.78-0.5)) end
				
				if pseat == 42 then SetEntityCoords(ped, vector3(812.85, -747.13, 26.78-0.5)) end
				if pseat == 43 then SetEntityCoords(ped, vector3(809.14, -747.22, 26.78-0.5)) end
				
				
				if pseat == 44 then SetEntityCoords(ped, vector3(803.35, -761.66, 31.27-0.5)) end
				if pseat == 45 then SetEntityCoords(ped, vector3(806.01, -761.49, 31.27-0.5)) end
				
				if pseat == 46 then SetEntityCoords(ped, vector3(798.56, -750.4, 31.27-0.5)) end
				if pseat == 47 then SetEntityCoords(ped, vector3(798.86, -753.3, 31.27-0.5)) end
				if pseat == 48 then SetEntityCoords(ped, vector3(797.04, -753.41, 31.27-0.5)) end
				
				if pseat == 49 then SetEntityCoords(ped, vector3(800.41, -756.39, 31.27-0.5)) end
				-- // Yacht \\ --
				if pseat == 50 then SetEntityCoords(ped, vector3(-1607.213, -1882.015, 5.8842439-0.5)) end
				if pseat == 51 then SetEntityCoords(ped, vector3(-1609.836, -1876.267, 5.88415-0.5)) end
				if pseat == 52 then SetEntityCoords(ped, vector3(-1609.334, -1877.662, 5.8841471-0.5)) end
				if pseat == 53 then SetEntityCoords(ped, vector3(-1602.122, -1892.837, 8.9711208-0.5)) end
				if pseat == 54 then SetEntityCoords(ped, vector3(-1596.673, -1890.685, 8.9711809-0.5)) end
				if pseat == 55 then SetEntityCoords(ped, vector3(-1605.822, -1882.959, 8.9711751-0.5)) end
				if pseat == 56 then SetEntityCoords(ped, vector3(-1606.872, -1883.392, 8.9711837-0.5)) end
				if pseat == 57 then SetEntityCoords(ped, vector3(-1600.972, -1881.022, 8.9711761-0.5)) end
				if pseat == 58 then SetEntityCoords(ped, vector3(-1599.839, -1880.565, 8.9711847-0.5)) end
				if pseat == 59 then SetEntityCoords(ped, vector3(-1599.984, -1879.64, 8.9712762-0.5)) end
				if pseat == 60 then SetEntityCoords(ped, vector3(-1600.399, -1878.618, 8.9712677-0.5)) end
				if pseat == 61 then SetEntityCoords(ped, vector3(-1607.489, -1882.635, 8.9712686-0.5)) end
				if pseat == 62 then SetEntityCoords(ped, vector3(-1607.918, -1881.627, 8.9712696-0.5)) end

				pseat = 0
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Jobs.Chairs = {
	-- // Bean Machine Legion Square \\ --

	--STOOLS
	{ location = vector3(124.5, -1032.41, 29.27+0.3), heading = 160.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 1 },
	{ location = vector3(122.95, -1032.34, 29.28+0.3), heading = 205.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 2 },
	{ location = vector3(122.19, -1033.4, 29.28+0.3), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 3 },
	{ location = vector3(121.76, -1034.44, 29.28+0.3), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 4 },
	{ location = vector3(119.12, -1041.75, 29.28+0.3), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 5 },
	{ location = vector3(118.74, -1042.75, 29.28+0.3), heading = 235.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 6 },
	{ location = vector3(118.71, -1044.01, 29.28+0.3), heading = 295.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 7 },
	{ location = vector3(119.9, -1044.98, 29.28+0.3), heading = 340.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 8 },
	{ location = vector3(122.45, -1046.87, 29.28+0.3), heading = 86.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, },
	{ location = vector3(121.74, -1048.66, 29.28+0.3), heading = 18.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 9 },
	
	{ location = vector3(117.91, -1047.8, 29.28+0.3), heading = 18.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, },
	{ location = vector3(116.28, -1047.11, 29.28+0.3), heading = 317.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, },
	{ location = vector3(125.15, -1029.07, 29.28+0.3), heading = 118.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 10 },
	{ location = vector3(123.61, -1028.61, 29.28+0.3), heading = 188.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 11 },
	
	--SEATING
	{ location = vector3(120.67, -1027.8, 29.28), heading = 165.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(119.02, -1028.51, 29.28), heading = 245.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(119.15, -1031.58, 29.28), heading = 175.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.74, -1032.55, 29.28), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.39, -1033.47, 29.28), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.04, -1034.42, 29.28), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.66, -1035.97, 29.28), heading = 335.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	
	{ location = vector3(113.5, -1044.37, 28.92), heading = 265.0, width = 0.6, depth = 0.6, minZ=28.09, maxZ=29.09, distance = 1.7 },
	{ location = vector3(114.34, -1045.99, 28.92), heading = 325.0, width = 0.6, depth = 0.6, minZ=28.09, maxZ=29.09, distance = 1.7 },

	-- // Pizza This \\ --

	--TableSeating
	{ location = vector3(808.11, -751.56, 26.78), heading = 84.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 12 },
	{ location = vector3(805.96, -751.59, 26.78), heading = 276.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 13 },

	{ location = vector3(804.17, -751.56, 26.78), heading = 86.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 13 },
	{ location = vector3(802.06, -751.55, 26.78), heading = 275.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 14 },

	{ location = vector3(800.18, -751.55, 26.78), heading = 85.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 14 },
	{ location = vector3(798.03, -751.55, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 15 },

	{ location = vector3(799.07, -748.83, 26.78), heading = 95.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 16 },
	{ location = vector3(796.92, -748.78, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 17 },

	{ location = vector3(795.08, -750.45, 26.78), heading = 205.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 18 },
	{ location = vector3(795.14, -752.68, 26.78), heading = 355.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 19 },

	{ location = vector3(799.58, -754.03, 26.78), heading = 161.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 20 },
	{ location = vector3(799.51, -756.1, 26.78), heading = 7.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 21 },

	--CORNER NEAR ATM
	{ location = vector3(796.55, -767.47, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },
	{ location = vector3(795.12, -765.91, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },
	{ location = vector3(795.09, -764.92, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },
	{ location = vector3(795.1, -763.93, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },

	--BOOTHS
	{ location = vector3(808.50, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 22 },
	{ location = vector3(808.50, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 22 },
	{ location = vector3(806.96, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 23 },
	{ location = vector3(806.96, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 23 },

	{ location = vector3(806.36, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 24 },
	{ location = vector3(806.36, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 24 },
	{ location = vector3(804.85, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 25 },
	{ location = vector3(804.85, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 25 },

	{ location = vector3(804.25, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 26 },
	{ location = vector3(804.25, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 26 },
	{ location = vector3(802.74, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 27 },
	{ location = vector3(802.74, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 27 },

	{ location = vector3(802.14, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 28 },
	{ location = vector3(802.14, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 28 },
	{ location = vector3(800.63, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 29 },
	{ location = vector3(800.63, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 29 },

	{ location = vector3(799.70, -756.86, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 30 },
	{ location = vector3(799.08, -756.86, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 30 },
	{ location = vector3(799.70, -758.37, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 31 },
	{ location = vector3(799.08, -758.37, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 31 },

	{ location = vector3(799.70, -758.97, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 32 },
	{ location = vector3(799.08, -758.97, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 32 },
	{ location = vector3(799.70, -760.48, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 33 },
	{ location = vector3(799.08, -760.48, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 33 },
	--OUTSIDE
	{ location = vector3(796.57, -747.15, 26.78), heading = 275.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 34 },
	{ location = vector3(799.28, -747.16, 26.78), heading = 85.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 35 },

	{ location = vector3(796.74, -741.29, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 36 },
	{ location = vector3(799.63, -741.27, 26.78), heading = 111.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 37 },

	{ location = vector3(803.11, -741.31, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 38 },
	{ location = vector3(805.97, -741.26, 26.78), heading = 111.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 39 },

	{ location = vector3(808.64, -741.27, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 40 },
	{ location = vector3(811.52, -741.3, 26.78), heading = 101.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 41 },

	{ location = vector3(809.6, -747.17, 26.78), heading = 285.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 42 },
	{ location = vector3(812.41, -747.16, 26.78), heading = 91.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 43 },
	--Basement
	{ location = vector3(809.75, -759.73, 22.3), heading = 352.0, width = 0.6, depth = 0.6, minZ=21.3, maxZ=22.3, distance = 1.7, },
	{ location = vector3(808.58, -758.5, 22.3), heading = 270.0, width = 0.6, depth = 0.6, minZ=21.3, maxZ=22.3, distance = 1.7, },
	{ location = vector3(809.78, -757.21, 22.3), heading = 170.0, width = 0.6, depth = 0.6, minZ=21.3, maxZ=22.3, distance = 1.7, },

	--UPSTAIRS
	--Office
	{ location = vector3(796.19, -767.65, 31.27), heading = 357.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.36, -763.7, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(796.11, -763.7, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(796.85, -763.68, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	--Main Area
	{ location = vector3(796.4, -762.58, 31.27), heading = 357.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.38, -761.42, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.33, -760.45, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.4, -759.43, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },

	{ location = vector3(803.91, -758.86, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 44 },
	{ location = vector3(803.85, -759.62, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 44 },
	{ location = vector3(803.87, -760.62, 31.27), heading = 277.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 44 },
	{ location = vector3(804.85, -761.66, 31.27), heading = 9.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(805.72, -760.58, 31.27), heading = 81.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 45 },
	{ location = vector3(805.69, -759.62, 31.27), heading = 91.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 45 },
	{ location = vector3(805.71, -758.86, 31.27), heading = 91.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 45 },
	--BOSS
	{ location = vector3(797.9, -750.40, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 46 },
	{ location = vector3(798.58, -752.73, 31.27), heading = 20.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 47 },
	{ location = vector3(797.19, -752.72, 31.27), heading = 340.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 48 },
	{ location = vector3(802.57, -749.27, 31.27), heading = 160.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(803.31, -756.31, 31.27), heading = 81.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(802.2, -757.48, 31.27), heading = 15.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 49 },
	{ location = vector3(800.83, -757.44, 31.27), heading = 340.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 49 },

	-- // Yacht \\ --

	{ location = vector3(-1607.8, -1881.98, 5.88), heading = 250.0, width = 0.6, depth = 0.6, minZ=5.0, maxZ=6.0, distance = 1.7, seat = 50 },
	{ location = vector3(-1610.41, -1876.17, 5.88), heading = 250.0, width = 0.8, depth = 0.8, minZ=5.0, maxZ=6.0, distance = 1.7, seat = 51 },
	{ location = vector3(-1609.51, -1878.2, 5.88), heading = 330.0, width = 0.8, depth = 0.8, minZ=5.0, maxZ=6.0, distance = 1.7, seat = 52 },
	{ location = vector3(-1602.15, -1893.37, 8.97), heading = 350.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=8.87, distance = 1.7, seat = 53 },
	{ location = vector3(-1596.21, -1891.03, 8.97), heading = 69.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 54 },
	{ location = vector3(-1605.61, -1883.58, 9.42), heading = 16.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 55 },
	{ location = vector3(-1606.66, -1884.02, 8.97), heading = 16.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 56 },
	{ location = vector3(-1600.8, -1881.67, 9.42), heading = 16.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 57 },
	{ location = vector3(-1599.63, -1881.19, 8.97), heading = 16.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 58 },
	{ location = vector3(-1599.31, -1879.5, 8.97), heading = 110.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, saet = 59 },
	{ location = vector3(-1599.82, -1878.28, 8.97), heading = 110.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 60 },
	{ location = vector3(-1608.08, -1882.98, 8.97), heading = 290.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 61 },
	{ location = vector3(-1608.56, -1881.77, 8.97), heading = 290.0, width = 0.8, depth = 1.0, minZ=8.0, maxZ=9.02, distance = 1.7, seat = 62 },
}

AddEventHandler('onResourceStop', function(r)
	if r == GetCurrentResourceName() then
		for k, v in pairs(Chairs) do
			exports['nocore-eye']:RemoveZone(k)
		end	
	end
end)