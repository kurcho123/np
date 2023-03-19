local Framework = exports['no-core']:GetCoreObject()
local NearGarage = false
local IsMenuActive = false   
local Debug = true   

-- Code

-- // Loops \\ --

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(4)
    if LocalPlayer.state.isLoggedIn then
        NearGarage = false
        for k, v in pairs(Config.GarageLocations) do
          local Distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v["Coords"]["X"], v["Coords"]["Y"], v["Coords"]["Z"], true) 
          if Distance < v['Distance'] then
           NearGarage = true
           Config.CurrentGarageData = {['GarageNumber'] = k, ['GarageName'] = v['Name']}
          end
        end
        if not NearGarage then
          Citizen.Wait(1500)
          Config.CurrentGarageData = {}
        end
    end
  end
end)

-- // Events \\ --

RegisterNetEvent('nocore-garages:client:check:owner')
AddEventHandler('nocore-garages:client:check:owner', function()
local Vehicle, VehDistance = Framework.Functions.GetClosestVehicle()
local Plate = exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(Vehicle))
  if VehDistance < 2.3 then
     Framework.Functions.TriggerCallback("nocore-garage:server:is:vehicle:owner", function(IsOwner)
         if IsOwner then
           TriggerEvent('nocore-garages:client:set:vehicle:in:garage', Vehicle, Plate)
         else
          Framework.Functions.Notify('Това не е вашето превозно средство', 'error')
         end
     end, Plate)
  else
    Framework.Functions.Notify('Няма превозно средство ?', 'error')
  end
end)

RegisterNetEvent('nocore-garages:client:set:vehicle:in:garage')
AddEventHandler('nocore-garages:client:set:vehicle:in:garage', function(Vehicle, Plate)
  local engine = GetVehicleEngineHealth(Vehicle)
  if engine < 0 then
    engine = 0
  end
   local VehicleMeta = {Fuel = exports['nocore-fuel']:GetFuelLevel(Plate), Body = GetVehicleBodyHealth(Vehicle), Engine = engine}
   local GarageData = Config.CurrentGarageData['GarageName']
    TaskLeaveAnyVehicle(PlayerPedId())
    Citizen.SetTimeout(1650, function()
      TriggerServerEvent('nocore-garages:server:set:in:garage', Plate, GarageData, 'in', VehicleMeta)
      Framework.Functions.DeleteVehicle(Vehicle)
      Framework.Functions.Notify('Превозното средство е паркирано в '..Config.CurrentGarageData['GarageName'], 'success')
    end)
end)

RegisterNetEvent('nocore-garages:client:set:vehicle:out:garage')
AddEventHandler('nocore-garages:client:set:vehicle:out:garage', function()
  OpenGarageMenu()
end)

RegisterNetEvent('nocore-garages:client:open:depot')
AddEventHandler('nocore-garages:client:open:depot', function()
  OpenDepotMenu()
end)

RegisterNetEvent('nocore-garages:client:spawn:vehicle')
AddEventHandler('nocore-garages:client:spawn:vehicle', function(Plate, VehicleName, Metadata)
  local RandomCoords = Config.GarageLocations[Config.CurrentGarageData['GarageNumber']]['Spawns'][math.random(1, #Config.GarageLocations[Config.CurrentGarageData['GarageNumber']]['Spawns'])]['Coords']
  local CoordTable = {}
  for k, v in pairs(Config.GarageLocations[Config.CurrentGarageData['GarageNumber']]['Spawns']) do
    CoordTable = {
      x = v['Coords']['X'],
      y = v['Coords']['Y'],
      z = v['Coords']['Z'],
      a = v['Coords']['H']
    }
    if Framework.Functions.IsSpawnPointClear(CoordTable, 3) then
      Framework.Functions.SpawnVehicle(VehicleName, function(Vehicle)
        SetVehicleNumberPlateText(Vehicle, exports['nocore-fakeplate']:GetFakePlate(Plate))
        DoCarDamage(Vehicle, Metadata.Engine, Metadata.Body)
        Citizen.Wait(25)
        --exports['nocore-mechanicjob']:SetVehicleDrivingDistance(GetVehicleNumberPlateText(Vehicle), Metadata.DrivingDistance)
        exports['nocore-vehiclekeys']:SetVehicleKey(exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), true)
        exports['nocore-fuel']:SetFuelLevel(Vehicle, exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), Metadata.Fuel, false)
        Framework.Functions.Notify('Превозното средство е паркирано.', 'success')
      end, CoordTable, true, false)
      break
    end
  end
end)

