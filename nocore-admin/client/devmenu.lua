local vehicleDevMode = false
local showCoords = false

local function round(input, decimalPlaces)
    return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", input))
end

local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s)', x, y, z)
        })
        Framework.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s)', x, y, z, h)
        })
        Framework.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = h
        })
        Framework.Functions.Notify(Lang:t("success.heading_copied"), "success")
    end
end

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = round(coords.x, 2)
            c.y = round(coords.y, 2)
            c.z = round(coords.z, 2)
            heading = round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~'..Lang:t("info.ped_coords") .. '~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

local function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText(Lang:t("info.vehicle_dev_data"), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format(Lang:t("info.ent_id") .. '~b~%s~s~ | ' .. Lang:t("info.net_id") .. '~b~%s~s~', vehicle, netID), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format(Lang:t("info.model") .. '~b~%s~s~ | ' .. Lang:t("info.hash") .. '~b~%s~s~', modelName, hash), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format(Lang:t("info.eng_health") .. '~b~%s~s~ | ' .. Lang:t("info.body_health") .. '~b~%s~s~', round(eHealth, 2), round(bHealth, 2)), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

DevMenu:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_vector3"),
    value = 'coords',
    description = Lang:t("desc.vector3_desc"),
    select = function()
        CopyToClipboard('coords3')
    end
})

DevMenu:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_vector4"),
    value = 'coords',
    description = Lang:t("desc.vector4_desc"),
    select = function()
        CopyToClipboard('coords4')
    end
})

DevMenu:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_heading"),
    value = 'heading',
    description = Lang:t("desc.copy_heading_desc"),
    select = function()
        CopyToClipboard('heading')
    end
})

DevMenu:AddCheckbox({
    icon = '📍',
    label = Lang:t("menu.display_coords"),
    description = Lang:t("desc.display_coords_desc"),
    onchange = function()
        TriggerServerEvent('Framework:CallCommand', 'coords')
    end
})

local function hotWireVehicle()
    TriggerServerEvent('nocore-vehiclekeys:server:AcquireVehicleKeys', GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
end
local function unlockVehicle()
    local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
    SetVehicleDoorsLocked(Vehicle, 1)
end

DevMenu:AddButton({
    icon = '🚘',
    label = "Hotwire Vehicle",
    description = "Вземи ключовете за това МПС",
    select = function()
        hotWireVehicle()
    end
})
DevMenu:AddButton({
    icon = '🚘',
    label = "Unlock Vehicle",
    description = "Отключи най-близкото МПС",
    select = function()
        unlockVehicle()
    end
})

local Dev = false
local function ToggleDevMode()
    Dev = not Dev
    TriggerEvent('nocore-admin:client:ToggleDevmode')
    if Dev then
        SetPlayerInvincible(PlayerId(), true)
        while Dev do
            TriggerServerEvent("Framework:Server:SetMetaData", "hunger", Framework.Functions.GetPlayerData().metadata["hunger"] + 10)
            TriggerServerEvent("Framework:Server:SetMetaData", "thirst", Framework.Functions.GetPlayerData().metadata["thirst"] + 10)
            TriggerServerEvent('hud:server:RelieveStress', 20)
            Wait(30000)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end
-- DevMenu:AddCheckbox({
--     icon = '⚫',
--     label = Lang:t("menu.hud_dev_mode"),
--     description = Lang:t("desc.hud_dev_mode_desc"),
--     onchange = function()
--         ToggleDevMode()
--     end
-- })

local deleteLazer = false
DevMenu:AddCheckbox({
    icon = '🔫',
    label = Lang:t("menu.delete_laser"),
    description = Lang:t("desc.delete_laser_desc"),
    onchange = function()
        deleteLazer = not deleteLazer
    end
})

DevMenu:AddCheckbox({
    icon = '🎥',
    label = Lang:t("menu.noclip"),
    description = Lang:t("desc.noclip_desc"),
    onchange = function()
        TriggerServerEvent('Framework:CallCommand', 'noclip')
    end
})

-- Delete Lazer
local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local _, b, c, _, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

local function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR =
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local _, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local _, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

CreateThread(function()	-- While loop needed for delete lazer
    local sleep
	while true do
		sleep = 1000
		if deleteLazer then
		    sleep = 5
		    local color = {r = 255, g = 50, b = 50, a = 200} -- Changes the color of the lines (currently red)
		    local position = GetEntityCoords(PlayerPedId())
		    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
		    -- If entity is found then verifie entity
		    if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                Draw2DText(Lang:t("info.health") .. ': ~g~'..GetEntityHealth(entity)..' ~w~' .. Lang:t("info.speed") .. ': ~b~'..GetEntitySpeed(entity)..'~w~', 4, {255, 255, 255}, 0.4, 0.55, 0.888 - 0.050)
                Draw2DText(Lang:t("info.networked") .. ': ~b~'..tostring(NetworkGetEntityIsNetworked(entity))..' ~w~' .. Lang:t("info.networked_owner_id") ..': ~b~'..GetPlayerServerId(NetworkGetEntityOwner(entity))..'~w~', 4, {255, 255, 255}, 0.4, 0.55, 0.888 - 0.025)
                Draw2DText(Lang:t("info.obj") .. ': ~b~' .. entity .. '~w~ ' .. Lang:t("info.model") .. ': ~b~' .. GetEntityModel(entity), 4, {255, 255, 255}, 0.4, 0.55, 0.888)
                Draw2DText(Lang:t("info.delete_object_info"), 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)

                if IsControlJustReleased(0, 38) then -- When E pressed then remove targeted entity
                    SetEntityAsMissionEntity(entity, true, true) -- Set as missionEntity so the object can be remove (Even map objects)
                    NetworkRequestControlOfEntity(entity) -- Request Network control so we own the object
                    Wait(250) -- Safety Wait
                    DeleteEntity(entity) -- Delete the object
                    DeleteObject(entity) -- Delete the object (failsafe)
                    SetEntityAsNoLongerNeeded(entity) -- Tells the engine this prop isnt needed anymore
                end
		    -- Only draw of not center of map
		    elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
			    -- Draws line to targeted position
			    DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			    DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
		end
		Wait(sleep)
	end
end)

RegisterNetEvent('nocore-admin:client:ToggleCoords', function()
    TriggerServerEvent('nocore-admin:server:check')
    ToggleShowCoordinates()
end)
