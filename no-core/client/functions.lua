Framework.Functions = {}
Framework.Functions.Locales = {}
Framework.Functions.GetPlayerData = function(cb)
	if not cb then return Framework.PlayerData end
	cb(Framework.PlayerData)
    -- if cb ~= nil then
        -- cb(Framework.PlayerData)
    -- else
        -- return Framework.PlayerData
    -- end
end

Framework.Functions.GetCoords = function(entity)
    local coords = GetEntityCoords(entity, false)
    local heading = GetEntityHeading(entity)
    return {
        x = coords.x,
        y = coords.y,
        z = coords.z,
        a = heading
    }
end

function Framework.Functions.HasItem(items, amount)
    local isTable = type(items) == 'table'
	local isArray = isTable and table.type(items) == 'array' or false
	local totalItems = #items
    local count = 0
    local kvIndex = 2
	if isTable and not isArray then
        totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    for _, itemData in pairs(Framework.PlayerData.items) do
        if isTable then
            for k, v in pairs(items) do
                local itemKV = {k, v}
                if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                    count += 1
                end
            end
            if count == totalItems then
                return true
            end
        else -- Single item as string
            if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
                return true
            end
        end
    end
    return false
end

Framework.Functions.SpawnVehicle = function(model, cb, coords, isnetworked, IsAdmin)
	local ped = PlayerPedId()
    local model = (type(model) == "number" and model or GetHashKey(model))
	local coords = coords ~= nil and coords or Framework.Functions.GetCoords(PlayerPedId())
    local isnetworked = isnetworked ~= nil and isnetworked or true
    local IsAdmin = IsAdmin ~= nil and IsAdmin or false

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end

    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.a, isnetworked, false)
    local netid = NetworkGetNetworkIdFromEntity(veh)

	TriggerEvent('persistent-vehicles/register-vehicle', veh)

	SetVehicleHasBeenOwnedByPlayer(vehicle,  true)
	SetNetworkIdCanMigrate(netid, true)
    SetVehicleNeedsToBeHotwired(veh, false)
    SetVehRadioStation(veh, "OFF")
    SetModelAsNoLongerNeeded(model)

    if IsAdmin then
        if IsModelValid(model) then
            Citizen.Wait(250)
            DoScreenFadeIn(250)   
        end
    end

    if cb ~= nil then
        cb(veh)
    end

end

Framework.Functions.DeleteVehicle = function(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
	TriggerEvent('persistent-vehicles/forget-vehicle', vehicle)
    DeleteVehicle(vehicle)
end

Framework.Functions.Notify = function(Message, Type, Time, Title)
    local Title = Title ~= nil and Title or "Нотификация"
    local Message = Message ~= nil and Message or "Message"
    local Time = Time ~= nil and Time or 2000
    local Type = Type ~= nil and Type or "info"
	SendNUIMessage({
		action = 'open',
		title = Title,
		type = Type,
		message = Message,
		time = Time,
	})
end

-- success (green)
-- info (blue)
-- warning (yellow)
-- error (red)
-- phone (orange)
-- neutral (grey)

Framework.Functions.OldNotify = function(text, textype, length)
    local ttype = textype ~= nil and textype or "primary"
    local length = length ~= nil and length or 5000
    SendNUIMessage({
        action = "show",
        type = ttype,
        length = length,
        text = text,
    })
end

Framework.Functions.PhoneNotify = function(text, textype, length)
    local ttype = textype ~= nil and textype or "primary"
    local length = length ~= nil and length or 5000
	TriggerEvent('nocore-phone:newnotify', text, textype)
end

Framework.Functions.TriggerCallback = function(name, cb, ...)
	Framework.ServerCallbacks[name] = cb
    TriggerServerEvent("Framework:Server:TriggerCallback", name, ...)
end

Framework.Functions.GetPlayers = function()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end

-- this is for translation

Framework.Functions.Locale = function(str, ...)
    --local text = Framework.Functions.Locales[Config.Locale][str]
    local text = Config.Locale[str]
    return string.format(text, ...)
end

Framework.Functions.GetStreetLabel = function()
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local FirstStreetLabel = GetStreetNameFromHashKey(s1)
    local SecondStreetLabel = GetStreetNameFromHashKey(s2)
    if SecondStreetLabel ~= nil and SecondStreetLabel ~= "" then 
        FirstStreetLabel = FirstStreetLabel .. " " .. SecondStreetLabel
    end
    return FirstStreetLabel
end

Framework.Functions.EnumerateEntities = function(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
    end)
end

Framework.Functions.GetVehicles = function()
    local vehicles = {}
	for vehicle in Framework.Functions.EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) do
		table.insert(vehicles, vehicle)
	end
	return vehicles
