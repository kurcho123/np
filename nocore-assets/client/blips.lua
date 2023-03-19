Citizen.CreateThread(function()
    for i = 1, #Config.Blips do
        Blips = AddBlipForCoord(Config.Blips[i].coords)
        SetBlipSprite(Blips, Config.Blips[i].spriteid)
        SetBlipDisplay(Blips, 4)
        SetBlipScale(Blips, Config.Blips[i].scale)
        SetBlipAsShortRange(Blips, true)
        SetBlipColour(Blips, Config.Blips[i].color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Blips[i].name)
        EndTextCommandSetBlipName(Blips)
    end
end)