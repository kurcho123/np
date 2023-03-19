


RegisterCommand("health", function()
    local ped = PlayerPedId()
    print(GetEntityHealth(ped))
    print(GetPedArmour(ped))
end)

