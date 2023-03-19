local Ran = false
Framework = nil


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(1250, function()
            TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
        end)
    end
end)
-- Wait until client is loaded into the map
RegisterCommand("ShutdownLoadingScreenNui", function()
	ShutdownLoadingScreenNui()
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
	if not Ran then
		-- Close loading screen resource
                Citizen.Wait(3000)
		ShutdownLoadingScreenNui()
		-- Set as ran
		Ran = true
	end
end)