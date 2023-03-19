
currentRegister = 0
currentSafe = 0
local isLoggedIn = false
local Framework = nil

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
  Citizen.SetTimeout(1250, function()
      TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
      Citizen.Wait(100)
      isLoggedIn = true
  end)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

Citizen.CreateThread(function()
    Citizen.SetTimeout(1250, function()
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
        Citizen.Wait(100)
        isLoggedIn = true
    end)
end)

Citizen.CreateThread(function()
    if(Config.UseBlips)then
        local StoreBlip = {}
        for v = 1, #Config.Shops do
            --SetBlipCoords(StoreBlip[v], Config.Shops[v].blip)

            StoreBlip[v] = AddBlipForCoord(Config.Shops[v].blip)

            SetBlipSprite(StoreBlip[v], 52)
            SetBlipScale(StoreBlip[v], 0.5)
            SetBlipColour(StoreBlip[v], 2)  

            SetBlipDisplay(StoreBlip[v], 4)
            SetBlipAsShortRange(StoreBlip[v], true)
        

            BeginTextCommandSetBlipName("STRING")
            --AddTextComponentSubstringPlayerName(Config.Shops[v].name)
            AddTextComponentSubstringPlayerName("Магазин")
            EndTextCommandSetBlipName(StoreBlip[v])
        end
    end
end)