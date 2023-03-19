local GetEntityCoords = GetEntityCoords
local Wait = Wait
local IsDisabledControlPressed = IsDisabledControlPressed
local GetEntityBoneIndexByName = GetEntityBoneIndexByName
local GetWorldPositionOfEntityBone = GetWorldPositionOfEntityBone
local SetPauseMenuActive = SetPauseMenuActive
local DisableAllControlActions = DisableAllControlActions
local EnableControlAction = EnableControlAction
local NetworkGetEntityIsNetworked = NetworkGetEntityIsNetworked
local NetworkGetNetworkIdFromEntity = NetworkGetNetworkIdFromEntity
local GetEntityModel = GetEntityModel
local IsPedAPlayer = IsPedAPlayer
local GetEntityType = GetEntityType
local PlayerPedId = PlayerPedId
local GetShapeTestResult = GetShapeTestResult
local StartShapeTestLosProbe = StartShapeTestLosProbe
local SetDrawOrigin = SetDrawOrigin
local DrawSprite = DrawSprite
local ClearDrawOrigin = ClearDrawOrigin
local HasStreamedTextureDictLoaded = HasStreamedTextureDictLoaded
local RequestStreamedTextureDict = RequestStreamedTextureDict
local currentResourceName = GetCurrentResourceName()
local Config, Types, Players, Entities, Models, Zones, nuiData, sendData, sendDistance = Config, {{}, {}, {}}, {}, {}, {}, {}, {}, {}, {}
local playerPed, targetActive, hasFocus, success, pedsReady, allowTarget = PlayerPedId(), false, false, false, false, true
local screen = {}
local table_wipe = table.wipe
local pairs = pairs
local CheckOptions = CheckOptions
local Bones = Load('bones')
local listSprite = {}
local Framework = exports['no-core']:GetCoreObject()

---------------------------------------
--- Source: https://github.com/citizenfx/lua/blob/luaglm-dev/cfx/libs/scripts/examples/scripting_gta.lua
--- Credits to gottfriedleibniz
local glm = require 'glm'

-- Cache common functions
local glm_rad = glm.rad
local glm_quatEuler = glm.quatEulerAngleZYX
local glm_rayPicking = glm.rayPicking

-- Cache direction vectors
local glm_up = glm.up()
local glm_forward = glm.forward()

local function ScreenPositionToCameraRay()
    local pos = GetFinalRenderedCamCoord()
    local rot = glm_rad(GetFinalRenderedCamRot(2))
    local q = glm_quatEuler(rot.z, rot.y, rot.x)
    return pos, glm_rayPicking(
        q * glm_forward,
        q * glm_up,
        glm_rad(screen.fov),
        screen.ratio,
        0.10000, -- GetFinalRenderedCamNearClip(),
        10000.0, -- GetFinalRenderedCamFarClip(),
        0, 0
    )
end
---------------------------------------

-- Functions

local function DrawTarget()
	CreateThread(function()
		while not HasStreamedTextureDictLoaded("shared") do Wait(10) RequestStreamedTextureDict("shared", true) end
		local sleep
		local r, g, b, a
		while targetActive do
			sleep = 500
			for _, zone in pairs(listSprite) do
				sleep = 0

				r = zone.targetoptions.drawColor?[1] or Config.DrawColor[1]
				g = zone.targetoptions.drawColor?[2] or Config.DrawColor[2]
				b = zone.targetoptions.drawColor?[3] or Config.DrawColor[3]
				a = zone.targetoptions.drawColor?[4] or Config.DrawColor[4]

				if zone.success then
					r = zone.targetoptions.successDrawColor?[1] or Config.SuccessDrawColor[1]
					g = zone.targetoptions.successDrawColor?[2] or Config.SuccessDrawColor[2]
					b = zone.targetoptions.successDrawColor?[3] or Config.SuccessDrawColor[3]
					a = zone.targetoptions.successDrawColor?[4] or Config.SuccessDrawColor[4]
				end

				SetDrawOrigin(zone.center.x, zone.center.y, zone.center.z, 0)
				DrawSprite("shared", "emptydot_32", 0, 0, 0.02, 0.035, 0, r, g, b, a)
				ClearDrawOrigin()
			end
			Wait(sleep)
		end
		listSprite = {}
	end)
end

local function RaycastCamera(flag, playerCoords)
	if not playerPed then playerPed = PlayerPedId() end
	if not playerCoords then playerCoords = GetEntityCoords(playerPed) end

	local rayPos, rayDir = ScreenPositionToCameraRay()
	local destination = rayPos + 10000 * rayDir
	local rayHandle = StartShapeTestLosProbe(rayPos.x, rayPos.y, rayPos.z, destination.x, destination.y, destination.z, flag or -1, playerPed, 0)

	while true do
		local result, _, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

		if result ~= 1 then
			local distance = playerCoords and #(playerCoords - endCoords)
			return endCoords, distance, entityHit, entityHit and GetEntityType(entityHit) or 0
		end

		Wait(0)
	end
end

exports('RaycastCamera', RaycastCamera)

local function DisableNUI()
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	hasFocus = false
end

exports('DisableNUI', DisableNUI)

local function EnableNUI(options)
	if not targetActive or hasFocus then return end
	SetCursorLocation(0.5, 0.5)
	SetNuiFocus(true, true)
	SetNuiFocusKeepInput(true)
	hasFocus = true
	SendNUIMessage({response = "validTarget", data = options})
end

exports('EnableNUI', EnableNUI)

local function LeftTarget()
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	success, hasFocus = false, false
	table_wipe(sendData)
	SendNUIMessage({response = "leftTarget"})
end

exports('LeftTarget', LeftTarget)

local function DisableTarget(forcedisable)
	if (not targetActive and hasFocus and not Config.Toggle) or not forcedisable then return end
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	Wait(100)
	targetActive, success, hasFocus = false, false, false
	SendNUIMessage({response = "closeTarget"})
end

exports('DisableTarget', DisableTarget)

local function DrawOutlineEntity(entity, bool)
	if not Config.EnableOutline or IsEntityAPed(entity) then return end
	SetEntityDrawOutline(entity, bool)
	SetEntityDrawOutlineColor(Config.OutlineColor[1], Config.OutlineColor[2], Config.OutlineColor[3], Config.OutlineColor[4])
end

exports('DrawOutlineEntity', DrawOutlineEntity)

local function SetupOptions(datatable, entity, distance, isZone)
	if not isZone then table_wipe(sendDistance) end
	table_wipe(nuiData)
	local slot = 0
	for _, data in ipairs(datatable) do
		if CheckOptions(data, entity, distance) then
			slot = data.num or slot + 1
			sendData[slot] = data
			sendData[slot].entity = entity
			nuiData[slot] = {
				icon = data.icon,
				targeticon = data.targeticon,
				label = data.label
			}
			if not isZone then
				sendDistance[data.distance] = true
			end
		else
			if not isZone then
				sendDistance[data.distance] = false
			end
		end
	end
	return slot
end

exports('SetupOptions', SetupOptions)

local function CheckEntity(flag, datatable, entity, distance)
	if not next(datatable) then return end
	local slot = SetupOptions(datatable, entity, distance)
	if not next(nuiData) then
		LeftTarget()
		DrawOutlineEntity(entity, false)
		return
	end
	success = true
	SendNUIMessage({response = "foundTarget", data = nuiData[slot].targeticon})
	DrawOutlineEntity(entity, true)
	while targetActive and success do
		local _, dist, entity2 = RaycastCamera(flag)
		if entity ~= entity2 then
			LeftTarget()
			DrawOutlineEntity(entity, false)
			break
		elseif not hasFocus and IsDisabledControlPressed(0, Config.MenuControlKey) then
			EnableNUI(nuiData)
			DrawOutlineEntity(entity, false)
		else
			for k, v in pairs(sendDistance) do
				if v and dist > k then
					LeftTarget()
					DrawOutlineEntity(entity, false)
					break
				end
			end
		end
		Wait(0)
	end
	LeftTarget()
	DrawOutlineEntity(entity, false)
end

exports('CheckEntity', CheckEntity)

local function CheckBones(coords, entity, bonelist)
	local closestBone = -1
	local closestDistance = 20
	local closestPos, closestBoneName
	for _, v in pairs(bonelist) do
		if Bones.Options[v] then
			local boneId = GetEntityBoneIndexByName(entity, v)
			local bonePos = GetWorldPositionOfEntityBone(entity, boneId)
			local distance = #(coords - bonePos)
			if closestBone == -1 or distance < closestDistance then
				closestBone, closestDistance, closestPos, closestBoneName = boneId, distance, bonePos, v
			end
		end
	end
	if closestBone ~= -1 then return closestBone, closestPos, closestBoneName
	else return false end
end

exports('CheckBones', CheckBones)

