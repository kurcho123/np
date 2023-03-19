local insidePoliceStationGarage = false
local insidePoliceStationHeli = false
local insideAmbulanceFix = false
--[[ Poly Zones ]]

local PoliceStationGarage = BoxZone:Create(vector3(380.71, -1626.15, 29.29), 10, 15.2, {
    name="Police Mechanic",
    heading=49,
    --debugPoly=true
})

local PoliceStationGarageRangers = BoxZone:Create(vector3(374.39, 796.51, 187.28), 4.6, 9.0, {
    name="Park Rangers Mechanic",
    heading=90,
    --debugPoly=true
})

local PoliceStationGaragePaleto = PolyZone:Create({
    vector2(-458.61679077148, 6039.384765625),
    vector2(-466.5903930664, 6046.21875),
    vector2(-487.94467163086, 6024.80859375),
    vector2(-481.3544921875, 6017.763671875)
}, {
    name="Police Paleto",
    --minZ = 31.340478897094,
    --maxZ = 31.340543746948
})

local PoliceStationGarageVespuci = BoxZone:Create(vector3(-1071.13, -853.46, 4.87), 4.6, 7.8, {
    name="Police Vespuci Mehcanic",
    heading=37,
    --debugPoly=true
})
  
local PoliceStationGarageHSPD = BoxZone:Create(vector3(871.36, -1350.15, 26.31), 7.0, 11.8, {
    name="Police HSPD ",
    heading=0,
    --debugPoly=true
})

local PoliceStationGarageSandy = BoxZone:Create(vector3(1846.4384, 3686.663, 33.974578), 30.4, 6.0, {
    name="Sandy Garage",
    heading=300,
    minZ=32.71,
    maxZ=36.71
})

local PoliceStationHeliDavis = BoxZone:Create(vector3(313.18, -1464.95, 46.51), 11.0, 11.0, {
    name="Police Heli",
    heading=321,
    debugPoly=false
})

local PoliceStationHeliSandy = BoxZone:Create(vector3(1853.59, 3706.31, 33.97), 11.0, 11.05, {
    name="PoliceSandyHeliRepair",
    heading=300,
})

local PoliceStationHeliPaleto = BoxZone:Create(vector3(-475.03, 5989.07, 31.34), 27.8, 20.4, {
    name="PolicePaletoHeliRepair",
    heading=45,
})

local AmbulanceFixFraudGarage = BoxZone:Create(vector3(831.74, -785.47, 26.21), 3.4, 5.6, {
    name="AmbulanceFixFraudGarage",
    heading=25,
    --debugPoly=true
})

local AmbulanceFixAutoDeluxe = BoxZone:Create(vector3(548.46, -205.72, 54.11), 6.0, 6.0, {
    name="AmbulanceFixAutoDeluxe",
    heading=0,
    --debugPoly=true
})

-- PolyZones loops
PoliceStationGarage:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationGarage = isPointInside
    end
end)
PoliceStationGarageRangers:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationGarage = isPointInside
    end
end)
PoliceStationGaragePaleto:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationGarage = isPointInside
    end
end)
PoliceStationGarageVespuci:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationGarage = isPointInside
    end
end)
PoliceStationGarageHSPD:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationGarage = isPointInside
    end
end)
PoliceStationGarageSandy:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationGarage = isPointInside
    end
end)
PoliceStationHeliDavis:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationHeli = isPointInside
    end
end)
PoliceStationHeliSandy:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationHeli = isPointInside
    end
end)
PoliceStationHeliPaleto:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insidePoliceStationHeli = isPointInside
    end
end)
AmbulanceFixFraudGarage:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insideAmbulanceFix = isPointInside
    end
end)
AmbulanceFixAutoDeluxe:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if LocalPlayer.state['isLoggedIn'] then
        insideAmbulanceFix = isPointInside
    end
end)

RegisterNetEvent('nocore-police:client:OpenExtraMenu')
AddEventHandler('nocore-police:client:OpenExtraMenu', function()
    if insidePoliceStationGarage then
        local sendMenu = {}
        table.insert(sendMenu,{
            id = 1,
            header = "Vehicle Extras",
            txt = "",
            isMenuHeader = true
        })
        for i=1,14,1 do     
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            if DoesExtraExist(vehicle,i) then 
                local extraStatus = IsVehicleExtraTurnedOn(vehicle,i)
                if extraStatus == 1 then extraStatus = "<span style='color: green; font-weight: bold; padding-left: 4px;'> ON</span> " else extraStatus = "<span style='color: red; font-weight: bold; padding-left: 4px; '> OFF</span> " end
                table.insert(sendMenu,{
                    id = #sendMenu+1,
                    header = "Toggle Extra "..i..": "..extraStatus,
                    txt = "",
                    params = { 
                        event = "toggleextra",
                        args = {
                            vehicle = vehicle,
                            extra = i
                        }
                    }
                })
            end
        end 
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Cancel",
            txt = "",
            params = { 
                event = "fakeevent",
                args = {}
            }
        })
        exports['nocore-context']:openMenu(sendMenu)
    else
        Framework.Functions.Notify("Трябва да сте в гараж", "error")
    end
