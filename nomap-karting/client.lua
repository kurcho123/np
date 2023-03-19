
Citizen.CreateThread(function()
    while true do
        Wait(0)
        ClearAreaOfVehicles(-85.162, -2067.108, 21.797, 1000, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(-85.162 - 90.0, -2067.108 - 90.0, 21 - 90.0, -85.162 + 90.0, 2067.108 + 90.0, 21 + 90.0)
    end
end)