local function EnableTarget()
	if not allowTarget or success or (not Config.Standalone and not LocalPlayer.state['isLoggedIn']) or IsNuiFocused() or (Config.DisableInVehicle and IsPedInAnyVehicle(playerPed or PlayerPedId(), false)) then return end
	if targetActive then return end

	targetActive = true
	playerPed = PlayerPedId()
	screen.ratio = GetAspectRatio(true)
	screen.fov = GetFinalRenderedCamFov()
	if Config.DrawSprite then DrawTarget() end

	SendNUIMessage({response = "openTarget"})
	CreateThread(function()
		repeat
			SetPauseMenuActive(false)
			DisableAllControlActions(0)
			EnableControlAction(0, 30, true)
			EnableControlAction(0, 31, true)

			if not hasFocus then
				EnableControlAction(0, 1, true)
				EnableControlAction(0, 2, true)
			end

			Wait(0)
		until not targetActive
	end)

	local flag

	while targetActive do
		local sleep = 0
		if flag == 30 then flag = -1 else flag = 30 end

		local coords, distance, entity, entityType = RaycastCamera(flag)
		if distance <= Config.MaxDistance then
			if entityType > 0 then

				-- Local(non-net) entity targets
				if Entities[entity] then
					CheckEntity(flag, Entities[entity], entity, distance)
				end

				-- Owned entity targets
				if NetworkGetEntityIsNetworked(entity) then
					local data = Entities[NetworkGetNetworkIdFromEntity(entity)]
					if data then CheckEntity(flag, data, entity, distance) end
				end

				-- Player and Ped targets
				if entityType == 1 then
					local data = Models[GetEntityModel(entity)]
					if IsPedAPlayer(entity) then data = Players end
					if data and next(data) then CheckEntity(flag, data, entity, distance) end

				-- Vehicle bones and models
				elseif entityType == 2 then
					local closestBone, _, closestBoneName = CheckBones(coords, entity, Bones.Vehicle)
					local datatable = Bones.Options[closestBoneName]
					if datatable and next(datatable) and closestBone then
						local slot = SetupOptions(datatable, entity, distance)
						if next(nuiData) then
							success = true
							SendNUIMessage({response = "foundTarget", data = nuiData[slot].targeticon})
							DrawOutlineEntity(entity, true)
							while targetActive and success do
								local _, dist, entity2 = RaycastCamera(flag)
								if entity == entity2 then
									local closestBone2 = CheckBones(coords, entity, Bones.Vehicle)
									if closestBone ~= closestBone2 then
										LeftTarget()
										DrawOutlineEntity(entity, false)
										break
									elseif not hasFocus and IsDisabledControlPressed(0, Config.MenuControlKey) then
										EnableNUI(nuiData)
										DrawOutlineEntity(entity, false)
									else
										for k, v in pairs(sendDistance) do
											if v and dist > k then
												LeftTarget()
												DrawOutlineEntity(entity, false)
												break
											end
										end
									end
								else
									LeftTarget()
									DrawOutlineEntity(entity, false)
									break
								end
								Wait(0)
							end
							LeftTarget()
							DrawOutlineEntity(entity, false)
						end
					end

					-- Vehicle model targets
					local data = Models[GetEntityModel(entity)]
					if data then CheckEntity(flag, data, entity, distance) end

				-- Entity targets
				elseif entityType > 2 then
					local data = Models[GetEntityModel(entity)]
					if data then CheckEntity(flag, data, entity, distance) end
				end

				-- Generic targets
				if not success then
					local data = Types[entityType]
					if data and next(data) then CheckEntity(flag, data, entity, distance) end
				end
			else sleep += 20 end
			if not success then
				-- Zone targets
				local closestDis, closestZone
				for k, zone in pairs(Zones) do
					if distance < (closestDis or Config.MaxDistance) and distance <= zone.targetoptions.distance and zone:isPointInside(coords) then
						closestDis = distance
						closestZone = zone
					end
					if Config.DrawSprite then
						if #(coords - zone.center) < (zone.targetoptions.drawDistance or Config.DrawDistance) then
							listSprite[k] = zone
						else
							listSprite[k] = nil
						end
					end
				end
				if closestZone then
					local slot = SetupOptions(closestZone.targetoptions.options, entity, distance, true)
					if next(nuiData) then
						success = true
						SendNUIMessage({response = "foundTarget", data = nuiData[slot].targeticon})
						if Config.DrawSprite then
							listSprite[closestZone.name].success = true
						end
						DrawOutlineEntity(entity, true)
						while targetActive and success do
							local newCoords, dist = RaycastCamera(flag)
							if not closestZone:isPointInside(newCoords) or dist > closestZone.targetoptions.distance then
								LeftTarget()
								DrawOutlineEntity(entity, false)
								break
							elseif not hasFocus and IsDisabledControlPressed(0, Config.MenuControlKey) then
								EnableNUI(nuiData)
								DrawOutlineEntity(entity, false)
							end
							Wait(0)
						end
						if Config.DrawSprite and listSprite[closestZone.name] then -- Check for when the targetActive is false and it removes the zone from listSprite
							listSprite[closestZone.name].success = false
						end
						LeftTarget()
						DrawOutlineEntity(entity, false)
					end
				else sleep += 20 end
			else LeftTarget() DrawOutlineEntity(entity, false) end
		else sleep += 20 end
		Wait(sleep)
	end
	DisableTarget(false)
end

local function AddCircleZone(name, center, radius, options, targetoptions)
	local centerType = type(center)
	center = (centerType == 'table' or centerType == 'vector4') and vec3(center.x, center.y, center.z) or center
	Zones[name] = CircleZone:Create(center, radius, options)
	targetoptions.distance = targetoptions.distance or Config.MaxDistance
	Zones[name].targetoptions = targetoptions
	return Zones[name]
end

exports("AddCircleZone", AddCircleZone)

local function AddBoxZone(name, center, length, width, options, targetoptions)
	local centerType = type(center)
	center = (centerType == 'table' or centerType == 'vector4') and vec3(center.x, center.y, center.z) or center
	Zones[name] = BoxZone:Create(center, length, width, options)
	targetoptions.distance = targetoptions.distance or Config.MaxDistance
	Zones[name].targetoptions = targetoptions
	return Zones[name]
end

exports("AddBoxZone", AddBoxZone)

