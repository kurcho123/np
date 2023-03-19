isDead, plyPed = false, PlayerPedId()

CreateThread(function()
    while true do 
        Wait(5000)
        plyPed = PlayerPedId()
    end
end)

PlayerData = {}

local function GetPedVehicleSeat(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)
    for i=-2,GetVehicleMaxNumberOfPassengers(vehicle) do
        if(GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -2
end

RegisterNetEvent('baseevents:revived')
AddEventHandler('baseevents:revived', function()
	isDead = false
end)

local function GetPlayerByEntityID(id)
    for _, player in ipairs(GetActivePlayers()) do 
        if NetworkIsPlayerActive(player) and GetPlayerPed(player) == id  then 
            return player 
        end 
    end
    return nil
end

RegisterNetEvent('echorp:playerSpawned') -- Use this to grab player info on spawn.
AddEventHandler('echorp:playerSpawned', function(sentData) 
    PlayerData = sentData 
end)

RegisterNetEvent('echorp:updateinfo')
AddEventHandler('echorp:updateinfo', function(toChange, targetData) 
	PlayerData[toChange] = targetData
end)

RegisterNetEvent('echorp:doLogout') -- Use this to logout.
AddEventHandler('echorp:doLogout', function(sentData) 
    PlayerData = {}
end)

CreateThread(function()
    local hasBeenDead = false
    while true do 
        Wait(0)
        if PlayerData['cid'] and DoesEntityExist(plyPed) then
            if IsPedFatallyInjured(plyPed) and not isDead then
                isDead = true
                local killer, killerweapon = NetworkGetEntityKillerOfPlayer(PlayerId())
                local killerentitytype = GetEntityType(killer)
                local killertype, killerinvehicle, killervehiclename, killervehicleseat = -1, false, '', 0

                if killerentitytype == 1 then
                    killertype = GetPedType(killer)
                    if IsPedInAnyVehicle(killer, false) == 1 then
                        killerinvehicle = true
                        killervehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(killer))) or "None"
                        killervehicleseat = GetPedVehicleSeat(killer)
                    else killerinvehicle = false
                    end
                end
                
                local killerid = GetPlayerByEntityID(killer)
                if killer ~= plyPed and killerid ~= nil and NetworkIsPlayerActive(killerid) then killerid = GetPlayerServerId(killerid)
                else killerid = -1
                end
                
                if killer == plyPed or killer == -1 then
                    TriggerEvent('baseevents:onPlayerDied', killertype, { table.unpack(GetEntityCoords(plyPed)) }, true)
                    TriggerServerEvent('baseevents:onPlayerDied', killertype, { table.unpack(GetEntityCoords(plyPed)) }, true)
                    hasBeenDead = true
                else
                    TriggerEvent('baseevents:onPlayerDied', killertype, { table.unpack(GetEntityCoords(plyPed)) })
                    TriggerServerEvent('baseevents:onPlayerDied', killertype, { table.unpack(GetEntityCoords(plyPed)) })
                    TriggerEvent('baseevents:onPlayerKilled', killerid, {killertype=killertype, weaponhash = killerweapon, killerinveh=killerinvehicle, killervehseat=killervehicleseat, killervehname=killervehiclename, killerpos={table.unpack(GetEntityCoords(ped))}})
                    TriggerServerEvent('baseevents:onPlayerKilled', killerid, {killertype=killertype, weaponhash = killerweapon, killerinveh=killerinvehicle, killervehseat=killervehicleseat, killervehname=killervehiclename, killerpos={table.unpack(GetEntityCoords(ped))}})
                    hasBeenDead = true
                end
            end
        end
    end
end)