RegisterNetEvent('nocore-garages:client:GetVehicle')
AddEventHandler('nocore-garages:client:GetVehicle', function(data)
  if IsNearGarage() then
    local RandomCoords = Config.GarageLocations[Config.CurrentGarageData['GarageNumber']]['Spawns'][math.random(1, #Config.GarageLocations[Config.CurrentGarageData['GarageNumber']]['Spawns'])]['Coords']
    local CoordTable = {x = RandomCoords['X'], y = RandomCoords['Y'], z = RandomCoords['Z'], a = RandomCoords['H']}
    if data.vehicle['State'] == 'in' then
      Framework.Functions.SpawnVehicle(data.vehicle['Model'], function(Vehicle)
        Framework.Functions.TriggerCallback('nocore-garage:server:get:vehicle:mods', function(Mods)
          Framework.Functions.SetVehicleProperties(Vehicle, Mods)
          SetVehicleNumberPlateText(Vehicle, exports['nocore-fakeplate']:GetFakePlate(data.vehicle['Plate']))
          Citizen.Wait(25)
          DoCarDamage(Vehicle, data.vehicle['Engine'], data.vehicle['Body'])
          Citizen.Wait(25)
          --exports['nocore-mechanicjob']:SetVehicleDrivingDistance(GetVehicleNumberPlateText(Vehicle), data.vehicle['DrivingDistance'])
          exports['nocore-vehiclekeys']:SetVehicleKey(exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), true)
          exports['nocore-fuel']:SetFuelLevel(Vehicle, exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), data.vehicle['Fuel'], false)
          Framework.Functions.Notify('Вашето превозно средство ви очаква на едно от местата за паркиране.', 'info')
          TriggerServerEvent('nocore-garages:server:set:garage:state', data.vehicle['Plate'], 'out')
        end, data.vehicle['Plate'])
      end, CoordTable, true, false)
    else
        Framework.Functions.Notify("Вашето превозно средство може да е в депо", "info", 3500)
    end
  elseif IsNearDepot() then
    local vehicles = Framework.Functions.GetVehicles()
    local plate = exports['nocore-fakeplate']:GetFakePlate(data.vehicle['Plate'])
    local plate2 = data.vehicle['Plate']
    local found = false

    for _, vehicle in pairs(vehicles) do
      --local plates = exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(vehicle))
      local plates = GetVehicleNumberPlateText(vehicle)
        if plates == plate or plates == plate2 then
            found = true
            CreateThread(function()
                local blip = AddBlipForCoord(GetEntityCoords(vehicle))
                SetBlipSprite(blip, 523)
                SetBlipColour(blip, 66)
                SetBlipNameToPlayerName(blip, data.vehicle['Name']..' - '..plate)
                SetBlipScale(blip, 0.9)
                SetBlipAsShortRange(blip, false)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(data.vehicle['Name']..' - '..plate)
                EndTextCommandSetBlipName(blip)

                Wait(15000)
                local a = 255
                while a > 0 do
                    SetBlipAlpha(blip, a)
                    a = a - 1
                    Wait(1)
                end
                RemoveBlip(blip)
            end)

            TriggerEvent('Framework:Notify', "Updated your vehicle on the GPS", "success")
            return
        end
    end

    if found == false then
      GetDepotVehicle(data)
    end

  elseif exports['nocore-housing']:NearHouseGarage() then
    if data.vehicle['State'] == 'in' then
      local VehicleSpawn = exports['nocore-housing']:GetGarageCoords()
      local CoordTable = {x = VehicleSpawn['X'], y = VehicleSpawn['Y'], z = VehicleSpawn['Z'], a = VehicleSpawn['H']}
      Framework.Functions.SpawnVehicle(data.vehicle['Model'], function(Vehicle)
        Framework.Functions.TriggerCallback('nocore-garage:server:get:vehicle:mods', function(Mods)
             Framework.Functions.SetVehicleProperties(Vehicle, Mods)
             SetVehicleNumberPlateText(Vehicle, exports['nocore-fakeplate']:GetFakePlate(data.vehicle['Plate']))
             Citizen.Wait(25)
             DoCarDamage(Vehicle, data.vehicle['Engine'], data.vehicle['Body'])
             Citizen.Wait(25)
             TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
             --exports['nocore-mechanicjob']:SetVehicleDrivingDistance(GetVehicleNumberPlateText(Vehicle), data.vehicle['DrivingDistance'])
             exports['nocore-vehiclekeys']:SetVehicleKey(exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), true)
             exports['nocore-fuel']:SetFuelLevel(Vehicle, exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), data.vehicle['Fuel'], false)
             Framework.Functions.Notify('Вашето превозно средство е изкарано от гаража', 'success')
             TriggerServerEvent('nocore-garages:server:set:garage:state', data.vehicle['Plate'], 'out')
           end, data.vehicle['Plate'])
        end, CoordTable, true, false)
      else
        Framework.Functions.Notify("Вашето превозно средство може да е в депо", "info", 3500)
    end
  end
