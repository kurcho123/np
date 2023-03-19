local Framework = exports['no-core']:GetCoreObject()
local CheckingPress = false

CreateThread(function()
    for k, v in pairs(Config.Teleports) do
        exports['nocore-polyzone']:AddBoxZone(k, v.coords, v.l, v.h, {
            name=k,
            heading=v.heading,
            minZ=v.minZ,
            maxZ=v.maxZ,
            debugPoly=false
        })
    end
end)

AddEventHandler('nocore-polyzone:enter', function(name)
    for k, v in pairs(Config.Teleports) do
        if LocalPlayer.state["isLoggedIn"] then
            if name == k then
                CheckForEPress(v.teleportCoords, v.teleportHeading)
                if v.enter then
                    exports['okokTextUI']:Open('<b>[E] Влез</b>', 'purple', 'right')
                else
                    exports['okokTextUI']:Open('<b>[E] Излез</b>', 'purple', 'right')
                end
            end
        end
    end
end)

AddEventHandler('nocore-polyzone:exit', function(name)
    for k, v in pairs(Config.Teleports) do
        if LocalPlayer.state["isLoggedIn"] then
            if name == k then
                exports['okokTextUI']:Close()
                CheckingPress = false
            end
        end
    end
end)

function CheckForEPress(coords, heading)
    CheckingPress = true
    Citizen.CreateThread(function()
        while CheckingPress do
            Citizen.Wait(1)
            if IsControlJustReleased(0, 38) then
                exports['okokTextUI']:Close()
                Teleport(coords, heading)
                CheckingPress = false
                return
            end
        end
    end)
end

function Teleport(coords, heading)
    DoScreenFadeOut(100)
    local PlayerVehicle = GetVehiclePedIsIn(PlayerPedId(), 0)
    if IsPedInAnyVehicle(PlayerPedId(), false) and (GetPedInVehicleSeat(PlayerVehicle, -1) == PlayerPedId()) then 
        Citizen.Wait(750)
        --Framework.Functions.Teleport(PlayerPedId(), coords)
        TeleportF(PlayerVehicle, coords, heading)
        Citizen.Wait(1000)
        DoScreenFadeIn(100)
    else
        Citizen.Wait(750)
        --Framework.Functions.Teleport(PlayerVehicle, coords)
        TeleportF(PlayerPedId(), coords, heading)
        DoScreenFadeIn(100)
    end
    
end

function TeleportF(entity, coords, heading)
    if DoesEntityExist(entity) then
		RequestCollisionAtCoord(coords)
		local timeout = 0

		-- we can get stuck here if any of the axies are "invalid"
		while not HasCollisionLoadedAroundEntity(entity) and timeout < 2000 do
			Citizen.Wait(0)
			timeout = timeout + 1
		end

		SetEntityCoords(entity, coords, false, false, false, false)

		if heading then
			SetEntityHeading(entity, heading)
		end
	end
end