end

Framework.Functions.GetClosestVehicle = function(coords)	
	local vehicles        = Framework.Functions.GetVehicles()
	local closestDistance = -1
	local closestVehicle  = -1
	local coords          = coords
	if coords == nil then
		local PlayerPed = PlayerPedId()
		coords = GetEntityCoords(PlayerPed)
	end
	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)
		if closestDistance == -1 or closestDistance > distance then
			closestVehicle  = vehicles[i]
			closestDistance = distance
		end
	end
	return closestVehicle, closestDistance
end

Framework.Functions.GetClosestPlayer = function(coords)
	if coords == nil then
        coords = GetEntityCoords(PlayerPedId())
	end
	local closestPlayers = Framework.Functions.GetPlayersFromCoords(coords)
    local closestDistance = -1
    local closestPlayer = -1
    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end
	return closestPlayer, closestDistance
end

Framework.Functions.MathRound = function(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10^numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

Framework.Functions.GetVehiclesInArea = function(coords, area)
	local Vehicles       = Framework.Functions.GetVehicles()
	local VehiclesInArea = {}
	for i=1, #Vehicles, 1 do
		local vehicleCoords = GetEntityCoords(Vehicles[i])
		local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)
		if distance <= area then
			table.insert(VehiclesInArea, Vehicles[i])
		end
	end
	return VehiclesInArea
end

Framework.Functions.Teleport = function(entity, coords)
	if DoesEntityExist(entity) then
		RequestCollisionAtCoord(coords.x, coords.y, coords.z)
		local timeout = 0

		-- we can get stuck here if any of the axies are "invalid"
		while not HasCollisionLoadedAroundEntity(entity) and timeout < 2000 do
			Citizen.Wait(0)
			timeout = timeout + 1
		end

		SetEntityCoords(entity, coords.x, coords.y, coords.z, false, false, false, false)

		if type(coords) == 'table' and coords.h then
			SetEntityHeading(entity, coords.h)
		end
	end
end

Framework.Functions.IsSpawnPointClear = function(coords, radius)
	local Vehicles = Framework.Functions.GetVehiclesInArea(coords, radius)
	if #Vehicles == 0 then
		return true
	end
end

Framework.Functions.MathGroupDigits = function(value)
    local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

    return left..(num:reverse():gsub('(%d%d%d)','%1' .. _U('locale_digit_grouping_symbol')):reverse())..right
end

Framework.Functions.MathTrim = function(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end
Framework.Functions.GetPlayersFromCoords = function(coords, distance)
    local players = Framework.Functions.GetPlayers()
    local closePlayers = {}
    if coords == nil then
		coords = GetEntityCoords(PlayerPedId())
    end
    if distance == nil then
        distance = 5.0
    end
    for _, player in pairs(players) do
		local target = GetPlayerPed(player)
		local targetCoords = GetEntityCoords(target)
		local targetdistance = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)
		if targetdistance <= distance then
			table.insert(closePlayers, player)
		end
    end
    return closePlayers
end

Framework.Functions.GetPeds = function(ignoreList)
    local ignoreList = ignoreList or {}
	local peds       = {}
	for ped in Framework.Functions.EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) do
		local found = false
        for j=1, #ignoreList, 1 do
			if ignoreList[j] == ped then
				found = true
			end
		end
		if not found then
			table.insert(peds, ped)
		end
	end
	return peds
end

Framework.Functions.GetClosestPed = function(coords, ignoreList)
	local ignoreList      = ignoreList or {}
	local peds            = Framework.Functions.GetPeds(ignoreList)
	local closestDistance = -1
    local closestPed      = -1
    if coords == nil then
        coords = GetEntityCoords(PlayerPedId())
    end
	for i=1, #peds, 1 do
		local pedCoords = GetEntityCoords(peds[i])
		local distance  = GetDistanceBetweenCoords(pedCoords, coords.x, coords.y, coords.z, true)
		if closestDistance == -1 or closestDistance > distance then
			closestPed      = peds[i]
			closestDistance = distance
		end
	end
	return closestPed, closestDistance
