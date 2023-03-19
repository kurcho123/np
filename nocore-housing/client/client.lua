local HouseData, OffSets = nil, nil
local plate = false
local HouseBlips = {}
Currenthouse = nil
IsNearHouse = false
local HouseCam = nil
local NearGarage = false
IsInHouse = false
HasKey = false
local StashLocation = nil
local ClothingLocation = nil
local LogoutLocation = nil
local Other = nil

Framework = exports['no-core']:GetCoreObject()


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.SetTimeout(5250, function()
            Framework.Functions.TriggerCallback("nocore-housing:server:get:config", function(config)
               Config = config
            end)
            Citizen.Wait(145)
            AddBlipForHouse()
        end)
    end
end)



RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        Framework.Functions.TriggerCallback("nocore-housing:server:get:config", function(config)
           Config = config
        end)
        Citizen.Wait(145)
        AddBlipForHouse()
    end)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    RemoveHouseBlip()
    IsInHouse = false
    Currenthouse = nil
    HasKey = false
end)


Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if LocalPlayer.state["isLoggedIn"] then
            if not IsInHouse then
                 IsNearHouse = false
                 for k, v in pairs(Config.Houses) do
                     local PlayerCoords = GetEntityCoords(PlayerPedId())
                     local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['Coords']['Enter']['X'], v['Coords']['Enter']['Y'], v['Coords']['Enter']['Z'], true)
                     if Distance < 15.0 then
                         IsNearHouse = true
                         Currenthouse = k
                         Citizen.Wait(10)
                     end
                 end
                 if not IsNearHouse and not IsInHouse then
                     Citizen.Wait(3500)
                     Currenthouse = nil
                 end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LocalPlayer.state["isLoggedIn"] then
            if Currenthouse ~= nil then

                local PlayerCoords = GetEntityCoords(PlayerPedId())
                
                if not IsInHouse then
                    if not Config.Houses[Currenthouse]['Owned'] then
                      if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'], true) < 2.0) then
                        DrawText3D(Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'], '~g~E~w~ - Вижте имота')
                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent('nocore-housing:server:view:house', Currenthouse)
                        end
                      end
                    end

                    if Config.Houses[Currenthouse]['Garage'] ~= nil then
                        if Config.Houses[Currenthouse]['Owned'] then
                            if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Garage']['X'], Config.Houses[Currenthouse]['Garage']['Y'], Config.Houses[Currenthouse]['Garage']['Z'], true) < 3.0) then
                                NearGarage = true
                                DrawMarker(2, Config.Houses[Currenthouse]['Garage']['X'], Config.Houses[Currenthouse]['Garage']['Y'], Config.Houses[Currenthouse]['Garage']['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                                DrawText3D(Config.Houses[Currenthouse]['Garage']['X'], Config.Houses[Currenthouse]['Garage']['Y'], Config.Houses[Currenthouse]['Garage']['Z'] + 0.12, '~g~E~w~ - Гараж')
                                if IsControlJustReleased(0, 38) then
                                    Framework.Functions.TriggerCallback('nocore-housing:server:has:house:key', function(HasHouseKey)
                                        if HasHouseKey or not Config.Houses[Currenthouse]['Door-Lock'] then
                                            local Vehicle = GetVehiclePedIsIn(PlayerPedId())
                                            if not IsPedInAnyVehicle(PlayerPedId()) then
                                                --exports['nocore-garages']:OpenHouseGarage(Currenthouse)
                                                TriggerEvent('nocore-garages:client:open:houseGarage', Currenthouse)
                                            else
                                                --Framework.Functions.TriggerCallback('nocore-materials:server:is:vehicle:owned', function(IsOwned)
                                                --    if IsOwned then
                                                --        exports['nocore-garages']:SetVehicleInHouseGarage(Currenthouse)
                                                --    else
                                                --        Framework.Functions.Notify("Това МПС не принадлежи на никого..", "error")
                                                --    end
                                                --end, GetVehicleNumberPlateText(Vehicle))
                                                Framework.Functions.TriggerCallback("nocore-garage:server:is:vehicle:owner", function(IsOwner)
                                                    --if IsOwner then
                                                       -- print(GetVehicleNumberPlateText(Vehicle))
                                                        
                                                        local Vehicle = GetVehiclePedIsIn(PlayerPedId()) 
                                                        --print(Currenthouse)
                                                    if Vehicle ~= nil then
                                                        Framework.Functions.TriggerCallback("nocore-houseing:server:checkveh", function(plate)
                                                            if plate == true then
                                                              --Framework.Functions.Notify(GetVehicleNumberPlateText(Vehicle), 'error')
                                                                exports['nocore-garages']:SetVehicleInHouseGarage(Currenthouse)
                                                            elseif plate == false then
                                                                Framework.Functions.Notify('Това не е вашето превозно средство', 'error')
                                                            end
                                                        end, exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(Vehicle)), Currenthouse)
                                                    end
                                                end, exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(Vehicle)))
                                            end
                                        -- else
                                        --     Framework.Functions.Notify("Нямате ключ за този гараж.", "error", 5000, "Garage")
                                        end
                                    end, Currenthouse)
                                end
                            else
                                NearGarage = false
                            end
                        end
                    end


                end


                  -- // Verlaten \\ --
        if IsInHouse then
           if OffSets ~= nil then


                if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, true) < 2.0) then
                  DrawMarker(2, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                  DrawText3D(Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z + 0.12, '~g~E~s~ - Излез')
                     if IsControlJustReleased(0, 38) then
                         LeaveHouse()
                     end
                end

                -- // Stash \\ --

                if CurrentBell ~= nil then
                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, true) < 2.0) then
                        DrawMarker(2, Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                        DrawText3D(Config.Houses[Currenthouse]['Coords']['Enter']['X'] - OffSets.exit.x, Config.Houses[Currenthouse]['Coords']['Enter']['Y'] - OffSets.exit.y, Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - OffSets.exit.z + 0.32, '~g~G~s~ - Влез')
                        if IsControlJustReleased(0, 47) then
                            TriggerServerEvent("nocore-housing:server:open:door", CurrentBell, Currenthouse)
                            CurrentBell = nil
                        end
                    end
                end
                    
                if StashLocation ~= nil then
                     if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, StashLocation['X'], StashLocation['Y'], StashLocation['Z'], true) < 1.65) then
                      DrawMarker(2, StashLocation['X'], StashLocation['Y'], StashLocation['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                      DrawText3D(StashLocation['X'], StashLocation['Y'], StashLocation['Z'], '~g~E~s~ - Шкаф')
                         if IsControlJustReleased(0, 38) then
                            TriggerEvent("nocore-inventory:client:SetCurrentStash", Currenthouse)
                            TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", Currenthouse, Other)
                            TriggerEvent("nocore-sound:client:play", "stash-open", 0.4)
                         end
                     end
                end

                if ClothingLocation ~= nil then
                    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, ClothingLocation['X'], ClothingLocation['Y'], ClothingLocation['Z'], true) < 1.65) then
                     DrawMarker(2, ClothingLocation['X'], ClothingLocation['Y'], ClothingLocation['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                     DrawText3D(ClothingLocation['X'], ClothingLocation['Y'], ClothingLocation['Z'], '~g~E~s~ - Гардероб')
                        if IsControlJustReleased(0, 38) then
                            --TriggerEvent('nocore-clothing:client:openOutfitMenu') // Old QB Menu
                            TriggerEvent('fivem-appearance:client:changeOutfitMenuInHousing')
                        end
                    end
                end

                --if LogoutLocation ~= nil then
                --    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, LogoutLocation['X'], LogoutLocation['Y'], LogoutLocation['Z'], true) < 1.65) then
                --     DrawMarker(2, LogoutLocation['X'], LogoutLocation['Y'], LogoutLocation['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                --     DrawText3D(LogoutLocation['X'], LogoutLocation['Y'], LogoutLocation['Z'], '~g~E~s~ - Спи (Logout)')
                --        if IsControlJustReleased(0, 38) then
                --            LogoutPlayer()
                --        end
                --    end
                --end



                end  
            end
        end


        end
    end
end)

-- // Events \\ --

RegisterNetEvent('nocore-housing:client:enter:house')
AddEventHandler('nocore-housing:client:enter:house', function()
    local Housing = {}
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    local CoordsTable = {x = Config.Houses[Currenthouse]['Coords']['Enter']['X'], y = Config.Houses[Currenthouse]['Coords']['Enter']['Y'], z = Config.Houses[Currenthouse]['Coords']['Enter']['Z'] - 35.0}
    IsInHouse = true
    TriggerEvent("nocore-sound:client:play", "house-door-open", 0.1)
    OpenDoorAnim()
    Citizen.Wait(350)
    SetHouseLocations()
    if Config.Houses[Currenthouse]['Tier'] == 1 then
        Other = {maxweight = 3000000, slots = 50}
        Housing = exports['nocore-interiors']:HouseTierOne(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 2 then
        Other = {maxweight = 4000000, slots = 60}
        Housing = exports['nocore-interiors']:HouseTierTwo(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 3 then
        Other = {maxweight = 4000000, slots = 60}
        Housing = exports['nocore-interiors']:HouseTierThree(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 4 then
        Other = {maxweight = 7000000, slots = 80}
        Housing = exports['nocore-interiors']:HouseTierFour(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 5 then
        Other = {maxweight = 7000000, slots = 85}
        Housing = exports['nocore-interiors']:HouseTierFive(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 6 then
        Other = {maxweight = 2500000, slots = 55}
        Housing = exports['nocore-interiors']:HouseTierSix(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 7 then
        Other = {maxweight = 7500000, slots = 80}
        Housing = exports['nocore-interiors']:HouseTierSeven(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 8 then
        Other = {maxweight = 7500000, slots = 85}
        Housing = exports['nocore-interiors']:HouseTierEight(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 9 then
        Other = {maxweight = 3500000, slots = 45}
        Housing = exports['nocore-interiors']:HouseTierNine(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 10 then
        Other = {maxweight = 8000000, slots = 90}
        Housing = exports['nocore-interiors']:HouseTierTen(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 11 then
        Other = {maxweight = 4000000, slots = 80}
        Housing = exports['nocore-interiors']:GarageTierOne(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 12 then
        Other = {maxweight = 6500000, slots = 90}
        Housing = exports['nocore-interiors']:GarageTierThree(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 13 then
        Other = {maxweight = 10000000, slots = 100}
        Housing = exports['nocore-interiors']:GarageTierTwo(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 14 then
        Other = {maxweight = 3000000, slots = 60}
        Housing = exports['nocore-interiors']:OfficeTwo(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 15 then
        Other = {maxweight = 4250000, slots = 70}
        Housing = exports['nocore-interiors']:OfficeOne(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 16 then
        Other = {maxweight = 5000000, slots = 80}
        Housing = exports['nocore-interiors']:OfficeBig(CoordsTable)
    elseif Config.Houses[Currenthouse]['Tier'] == 17 then
        Other = {maxweight = 500000000, slots = 800}
        Housing = exports['nocore-interiors']:GarageTierThree(CoordsTable)
    end
    LoadDecorations(Currenthouse)
    TriggerEvent('nocore-weathersync:client:DisableSync')
    HouseData, OffSets = Housing[1], Housing[2]
    --Citizen.SetTimeout(450, function()
    --    exports['nocore-houseplants']:LoadHousePlants(Currenthouse)
    --end)
end)

RegisterNetEvent('nocore-housing:client:add:to:config')
AddEventHandler('nocore-housing:client:add:to:config', function(Name, Owner, CoordsTable, Owned, Tier, Price, DoorLocked, KeyHolder, Label, Garage)
    Config.Houses[Name] = {
        ['Coords'] = CoordsTable,
        ['Owned'] = Owned,
        ['Owner'] = Owner,
        ['Tier'] = Tier,
        ['Price'] = Price,
        ['Door-Lock'] = DoorLocked,
        ['Adres'] = Label,
        ['Garage'] = Garage,
        ['Key-Holders'] = KeyHolder,
        ['Decorations'] = {}
    }
end)

RegisterNetEvent('nocore-housing:client:set:garage')
AddEventHandler('nocore-housing:client:set:garage', function(HouseId, Coords)
    Config.Houses[HouseId]['Garage'] = Coords
end)

RegisterNetEvent('nocore-housing:client:set:owned')
AddEventHandler('nocore-housing:client:set:owned', function(HouseId, Owned, CitizenId)
    Config.Houses[HouseId]['Owner'] = CitizenId
    Config.Houses[HouseId]['Owned'] = Owned
    Config.Houses[HouseId]['Key-Holders'] = {[1] = CitizenId}
    Citizen.SetTimeout(100, function()
        RefreshHouseBlips()
    end)
end)

local houses = {
    {name = "Къща 1", price = 150000, tier = 1},
    {name = "Къща 2 (Апартамент)", price = 185000, tier = 2},
    {name = "Къща 3", price = 275000, tier = 3},
    {name = "Къща 4", price = 450000, tier = 4},
    {name = "Къща 5", price = 475000, tier = 5},
    {name = "Къща 6 (Каравана)", price = 70000, tier = 6},
    {name = "Къща 7 (Апартамент)", price = 525000, tier = 7},
    {name = "Къща 8 (Апартамент)", price = 550000, tier = 8},
    {name = "Къща 9", price = 125000, tier = 9},
    {name = "Къща 10", price = 600000, tier = 10},
    {name = "Малък склад", price = 160000, tier = 11},
    {name = "Среден склад", price = 250000, tier = 12},
    {name = "Голям склад", price = 500000, tier = 13},
    {name = "Малък Офис", price = 150000, tier = 14},
    {name = "Среден офис", price = 225000, tier = 15},
    {name = "Голям офис", price = 300000, tier = 16},
    --{name = "Албански склад", price = 300000, tier = 17},
    -- {name = "", price = , tier = },
}

RegisterNetEvent('nocore-housing:openContext')
AddEventHandler('nocore-housing:openContext', function ()
    local sendMenu = {}
    sendMenu[#sendMenu+1] = {
        id = 1,
        header = "Създай имот",
        isMenuHeader = true,
    }
    for i = 1, #houses do
        sendMenu[#sendMenu+1] = {
            id = i,
            header = houses[i].name,
            txt = houses[i].price.. "$",
            params = {
                event = "nocore-housing:client:create:house",
                args = {
                    price = houses[i].price,
                    tier = houses[i].tier,
                }
            }
        }
      end
      sendMenu[#sendMenu+1] = {
          id = #sendMenu+1,
          header = "Затвори",
          txt = "",
          params = { 
              event = "fakeevnettt",
              args = {}
          }
      }
      exports['nocore-context']:openMenu(sendMenu)
end)

RegisterCommand('properties', function ()
    local Menu = {}
    Framework.Functions.TriggerCallback('nocore-phone:server:GetPlayerHouses', function(Houses)
        local keyHolders = 0
        -- Menu[#Menu+1] = {
        --     id = 1,
        --     header = "Имоти",
        --     isMenuHeader = true,
        -- }
        for k, v in pairs(Houses) do
            if v.keyholders then
                keyHolders = #v.keyholders
            end
            if keyHolders >= 1 then
                Menu[#Menu+1] = {
                    id = #Menu+1,
                    header = v.label,
                    txt = "Общо ключове: "..keyHolders,
                    params = {
                        event = "nocore-housing:openKeysContext",
                        args = {
                            id = k,
                            label = v.label,
                            keyholders = v.keyholders
                        }
                    }
                }
            else
                Menu[#Menu+1] = {
                    id = 1,
                    header = "Нямаш имоти",
                    isMenuHeader = true,
                }
            end
        end
        Menu[#Menu+1] = {
            id = #Menu+1,
            header = "Затвори",
            params = {
                event = 'qb-menu:client:closeMenu'
            }
        }
        exports['nocore-context']:openMenu(Menu)
    end)
end)

AddEventHandler('nocore-housing:openKeysContext', function (data)
    if not IsInHouse then
        Framework.Functions.Notify('Трябва да си в имот', 'error', 5000, 'Housing')
        return
    end

    if Config.Houses[Currenthouse]['Adres'] ~= data.label then
        Framework.Functions.Notify('Трябва да си в имота, в който искаш да премахнеш ключа', 'error', 5000, 'Housing')
        return
    end

    if Framework.Functions.GetPlayerData().citizenid ~= Config.Houses[Currenthouse]['Owner'] then
        Framework.Functions.Notify('Трябва да си собственик на имота', 'error', 5000, 'Housing')
        return
    end

    local Menu = {}
    Menu[#Menu+1] = {
        id = 1,
        header = "Ключове за имот "..data.label,
        isMenuHeader = true,
    }
    for k, v in pairs(data.keyholders) do
        Menu[#Menu+1] = {
            id = #Menu+1,
            header = v.charinfo.firstname.. " " ..v.charinfo.lastname,
            disabled = Framework.Functions.GetPlayerData().citizenid == v.citizenid,
            txt = "Цъкни, за да премахнеш ключа",
            params = {
                event = 'nocore-housing:removeKeyContext',
                args = {
                    house = Currenthouse,
                    citizenid = v.citizenid
                }
            }
        }
    end
    Menu[#Menu+1] = {
        id = #Menu+1,
        header = "Затвори",
        params = {
            event = 'qb-menu:client:closeMenu'
        }
    }
    exports['nocore-context']:openMenu(Menu)
end)

AddEventHandler('nocore-housing:removeKeyContext', function (data)
    if not IsInHouse then
        Framework.Functions.Notify('Трябва да си в имот', 'error', 5000, 'Housing')
        return
    end

    if Framework.Functions.GetPlayerData().citizenid ~= Config.Houses[Currenthouse]['Owner'] then
        Framework.Functions.Notify('Трябва да си собственик на имота', 'error', 5000, 'Housing')
        return
    end

    local removeData = {
        HouseId = data.house,
        CitizenId = data.citizenid
    }
    TriggerServerEvent('nocore-housing:server:remove:house:key', removeData)
end)

RegisterNetEvent('nocore-housing:client:create:house')
AddEventHandler('nocore-housing:client:create:house', function(data)
    if IsNearHouse then 
        Framework.Functions.Notify('Съществува имот наблизо', 'error', 5000, 'Housing')
    else
        local PlayerCoords = GetEntityCoords(PlayerPedId())
        local PlayerHeading = GetEntityHeading(PlayerPedId())
        local StreetNative = Citizen.InvokeNative(0x2EB41072B4C1E4C0, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
        local StreetName = GetStreetNameFromHashKey(StreetNative)
        local Price = data.price
        local Tier = data.tier
        local CoordsTable = {['Enter'] = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z, ['H'] = PlayerHeading}, ['Cam'] = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z, ['H'] = PlayerHeading, ['Yaw'] = -10.0}}
        TriggerServerEvent('nocore-housing:server:add:new:house', StreetName:gsub("%-", " "), CoordsTable, Price, Tier)
    end
end)

RegisterNetEvent('nocore-housing:client:delete:successful')
AddEventHandler('nocore-housing:client:delete:successful', function(HouseId)
    Currenthouse = nil
    Config.Houses[HouseId] = {}
end)

RegisterNetEvent('nocore-housing:client:delete:house')
AddEventHandler('nocore-housing:client:delete:house', function()
    if Currenthouse ~= nil then 
        TriggerServerEvent('nocore-housing:server:detlete:house', Currenthouse)
    else
        Framework.Functions.Notify("Няма къща на близо", "error")
    end
end)

RegisterNetEvent('nocore-housing:client:add:garage')
AddEventHandler('nocore-housing:client:add:garage', function()
    if Currenthouse ~= nil then 
        local PlayerCoords = GetEntityCoords(PlayerPedId())
        local PlayerHeading = GetEntityHeading(PlayerPedId())
        local CoordsTable = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z, ['H'] = PlayerHeading}
        TriggerServerEvent('nocore-housing:server:add:garage', Currenthouse, Config.Houses[Currenthouse]['Adres'], CoordsTable)
    else
        Framework.Functions.Notify("Няма къща наблизо", "error")
    end
end)

RegisterNetEvent('nocore-housing:client:view:house')
AddEventHandler('nocore-housing:client:view:house', function(houseprice, brokerfee, bankfee, taxes, firstname, lastname)
    SetHouseCam(Config.Houses[Currenthouse]['Coords']['Cam'], Config.Houses[Currenthouse]['Coords']['Cam']['H'], Config.Houses[Currenthouse]['Coords']['Cam']['Yaw'])
    Citizen.Wait(500)
    OpenHouseContract(true)
    SendNUIMessage({
        type = "setupContract",
        firstname = firstname,
        lastname = lastname,
        street = Config.Houses[Currenthouse]['Adres'],
        houseprice = houseprice,
        brokerfee = brokerfee,
        --bankfee = bankfee,
        --taxes = taxes,
        totalprice = (houseprice + brokerfee)
    })
end)

RegisterNetEvent('nocore-housing:client:set:location')
AddEventHandler('nocore-housing:client:set:location', function(Type)
 local PlayerCoords = GetEntityCoords(PlayerPedId())
 local CoordsTable = {['X'] = PlayerCoords.x, ['Y'] = PlayerCoords.y, ['Z'] = PlayerCoords.z}
 if IsInHouse then
    Framework.Functions.TriggerCallback('nocore-housing:server:has:house:key', function(HasHouseKey)
        if HasHouseKey then
            if Type == 'stash' then
             TriggerServerEvent('nocore-housing:server:set:location', Currenthouse, CoordsTable, 'stash')
            elseif Type == 'clothes' then
             TriggerServerEvent('nocore-housing:server:set:location', Currenthouse, CoordsTable, 'clothes')
           --elseif Type == 'logout' then
           --  TriggerServerEvent('nocore-housing:server:set:location', Currenthouse, CoordsTable, 'logout')
           end
        end
    end, Currenthouse)
 end
end)

RegisterNetEvent('nocore-housing:client:refresh:location')
AddEventHandler('nocore-housing:client:refresh:location', function(HouseId, CoordsTable, Type)
 if HouseId == Currenthouse then
    if IsInHouse then
         if Type == 'stash' then
            StashLocation = CoordsTable
         elseif Type == 'clothes' then
            ClothingLocation = CoordsTable
        --elseif Type == 'logout' then
        --    LogoutLocation = CoordsTable
        end
    end
 end
end)

RegisterNetEvent('nocore-housing:client:give:keys')
AddEventHandler('nocore-housing:client:give:keys', function()
  local Player, Distance = Framework.Functions.GetClosestPlayer()
  if Player ~= -1 and Distance < 5 then  
    Framework.Functions.GetPlayerData(function(PlayerData)
      if Config.Houses[Currenthouse]['Owner'] == PlayerData.citizenid then
         TriggerServerEvent('nocore-housing:server:give:keys', Currenthouse, GetPlayerServerId(Player))
      else
        Framework.Functions.Notify("Вие не сте собственик на тази къща.", "error")
      end
    end)
  else
    Framework.Functions.Notify("Никой не е намерен", "error")
  end
end)

RegisterNetEvent('nocore-housing:client:ring:door')
AddEventHandler('nocore-housing:client:ring:door', function()
    if Currenthouse ~= nil then
      TriggerServerEvent('nocore-housing:server:ring:door', Currenthouse)
    end
end)

RegisterNetEvent('nocore-housing:client:ringdoor')
AddEventHandler('nocore-housing:client:ringdoor', function(Player, HouseId)
    if Currenthouse == HouseId and IsInHouse then
        CurrentBell = Player
        TriggerEvent("nocore-sound:client:play", "house-doorbell", 0.1)
        Framework.Functions.Notify("Има някой на вратата.")
    end
end)

RegisterNetEvent('nocore-housing:client:set:in:house')
AddEventHandler('nocore-housing:client:set:in:house', function(House)
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[House]['Coords']['Enter']['X'], Config.Houses[House]['Coords']['Enter']['Y'], Config.Houses[House]['Coords']['Enter']['Z'], true) < 5.0) then
        TriggerEvent('nocore-housing:client:enter:house')
    end
end)

RegisterNetEvent('nocore-housing:client:set:new:key:holders')
AddEventHandler('nocore-housing:client:set:new:key:holders', function(HouseId, HouseKeys)
    Config.Houses[HouseId]['Key-Holders'] = HouseKeys
end)

RegisterNetEvent('nocore-housing:client:set:house:door')
AddEventHandler('nocore-housing:client:set:house:door', function(HouseId, bool)
    Config.Houses[HouseId]['Door-Lock'] = bool
end)

RegisterNetEvent('nocore-housing:client:reset:house:door')
AddEventHandler('nocore-housing:client:reset:house:door', function()
    if IsNearHouse then
        if not Config.Houses[Currenthouse]['Door-Lock'] then
            OpenDoorAnim()
            TriggerServerEvent('nocore-sound:server:play:source', 'doorlock-keys', 0.4)
            TriggerServerEvent('nocore-housing:server:set:house:door', Currenthouse, true)
        else
            Framework.Functions.Notify("Тази врата вече е затворена.", 'error')
        end
    else
        Framework.Functions.Notify("Няма къща.", 'error')
    end
end)

RegisterNetEvent('nocore-housing:client:breaking:door')
AddEventHandler('nocore-housing:client:breaking:door', function()
    if IsNearHouse then
        if Config.Houses[Currenthouse]['Door-Lock'] then
            RamAnimation(true)
            Framework.Functions.Progressbar("bonk-door", "Блъскане на вратата..", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function() -- Done
                RamAnimation(false)
                TriggerServerEvent('nocore-housing:server:set:house:door', Currenthouse, false)
            end, function() -- Cancel
                RamAnimation(false)
            end, 'fa-solid fa-house')
        else
            Framework.Functions.Notify("Вратата вече е отворена.", 'error')
        end
    end
end)

-- // Functions \\ --

function LeaveHouse()
    TriggerEvent("nocore-sound:client:play", "house-door-open", 0.1)
    OpenDoorAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    exports['nocore-interiors']:DespawnInterior(HouseData, function()
        SetEntityCoords(PlayerPedId(), Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'])
        TriggerEvent('nocore-weathersync:client:EnableSync')
        --exports['nocore-houseplants']:UnloadHousePlants(Currenthouse)
        UnloadDecorations()
        Citizen.Wait(1000)
        IsInHouse = false
        Other = nil
        TriggerEvent('qb-menu:client:closeMenu')
        Currenthouse = nil
        StashLocation, ClothingLocation, LogoutLocation = nil, nil, nil
        HouseData, OffSets = nil, nil
        DoScreenFadeIn(1000)
        TriggerEvent("nocore-sound:client:play", "house-door-close", 0.1)
    end)
end

function LogoutPlayer()
    TriggerEvent("nocore-sound:client:play", "house-door-open", 0.1)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    exports['nocore-interiors']:DespawnInterior(HouseData, function()
        SetEntityCoords(PlayerPedId(), Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'])
        TriggerEvent('nocore-weathersync:client:EnableSync')
        UnloadDecorations()
        Citizen.Wait(1000)
        IsInHouse = false
        Other = nil
        Currenthouse = nil
        StashLocation, ClothingLocation, LogoutLocation = nil, nil, nil
        HouseData, OffSets = nil, nil
        TriggerEvent("nocore-sound:client:play", "house-door-close", 0.1)
        Citizen.Wait(450)
        TriggerServerEvent('nocore-housing:server:logout')
    end)
  end

function SetHouseLocations()
  if Currenthouse ~= nil then
      Framework.Functions.TriggerCallback('nocore-housing:server:get:locations', function(result)
          if result ~= nil then
              if result.stash ~= nil then
                StashLocation = json.decode(result.stash)
              end  
              if result.outfit ~= nil then
                ClothingLocation = json.decode(result.outfit)
              end  
              --if result.logout ~= nil then
              --  LogoutLocation = json.decode(result.logout)
              --end
          end
      end, Currenthouse)
  end
end

function RamAnimation(bool)
    if bool then
      exports['nocore-assets']:RequestAnimationDict("missheistfbi3b_ig7")
      TaskPlayAnim(PlayerPedId(), "missheistfbi3b_ig7", "lift_fibagent_loop", 8.0, 8.0, -1, 1, -1, false, false, false)
    else
      exports['nocore-assets']:RequestAnimationDict("missheistfbi3b_ig7")
      TaskPlayAnim(PlayerPedId(), "missheistfbi3b_ig7", "exit", 8.0, 8.0, -1, 1, -1, false, false, false)
    end
end

-- RegisterCommand("kushta", function()
--     print(EnterNearHouse())
-- end)

function EnterNearHouse()
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    if Currenthouse ~= nil then
        local HasKey = nil
        Framework.Functions.TriggerCallback('nocore-housing:server:has:house:key', function(HasHouseKey)
            HasKey = HasHouseKey
        end, Currenthouse)
        while HasKey == nil do Citizen.Wait(0) end
        local Area = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'], true)
        if (Area < 2.0 and HasKey) or (Area < 2.0 and not Config.Houses[Currenthouse]['Door-Lock']) then
            if not IsInHouse then
                return true
            end
        end
    end
end

function IsNearAnyHouse()
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    if Currenthouse ~= nil then
        local Area = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Houses[Currenthouse]['Coords']['Enter']['X'], Config.Houses[Currenthouse]['Coords']['Enter']['Y'], Config.Houses[Currenthouse]['Coords']['Enter']['Z'], true)
        if Area < 2.0 and Config.Houses[Currenthouse]['Door-Lock'] then
            if not IsInHouse then
                return true
            end
        end
    end
end

function HasEnterdHouse()
    if Currenthouse == nil then return false end
    local HasKey = nil
    Framework.Functions.TriggerCallback('nocore-housing:server:has:house:key', function(HasHouseKey)
        HasKey = HasHouseKey
    end, Currenthouse)
    while HasKey == nil do Citizen.Wait(0) end
    if IsInHouse and HasKey then
        return true
    end
end

function OpenDoorAnim()
  exports['nocore-assets']:RequestAnimationDict('anim@heists@keycard@')
  TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
  Citizen.Wait(400)
  ClearPedTasks(PlayerPedId())
end

function SetHouseCam(coords, h, yaw)
    HouseCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords['X'], coords['Y'], coords['Z'], yaw, 0.00, h, 80.00, false, 0)
    SetCamActive(HouseCam, true)
    RenderScriptCams(true, true, 500, true, true)
end

function OpenHouseContract(bool)
  SetNuiFocus(bool, bool)
  SendNUIMessage({
      type = "toggle",
      status = bool,
  })
end

function NearHouseGarage()
    return NearGarage
end

function GetGarageCoords()
    return Config.Houses[Currenthouse]['Garage']
end

function AddBlipForHouse()
    Framework.Functions.GetPlayerData(function(PlayerData)
      for k, v in pairs(Config.Houses) do
         if Config.Houses[k]['Owner'] == PlayerData.citizenid then
            Blips = AddBlipForCoord(Config.Houses[k]['Coords']['Enter']['X'], Config.Houses[k]['Coords']['Enter']['Y'], Config.Houses[k]['Coords']['Enter']['Z'])
            SetBlipSprite (Blips, 40)
            SetBlipDisplay(Blips, 4)
            SetBlipScale  (Blips, 0.48)
            SetBlipAsShortRange(Blips, true)
            SetBlipColour(Blips, 26)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Houses[k]['Adres'])
            EndTextCommandSetBlipName(Blips)
            table.insert(HouseBlips, Blips)
         end
      end
    end)
end

function RefreshHouseBlips()
    RemoveHouseBlip()
    Citizen.SetTimeout(450, function()
        AddBlipForHouse()
    end)
end

function RemoveHouseBlip()
    if HouseBlips ~= nil then
      for k, v in pairs(HouseBlips) do
          RemoveBlip(v)
      end
      HouseBlips = {}
    end
end

function DrawText3D(x, y, z, text)
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(true)
  AddTextComponentString(text)
  SetDrawOrigin(x,y,z, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()
end

-- // NUI \\ --

RegisterNUICallback('buy', function()
  OpenHouseContract(false)
  if DoesCamExist(HouseCam) then
   RenderScriptCams(false, true, 500, true, true)
   SetCamActive(HouseCam, false)
   DestroyCam(HouseCam, true)
  end
  TriggerServerEvent('nocore-housing:server:buy:house', Currenthouse)
end)

RegisterNUICallback('exit', function()
  OpenHouseContract(false)
  if DoesCamExist(HouseCam) then
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(HouseCam, false)
    DestroyCam(HouseCam, true)
  end
end)
