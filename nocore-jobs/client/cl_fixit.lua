local Framework = exports['no-core']:GetCoreObject()
CreateThread(function()
    local fixitduty = PolyZone:Create({
		vector2(525.76, -133.71),
		vector2(559.09, -137.88),
		vector2(560.61, -195.08),
		vector2(541.29, -243.18),
		vector2(520.83, -164.39)
		}, {
		name="fixit",
		--minZ=0,
		--maxZ=800
		})       
	fixitduty:onPlayerInOut(function(isPointInside) 
		if LocalPlayer.state.isLoggedIn and not isPointInside and Framework.Functions.GetPlayerData().job.onduty and Framework.Functions.GetPlayerData().job.name == "fixit" then 
			Framework.Functions.Notify("Отдалечи се твърде много от работното си място!", "error")
			TriggerEvent("nocore-police:client:ToggleDuty") 
		end
	end)
end)