end

Framework.Functions.ShowFloatingHelpNotification = function(msg, x,y,z)
	AddTextEntry('FloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, x,y,z)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('FloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end


Framework.Functions.Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel, icon)
	exports['nocore-progressbar']:Progress({
		name = name:lower(),
		duration = duration,
		label = label,
		icon = icon,
		useWhileDead = useWhileDead,
		canCancel = canCancel,
		controlDisables = disableControls,
		animation = animation,
		prop = prop,
		propTwo = propTwo,
	}, function(cancelled)
		if not cancelled then
			if onFinish then
				onFinish()
			end
		else
			if onCancel then
				onCancel()
			end
		end
	end)
end


Framework.Functions.IsWearingHandshoes = function(ped)
	local Ped = ped
	if Ped == nil then
		Ped = PlayerPedId()
	end
    local armIndex = GetPedDrawableVariation(Ped, 3)
    local model = GetEntityModel(Ped)
    local retval = true
    
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

Framework.Functions.GetVehicleProperties = function(vehicle)
	local color1, color2 = GetVehicleColours(vehicle)
 
	local color1Custom = {}
	color1Custom[1], color1Custom[2], color1Custom[3] = GetVehicleCustomPrimaryColour(vehicle)
 
	local color2Custom = {}
	color2Custom[1], color2Custom[2], color2Custom[3] = GetVehicleCustomSecondaryColour(vehicle)
 
	local color1Type = GetVehicleModColor_1(vehicle)
	local color2Type = GetVehicleModColor_2(vehicle)
 
	local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
 
	local extras = {}
	for id = 0, 25 do
		if (DoesExtraExist(vehicle, id)) then
			extras[tostring(id)] = IsVehicleExtraTurnedOn(vehicle, id)
		end
	end
 
	local neonColor = {}
	neonColor[1], neonColor[2], neonColor[3] = GetVehicleNeonLightsColour(vehicle)
 
	local tyreSmokeColor = {}
	tyreSmokeColor[1], tyreSmokeColor[2], tyreSmokeColor[3] = GetVehicleTyreSmokeColor(vehicle)
 
	local tempData = {
		model             = GetEntityModel(vehicle),
 
		plate             = Framework.Functions.MathTrim(GetVehicleNumberPlateText(vehicle)),
		plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),
 
		bodyHealth        = Framework.Functions.MathRound(GetVehicleBodyHealth(vehicle), 1),
		engineHealth      = Framework.Functions.MathRound(GetVehicleEngineHealth(vehicle), 1),
 
		fuelLevel         = Framework.Functions.MathRound(GetVehicleFuelLevel(vehicle), 1),
		dirtLevel         = Framework.Functions.MathRound(GetVehicleDirtLevel(vehicle), 1),
 
		color1            = color1,
		color1Custom      = color1Custom,
 
		color2            = color2,
		color2Custom      = color2Custom,
 
		pearlescentColor  = pearlescentColor,
 
		color1Type 		  = GetVehicleModColor_1(vehicle),
		color2Type 		  = GetVehicleModColor_2(vehicle),
 
		wheelColor        = wheelColor,
		wheels            = GetVehicleWheelType(vehicle),
		windowTint        = GetVehicleWindowTint(vehicle),
 
		extras            = extras,
 
		neonEnabled       = {
			IsVehicleNeonLightEnabled(vehicle, 0),
			IsVehicleNeonLightEnabled(vehicle, 1),
			IsVehicleNeonLightEnabled(vehicle, 2),
			IsVehicleNeonLightEnabled(vehicle, 3)
		},
 
		neonColor         = neonColor,
		tyreSmokeColor    = tyreSmokeColor,
 
		modSpoilers       = GetVehicleMod(vehicle, 0),
		modFrontBumper    = GetVehicleMod(vehicle, 1),
		modRearBumper     = GetVehicleMod(vehicle, 2),
		modSideSkirt      = GetVehicleMod(vehicle, 3),
		modExhaust        = GetVehicleMod(vehicle, 4),
		modFrame          = GetVehicleMod(vehicle, 5),
		modGrille         = GetVehicleMod(vehicle, 6),
		modHood           = GetVehicleMod(vehicle, 7),
		modFender         = GetVehicleMod(vehicle, 8),
		modRightFender    = GetVehicleMod(vehicle, 9),
		modRoof           = GetVehicleMod(vehicle, 10),
 
		modEngine         = GetVehicleMod(vehicle, 11),
		modBrakes         = GetVehicleMod(vehicle, 12),
		modTransmission   = GetVehicleMod(vehicle, 13),
		modHorns          = GetVehicleMod(vehicle, 14),
		modSuspension     = GetVehicleMod(vehicle, 15),
		modArmor          = GetVehicleMod(vehicle, 16),
 
		modTurbo          = IsToggleModOn(vehicle, 18),
		modSmokeEnabled   = IsToggleModOn(vehicle, 20),
		modXenon          = GetVehicleXenonLightsColour(vehicle),
 
		modFrontWheels    = GetVehicleMod(vehicle, 23),
		modBackWheels     = GetVehicleMod(vehicle, 24),
 
		modPlateHolder    = GetVehicleMod(vehicle, 25),
		modVanityPlate    = GetVehicleMod(vehicle, 26),
		modTrimA          = GetVehicleMod(vehicle, 27),
		modOrnaments      = GetVehicleMod(vehicle, 28),
		modDashboard      = GetVehicleMod(vehicle, 29),
		modDial           = GetVehicleMod(vehicle, 30),
		modDoorSpeaker    = GetVehicleMod(vehicle, 31),
		modSeats          = GetVehicleMod(vehicle, 32),
		modSteeringWheel  = GetVehicleMod(vehicle, 33),
		modShifterLeavers = GetVehicleMod(vehicle, 34),
		modAPlate         = GetVehicleMod(vehicle, 35),
		modSpeakers       = GetVehicleMod(vehicle, 36),
		modTrunk          = GetVehicleMod(vehicle, 37),
		modHydrolic       = GetVehicleMod(vehicle, 38),
		modEngineBlock    = GetVehicleMod(vehicle, 39),
		modAirFilter      = GetVehicleMod(vehicle, 40),
		modStruts         = GetVehicleMod(vehicle, 41),
		modArchCover      = GetVehicleMod(vehicle, 42),
		modAerials        = GetVehicleMod(vehicle, 43),
		modTrimB          = GetVehicleMod(vehicle, 44),
		modTank           = GetVehicleMod(vehicle, 45),
		modWindows        = GetVehicleMod(vehicle, 46),
		modLivery         = GetVehicleMod(vehicle, 48),
		livery            = GetVehicleLivery(vehicle),
		interiorcolor     = GetVehicleInteriorColor(vehicle),
		dashboardcolor    = GetVehicleDashboardColor(vehicle)
	}
 
	tempData.modTurbo = tempData.modTurbo or 0
 
	return tempData