end)

-- // Functions \\ --

function DoCarDamage(Vehicle, EngineHealth, BodyHealth)
	SmashWindows = false
	damageOutside = false
	damageOutside2 = false 
	local engine = EngineHealth + 0.0
	local body = BodyHealth + 0.0
	if engine < 200.0 then
		engine = 200.0
	end

	if body < 150.0 then
		body = 150.0
	end
	if body < 950.0 then
		SmashWindows = true
	end

	if body < 920.0 then
		damageOutside = true
	end

	if body < 920.0 then
		damageOutside2 = true
	end
	Citizen.Wait(100)
	SetVehicleEngineHealth(Vehicle, engine)
	if SmashWindows then
		SmashVehicleWindow(Vehicle, 0)
		SmashVehicleWindow(Vehicle, 1)
		SmashVehicleWindow(Vehicle, 2)
		SmashVehicleWindow(Vehicle, 3)
		SmashVehicleWindow(Vehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(Vehicle, 1, true)
		SetVehicleDoorBroken(Vehicle, 6, true)
		SetVehicleDoorBroken(Vehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(Vehicle, 1, false, 990.0)
		SetVehicleTyreBurst(Vehicle, 2, false, 990.0)
		SetVehicleTyreBurst(Vehicle, 3, false, 990.0)
		SetVehicleTyreBurst(Vehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(Vehicle, 985.0)
  end
end

function GetDepotVehicle(data)
  Framework.Functions.TriggerCallback('nocore-garage:server:pay:depot', function(DidPayment)
    if DidPayment then
      local CoordTable = {x = 405.73071289063, y = -1643.8446044922, z = 29.292079925537, a = 224.38739013672}
      Framework.Functions.SpawnVehicle(data.vehicle['Model'], function(Vehicle)
      Framework.Functions.TriggerCallback('nocore-garage:server:get:vehicle:mods', function(Mods)
      Framework.Functions.SetVehicleProperties(Vehicle, Mods)
        SetVehicleNumberPlateText(Vehicle, exports['nocore-fakeplate']:GetFakePlate(data.vehicle['Plate']))
       -- Citizen.Wait(25)
        DoCarDamage(Vehicle, data.vehicle['Engine'], data.vehicle['Body'])
        --Citizen.Wait(25)
        TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
        --exports['nocore-mechanicjob']:SetVehicleDrivingDistance(GetVehicleNumberPlateText(Vehicle), data.vehicle['DrivingDistance'])
        exports['nocore-vehiclekeys']:SetVehicleKey(exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), true)
        exports['nocore-fuel']:SetFuelLevel(Vehicle, exports['nocore-fakeplate']:GetFakePlate(GetVehicleNumberPlateText(Vehicle)), data.vehicle['Fuel'], false)
        Framework.Functions.Notify('Изкарвате вашето превозно средство е изкарано от депото', 'success')
        TriggerServerEvent('nocore-garages:server:set:depot:price', data.vehicle['Plate'], 0)
        TriggerServerEvent('nocore-garages:server:set:garage:state', data.vehicle['Plate'], 'out')
        end, data.vehicle['Plate'])
      end, CoordTable, true, false)
    end
  end, data.vehicle['Price'])
end

function IsNearGarage()
  return NearGarage
end

function IsNearDepot()
  local PlayerCoords = GetEntityCoords(PlayerPedId())
  local Distance = GetDistanceBetweenCoords(PlayerCoords, 403.28237915039, -1636.791015625, 29.292081832886, true) 
  if Distance < 10.0 then
    return true
  end
end

function OpenGarageMenu()
  local VehicleTable = {}
  PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
  Framework.Functions.TriggerCallback("nocore-garage:server:GetUserVehicles", function(result)
      if result ~= nil then
          for k, v in pairs(result) do
             local Vehicle = {}
             local MetaData = json.decode(v.metadata)
             Vehicle = {
               ['Name'] = Framework.Shared.Vehicles[v.vehicle]['name'],
               ['Model'] = v.vehicle, 
               ['Plate'] = v.plate, 
               ['Garage'] = v.garage,
               ['State'] = v.state, 
               ['Fuel'] = MetaData.Fuel, 
               ['DrivingDistance'] = v.drivingdistance, 
               ['Engine'] = math.ceil(MetaData.Engine), 
               ['Body'] = math.ceil(MetaData.Body)}
             table.insert(VehicleTable, Vehicle) 
          end
          --SetNuiFocus(true, true)
          --Citizen.InvokeNative(0xFC695459D4D0E219, 0.9, 0.25)
          --SendNUIMessage({action = "OpenGarage", garagevehicles = VehicleTable})
          OpenTheGarageMenu(VehicleTable)
      else
        Framework.Functions.Notify("Нямате превозни средства в този гараж", "error", 5000)
      end
  end, Config.CurrentGarageData['GarageName'])
end

function OpenTheGarageMenu(VehicleTable)
  local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Гараж",
        txt = "",
        isMenuHeader = true
    })

    for k, v in pairs(VehicleTable) do
        if v['State'] == 'out' then
            sendMenu[#sendMenu+1] = {
                id = #sendMenu+1,
                header = v['Name'],
                txt = v['Plate'].. " | Извън гараж",
                params = {
                    event = "nocore-garages:client:GetVehicle",
                    args = {
                        vehicle = v,
                    }
                }
            }
        else
            sendMenu[#sendMenu+1] = {
                id = #sendMenu+1,
                header = v['Name'],
                txt = v['Plate'].. " | В гараж",
                params = {
                    event = "nocore-garages:client:GetVehicle",
                    args = {
                        vehicle = v,
                    }
                }
            }
        end
    end
  table.insert(sendMenu,{
    id = #sendMenu+1,
    header = "Затвори",
    txt = "",
    params = { 
      event = "fakeeeevent",
      args = {}
    }
  })
  exports['nocore-context']:openMenu(sendMenu)
