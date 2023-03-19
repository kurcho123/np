Framework = {}
Framework.PlayerData = {}
Framework.Config = Config
Framework.Shared = Shared
Framework.ServerCallbacks = {}

isLoggedIn = false

exports('GetCoreObject', function()
    return Framework
end)

function GetCoreObject()
	return Framework
end

RegisterNetEvent('Framework:GetObject')
AddEventHandler('Framework:GetObject', function(cb)
	cb(GetCoreObject())
end)


-- Player load and unload handling
-- New method for checking if logged in across all scripts (optional)
-- if LocalPlayer.state['isLoggedIn'] then
RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
	ShutdownLoadingScreenNui()
	isLoggedIn = true
	LocalPlayer.state:set('isLoggedIn', true, false)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    isLoggedIn = false
    LocalPlayer.state:set('isLoggedIn', false, false)
end)