end

Framework.Functions.DrawText = function(x, y, width, height, scale, r, g, b, a, text)
	SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Framework.Functions.DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Framework.Functions.Draw2DText = function(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function Framework.Functions.RequestAnimDict(animDict)
	if HasAnimDictLoaded(animDict) then return end
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(0)
	end
end

function Framework.Functions.PlayAnim(animDict, animName, upperbodyOnly, duration)
    local flags = upperbodyOnly == true and 16 or 0
    local runTime = duration ~= nil and duration or -1
    Framework.Functions.RequestAnimDict(animDict)
    TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, 1.0, runTime, flags, 0.0, false, false, true)
    RemoveAnimDict(animDict)
end

function Framework.Functions.LoadModel(model)
    if HasModelLoaded(model) then return end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

Framework.Functions.SetVehicleProperties = function(vehicle, props)
	if (props == nil) then return end
 
	SetVehicleModKit(vehicle, 0)
 
	if (props == nil or vehicle == nil or not DoesEntityExist(vehicle)) then return end
 
	SetVehicleModKit(vehicle, 0)
	SetVehicleAutoRepairDisabled(vehicle, false)
 
	if (props.plate) then
		SetVehicleNumberPlateText(vehicle, props.plate)
	end
 
	if (props.plateIndex) then
		SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
	end
 
	if (props.bodyHealth) then
		SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
	end
 
	if (props.engineHealth) then
		SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
	end
 
	if (props.fuelLevel) then
		SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
	end
 
	if (props.dirtLevel) then
		SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
	end
 
	if (props.color1) then
		ClearVehicleCustomPrimaryColour(vehicle)
 
		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, props.color1, color2)
	end
 
	if (props.color1Custom) then
		SetVehicleCustomPrimaryColour(vehicle, props.color1Custom[1], props.color1Custom[2], props.color1Custom[3])
	end
 
	if (props.color2) then
		ClearVehicleCustomSecondaryColour(vehicle)
 
		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, color1, props.color2)
	end
 
	if (props.color2Custom) then
		SetVehicleCustomSecondaryColour(vehicle, props.color2Custom[1], props.color2Custom[2], props.color2Custom[3])
	end
 
	if (props.color1Type) then
		SetVehicleModColor_1(vehicle, props.color1Type)
	end
 
	if (props.color2Type) then
		SetVehicleModColor_2(vehicle, props.color2Type)
	end
 
	if (props.pearlescentColor) then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
	end
 
	if (props.wheelColor) then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
	end
 
	if (props.wheels) then
		SetVehicleWheelType(vehicle, props.wheels)
	end
 
	if (props.windowTint) then
		SetVehicleWindowTint(vehicle, props.windowTint)
	end
 
	if (props.extras) then
		for id = 0, 25 do
			if (DoesExtraExist(vehicle, id)) then
				SetVehicleExtra(vehicle, id, props.extras[tostring(id)] and 0 or 1)
			end
		end
	end
 
	if (props.neonEnabled) then
		SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1] == true or props.neonEnabled[1] == 1)
		SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2] == true or props.neonEnabled[2] == 1)
		SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3] == true or props.neonEnabled[3] == 1)
		SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4] == true or props.neonEnabled[4] == 1)
	end
 
	if (props.neonColor) then
		SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
	end
 
	if (props.modSmokeEnabled) then
		ToggleVehicleMod(vehicle, 20, true)
	end
 
	if (props.tyreSmokeColor) then
		SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
	end
 
	if (props.modSpoilers) then
		SetVehicleMod(vehicle, 0, props.modSpoilers, false)
	end
 
	if (props.modFrontBumper) then
		SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
	end
 
	if (props.modRearBumper) then
		SetVehicleMod(vehicle, 2, props.modRearBumper, false)
	end
 
	if (props.modSideSkirt) then
		SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
	end
 
	if (props.modExhaust) then
		SetVehicleMod(vehicle, 4, props.modExhaust, false)
	end
 
	if (props.modFrame) then
		SetVehicleMod(vehicle, 5, props.modFrame, false)
	end
 
	if (props.modGrille) then
		SetVehicleMod(vehicle, 6, props.modGrille, false)
	end
 
	if (props.modHood) then
		SetVehicleMod(vehicle, 7, props.modHood, false)
	end
 
	if (props.modFender) then
		SetVehicleMod(vehicle, 8, props.modFender, false)
	end
 
	if (props.modRightFender) then
		SetVehicleMod(vehicle, 9, props.modRightFender, false)
	end
 
	if (props.modRoof) then
		SetVehicleMod(vehicle, 10, props.modRoof, false)
	end
 
	if (props.modEngine) then
		SetVehicleMod(vehicle, 11, props.modEngine, false)
	end
 
	if (props.modBrakes) then
		SetVehicleMod(vehicle, 12, props.modBrakes, false)
	end
 
	if (props.modTransmission) then
		SetVehicleMod(vehicle, 13, props.modTransmission, false)
	end
 
	if (props.modHorns) then
		SetVehicleMod(vehicle, 14, props.modHorns, false)
	end
 
	if (props.modSuspension) then
		SetVehicleMod(vehicle, 15, props.modSuspension, false)
	end
 
	if (props.modArmor) then
		SetVehicleMod(vehicle, 16, props.modArmor, false)
	end
 
	if (props.modTurbo) then
		ToggleVehicleMod(vehicle,  18, props.modTurbo)
	end
 
	if (props.modXenon) then
        ToggleVehicleMod(vehicle, 22, true)
        SetVehicleXenonLightsColour(vehicle, props.modXenon)
	end
 
	if (props.modFrontWheels) then
		SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
	end
 
	if (props.modBackWheels) then
		SetVehicleMod(vehicle, 24, props.modBackWheels, false)
	end
 
	if (props.modPlateHolder) then
		SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
	end
 
	if (props.modVanityPlate) then
		SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
	end
 
	if (props.modTrimA) then
		SetVehicleMod(vehicle, 27, props.modTrimA, false)
	end
 
	if (props.modOrnaments) then
		SetVehicleMod(vehicle, 28, props.modOrnaments, false)
	end
 
	if (props.modDashboard) then
		SetVehicleMod(vehicle, 29, props.modDashboard, false)
	end
 
	if (props.modDial) then
		SetVehicleMod(vehicle, 30, props.modDial, false)
	end
 
	if (props.modDoorSpeaker) then
		SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
	end
 
	if (props.modSeats) then
		SetVehicleMod(vehicle, 32, props.modSeats, false)
	end
 
	if (props.modSteeringWheel) then
		SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
	end
 
	if (props.modShifterLeavers) then
		SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
	end
 
	if (props.modAPlate) then
		SetVehicleMod(vehicle, 35, props.modAPlate, false)
	end
 
	if (props.modSpeakers) then
		SetVehicleMod(vehicle, 36, props.modSpeakers, false)
	end
 
	if (props.modTrunk) then
		SetVehicleMod(vehicle, 37, props.modTrunk, false)
	end
 
	if (props.modHydrolic) then
		SetVehicleMod(vehicle, 38, props.modHydrolic, false)
	end
 
	if (props.modEngineBlock) then
		SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
	end
 
	if (props.modAirFilter) then
		SetVehicleMod(vehicle, 40, props.modAirFilter, false)
	end
 
	if (props.modStruts) then
		SetVehicleMod(vehicle, 41, props.modStruts, false)
	end
 
	if (props.modArchCover) then
		SetVehicleMod(vehicle, 42, props.modArchCover, false)
	end
 
	if (props.modAerials) then
		SetVehicleMod(vehicle, 43, props.modAerials, false)
	end
 
	if (props.modTrimB) then
		SetVehicleMod(vehicle, 44, props.modTrimB, false)
	end
 
	if (props.modTank) then
		SetVehicleMod(vehicle, 45, props.modTank, false)
	end
 
	if (props.modWindows) then
		SetVehicleMod(vehicle, 46, props.modWindows, false)
	end
 
	if (props.modLivery) then
		SetVehicleMod(vehicle, 48, props.modLivery, false)
	end
 
	if (props.livery) then
		SetVehicleLivery(vehicle, props.livery)
	end	

	if (props.interiorcolor) then
		SetVehicleInteriorColor(vehicle, props.interiorcolor)
	end	

	if (props.dashboardcolor) then
		SetVehicleDashboardColour(vehicle, props.dashboardcolor)
	end	
