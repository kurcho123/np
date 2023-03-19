Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        collectgarbage("collect")
    end 
end)
--low impact
Citizen.CreateThread(function()
    while true do
        globalPlayerPedId = PlayerPedId()
        globalPlayerPed = PlayerPedId()
        globalPlayerId = PlayerId()
        Citizen.Wait(3000)
    end
end)
--medium impact
Citizen.CreateThread(function()
    while true do
        globalIsPedArmed = IsPedArmed(globalPlayerPedId, 7)
        globalPlayerCoords = GetEntityCoords(globalPlayerPed)
        globalIsPedInAnyVehicle = IsPedInAnyVehicle(globalPlayerPedId, false)
        Citizen.Wait(250)
    end
end)
--high impact
Citizen.CreateThread(function()
    while true do
        globalIsPedShooting = IsPedShooting(globalPlayerPedId)
        Citizen.Wait(10)
    end
end)