local function AddPolyZone(name, points, options, targetoptions)
	local _points = {}
	local pointsType = type(points[1])
	if pointsType == 'table' or pointsType == 'vector3' or pointsType == 'vector4' then
		for i = 1, #points do
			_points[i] = vec2(points[i].x, points[i].y)
		end
	end
	Zones[name] = PolyZone:Create(#_points > 0 and _points or points, options)
	targetoptions.distance = targetoptions.distance or Config.MaxDistance
	Zones[name].targetoptions = targetoptions
	return Zones[name]
end

exports("AddPolyZone", AddPolyZone)

local function AddComboZone(zones, options, targetoptions)
	Zones[options.name] = ComboZone:Create(zones, options)
	targetoptions.distance = targetoptions.distance or Config.MaxDistance
	Zones[options.name].targetoptions = targetoptions
	return Zones[options.name]
end

exports("AddComboZone", AddComboZone)

local function AddEntityZone(name, entity, options, targetoptions)
	Zones[name] = EntityZone:Create(entity, options)
	targetoptions.distance = targetoptions.distance or Config.MaxDistance
	Zones[name].targetoptions = targetoptions
	return Zones[name]
end

exports("AddEntityZone", AddEntityZone)

local function RemoveZone(name)
	if not Zones[name] then return end
	if Zones[name].destroy then Zones[name]:destroy() end
	Zones[name] = nil
end

exports("RemoveZone", RemoveZone)

local function SetOptions(tbl, distance, options)
	for _, v in pairs(options) do
		if v.required_item then
			v.item = v.required_item
			v.required_item = nil
		end
		if not v.distance or v.distance > distance then v.distance = distance end
		tbl[#tbl+1] = v
	end
end

exports("SetOptions", SetOptions)

local function AddTargetBone(bones, parameters)
	local distance, options = parameters.distance or Config.MaxDistance, parameters.options
	if type(bones) == 'table' then
		for _, bone in pairs(bones) do
			if not Bones.Options[bone] then Bones.Options[bone] = {} end
			SetOptions(Bones.Options[bone], distance, options)
		end
	elseif type(bones) == 'string' then
		if not Bones.Options[bones] then Bones.Options[bones] = {} end
		SetOptions(Bones.Options[bones], distance, options)
	end
end

exports("AddTargetBone", AddTargetBone)

local function RemoveTargetBone(bones, labels)
	if type(bones) == 'table' then
		for _, bone in pairs(bones) do
			if type(labels) == 'table' then
				for _, v in pairs(labels) do
					if Bones.Options[bone] then
						Bones.Options[bone][v] = nil
					end
				end
			elseif type(labels) == 'string' then
				if Bones.Options[bone] then
					Bones.Options[bone][labels] = nil
				end
			end
		end
	else
		if type(labels) == 'table' then
			for _, v in pairs(labels) do
				if Bones.Options[bones] then
					Bones.Options[bones][v] = nil
				end
			end
		elseif type(labels) == 'string' then
			if Bones.Options[bones] then
				Bones.Options[bones][labels] = nil
			end
		end
	end
end

exports("RemoveTargetBone", RemoveTargetBone)

local function AddTargetEntity(entities, parameters)
	local distance, options = parameters.distance or Config.MaxDistance, parameters.options
	if type(entities) == 'table' then
		for _, entity in pairs(entities) do
			if NetworkGetEntityIsNetworked(entity) then entity = NetworkGetNetworkIdFromEntity(entity) end -- Allow non-networked entities to be targeted
			if not Entities[entity] then Entities[entity] = {} end
			SetOptions(Entities[entity], distance, options)
		end
	elseif type(entities) == 'number' then
		if NetworkGetEntityIsNetworked(entities) then entities = NetworkGetNetworkIdFromEntity(entities) end -- Allow non-networked entities to be targeted
		if not Entities[entities] then Entities[entities] = {} end
		SetOptions(Entities[entities], distance, options)
	end
end

exports("AddTargetEntity", AddTargetEntity)

local function RemoveTargetEntity(entities, labels)
	if type(entities) == 'table' then
		for _, entity in pairs(entities) do
			if NetworkGetEntityIsNetworked(entity) then entity = NetworkGetNetworkIdFromEntity(entity) end -- Allow non-networked entities to be targeted
			if type(labels) == 'table' then
				for _, v in pairs(labels) do
					if Entities[entity] then
						Entities[entity][v] = nil
					end
				end
			elseif type(labels) == 'string' then
				if Entities[entity] then
					Entities[entity][labels] = nil
				end
			end
		end
	elseif type(entities) == 'number' then
		if NetworkGetEntityIsNetworked(entities) then entities = NetworkGetNetworkIdFromEntity(entities) end -- Allow non-networked entities to be targeted
		if type(labels) == 'table' then
			for _, v in pairs(labels) do
				if Entities[entities] then
					Entities[entities][v] = nil
				end
			end
		elseif type(labels) == 'string' then
			if Entities[entities] then
				Entities[entities][labels] = nil
			end
		end
	end
end

exports("RemoveTargetEntity", RemoveTargetEntity)

local function AddTargetModel(models, parameters)
	local distance, options = parameters.distance or Config.MaxDistance, parameters.options
	if type(models) == 'table' then
		for _, model in pairs(models) do
			if type(model) == 'string' then model = joaat(model) end
			if not Models[model] then Models[model] = {} end
			SetOptions(Models[model], distance, options)
		end
	else
		if type(models) == 'string' then models = joaat(models) end
		if not Models[models] then Models[models] = {} end
		SetOptions(Models[models], distance, options)
	end
end

exports("AddTargetModel", AddTargetModel)

local function RemoveTargetModel(models, labels)
	if type(models) == 'table' then
		for _, model in pairs(models) do
			if type(model) == 'string' then model = joaat(model) end
			if type(labels) == 'table' then
				for _, v in pairs(labels) do
					if Models[model] then
						Models[model][v] = nil
					end
				end
			elseif type(labels) == 'string' then
				if Models[model] then
					Models[model][labels] = nil
				end
			end
		end
	else
		if type(models) == 'string' then models = joaat(models) end
		if type(labels) == 'table' then
			for _, v in pairs(labels) do
				if Models[models] then
					Models[models][v] = nil
				end
			end
		elseif type(labels) == 'string' then
			if Models[models] then
				Models[models][labels] = nil
			end
		end
	end
end

exports("RemoveTargetModel", RemoveTargetModel)

local function AddGlobalType(type, parameters)
	local distance, options = parameters.distance or Config.MaxDistance, parameters.options
	SetOptions(Types[type], distance, options)
end

exports("AddGlobalType", AddGlobalType)

local function AddGlobalPed(parameters) AddGlobalType(1, parameters) end

exports("AddGlobalPed", AddGlobalPed)

local function AddGlobalVehicle(parameters) AddGlobalType(2, parameters) end

exports("AddGlobalVehicle", AddGlobalVehicle)

local function AddGlobalObject(parameters) AddGlobalType(3, parameters) end

exports("AddGlobalObject", AddGlobalObject)

local function AddGlobalPlayer(parameters)
	local distance, options = parameters.distance or Config.MaxDistance, parameters.options
	SetOptions(Players, distance, options)
end

exports("AddGlobalPlayer", AddGlobalPlayer)

local function RemoveGlobalType(typ, labels)
	if type(labels) == 'table' then
		for _, v in pairs(labels) do
			Types[typ][v] = nil
		end
	elseif type(labels) == 'string' then
		Types[typ][labels] = nil
	end
end

exports("RemoveGlobalType", RemoveGlobalType)

local function RemoveGlobalPlayer(labels)
	if type(labels) == 'table' then
		for _, v in pairs(labels) do
			Players[v] = nil
		end
	elseif type(labels) == 'string' then
		Players[labels] = nil
	end
end

exports("RemoveGlobalPlayer", RemoveGlobalPlayer)

function SpawnPeds()
	if pedsReady or not next(Config.Peds) then return end
	for k, v in pairs(Config.Peds) do
		if not v.currentpednumber or v.currentpednumber == 0 then
			local spawnedped
			RequestModel(v.model)
			while not HasModelLoaded(v.model) do
				Wait(0)
			end

			if type(v.model) == 'string' then v.model = joaat(v.model) end

			if v.minusOne then
				spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.coords.w, v.networked or false, false)
			else
				spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z, v.coords.w, v.networked or false, false)
			end

			if v.freeze then
				FreezeEntityPosition(spawnedped, true)
			end

			if v.invincible then
				SetEntityInvincible(spawnedped, true)
			end

			if v.blockevents then
				SetBlockingOfNonTemporaryEvents(spawnedped, true)
			end

			if v.animDict and v.anim then
				RequestAnimDict(v.animDict)
				while not HasAnimDictLoaded(v.animDict) do
					Wait(0)
				end

				TaskPlayAnim(spawnedped, v.animDict, v.anim, 8.0, 0, -1, v.flag or 1, 0, 0, 0, 0)
			end

			if v.scenario then
				SetPedCanPlayAmbientAnims(spawnedped, true)
				TaskStartScenarioInPlace(spawnedped, v.scenario, 0, true)
			end

			if v.appearance then
                exports['fivem-appearance']:setPedAppearance(spawnedped, v.appearance)
			end

			if v.target then
				if v.target.useModel then
					AddTargetModel(v.model, {
						options = v.target.options,
						distance = v.target.distance
					})
				else
					AddTargetEntity(spawnedped, {
						options = v.target.options,
						distance = v.target.distance
					})
				end
			end

			Config.Peds[k].currentpednumber = spawnedped
		end
	end
	pedsReady = true
end

function DeletePeds()
	if not pedsReady or not next(Config.Peds) then return end
	for k, v in pairs(Config.Peds) do
		DeletePed(v.currentpednumber)
		Config.Peds[k].currentpednumber = 0
	end
	pedsReady = false
end

exports("DeletePeds", DeletePeds)

local function SpawnPed(data)
	local spawnedped
	local key, value = next(data)
	if type(value) == 'table' and type(key) ~= 'string' then
		for _, v in pairs(data) do
			if v.spawnNow then
				RequestModel(v.model)
				while not HasModelLoaded(v.model) do
					Wait(0)
				end

				if type(v.model) == 'string' then v.model = joaat(v.model) end

				if v.minusOne then
					spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.coords.w or 0.0, v.networked or false, true)
				else
					spawnedped = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z, v.coords.w or 0.0, v.networked or false, true)
				end

				if v.freeze then
					FreezeEntityPosition(spawnedped, true)
				end

				if v.invincible then
					SetEntityInvincible(spawnedped, true)
				end

				if v.blockevents then
					SetBlockingOfNonTemporaryEvents(spawnedped, true)
				end

				if v.animDict and v.anim then
					RequestAnimDict(v.animDict)
					while not HasAnimDictLoaded(v.animDict) do
						Wait(0)
					end

					TaskPlayAnim(spawnedped, v.animDict, v.anim, 8.0, 0, -1, v.flag or 1, 0, 0, 0, 0)
				end

				if v.scenario then
					SetPedCanPlayAmbientAnims(spawnedped, true)
					TaskStartScenarioInPlace(spawnedped, v.scenario, 0, true)
				end

				if v.target then
					if v.target.useModel then
						AddTargetModel(v.model, {
							options = v.target.options,
							distance = v.target.distance
						})
					else
						AddTargetEntity(spawnedped, {
							options = v.target.options,
							distance = v.target.distance
						})
					end
				end

				v.currentpednumber = spawnedped
			end

			local nextnumber = #Config.Peds + 1
			if nextnumber <= 0 then nextnumber = 1 end

			Config.Peds[nextnumber] = v
		end
	else
		if data.spawnNow then
			RequestModel(data.model)
			while not HasModelLoaded(data.model) do
				Wait(0)
			end

			if type(data.model) == 'string' then data.model = joaat(data.model) end

			if data.minusOne then
				spawnedped = CreatePed(0, data.model, data.coords.x, data.coords.y, data.coords.z - 1.0, data.coords.w, data.networked or false, true)
			else
				spawnedped = CreatePed(0, data.model, data.coords.x, data.coords.y, data.coords.z, data.coords.w, data.networked or false, true)
			end

			if data.freeze then
				FreezeEntityPosition(spawnedped, true)
			end

			if data.invincible then
				SetEntityInvincible(spawnedped, true)
			end

			if data.blockevents then
				SetBlockingOfNonTemporaryEvents(spawnedped, true)
			end

			if data.animDict and data.anim then
				RequestAnimDict(data.animDict)
				while not HasAnimDictLoaded(data.animDict) do
					Wait(0)
				end

				TaskPlayAnim(spawnedped, data.animDict, data.anim, 8.0, 0, -1, data.flag or 1, 0, 0, 0, 0)
			end

			if data.scenario then
				SetPedCanPlayAmbientAnims(spawnedped, true)
				TaskStartScenarioInPlace(spawnedped, data.scenario, 0, true)
			end

			if data.target then
				if data.target.useModel then
					AddTargetModel(data.model, {
						options = data.target.options,
						distance = data.target.distance
					})
				else
					AddTargetEntity(spawnedped, {
						options = data.target.options,
						distance = data.target.distance
					})
				end
			end

			data.currentpednumber = spawnedped
		end

		local nextnumber = #Config.Peds + 1
		if nextnumber <= 0 then nextnumber = 1 end

		Config.Peds[nextnumber] = data
	end