end


Framework.Functions.ShowFloatingHelpNotify = function(x, y, z, msg)
	AddTextEntry('FloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, vector3(x,y,z))
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('FloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

Framework.Functions.GetVehicle = function(veh)
	local myvehicle = GetEntityModel(veh)
	for _, vehicle in pairs(Shared.Vehicles) do
		if vehicle.hash == myvehicle then
			return vehicle
		end
	end
	return nil
end

Framework.Functions.SpawnObject = function(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
		Framework.RequestModel(model)

		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

		if cb ~= nil then
			cb(obj)
		end
	end)
end

function Framework.RequestModel(modelHash, cb)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end

	if cb ~= nil then
		cb()
	end
end


-- dobaveno ot buddyboyvilla

Framework.Functions.DeleteObject = function(object)
    SetEntityAsMissionEntity(object, false, true)
    DeleteObject(object)
end


Framework.Functions.SpawnLocalObject = function(model, coords, cb)
    local model = (type(model) == 'number' and model or GetHashKey(model))

    Citizen.CreateThread(function()
        RequestModel(model)
        local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
        SetModelAsNoLongerNeeded(model)

        if cb then
            cb(obj)
        end
    end)
end

Framework.Functions.SpawnObject = function(model, coords, cb)
    local model = (type(model) == 'number' and model or GetHashKey(model))

    Citizen.CreateThread(function()
        RequestModel(model)
        local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)
        SetModelAsNoLongerNeeded(model)

        if cb then
            cb(obj)
        end
    end)
end
