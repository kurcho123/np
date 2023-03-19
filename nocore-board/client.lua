local Framework = exports['no-core']:GetCoreObject()
local PlayerPerms = {}
local TotalPlayers = 0

-- Code

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.TriggerCallback('nocore-scoreboard:server:GetConfig', function(perms)
        PlayerPerms = perms
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Framework.Functions.TriggerCallback('nocore-scoreboard:server:GetConfig', function(perms)
            PlayerPerms = perms
        end)
    end
end)

local scoreboardOpen = false

GetClosestPlayer = function()
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

GetPlayers = function()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end

GetPlayersFromCoords = function(coords, distance)
    local players = GetPlayers()
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

RegisterKeyMapping("+scoreboard", "Scoreboard", "keyboard", "HOME")
RegisterCommand('+scoreboard', function ()
    if scoreboardOpen then return end
    SendNUIMessage({
        action = "open",
        players = TotalPlayers,
        maxPlayers = 128,
    })
    scoreboardOpen = true
    ScoreboardRefresh()
end, false)
RegisterCommand('-scoreboard', function ()
    if not scoreboardOpen then return end
    SendNUIMessage({
        action = "close",
    })
    scoreboardOpen = false
    ScoreboardRefresh()
end, false)
TriggerEvent("chat:removeSuggestion", "/+scoreboard")
TriggerEvent("chat:removeSuggestion", "/-scoreboard")
function ScoreboardRefresh()
    while scoreboardOpen do
        for _, player in pairs(GetPlayersFromCoords(GetEntityCoords(PlayerPedId()), 10.0)) do
            local PlayerId = GetPlayerServerId(player)
            local PlayerPed = GetPlayerPed(player)
            local PlayerName = GetPlayerName(player)
            local PlayerCoords = GetEntityCoords(PlayerPed)
            if PlayerPerms[PlayerId] ~= nil and not PlayerPerms[PlayerId] then
                Framework.Functions.DrawText3D(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '['..PlayerId..']')
            end
        end

        Citizen.Wait(3)
    end
end

RegisterNetEvent('nocore-scoreboard:client:UpdateScoreBoard')
AddEventHandler('nocore-scoreboard:client:UpdateScoreBoard', function(players, admins)
    TotalPlayers = players
    PlayerPerms = admins
end)