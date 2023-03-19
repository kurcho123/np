local PlayerJob = {}
Framework = exports['no-core']:GetCoreObject()

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    SpawnPesho()
    TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
    PlayerJob = Framework.Functions.GetPlayerData().job
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Wait(500)
        SpawnPesho()
    end
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('nocore-fa:client:GetParkingList')
AddEventHandler('nocore-fa:client:GetParkingList', function()
    OpenParkingList()
end)

RegisterNetEvent('nocore-fa:client:GetVehicleList')
AddEventHandler('nocore-fa:client:GetVehicleList', function()
    if PlayerJob.name == "jamals" and PlayerJob.grade.level >= 0 then
        OpenHouseGarage()
    else
        Framework.Functions.Notify("Чейн хареса това", "info", 3500)
    end
end)

RegisterNetEvent('nocore-fraudauto:client:openCarsList')
AddEventHandler('nocore-fraudauto:client:openCarsList', function(data)
    OpenCarsList(data)
end)

RegisterNetEvent('nocore-fraudauto:client:display:car')
AddEventHandler('nocore-fraudauto:client:display:car', function(data)
    DisplayVehicle(data)
end)

RegisterNetEvent('nocore-fraudauto:client:DriveTest')
AddEventHandler('nocore-fraudauto:client:DriveTest', function(data)
    Framework.Functions.TriggerCallback("nocore-fraudauto:server:can:drivetest", function(CanDriveTest)
        if CanDriveTest then 
            local CoordTable = {x = Shared.DriveTestLocation['X'], y = Shared.DriveTestLocation['Y'], z = Shared.DriveTestLocation['Z'], a = Shared.DriveTestLocation['H']}
            if data.vehicle['State'] == 'in' then
            Framework.Functions.SpawnVehicle(data.vehicle['Model'], function(Vehicle)
            TriggerServerEvent('nocore-garages:server:set:garage:state', data.vehicle['Plate'], 'out')
            Framework.Functions.TriggerCallback('nocore-garage:server:get:vehicle:mods', function(Mods)
                Framework.Functions.SetVehicleProperties(Vehicle, Mods)
                exports['nocore-vehiclekeys']:SetVehicleKey(exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), true)
                exports['nocore-fuel']:SetFuelLevel(Vehicle, exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), data.vehicle['Fuel'], false)
                Framework.Functions.Notify('Вашето превозно средство ви очаква на едно от местата за паркиране.', 'info')
            end, data.vehicle['Plate'])
            end, CoordTable, true, false)
            else
            Framework.Functions.Notify("Вашето превозно средство може да е в депо", "info", 3500)
            end
        else
            Framework.Functions.Notify("No money - no funny", "info", 3500)
        end
    end)
end)

RegisterNetEvent('nocore-fa:client:RemoveVehicle')
AddEventHandler('nocore-fa:client:RemoveVehicle', function()
    local nearbyVehicle = Framework.Functions.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(nearbyVehicle)
    if nearbyVehicle ~= 0 then
        NetworkRequestControlOfEntity(nearbyVehicle)
        SetEntityAsMissionEntity(nearbyVehicle, true, true)
        DeleteEntity(nearbyVehicle)
        while DoesEntityExist(nearbyVehicle) do
            DeleteEntity(nearbyVehicle)
            Citizen.Wait(50)
        end
        TriggerServerEvent('nocore-garages:server:set:garage:state', plate, 'in')
        Framework.Functions.Notify('Вашето превозно средство бе върнато в гаража.', 'info', 3500)
    else
        Framework.Functions.Notify('Кво връщаш бе папук????.', 'info', 3500)
    end
end)

RegisterNetEvent('nocore-fa:client:CheckVehiclePrice')
AddEventHandler('nocore-fa:client:CheckVehiclePrice', function()
    local nearbyVehicle = GetClosestVehicle(Shared.DriveTestLocation['X'], Shared.DriveTestLocation['Y'], Shared.DriveTestLocation['Z'], 2.5, 0 ,70)
    if nearbyVehicle ~= 0 then
        local Plate = exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(nearbyVehicle))
        Framework.Functions.TriggerCallback("nocore-fraudauto:server:get:car:price", function(result)
            if result > 0 then
                Framework.Functions.Notify('Шефа ти дава некви къси $'..math.ceil(result*0.7), 'info', 7500)
            else
                SetNewWaypoint(2348.34, 3136.27)
                Framework.Functions.Notify('Дадох ти локация, за там е тая кола', 'info', 7500)
            end
        end, Plate)
    else
        Framework.Functions.Notify('Кво прайш бе папук????.', 'info', 3500)
    end
end)

RegisterNetEvent('nocore-fraudauto:client:RemoveVehicle')
AddEventHandler('nocore-fraudauto:client:RemoveVehicle', function(Vehicle)
    Citizen.Wait(120000)
    NetworkRequestControlOfEntity(Vehicle)
    SetEntityAsMissionEntity(Vehicle, true, true)
    DeleteEntity(Vehicle)
    while DoesEntityExist(Vehicle) do
        DeleteEntity(Vehicle)
        Citizen.Wait(50)
    end
end)