end)


AddEventHandler('toggleextra',function(data)
    local extraStatus = IsVehicleExtraTurnedOn(data.vehicle,data.extra)
    if extraStatus == 1 then 
        SetVehicleExtra(data.vehicle, data.extra, 1)
    else 
        SetVehicleExtra(data.vehicle, data.extra, 0)
    end 
    TriggerEvent('nocore-police:client:OpenExtraMenu')
end)

RegisterNetEvent('nocore-police:client:OpenLiveryMenu')
AddEventHandler('nocore-police:client:OpenLiveryMenu', function()
    if insidePoliceStationGarage then
        local sendMenu = {}
        table.insert(sendMenu,{
            id = 1,
            header = "Vehicle Liveries",
            txt = "",
            isMenuHeader = true
        })
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local count = GetVehicleLiveryCount(vehicle)
        for i=1,count,1 do     
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = "Toggle Livery "..i,
                txt = "",
                params = { 
                    event = "togglelivery",
                    args = {
                        vehicle = vehicle,
                        livery = i
                    }
                }
            })
        end 
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Cancel",
            txt = "",
            params = { 
                event = "fakeevent",
                args = {}
            }
        })
        exports['nocore-context']:openMenu(sendMenu)
    else
        Framework.Functions.Notify("Трябва да сте в гараж", "error")
    end
end)

AddEventHandler('togglelivery',function(data)
    SetVehicleLivery(data.vehicle,data.livery)
    TriggerEvent('nocore-police:client:OpenLiveryMenu')
end)

RegisterNetEvent('nocore-police:client:RepairVehicle')
AddEventHandler('nocore-police:client:RepairVehicle', function()
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    print(GetVehicleClass(Veh))
    if insidePoliceStationGarage then
        if Veh ~= nil then
            Framework.Functions.Progressbar('PoliceRepair', 'Вашето МПС се поправя', math.random(10000,15000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function() -- Done
                   SetVehicleFixed(Veh)
                   SetVehicleDirtLevel(Veh, 0)
                   if GetVehicleClass(Veh) == 15 then
                    exports['nocore-fuel']:SetFuelLevel(Veh, GetVehicleNumberPlateText(Veh), 100.0, false)
                   else
                    exports['nocore-fuel']:SetFuelLevel(Veh, GetVehicleNumberPlateText(Veh), 100.0, false)
                   end
                   Framework.Functions.Notify("Вашето МПС бе поправено и заредено до горе!")
            end, function() -- Cancel
                Framework.Functions.Notify("Вие отказахте поправката на вашето мпс!")
            end)
        else
            Framework.Functions.Notify("Трябва да сте в МПС", "error")
        end
    elseif insidePoliceStationHeli then
        if GetEntityModel(Veh) == GetHashKey("as350") then
            Framework.Functions.Progressbar('PoliceRepair', 'Вашето МПС се поправя', 60000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function() -- Done
                   SetVehicleFixed(Veh)
                   SetVehicleDirtLevel(Veh, 0)
                   exports['nocore-fuel']:SetFuelLevel(Veh, GetVehicleNumberPlateText(Veh), 100.0, false)
                   Framework.Functions.Notify("Вашето МПС бе поправено и заредено до горе!")
            end, function() -- Cancel
                Framework.Functions.Notify("Вие отказахте поправката на вашето мпс!")
            end)
        else
            Framework.Functions.Notify("Трябва да сте в МПС", "error")
        end
    else
        Framework.Functions.Notify("Трябва да сте в гараж", "error")
    end
end)

RegisterNetEvent('nocore-police:client:RepairVehicleambulance')
AddEventHandler('nocore-police:client:RepairVehicleambulance', function()
    local Veh = GetVehiclePedIsIn(PlayerPedId())

    if GetVehicleClass(Veh) == 18 then
        if insideAmbulanceFix then
             if Veh ~= nil then
                Framework.Functions.Progressbar('AmbRepair', 'Вашето МПС се поправя', math.random(10000,15000), false, true, {
                   disableMovement = true,
                   disableCarMovement = true,
                   disableMouse = false,
                   disableCombat = true,
                   disableInventory = true,
                   }, {}, {}, {}, function() -- Done
                   SetVehicleFixed(Veh)
                   SetVehicleDirtLevel(Veh, 0)
                   Framework.Functions.TriggerCallback('nocore-police:takerepmoney', function(result)
                        if result then
                            Framework.Functions.Notify("Вашето МПС бе поправено!")
                        end
                    end)
                end, function() -- Cancel
                    Framework.Functions.Notify("Вие отказахте поправката на вашето мпс!")
                end)
            else
                Framework.Functions.Notify("Трябва да сте в МПС", "error")
            end
        end
    end
end)