end

function OpenDepotMenu()
  local VehicleTable = {}
  PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
  Framework.Functions.TriggerCallback("nocore-garage:server:GetDepotVehicles", function(result)
      if result ~= nil then
          for k, v in pairs(result) do
              if v.state == 'out' then
                local Vehicle = {}
                local MetaData = json.decode(v.metadata)
                Vehicle = {['Name'] = Framework.Shared.Vehicles[v.vehicle]['name'], 
                ['Model'] = v.vehicle, 
                ['Plate'] = v.plate, 
                ['Garage'] = v.garage, 
                ['State'] = v.state, 
                ['Price'] = v.depotprice, 
                ['Fuel'] = MetaData.Fuel, 
                ['DrivingDistance'] = v.drivingdistance, 
                ['Engine'] = math.ceil(MetaData.Engine),
                ['Body'] = math.ceil(MetaData.Body)}
                table.insert(VehicleTable, Vehicle)
              end 
          end
          --[[ SetNuiFocus(true, true)
          Citizen.InvokeNative(0xFC695459D4D0E219, 0.9, 0.25)
          SendNUIMessage({action = "OpenDepot", depotvehicles = VehicleTable}) ]]
          OpenTheDepotMenu(VehicleTable)
      else
        Framework.Functions.Notify("Депото е празно", "error", 5000)
      end
  end)
end