end

exports("SpawnPed", SpawnPed)

local function RemovePed(peds)
	if type(peds) == 'table' then
		for k, v in pairs(peds) do
			DeletePed(v)
			if Config.Peds[k] then Config.Peds[k].currentpednumber = 0 end
		end
	elseif type(peds) == 'number' then
		DeletePed(peds)
	end
end

exports("RemoveSpawnedPed", RemovePed)

-- Misc. Exports

exports("RemoveGlobalPed", function(labels) RemoveGlobalType(1, labels) end)

exports("RemoveGlobalVehicle", function(labels) RemoveGlobalType(2, labels) end)

exports("RemoveGlobalObject", function(labels) RemoveGlobalType(3, labels) end)

exports("IsTargetActive", function() return targetActive end)

exports("IsTargetSuccess", function() return success end)

exports("GetGlobalTypeData", function(type, label) return Types[type][label] end)

exports("GetZoneData", function(name) return Zones[name] end)

exports("GetTargetBoneData", function(bone, label) return Bones.Options[bone][label] end)

exports("GetTargetEntityData", function(entity, label) return Entities[entity][label] end)

exports("GetTargetModelData", function(model, label) return Models[model][label] end)

exports("GetGlobalPedData", function(label) return Types[1][label] end)

exports("GetGlobalVehicleData", function(label) return Types[2][label] end)

exports("GetGlobalObjectData", function(label) return Types[3][label] end)

exports("GetGlobalPlayerData", function(label) return Players[label] end)

exports("UpdateGlobalTypeData", function(type, label, data) Types[type][label] = data end)

exports("UpdateZoneData", function(name, data) Zones[name] = data end)

exports("UpdateTargetBoneData", function(bone, label, data) Bones.Options[bone][label] = data end)

exports("UpdateTargetEntityData", function(entity, label, data) Entities[entity][label] = data end)

exports("UpdateTargetModelData", function(model, label, data) Models[model][label] = data end)

exports("UpdateGlobalPedData", function(label, data) Types[1][label] = data end)

exports("UpdateGlobalVehicleData", function(label, data) Types[2][label] = data end)

exports("UpdateGlobalObjectData", function(label, data) Types[3][label] = data end)

exports("UpdateGlobalPlayerData", function(label, data) Players[label] = data end)

exports("GetPeds", function() return Config.Peds end)

exports("UpdatePedsData", function(index, data) Config.Peds[index] = data end)

exports("AllowTargeting", function(bool)
	allowTarget = bool
	if not allowTarget then
		DisableTarget(true)
	end
end)

-- NUI Callbacks

RegisterNUICallback('selectTarget', function(option, cb)
	option = tonumber(option) or option
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
	Wait(100)
	targetActive, success, hasFocus = false, false, false
	if not next(sendData) then return end
	local data = sendData[option]
	if not data then return end
	table_wipe(sendData)
	CreateThread(function()
		Wait(0)
		if data.action then
			data.action(data.entity)
		elseif data.event then
			if data.type == "client" then
				TriggerEvent(data.event, data)
			elseif data.type == "server" then
				TriggerServerEvent(data.event, data)
			elseif data.type == "command" then
				ExecuteCommand(data.event)
			elseif data.type == "frameworkcommand" then
				TriggerServerEvent('Framework:CallCommand', data.event, data)
			else
				TriggerEvent(data.event, data)
			end
		else
			error("No trigger setup")
		end
	end)
	cb('ok')
end)

RegisterNUICallback('closeTarget', function(_, cb)
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	Wait(100)
	targetActive, success, hasFocus = false, false, false
	cb('ok')
end)

RegisterNUICallback('leftTarget', function(_, cb)
	if Config.Toggle then
		SetNuiFocus(false, false)
		SetNuiFocusKeepInput(false)
		Wait(100)
		table_wipe(sendData)
		success, hasFocus = false, false
	else
		DisableTarget(true)
	end
	cb('ok')
end)

-- Startup thread

CreateThread(function()
	if Config.Toggle then
		RegisterCommand('playerTarget', function()
			if targetActive then
				DisableTarget(true)
			else
				EnableTarget()
			end
		end, false)
		RegisterKeyMapping("playerTarget", "Toggle targeting", "keyboard", Config.OpenKey)
		TriggerEvent('chat:removeSuggestion', '/playerTarget')
	else
		RegisterCommand('+playerTarget', EnableTarget, false)
		RegisterCommand('-playerTarget', DisableTarget, false)
		RegisterKeyMapping("+playerTarget", "Enable targeting", "keyboard", Config.OpenKey)
		TriggerEvent('chat:removeSuggestion', '/+playerTarget')
		TriggerEvent('chat:removeSuggestion', '/-playerTarget')
	end

    if next(Config.CircleZones) then
        for _, v in pairs(Config.CircleZones) do
            AddCircleZone(v.name, v.coords, v.radius, {
                name = v.name,
                debugPoly = v.debugPoly,
            }, {
                options = v.options,
                distance = v.distance
            })
        end
    end

    if next(Config.BoxZones) then
        for _, v in pairs(Config.BoxZones) do
            AddBoxZone(v.name, v.coords, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                debugPoly = v.debugPoly,
                minZ = v.minZ,
                maxZ = v.maxZ
            }, {
                options = v.options,
                distance = v.distance
            })
        end
    end

    if next(Config.PolyZones) then
        for _, v in pairs(Config.PolyZones) do
            AddPolyZone(v.name, v.points, {
                name = v.name,
                debugPoly = v.debugPoly,
                minZ = v.minZ,
                maxZ = v.maxZ
            }, {
                options = v.options,
                distance = v.distance
            })
        end
    end

    if next(Config.TargetBones) then
        for _, v in pairs(Config.TargetBones) do
            AddTargetBone(v.bones, {
                options = v.options,
                distance = v.distance
            })
        end
    end

    if next(Config.TargetModels) then
        for _, v in pairs(Config.TargetModels) do
            AddTargetModel(v.models, {
                options = v.options,
                distance = v.distance
            })
        end
    end

    if next(Config.GlobalPedOptions) then
        AddGlobalPed(Config.GlobalPedOptions)
    end

    if next(Config.GlobalVehicleOptions) then
        AddGlobalVehicle(Config.GlobalVehicleOptions)
    end

    if next(Config.GlobalObjectOptions) then
        AddGlobalObject(Config.GlobalObjectOptions)
    end

    if next(Config.GlobalPlayerOptions) then
        AddGlobalPlayer(Config.GlobalPlayerOptions)
    end
end)

-- Events

-- This is to make sure the peds spawn on restart too instead of only when you load/log-in.
AddEventHandler('onResourceStart', function(resource)
	if resource == currentResourceName then
		SpawnPeds()
	end
end)

-- This will delete the peds when the resource stops to make sure you don't have random peds walking
AddEventHandler('onResourceStop', function(resource)
	if resource == currentResourceName then
		DeletePeds()
	end
end)

-- Debug Option

if Config.Debug then Load('debug') end

RegisterNetEvent('nocore-eye:client:givemoney:keyboard', function(data)
	local Player = NetworkGetPlayerIndexFromPed(data.entity)
	local keyboard = exports["nocore-keyboard"]:KeyboardInput({
		header = "Сума която желаете да дадете",
		rows = {
			{
				id = 0,
				helper = "Кеш сума"
			}
		}
	})
	if keyboard ~= nil then
		if keyboard[1].input == nil then return end
		TriggerServerEvent('nocore-eye:server:givecash', GetPlayerServerId(Player), keyboard[1].input)
	end
end)

RegisterNetEvent('nocore-eye:client:vizitka', function(data)
    local Player = NetworkGetPlayerIndexFromPed(data.entity)
    TriggerServerEvent('nocore-eye:server:vizitka', GetPlayerServerId(Player))
end)

RegisterNetEvent('nocore-eye:copyVizitka', function(number)
    lib.setClipboard(number)
    Framework.Functions.Notify('Копирахте телефонния номер', 'info', 5000)
end)

AddEventHandler('nocore-redcircle:client:open:stash', function()
    TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Redcirlce')
    TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Redcirlce', {
        maxweight = 5000000,
        slots = 40,
    })
end)

