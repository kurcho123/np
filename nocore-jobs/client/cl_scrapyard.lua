local NearScrapYard = false
local Framework = exports['no-core']:GetCoreObject()

local scrapyardZone = BoxZone:Create(vector3(1902.5, 4921.35, 48.74), 6.0, 7.8, {
    name="scrapyardZone",
    heading=70,
    --debugPoly=true
})

scrapyardZone:onPlayerInOut(function(isPointInside)
    NearScrapYard = isPointInside
    if NearScrapYard and IsPedInAnyVehicle(PlayerPedId(), false) then
        exports['okokTextUI']:Open('[Radial Menu] Разфасовка', 'purple', 'left')
    else
        exports['okokTextUI']:Close()
    end
end)

RegisterNetEvent('nocore-materials:client:scrap:vehicle')
AddEventHandler('nocore-materials:client:scrap:vehicle', function()
    local Vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    local driver = GetPedInVehicleSeat(Vehicle, -1)
    Framework.Functions.TriggerCallback('nocore-materials:server:scrap:checkcooldown', function(CanScrap)
        if CanScrap then
            TriggerServerEvent('nocore-materials:server:scrap:cooldown')
            Framework.Functions.TriggerCallback('nocore-materials:server:is:vehicle:owned', function(IsOwned)
                if not IsOwned then
                    if driver == PlayerPedId() then
                    local Time = math.random(30000, 40000)
                    if math.random(1,2) == 1 then
                        TriggerEvent('nocore-dispatch:alerts:scrapyard')
                    end
                    exports['okokTextUI']:Close()
                    Framework.Functions.Progressbar("scrap-vehicle", 'Разфасоване..', Time, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function() -- Done
                        Framework.Functions.DeleteVehicle(Vehicle)
                        Framework.Functions.TriggerCallback('nocore-materials:server:scrap:reward', function() end)
                    end, function() -- Cancel
                        Framework.Functions.Notify("Прекратено", "error")
                    end)
                    else
                        Framework.Functions.Notify("Не си на шофьорското място..", "error")
                    end

                else
                    Framework.Functions.Notify("Този автомобил не може да бъде разфасован", "error")
                end
            end, GetVehicleNumberPlateText(Vehicle))
        else
          Framework.Functions.Notify("Трябва да изчакаш малко повече..", "error")
        end
    end)
end)

function IsNearScrapYard()
  if IsPedSittingInAnyVehicle(PlayerPedId()) then
      return NearScrapYard
  else
      return false
  end
end

exports('IsNearScrapYard', IsNearScrapYard)

function ScrapVehicleAnim(time)
    time = (time / 1000)
    exports['nocore-assets']:RequestAnimationDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    Scrapping = true
    CreateThread(function()
        while Scrapping do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(2000)
			time = time - 2
            if time <= 0 then
                Scrapping = false
                StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end