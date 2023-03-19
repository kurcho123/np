ped = nil
local objects = {}
local robbing = false
canRob = true
canRobType = nil
lockpicking = false
registering = false
safeboxing = false
currentStore = 0
copsCalled = false
serverKeyGen = 0


RegisterNetEvent('storeRobberies:client:shopkeeperUpdate')
AddEventHandler('storeRobberies:client:shopkeeperUpdate', function(shopkeepers)
        for v = 1, #Config.Shops do
            Config.Shops[v].shopKeeper = shopkeepers[v]
        end
end)

RegisterNetEvent('storeRobberies:client:randomKeyGen')
AddEventHandler('storeRobberies:client:randomKeyGen', function(key)
    serverKeyGen = key
end)

RegisterNetEvent('storeRobberies:client:safeOpen')
AddEventHandler('storeRobberies:client:safeOpen', function(store, state)
    Config.Shops[store].safeOpened = state
end)

RegisterNetEvent('storeRobberies:client:shopkeeperStateUpdate')
AddEventHandler('storeRobberies:client:shopkeeperStateUpdate', function(state)
    for v = 1, #Config.Shops do
        Config.Shops[v].shopKeeperState = state[v]
    end
end)


Citizen.CreateThread(function()
    local distance = 1000
    Citizen.Wait(1000)
    while true do
        for v = 1, #Config.Shops do
            if #(globalPlayerCoords - Config.Shops[v].shopKeeperCoords) <= distance then
                distance = #(globalPlayerCoords - Config.Shops[v].shopKeeperCoords)
                currentStore = v
            end
        end
        Citizen.Wait(500)
        distance = 1000
    end
end)

RegisterNetEvent('storeRobberies:client:pedHandler')
AddEventHandler('storeRobberies:client:pedHandler', function()
    Citizen.CreateThread(function()
        while true do
                v = currentStore
                if(#(globalPlayerCoords - Config.Shops[v].shopKeeperCoords) <= 20.0)then
                    if(not DoesEntityExist(ped))then
                        ped = _CreatePed(Config.Shopkeepers[Config.Shops[v].shopKeeper].model, Config.Shops[v].shopKeeperCoords, Config.Shops[v].shopKeeperHeading)
                        local brokenCashRegister = GetClosestObjectOfType(GetEntityCoords(ped), 5.0, GetHashKey('prop_till_01_dam'))
                        if DoesEntityExist(brokenCashRegister) then
                            CreateModelSwap(GetEntityCoords(brokenCashRegister), 0.5, GetHashKey('prop_till_01_dam'), GetHashKey('prop_till_01'), false)
                        end
                    
                        if(not Config.Shops[v].shopKeeperState)then
                            SetEntityHealth(ped, 0)
                        end
                    end
                else
                    if(DoesEntityExist(ped))then
                        DeletePed(ped)
                    end
                    Citizen.Wait(1000)
                end
            Citizen.Wait(500)
        end
    end)
end)

Citizen.CreateThread(function()
    
    ped = nil

    while(globalPlayerId == nil)do
        print("Initializing globalPlayerId value")
        Wait(100)
    end

    while(Config.Shops[1].shopKeeper == nil)do
        TriggerServerEvent("storeRobberies:server:randomKeyGen", GetPlayerServerId(globalPlayerId))

        TriggerServerEvent("storeRobberies:server:shopkeeperUpdate", GetPlayerServerId(globalPlayerId))

        TriggerServerEvent("storeRobberies:server:shopkeeperStateUpdate", GetPlayerServerId(globalPlayerId))
        Citizen.Wait(1000)
    end

    TriggerEvent("storeRobberies:client:pedHandler", currentStore)
end)