function OpenTheDepotMenu(VehicleTable)
  local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Гараж",
        txt = "",
        isMenuHeader = true
    })
    
  for k, v in pairs(VehicleTable) do
    --[[ local price = 
    PlayerData.steam = PlayerData.steam ~= nil and PlayerData.steam or Framework.Functions.GetIdentifier(source, "steam") ]]
    table.insert(sendMenu,{
      id = #sendMenu+1,
      header = v['Name'],
      txt = v['Plate'] ..' - ' .. v['Price']..'$',
      params = { 
          event = "nocore-garages:client:GetVehicle",
          args = {
              vehicle = v,
          }
      }
    })
  end
  table.insert(sendMenu,{
    id = #sendMenu+1,
    header = "Затвори",
    txt = "",
    params = { 
      event = "fakeeeevent",
      args = {}
    }
  })
    exports['nocore-context']:openMenu(sendMenu)
end

RegisterNetEvent('nocore-garages:client:open:houseGarage')
AddEventHandler('nocore-garages:client:open:houseGarage', function(HouseId)
  OpenHouseGarage(HouseId)
end)

function OpenHouseGarage(HouseId)
  local VehicleTable = {}
  PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
  Framework.Functions.TriggerCallback("nocore-garage:server:GetHouseVehicles", function(result)
      if result ~= nil then
          for k, v in pairs(result) do
              local Vehicle = {}
              local MetaData = json.decode(v.metadata)
              Vehicle = {['Name'] = Framework.Shared.Vehicles[v.vehicle]['name'], ['DrivingDistance'] = v.drivingdistance, ['Model'] = v.vehicle, ['Plate'] = v.plate, ['Garage'] = v.garage, ['State'] = v.state, ['Fuel'] = MetaData.Fuel, ['Engine'] = math.ceil(MetaData.Engine), ['Body'] = math.ceil(MetaData.Body)}
              table.insert(VehicleTable, Vehicle)
          end
          --SetNuiFocus(true, true)
          --Citizen.InvokeNative(0xFC695459D4D0E219, 0.9, 0.25)
          --SendNUIMessage({action = "OpenGarage", garagevehicles = VehicleTable})
          OpenHouseGarageMenu(VehicleTable)
      else
        Framework.Functions.Notify("В този гараж нямате превозни средства", "error", 5000)
      end
  end, HouseId)
end

function OpenHouseGarageMenu(VehicleTable)
    local sendMenu = {}
      sendMenu[#sendMenu+1] = {
          id = 1,
          header = "Гараж",
          txt = "",
          isMenuHeader = true
      }

    for k, v in pairs(VehicleTable) do
        if v['State'] == 'out' then
            sendMenu[#sendMenu+1] = {
                id = #sendMenu+1,
                header = v['Name'],
                txt = v['Plate'].. " | Извън гараж",
                params = {
                    event = "nocore-garages:client:GetVehicle",
                    args = {
                        vehicle = v,
                    }
                }
            }
        else
            sendMenu[#sendMenu+1] = {
                id = #sendMenu+1,
                header = v['Name'],
                txt = v['Plate'].. " | В гараж",
                params = {
                    event = "nocore-garages:client:GetVehicle",
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

function SetVehicleInHouseGarage(HouseId)
  local Vehicle = GetVehiclePedIsIn(PlayerPedId())
  local Plate = exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(Vehicle))
  local engine = GetVehicleEngineHealth(Vehicle)
  if engine < 0 then
    engine = 0
  end
  local VehicleMeta = {Fuel = exports['nocore-fuel']:GetFuelLevel(Plate), Body = GetVehicleBodyHealth(Vehicle), Engine = engine}
  local GarageData = HouseId
  TaskLeaveAnyVehicle(PlayerPedId())
  Citizen.SetTimeout(1650, function()
    TriggerServerEvent('nocore-garages:server:set:in:garage', Plate, GarageData, 'in', VehicleMeta)
    Framework.Functions.DeleteVehicle(Vehicle)
    Framework.Functions.Notify('Паркирано превозно средство в '..HouseId, 'success')
  end)
end


local SetGarageLocation = function(GarageName)
  for k, v in pairs(Config.GarageLocations) do
    if v['Name'] ==  GarageName then
      SetNewWaypoint(v['Coords']['X'], v['Coords']['Y'])
      return
    end
  end
end

exports('SetGarageLocation', SetGarageLocation)