local parkingSpots = {
    {name = "1st", Pos = {x = 907.63,y = -1579.42, z = 30.7,h = 4.93}},
    {name = "2st", Pos = {x = 904.43,y = -1579.81, z = 30.3,h = 4.93}},
    {name = "3st", Pos = {x = 900.95,y = -1579.58, z = 30.3,h = 4.93}},
    {name = "4st", Pos = {x = 897.76,y = -1579.8, z = 30.3,h = 4.93}},
    {name = "5th", Pos = {x = 894.35,y = -1579.67, z = 30.3,h = 4.93}},
    {name = "6th", Pos = {x = 891.14,y = -1579.8, z = 30.3,h = 4.93}},
    {name = "7th", Pos = {x = 887.81,y = -1579.8, z = 30.3,h = 4.93}},
}

function OpenCarsContext(Place, VehicleTable)
    local sendMenu = {}
    sendMenu[#sendMenu+1] = {
        id = 1,
        header = "Jamals - Display",
        isMenuHeader = true
    }
  for k, v in pairs(VehicleTable) do
    sendMenu[#sendMenu+1] = {
        id = #sendMenu+1,
        header = v['Name'],
        txt = v['Plate'],
        params = {
            event = "nocore-fraudauto:client:display:car",
            args = {
                vehicle = v,
                positionX = Place.positionX,
                positionY = Place.positionY,
                positionZ = Place.positionZ,
                positionH = Place.positionH,
            }
        }
    }
  end
  sendMenu[#sendMenu+1] = {
    id = #sendMenu+1,
    header = "Затвори",
    txt = "",
    params = { 
      event = "fakeeeevent",
      args = {}
    }
  }
  exports['nocore-context']:openMenu(sendMenu)
end

function DisplayVehicle(data)
    CoordTable = {
        x = data.positionX,
        y = data.positionY,
        z = data.positionZ,
        a = data.positionH
      }
    if Framework.Functions.IsSpawnPointClear(CoordTable, 3) then
        SpawnVehicle(data)
    else
        local nearbyVehicle = GetClosestVehicle(CoordTable.x, CoordTable.y, CoordTable.z, 2.5, 0 ,70)
        if nearbyVehicle ~= nil then
            NetworkRequestControlOfEntity(nearbyVehicle)
            SetEntityAsMissionEntity(nearbyVehicle, true, true)
            DeleteEntity(nearbyVehicle)
            while DoesEntityExist(nearbyVehicle) do
                DeleteEntity(nearbyVehicle)
                Citizen.Wait(50)
            end
        end
        if Framework.Functions.IsSpawnPointClear(CoordTable, 3) then
            SpawnVehicle(data)
        else
            Framework.Functions.Notify('Нещо пречи на това място', 'info')
        end
    end
end

function SpawnVehicle(data)
    Framework.Functions.SpawnVehicle(data.vehicle['Model'], function(Vehicle)
        Framework.Functions.TriggerCallback('nocore-garage:server:get:vehicle:mods', function(Mods)
        Framework.Functions.SetVehicleProperties(Vehicle, Mods)
        FreezeEntityPosition(Vehicle, true)
        SetVehicleDoorsLocked(Vehicle, 2)
        Framework.Functions.Notify('Превозното средство е на място и ще бъде прибрано след 120 секунди.', 'info', 7500)
        end, data.vehicle['Plate'])
        TriggerEvent("nocore-fraudauto:client:RemoveVehicle", Vehicle)
    end, CoordTable, true, false)
end

function OpenCarsList(position)
    local VehicleTable = {}
    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    Framework.Functions.TriggerCallback("nocore-garage:server:GetHouseVehicles", function(result)
        if result ~= nil then
            for k, v in pairs(result) do
                local Vehicle = {}
                local mods = json.decode(v.mods)
                Vehicle = {
                ['Name'] = Framework.Shared.Vehicles[v.vehicle]['name'], 
                ['Model'] = v.vehicle, 
                ['Plate'] = v.plate, 
                ['State'] = v.state, 
                ['Engine'] = mods.modEngine == nil and "No info" or mods.modEngine, 
                ['Brakes'] = mods.modBrakes == nil and "No info" or mods.modBrakes, 
                ['Turbo'] = mods.modTurbo == nil and "No info" or mods.modTurbo,
                ['Transmission'] = mods.modTransmission == nil and "No info" or mods.modTransmission,
                ['Suspension'] = mods.modSuspension == nil and "No info" or mods.modSuspension}
                table.insert(VehicleTable, Vehicle)
            end
            OpenCarsContext(position, VehicleTable)
        else
          Framework.Functions.Notify("В този гараж нямате превозни средства", "error", 5000)
        end
    end, Shared.Settings.GarageName)
end