AddEventHandler('nocore-mousehouse:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'MouseHouse')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'MouseHouse', {
				maxweight = 5000000,
				slots = 40,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'mouse-key')
end)

AddEventHandler('nocore-dokhouse:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Dokhouse')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Dokhouse', {
				maxweight = 5000000,
				slots = 40,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'dok-key')
end)

AddEventHandler('nocore-ballas:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Ballas')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Ballas', {
				maxweight = 50000000,
				slots = 1000,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'key-ballas')
end)

AddEventHandler('nocore-vagos:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Vagos')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Vagos', {
				maxweight = 50000000,
				slots = 1000,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'key-vagos')
end)

AddEventHandler('nocore-families:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Families')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Families', {
				maxweight = 50000000,
				slots = 1000,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'key-gsf')
end)

AddEventHandler('nocore-marabunta:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Marabunta')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Marabunta', {
				maxweight = 50000000,
				slots = 1000,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'key-marabunta')
end)

AddEventHandler('nocore-aztecas:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Aztecas')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Aztecas', {
				maxweight = 50000000,
				slots = 1000,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'key-aztecas')
end)

AddEventHandler('nocore-aztecas:client:open:stash', function()
	Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
        if HasItem then
			TriggerEvent('nocore-inventory:client:SetCurrentStash', 'Aztecas')
			TriggerServerEvent('nocore-inventory:server:OpenInventory', 'stash', 'Aztecas', {
				maxweight = 50000000,
				slots = 1000,
			})
        else
            Framework.Functions.Notify("Нямате необходимия ключ..", "error")
        end
    end, 'key-aztecas')
end)

local drinks = {
    `prop_vend_fags_01`,
    `prop_vend_soda_02`,
    `v_68_broeknvend`,
    `prop_vend_water_01`,
    `prop_vend_soda_01`,
    `ch_chint10_vending_smallroom_01`,
}

local atms = {
    `prop_atm_01`,
    `prop_atm_02`,
    `prop_atm_03`,
    `prop_fleeca_atm`,
}

local stopsigns = {
    `prop_sign_road_01a`,
}

local craftingtables = {
    `prop_toolchest_05`,
}

local newspaper = {
    `prop_news_disp_02a_s`,
    `prop_cs_newspaper`,
    `p_cs_newspaper_s`,
    `prop_news_disp_01a`,
    `ng_proc_paper_news_rag`,
    `ng_proc_paper_news_quik`,
    `ng_proc_paper_news_meteor`,
    `ng_proc_paper_news_globe`,
    `prop_news_disp_02a`,
    `prop_news_disp_02b`,
    `prop_news_disp_02c`,
    `prop_news_disp_02d`,
    `prop_news_disp_02e`,
    `prop_news_disp_03a`,
    `prop_news_disp_03c`,
    `prop_news_disp_05a`,
    `prop_news_disp_06a`,
}

local dumbsters = {
    `prop_cs_dumpster_01a`,
    `prop_dumpster_02a`,
    `prop_dumpster_01a`,
    `prop_dumpster_02b`,
    `prop_dumpster_4b`,
    `prop_dumpster_3a`,
    `prop_bin_05a`,
}

local traphouse = {
    `ig_clay`,
}

local store = {
    `mp_m_shopkeep_01`,
    `s_f_m_sweatshop_01`,
}

local bed = {
    `v_med_bed1`,
    `v_med_bed2`,
}

local weed = {
    `bkr_prop_weed_01_small_01b`,
    `bkr_prop_weed_med_01a`,
    `bkr_prop_weed_med_01b`,
}

local weed2 = {
    `bkr_prop_weed_lrg_01a`,
    `bkr_prop_weed_lrg_01b`,
}

local gaspumps = {
    -2007231801,
	1339433404,
	1694452750,
	1933174915,
	-462817101,
	-469694731,
	-164877493
}

local printer = {
    -824819003
}

local seatBones = {
    'seat_pside_r',
    'seat_dside_r',
    'seat_dside_f',
    'seat_pside_f'
}

