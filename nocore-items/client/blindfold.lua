RegisterNetEvent('nocore-blindfold:client:omdoen')
AddEventHandler('nocore-blindfold:client:omdoen', function()

	LoadAnimationDictionary("mp_masks@on_foot")

	while not HasAnimDictLoaded('mp_masks@on_foot') do
		Citizen.Wait(100)
	end

	TaskPlayAnim(PlayerPedId(), "mp_masks@on_foot", "put_on_mask", 8.0, -8, -1, 48, 0, 0, 0, 0)
	bag = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true) -- Create head bag object!
    AttachEntityToEntity(bag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- Attach object to head
	Citizen.Wait(1000)
	ClearPedTasks(PlayerPedId())

		SendNUIMessage({
			action = "open"
		})
		SetNuiFocus(false,false)
end)


function GetClosestPlayer()
    local closestPlayers = Framework.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
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

RegisterNetEvent('nocore-blindfold:client:afdoen')
AddEventHandler('nocore-blindfold:client:afdoen', function()
	
	SendNUIMessage({
		action = "close"
		
	})

	SetNuiFocus(false,false)
	--LoadAnimationDictionary("misscommon@std_take_off_masks")

	DeleteEntity(bag)
	SetEntityAsNoLongerNeeded(bag)
	--TaskPlayAnim(PlayerPedId(), "misscommon@std_take_off_masks", "take_off_mask_ps", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(1000)
	ClearPedTasks(PlayerPedId())

end)
--remove it
RegisterNetEvent('nocore-blindfold:client:afdoenanderespeler')
AddEventHandler('nocore-blindfold:client:afdoenanderespeler', function()
	local player, distance = GetClosestPlayer()  

	if distance ~= -1 and distance <= 3.0 then
		TriggerServerEvent('nocore-blindfold:server:afdoen',GetPlayerServerId(player))
    else
	    Framework.Functions.Notify("Няма играч наблизо", "error")
	end

end)


RegisterNetEvent('nocore-blindfold:client:afdoeneigen')
AddEventHandler('nocore-blindfold:client:afdoeneigen', function()
		TriggerServerEvent('nocore-blindfold:server:afdoen',GetPlayerServerId(-1))
end)

--put it
RegisterNetEvent('nocore-blindfold:client:omdoenanderespeler')
AddEventHandler('nocore-blindfold:client:omdoenanderespeler', function()
	local player, distance = GetClosestPlayer()  

	if distance ~= -1 and distance <= 3.0 then
		TriggerServerEvent('nocore-blindfold:server:omdoen', GetPlayerServerId(player), source)
    else
	Framework.Functions.Notify("Няма играч наблизо", "error")

	end
end)

function LoadAnimationDictionary(animationD)
    while(not HasAnimDictLoaded(animationD)) do
        RequestAnimDict(animationD)
        Citizen.Wait(1)
    end
end