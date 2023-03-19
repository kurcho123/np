
RegisterNUICallback('getVehicles', function(data, cb)
    local GarageVehicles = Phone.API.TriggerServerEvent('garage:get:vehicles')
    cb(GarageVehicles)
end)

RegisterNUICallback('setGarageLocation', function(data, cb)
    if data.garage ~= 'Police' then
        exports["nocore-garages"]:SetGarageLocation(data.garage)
        TriggerEvent('phone:notify', { app = 'garage', title = Locales.garageTitle, content = "Зададена локация до "..data.garage, sameApp = true })
    else
        SetNewWaypoint(441.02798, -988.7217)
        TriggerEvent('phone:notify', { app = 'garage', title = Locales.garageTitle, content = "Колата ви се намира в наказателен паркинг", sameApp = true })
    end
end)