Citizen.CreateThread(function()
    
    AddTargetBone(Config.VehicleTrunkBones, {
        options = {
            {
                event = "nocore-vehcommands:target:open:trunk",
                icon = "fas fa-truck-loading",
                label = "Багажник",
            },
            {
                event = "nocore-police:client:CheckPlate",
                icon = "fas fa-align-left",
                label = "Проверка на рег. номер",
                job = "police",
                duty = true,
            },
        },
        distance = 5
    })

    AddTargetBone(seatBones, {
        options = {
            {
                --num = 2,
                event = "nocore-police:client:PutPlayerInVehicle",
                icon = "fas fa-sign-in-alt",
                label = "Вкарай",
            },
            {
                --num = 3,
                event = "nocore-police:client:SetPlayerOutVehicle",
                icon = "fas fa-sign-in-alt",
                label = "Изкарай",
            },
        },
        distance = 2
    })
    
    AddTargetBone('boot', {
        options = {
            {
                event = "nocore-police:client:CheckPlate",
                icon = "fas fa-sign-in-alt",
                label = "Проверка на рег. номер",
                job = "police",
                duty = true,
            },
        },
        distance = 5
    })

    AddTargetModel(bed, {
        options = {{
            event = "ChairBedSystem:Client:Lay",
            anim = "sit",
            icon = "fas fa-circle",
            label = "Седни"
        },
        {
            event = "ChairBedSystem:Client:Lay",
            anim = "back",
            icon = "fas fa-circle",
            label = "Легни по гръб"
        },
        {
            event = "ChairBedSystem:Client:Lay",
            anim = "stomach",
            icon = "fas fa-circle",
            label = "Легни по корем"
        }},
        
        distance = 2
    })

    AddTargetModel(stopsigns, {
        options = {{
            event = "stopsign:client:GetStopSign",
            icon = "fas fa-history",
            label = "Вземи тоз знак"
        }},
        
        distance = 2
    })

    AddTargetModel(gaspumps, {
        options = {{
            event = "nocore-fuel:client:get:fuel",
            icon = "fas fa-gas-pump",
            label = "Вземи туба с гориво (100$)"
        }},
        
        distance = 2
    })

    AddTargetModel(store, {
        options = {{
            event = "nocore-stores:client:open:shop",
            icon = "fas fa-cash-register",
            label = "Магазин"
        }},
        
        distance = 2
    })

    --[[ AddTargetModel(traphouse, {
        options = {{
            event = "nocore-traphouse:server:sell:item",
            type = "Server",
            icon = "fas fa-circle",
            label = "Продай диаманти"
        }},
        
        distance = 2
    }) ]]

    AddTargetModel(printer, {
        options = {{
            event = "nocore-printer:client:OpenPrinter",
            icon = "fas fa-print",
            label = "Принтер"
        }},
        
        distance = 2
    })

    AddTargetModel(dumbsters, {
        options = {{
            event = "nocore-materials:client:search:trash",
            icon = "fas fa-dumpster",
            label = "Прерови"
        }},
        
        distance = 2
    })

    AddTargetModel(newspaper, {
        options = {{
            event = "newspaper:toggle",
            icon = "fas fa-circle",
            label = "Вестник"
        }},
        
        distance = 2
    })

    -- AddTargetModel(coffee, {
    --     options = {{
    --         event = "nocore-inventory:client:openVending",
    --         type = "coffee",
    --         icon = "fas fa-mug-hot",
    --         label = "Кафе Машина"
    --     }},
        
    --     distance = 2
    -- })

    AddTargetModel(drinks, {
        options = {{
            event = "nocore-inventory:client:openVending",
            type = "drinks",
            icon = "fas fa-money-bill-wave-alt",
            label = "Вендинг Машина"
        }},
        
        distance = 2
    })

    AddTargetModel(craftingtables, {
        options = {{
            event = "nocore-crafting:opentable",
            icon = "fas fa-tools",
            label = "Маса за изработка"
        }},
        
        distance = 2
    })

    AddBoxZone("explosivecrafting", vector3(926.48, -1488.08, 30.49), 1.5, 2.0, {
        name = "explosivecrafting",
        heading = 255,
        debugPoly = Config.DebugZones,
        minZ=29.49,
        maxZ=32.29
    }, {
        options = {{
            event = "nocore-crafting:openexplosivetable",
            icon = "fas fa-tools",
            label = "Маса"
        }},
        distance = 1.5
    })

    -- AddTargetModel(snak, {
    --     options = {{
    --         event = "nocore-inventory:client:openVending",
    --         type = "snak",
    --         icon = "fas fa-money-bill-wave-alt",
    --         label = "Вендинг Машина"
    --     }},
        
    --     distance = 2
    -- })

    AddTargetModel(atms, {
        options = {{
            event = "nocore-bank:OpenATM",
            icon = "fas fa-credit-card",
            action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                TaskTurnPedToFaceEntity(PlayerPedId(), entity, 0)
                Wait(1000)
                TriggerEvent("nocore-bank:OpenATM")
              end,
            label = "ATM"
        }},
        
        distance = 2
    })
    
    --[[ AddTargetModel(peds, {
        options = {{
            event = "nocore-illegal:client:talk:to:npc",
            icon = "talk",
            label = "Говори с човек"
        }},
        
        distance = 3
    }) ]]

    AddTargetModel({112404821, -2126678982, -322953213}, {
        options = {
            {
                event = "joincasinogame",
                icon = "fas fa-money-bill-wave",
                label = "Играй Blackjack",
                canInteract = function()
                    return not exports['nocore-blackjack']:isPlayingBlackjack()
                end,
            },
            {
                event = "nocore-casino:blackjack:exitTable:eye",
                icon = "fas fa-sign-out-alt",
                label = "Напусни масата",
                canInteract = function()
                    return exports['nocore-blackjack']:isPlayingBlackjack()
                end,
            },
        },
        distance = 2.0
    })
    AddTargetModel({623773339}, {
        options = {
            {
                canInteract = function()
                    return not exports['nocore-roulette']:isPlayingRoulette()
                end,
                event = "nocore-casino:roulette:selectChair",
                icon = "fas fa-money-bill-wave",
                label = "Играй рулетка",
            },
        },
        distance = 2.0
    })
    AddTargetModel({-1744066143}, {
        options = {
            {
                -- canInteract = function()
                --     return not exports['nocore-roulette']:isPlayingRoulette()
                -- end,
                event = "nocore-poker:SitTable",
                icon = "fas fa-money-bill-wave",
                label = "Играй покер",
            },
        },
        distance = 1
    })


    AddBoxZone("BurgerShotTray1", vector3(-1194.02, -894.21, 14.0), 0.6, 0.6, {
        name= "BurgerShotTray1",
        debugPoly=Config.DebugZones,
        heading=34,
        minZ=13.85,
        maxZ=14.25
    }, {
        options = {{
            event = "nocore-burgershot:client:open:tray",
            Numbers = 1,
            icon = "fas fa-hamburger",
            label = "Табла"
        }},
        
        distance = 2.5
    })
    AddBoxZone("BurgerShotTray2", vector3(-1194.93, -892.85, 13.98), 0.4, 0.6, {
        name= "BurgerShotTray2",
        heading=305,
        debugPoly=Config.DebugZones,
        minZ=13.88,
        maxZ=15.78
    }, {
        options = {{
            event = "nocore-burgershot:client:open:tray",
            Numbers = 2,
            icon = "fas fa-hamburger",
            label = "Табла"
        }},
        
        distance = 2.5
    })
    AddBoxZone("BurgerShotTray3", vector3(-1195.97, -891.35, 13.98), 0.6, 0.5, {
        name= "BurgerShotTray3",
        heading=35,
        debugPoly=Config.DebugZones,
        minZ=13.88,
        maxZ=15.78
    }, {
        options = {{
            event = "nocore-burgershot:client:open:tray",
            Numbers = 3,
            icon = "fas fa-hamburger",
            label = "Табла"
        }},
        
        distance = 2.5
    })
    AddBoxZone("BurgerShotCash1", vector3(-1194.28, -893.9, 13.98), 0.6, 1.0, {
        name= "BurgerShotCash1",
        debugPoly = Config.DebugZones,
        heading=35,
        minZ=13.78,
        maxZ=14.78,
    }, {
        options = {{
            event = "nocore-burgershot:client:open:cashregister",
            icon = "fas fa-cash-register",
            label = "Касов апарат"
        },
        {
            event = "nocore-burgershot:client:open:cashregister",
            icon = "fas fa-cash-register",
            label = "Нова поръчка",
            job = 'burger',
            duty = true
        }},
        
        distance = 1.5
    })

    AddBoxZone("BurgerShotCash2", vector3(-1195.26, -892.33, 13.98), 0.6, 1.0, {
        name= "BurgerShotCash2",
        debugPoly = Config.DebugZones,
        heading=35,
        minZ=13.78,
        maxZ=14.78,
    }, {
        options = {{
            event = "nocore-burgershot:client:open:cashregister",
            icon = "fas fa-cash-register",
            label = "Касов апарат"
        },
        {
            event = "nocore-burgershot:client:open:cashregister",
            icon = "fas fa-cash-register",
            label = "Нова поръчка",
            job = 'burger',
            duty = true
        }},
        
        distance = 1.5
    })

    AddBoxZone("BurgerShotCash3", vector3(-1196.33, -890.75, 13.98), 0.8, 1.0, {
        name= "BurgerShotCash3",
        debugPoly = Config.DebugZones,
        heading=35,
        minZ=13.78,
        maxZ=14.78,
    }, {
        options = {{
            event = "nocore-burgershot:client:open:cashregister",
            icon = "fas fa-cash-register",
            label = "Касов апарат"
        },
        {
            event = "nocore-burgershot:client:open:cashregister",
            icon = "fas fa-cash-register",
            label = "Нова поръчка",
            job = 'burger',
            duty = true
        }},
        
        distance = 1.5
    })
    AddBoxZone("BurgerShotFridge", vector3(-1196.6, -901.98, 13.98), 1.55, 0.8, {
        name= "BurgerShotFridge",
        heading=304,
        debugPoly = Config.DebugZones,
        minZ=12.98,
        maxZ=15.58
    }, {
        options = {{
            event = "nocore-burgershot:client:open:cold:storage",
            icon = "fas fa-icicles",
            label = "Фризер",
            job = 'burger',
            duty = true
        }},
        duty = true,
        distance = 2.4
    })
    AddBoxZone("BurgerShotHotStorage", vector3(-1197.77, -893.92, 13.98), 3.0, 1.2, {
        name= "BurgerShotHotStorage", 
        heading=34,
        debugPoly = Config.DebugZones,
        minZ=12.98,
        maxZ=15.38
    }, {
        options = {{
            event = "nocore-burgershot:client:open:hot:storage",
            icon = "fab fa-free-code-camp",
            label = "Витрина",
            job = 'burger',
            duty = true
        }},
        duty = true,
        distance = 3.4
    })

    AddBoxZone("BurgerShotFries", vector3(-1201.91, -898.69, 13.98), 0.8, 1.6, {
        name= "BurgerShotFries",
        heading=305,
        debugPoly = Config.DebugZones,
        minZ=13.58,
        maxZ=14.98
    }, {
        options = {{
            event = "nocore-burgershot:client:bake:fries",
            icon = "fas fa-circle",
            label = "Изпържи картофи",
            job = 'burger',
            duty = true
        }},
        duty = true,
        distance = 2.4
    })

    AddBoxZone("BurgerShotBurger", vector3(-1198.43, -898.54, 13.98), 1.6, 0.8, {
        name= "BurgerShotBurger",
        heading=304,
        debugPoly = Config.DebugZones,
        minZ=13.58,
        maxZ=15.58
    }, {
        options = {{
            event = "nocore-burgershot:client:open:burgers",
            icon = "fas fa-hamburger",
            label = "Приговтви бургер",
            job = 'burger',
            duty = true
        }},
        duty = true,
        distance = 2.4
    })

    AddBoxZone("BurgerShotDrink", vector3(-1199.89, -895.45, 13.98), 1.0, 2.4, {
        name= "BurgerShotDrink",
        heading=305,
        debugPoly = Config.DebugZones,
        minZ=12.98,
        maxZ=14.98
    }, {
        options = {{
            event = "nocore-burgershot:client:open:drinks",
            DrinkType = 'burger-softdrink',
            icon = "fas fa-tint",
            label = "Сипи напитка",
            job = 'burger',
            duty = true
        }},
        duty = true,
        distance = 2.4
    })

    AddBoxZone("BurgerShotMeet", vector3(-1202.66, -897.73, 13.98), 1.0, 1.0, {
        name= "BurgerShotMeet",
        heading=35,
        debugPoly = Config.DebugZones,
        minZ=12.98,
        maxZ=14.98
    }, {
        options = {{
            event = "nocore-burgershot:client:bake:meat",
            icon = "fas fa-bacon",
            label = "Изпечи месо",
            job = 'burger',
            duty = true
        }},
        distance = 2.4
    })

    AddBoxZone("BurgerShotDuty", vector3(-1190.18, -902.55, 13.98), 1.6, 0.2, {
        name= "BurgerShotDuty",
        heading=35,
        debugPoly = Config.DebugZones,
        minZ=13.78,
        maxZ=15.18
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'burger'
        }},
        distance = 2.4
    })
    
    AddBoxZone("BurgerShotBoss", vector3(-1178.06, -896.18, 13.98), 0.85, 0.6, {
        name= "BurgerShotBoss", 
        heading=35,
        debugPoly = Config.DebugZones,
        minZ=13.58,
        maxZ=15.18
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'burger',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.4
    })
    AddBoxZone("AmbulanceDuty", vector3(353.45, -1411.76, 32.5), 1, 1, {
        name= "AmbulanceDuty",
        heading= 342,
        debugPoly = Config.DebugZones,
        minZ = 32.1,
        maxZ = 37.5
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'ambulance'
        }},
        distance = 2
    })

    AddBoxZone("AmbulanceBoss", vector3(361.45, -1381.65, 36.53), 1, 1, {
        name= "AmbulanceBoss",
        heading= 0,
        debugPoly = Config.DebugPoly,
        minZ = 32.1,
        maxZ = 37.5
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'ambulance',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        },
        {
            event = "nocore-hospital:Client:OpenBossCarMenu",
            icon = "fas fa-user-alt",
            label = "МПС-та",
            job = 'ambulance'
        }},
        distance = 2
    })
    AddBoxZone("BalzeitBoss", vector3(362.39, -1258.69, 33.39), 0.85, 0.6, {
        name= "BlazeitBoss", 
        heading=35,
        debugPoly = Config.DebugZones,
        minZ=32.00,
        maxZ=35.18
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-user-alt",
            label = "Шефско меню",
            job = 'blazeit',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        },
        {
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-user-alt",
            label = "Влез/Излез от смяна",
            job = 'blazeit'
        }},
        distance = 2
    })
    AddBoxZone("JudgeBossMenu", vector3(241.1387, -1097.679, 35.95893), 0.8, 1.3, {
        name= "JudgeBossMenu",
        heading= 95.246795654297,
        debugPoly = Config.DebugPoly,
        minZ = 35.9,
        maxZ = 36.1
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'judge',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2
    })
    AddBoxZone("JudgeBossMenu2", vector3(-1372.38, -464.83, 72.04), 1.0, 1.0, {
        name= "JudgeBossMenu2",
        heading= 10.0,
        debugPoly = Config.DebugPoly,
        minZ=71.84,
        maxZ=73.04
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'judge',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2
    })

    AddBoxZone("PoliceDuty", vector3(381.26, -1595.74, 30.05), 0.8, 1.8, {
        name = "PoliceDuty",
        heading = 50,
        debugPoly = Config.DebugPoly,
        minZ = 29.70,
        maxZ = 30.25
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'police'
        },
        {
            event = "nocore-policeform:Client:OpenPoliceForm",
            icon = "fas fa-mail-bulk",
            label = "Подай заявление"
        }},
        distance = 1.5
    })

    AddBoxZone("PoliceDutyPaleto", vector3(-447.33, 6012.99, 32.29), 0.6, 0.6, {
        name = "PoliceDutyPaleto",
        heading = 50,
        debugPoly = Config.DebugPoly,
        minZ = 32.3,
        maxZ = 32.6
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'police'
        }},
        distance = 1.5
    })

    AddBoxZone("PoliceDutySandy", vector3(1852.52, 3687.016, 34.14905), 0.6, 0.4, {
        name = "PoliceDutySandy",
        heading = 30,
        debugPoly = Config.DebugZones,
        maxZ = 34.3,
        minZ = 34.1
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'police'
        }},
        distance = 1.5
    })

    AddBoxZone("TaxiBossMenu", vector3(-1607.364, -844.202, 9.997), 0.4, 0.6, {
        name = "TaxiBossMenu",
        heading = 140,
        debugPoly = Config.DebugZones,
        minZ = 9.9,
        maxZ = 10.1
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'taxi',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 1.5
    })

    AddBoxZone("TaxiDuty", vector3(-1611.136, -838.2053, 10.31775), 0.6, 1.2, {
        name = "TaxiDuty",
        heading = 228,
        debugPoly = Config.DebugZones,
        minZ = 10.2,
        maxZ = 10.5
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'taxi'
        }},
        distance = 1.5
    })

    AddBoxZone("TaxiStash", vector3(-1613.207, -838.5317, 9.6754), 0.1, 1.6, {
        name = "TaxiStash",
        heading = 140,
        debugPoly = Config.DebugZones,
        minZ = 9.0,
        maxZ = 10.2
    }, {
        options = {{
            event = "nocore-taxi:client:open:stash",
            icon = "fas fa-archive",
            label = "Шкаф",
            job = 'taxi'
        }},
        distance = 1.5
    })

    AddBoxZone("TaxiStash2", vector3(899.6417, -169.3696, 76.28609), 0.8, 4.6, {
        name = "TaxiStash2",
        heading = 60,
        debugPoly = false,
        minZ = 74.0,
        maxZ = 75.2
    }, {
        options = {{
            event = "nocore-taxi:client:open:stashretro",
            icon = "fas fa-archive",
            label = "Шкаф",
            job = 'retro'
        }},
        distance = 3.5
    })

    AddBoxZone("TaxiVehicles", vector3(-1613.567, -833.4425, 10.15842), 0.4, 0.6, {
        name = "TaxiVehicles",
        heading = 312,
        debugPoly = Config.DebugZones,
        minZ = 10.0,
        maxZ = 10.2
    }, {
        options = {{
            event = "nocore-taxi:client:open:vehicle:menu",
            icon = "fas fa-laptop",
            label = "Лаптоп",
            job = 'taxi',
            duty = true
        }},
        distance = 1.5
    })

    AddBoxZone("TaxiVehicles2", vector3(896.8034, -146.1299, 77.2469), 0.3, 0.4, {
        name = "TaxiVehicles2",
        heading = 328.00637817383,
        debugPoly = Config.DebugZones,
        minZ = 76.9,
        maxZ = 77.5
    }, {
        options = {{
            event = "nocore-taxi:client:open:vehicle:menu2",
            icon = "fas fa-laptop",
            label = "Ключове",
            job = 'retro',
            duty = true
        }},
        distance = 1.5
    })

    AddBoxZone("PoliceImpound", vector3(370.36, -1612.23, 30.05), 1, 0.8, {
        name = "PoliceImpound",
        heading = 49,
        debugPoly = Config.DebugZones,
        maxZ = 31.8,
        minZ = 29.8
    }, {
        options = {{
            event = "nocore-police:client:open:impound",
            icon = "fas fa-key",
            label = "Ключове",
            job = 'police',
            duty = true
        }},
        distance = 1.5
    })


    AddBoxZone("MechanicBossMenu", vector3(-684.54, -784.1, 31.99), 1.0, 1.0, {
        name = "MechanicBossMenu",
        heading = 180,
        debugPoly = Config.DebugZones,
        minZ = 32.0,
        maxZ = 33.6
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-user-alt",
            label = "Шефско меню",
            job = 'mechanic',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 1.5
    })

    AddBoxZone("MechanicStash", vector3(-705.26, -809.22, 32.66), 10.8, 2.8, {
        name = "MechanicStash",
        heading = 180,
        debugPoly = Config.DebugZones,
        maxZ = 37.4,
        minZ = 30.3
    }, {
        options = {{
            event = "nocore-mechanic:client:open:stash",
            icon = "fas fa-archive",
            label = "Шкаф",
            job = 'mechanic',
            duty = true
        }},
        distance = 2.5
    })

    AddBoxZone("AmbulanceHelipad", vector3(339.89, -1430.39, 46.51), 1.6, 0.4, {
        name= "AmbulanceHelipad",
        heading=320,
        debugPoly = Config.DebugZones,
        minZ=46.71,
        maxZ=47.91
    }, {
        options = {{
            event = "nocore-hospital:client:spawn:heli",
            icon = "ambulance_board",
            label = "Фърчикоптер"
        }},
        job = {"ambulance"},
        distance = 2
    })

    --AddBoxZone("RealEstateDuty", vector3(-72.75829, -814.7515, 243.131), 0.4, 0.4, {
    --    name= "RealEstateDuty",
    --    heading= 131.776,
    --    debugPoly = Config.DebugZones,
    --    minZ = 243.0,
    --    maxZ = 243.3
    --}, {
    --    options = {{
    --        event = "nocore-police:client:ToggleDuty",
    --        icon = "fas fa-dot-circle",
    --        label = "Влез/Излез от смяна",
    --        job = 'realestate'
    --    }},
    --    distance = 2.4
    --})
    --
    AddBoxZone("RealEstateBoss", vector3(-841.8791, -1254.66, -27.57538), 0.6, 0.6, {
        name= "RealEstateBoss", 
        heading= 90.0,
        debugPoly = Config.DebugZones,
        minZ = -27.7,
        maxZ = -27.5
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'realestate',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.5
    })

    AddBoxZone("FraudAutoBoss", vector3(-841.8305, -1255.852, -27.5516), 0.6, 0.6, {
        name= "FraudAutoBoss", 
        heading= 90.0,
        debugPoly = Config.DebugZones,
        minZ = -27.7,
        maxZ = -27.5
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'fraudauto',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.5
    })

    AddBoxZone("TehnicheskiBoss", vector3(-347.84, -130.64, 5.28), 1.0, 1.0, {
        name= "TehnicheskiBoss", 
        debugPoly = false,
        heading= 90.0,
        minZ = 4.8,
        maxZ = 5.8
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'tehnicheski',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.5
    })
    
    AddBoxZone("RedCircleBoss", vector3(-318.6139, 190.5682, 103.9606), 0.6, 0.6, {
        name= "RedCircleBoss", 
        debugPoly = false,
        heading= 90.0,
        minZ = 103.0,
        maxZ = 104.5
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'redcircle',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.5
    })

    AddBoxZone("RedCircleDuty", vector3(-307.67, 212.74, 99.88), 0.9, 2.4, {
        name = "RedCircleDuty",
        heading = 50,
        minZ = 99.88 - 1.5,
        maxZ = 99.88 + 1.5
    }, {
        options = {{
            event = "nocore-redcircle:job:opt",
            icon = "fas fa-user-alt",
            label = "Влез/Излез от смяна",
            job = "redcircle"
        }},
        distance = 3.4
    })

    AddBoxZone("RedCircleStash", vector3(-298.0, 189.39, 100.86), 0.6, 1.8, {
        name = "RedCircleStash",
        heading = 10,
        minZ = 100.86 - 1,
        maxZ = 100.86 + 1.2
    }, {
        options = {{
            event = "nocore-redcircle:client:open:stash",
            icon = "fas fa-cocktail",
            label = "Отвори склад",
            job = 'redcircle',
        }},
        distance = 1.5
    })

    AddBoxZone("Mechanic2Boss", vector3(541.8845, -200.6729, 54.30386), 0.6, 0.6, {
        name= "Mechanic2Boss", 
        heading= 17.5,
        debugPoly = Config.DebugZones,
        minZ = 54.0,
        maxZ = 55.0
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'fixit',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.4
    })
    AddBoxZone("FixitDuty", vector3(551.98, -182.58, 54.49), 1.1, 0.5, {
        name = "FixitDuty",
        heading=0,
        debugPoly = Config.DebugZones,
        minZ=54.44,
        maxZ=55.49
    }, {
        options = {{
            event = "nocore-police:client:ToggleDuty",
            icon = "fas fa-dot-circle",
            label = "Влез/Излез от смяна",
            job = 'fixit'
        }},
        distance = 1.5
    })

    AddBoxZone("FixitVehicles", vector3(547.99, -181.68, 54.49), 1.0, 0.8, {
        name = "FixitVehicles",
        heading = 0,
        debugPoly = Config.DebugZones,
        minZ=54.29,
        maxZ=55.29
    }, {
        options = {{
            event = "nocore-mechanicjob:client:open:vehicle:menu",
            icon = "fas fa-key",
            label = "Ключове",
            job = 'fixit',
            serviz = 'fixit',
            duty = true
        }},
        distance = 1.5
    })

    -- AddBoxZone("RetroTaxi", vector3(-621.5696, -1638.624, -7.942755), 0.6, 0.6, {
    --     name = "RetroTaxi",
    --     heading = 90.0,
    --     debugPoly = Config.DebugZones,
    --     minZ = -8.5,
    --     maxZ = -7.2
    -- }, {
    --     options = {{
    --         event = "nocore-bossmenu:client:openBossMenu",
    --         icon = "fas fa-user-alt",
    --         label = "Шефско мнею",
    --         job = "retro"
    --     }},
    --     distance = 2.4
    -- })

    AddBoxZone("BennysBoss", vector3(-204.0196, -1336.86, 34.894046), 0.6, 1.7, {
        name= "BennysBoss", 
        heading= 17.5,
        debugPoly = Config.DebugZones,
        minZ = 34.0,
        maxZ = 35.4
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'bennys',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.4
    })
    AddBoxZone("MisfitsBoss", vector3(835.05, -827.46, 26.33), 1.0, 1.0, {
        name= "MisfitsBoss", 
        heading=0,
        debugPoly = Config.DebugZones,
        minZ=25.93,
        maxZ=27.93
    }, {
        options = {{
            event = "nocore-bossmenu:client:OpenMenu",
            icon = "fas fa-clipboard-list",
            label = "Шефско меню",
            job = 'misfits',
            canInteract = function ()
                return Framework.Functions.GetPlayerData().job.isboss
            end
        }},
        distance = 2.4
    })

    -- AddBoxZone("RetroTaxi2", vector3(908.0399, -153.9003, 74.0708), 0.4, 1.0, {
    --     name = "RetroTaxi2",
    --     heading = 53.423728942871,
    --     debugPoly = Config.DebugZones,
    --     minZ = 73.9,
    --     maxZ = 74.1
    -- }, {
    --     options = {{
    --         event = "nocore-bossmenu:client:openBossMenu",
    --         icon = "fas fa-user-alt",
    --         label = "Шефско мнею",
    --         job = "retro"
    --     }},
    --     distance = 3.4
    -- })

    -- AddBoxZone("RetroTaxiDuty", vector3(897.2339, -165.0286, 73.96936), 0.5, 0.3, {
    --     name = "RetroTaxiDuty",
    --     heading = 117.54108428955,
    --     debugPoly = Config.DebugZones,
    --     minZ = 73.8,
    --     maxZ = 74.1
    -- }, {
    --     options = {{
    --         event = "nocore-police:client:ToggleDuty",
    --         icon = "fas fa-user-alt",
    --         label = "Влез/Излез от смяна",
    --         job = "retro"
    --     }},
    --     distance = 3.4
    -- })

    AddBoxZone("Microwave", vector3(12.70, -1596.973, 29.50), 0.4, 0.4, {
    	name="Microwave",
    	heading = 60,
        minZ = 29.40,
    	maxZ = 29.60,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-tacos:client:make:taco",
    		label = "Направи тако",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })

    AddBoxZone("Cooker", vector3(11.01, -1598.96, 29.50), 0.8, 1.5, {
    	name="Cooker",
    	heading = 60,
        minZ = 29.40,
    	maxZ = 29.60,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-tacos:client:make:meat",
    		label = "Сготви месо",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })

    AddBoxZone("Fridge", vector3(17.2, -1599.1, 29.5806), 1.0, 1.0, {
    	name="Fridge",
    	heading = 50,
        minZ = 28.5,
    	maxZ = 30.5,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-tacos:client:take:lettuce",
    		label = "Вземи маруля",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })

    AddBoxZone("TacoStash", vector3(20.36654, -1601.656, 29.42747), 1.5, 1.5, {
    	name="TacoStash",
    	heading = 50,
        minZ = 28.50,
    	maxZ = 30.20,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-tacos:client:add:stuff",
    		label = "Прибери стоката",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })
    AddBoxZone("InsideBar", vector3(6.623739, -1605.022, 29.53705), 0.5, 0.5, {
    	name="InsideBar",
    	heading = 90,
        minZ = 29.40,
    	maxZ = 29.60,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-tacos:client:put:taco",
    		label = "Изкарай тако за продан",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })

    AddBoxZone("Register",vector3(10.0173, -1605.361, 29.60968), 0.4, 0.4, {
    	name="Register",
    	heading = 60,
        minZ = 29.40,
    	maxZ = 29.60,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-tacos:client:take:moneyasemployee",
    		label = "Прибери оборот",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })

    AddBoxZone("OutsideBar", vector3(5.775352, -1605.083, 29.53691), 0.4, 0.4, {
    	name="OutsideBar",
    	heading = 90,
        minZ = 29.40,
    	maxZ = 29.60,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-taco:start:outside:bar",
    		label = "Доставка",
    		icon = "fas fa-archive",
            job = "tacos",
            duty = true
    	}},
    	distance = 1.5
    })

    AddBoxZone("Sandybar", vector3(650.64, 2726.833, 42.26), 0.4, 0.4, {
    	name="Sandybar",
    	heading = 90,
        minZ = 42.0,
    	maxZ = 42.4,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-taco:start:sandy:bar",
    		label = "Вземи доставка",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("MouseStash", vector3(-1477.285, -47.96887, 61.58228), 0.8, 0.8, {
    	name="MouseStash",
    	heading = 90,
        minZ = 61.0,
    	maxZ = 62.0,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-mousehouse:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("Dokstash", vector3(-1987.813, -511.373, 20.55231), 0.8, 0.8, {
    	name="Dokstash",
    	heading = 90,
        minZ = 20.0,
    	maxZ = 21.0,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-dokhouse:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("Ballas", vector3(-2.61, -1821.84, 29.55), 2, 2, {
    	name="Ballas",
    	heading = 90,
        minZ = 29.0,
    	maxZ = 30.5,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-ballas:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("Vagos", vector3(325.48, -1999.12, 24.21), 2, 2, {
    	name="Vagos",
    	heading = 90,
        minZ = 24.0,
    	maxZ = 25.5,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-vagos:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("Families", vector3(-162.43, -1613.18, 33.65), 2, 2, {
    	name="Families",
    	heading = 90,
        minZ = 33.0,
    	maxZ = 34.5,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-families:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("Marabunta", vector3(1254.32, -1571.34, 58.75), 2, 2, {
    	name="Marabunta",
    	heading = 90,
        minZ = 58.0,
    	maxZ = 59.5,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-marabunta:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    AddBoxZone("Aztecas", vector3(495.59, -1527.67, 29.29), 2, 2, {
    	name="Aztecas",
    	heading = 90,
        minZ = 29.0,
    	maxZ = 30.5,
    	debugPoly = Config.DebugZones,
    }, {
    	options = {{
    		event = "nocore-aztecas:client:open:stash",
    		label = "Отвори шкаф",
    		icon = "fas fa-archive",
    	}},
    	distance = 1.5
    })

    --[[
    AddTargetModel(weed, {
        options = {
            {
                event = "nocore-weed:checkPlant",
                icon = "fas fa-cannabis",
                label = "Провери",
            },
        },
        distance = 3
    })

    AddTargetModel(weed2, {
        options = {
            {
                event = "nocore-weed:checkPlant",
                icon = "fas fa-cannabis",
                label = "Провери",
            },
            {
                event = "nocore-weed:pickPlant",
                icon = "fas fa-cannabis",
                label = "Събери",
            },
        },
        distance = 3
    })
    ]]
end)