function OpenParkingList()
    local sendMenu = {}
    sendMenu[#sendMenu+1] = {
        id = 1,
        header = "Налични места",
        isMenuHeader = true,
    }
    for i = 1, #parkingSpots do
        sendMenu[#sendMenu+1] = {
            id = i,
            header = parkingSpots[i].name,
            params = {
                event = "nocore-fraudauto:client:openCarsList",
                args = {
                    positionX = parkingSpots[i].Pos['x'],
                    positionY = parkingSpots[i].Pos['y'],
                    positionZ = parkingSpots[i].Pos['z'],
                    positionH = parkingSpots[i].Pos['h'],
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
end

function OpenHouseGarage()
    local VehicleTable = {}
    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    Framework.Functions.TriggerCallback("nocore-garage:server:GetHouseVehicles", function(result)
        if result ~= nil then
            for k, v in pairs(result) do
                local Vehicle = {}
                local mods = json.decode(v.mods)
                Vehicle = {
                ['Name'] = Framework.Shared.Vehicles[v.vehicle]['name'], 
                ['Model'] = v.vehicle, 
                ['Plate'] = v.plate, 
                ['State'] = v.state, 
                ['Engine'] = mods.modEngine == nil and "No info" or mods.modEngine, 
                ['Brakes'] = mods.modBrakes == nil and "No info" or mods.modBrakes, 
                ['Turbo'] = mods.modTurbo == nil and "No info" or mods.modTurbo,
                ['Transmission'] = mods.modTransmission == nil and "No info" or mods.modTransmission,
                ['Suspension'] = mods.modSuspension == nil and "No info" or mods.modSuspension}
                table.insert(VehicleTable, Vehicle)
            end
            OpenHouseGarageMenu(VehicleTable)
        else
          Framework.Functions.Notify("В този гараж нямате превозни средства", "error", 5000)
        end
    end, Shared.Settings.GarageName)
  end
  
  function OpenHouseGarageMenu(VehicleTable)
      local sendMenu = {}
        sendMenu[#sendMenu+1] = {
            id = 1,
            header = "Jamals - Drive test",
            txt = "$2000 Drive test",
            isMenuHeader = true
        }
  
      for k, v in pairs(VehicleTable) do
          if v['State'] == 'out' then

          else
              sendMenu[#sendMenu+1] = {
                  id = #sendMenu+1,
                  header = v['Name'],
                  txt = v['Plate'],
                  params = {
                      event = "nocore-fraudauto:client:DriveTest",
                      args = {
                          vehicle = v,
                      }
                  }
              }
          end
      end
      sendMenu[#sendMenu+1] = {
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        params = { 
          event = "fakeeeevent",
          args = {}
        }
      }
      exports['nocore-context']:openMenu(sendMenu)
  end


function SpawnPesho()
    local ped_hash = GetHashKey(Shared.Settings.PedHash)
    RequestModel(ped_hash)
    while not HasModelLoaded(ped_hash) do
        Citizen.Wait(1)
    end
    FraudAutoPed = CreatePed(1, ped_hash, 921.95, -1564.54, 29.85, 51.4, false, true)
    SetBlockingOfNonTemporaryEvents(FraudAutoPed, true)
    SetPedDiesWhenInjured(FraudAutoPed, false)
    SetPedCanPlayAmbientAnims(FraudAutoPed, true)
    SetPedCanRagdollFromPlayerImpact(FraudAutoPed, false)
    SetEntityInvincible(FraudAutoPed, true)
    FreezeEntityPosition(FraudAutoPed, true)

    exports['nocore-eye']:AddTargetEntity(FraudAutoPed, {
        options = {
            {
                num = 1,
                event = "nocore-fa:client:GetParkingList",
                icon = "fas fa-sign-in-alt",
                label = "Лист с паркоместа",
            },
            {
                num = 2,
                event = "nocore-jar:client:open:store",
                icon = "fas fa-sign-in-alt",
                label = "Отвори магазина",
            },
            {
                num = 3,
                event = "nocore-jar:client:open:mechanicStore",
                icon = "fas fa-sign-in-alt",
                label = "Магазин на сервиза",
                job = "jamals"
            },
            {
                num = 4,
                event = "nocore-fa:client:openstash",
                icon = "fas fa-sign-in-alt",
                label = "Склада",
                job = {
                    ["jamals"] = 1,
                },
            },
            {
                num = 5,
                event = "nocore-jar:client:open:privateStore",
                icon = "fas fa-sign-in-alt",
                label = "Магазин на сервиза",
                job = {
                    ["jamals"] = 2,
                },
            },
        },
        distance = 2.5
    })
end

RegisterNetEvent('nocore-fa:client:openstash',function()
    if PlayerJob.name == "jamals" and PlayerJob.grade.level >= 1 then
        TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "Fridge", {
            maxweight = 900000000,
            slots = 400,
        })
        TriggerEvent("nocore-inventory:client:SetCurrentStash", "Fridge")
    end
end)

AddTextEntryByHash(0x1F3B2F8D, 'Fraud Street')