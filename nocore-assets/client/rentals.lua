local Framework = exports['no-core']:GetCoreObject()
local SpawnVehicle = false

local locations = {
    cars = {
        coords = vector4(109.9739, -1088.61, 28.302, 345.64),
        pedhash = `a_m_y_business_03`,
        spawnpoint = {x = 111.4223, y = -1081.24, z = 29.192, a = 340.0},
    },

    boats = {
        coords = vector4(-753.5, -1512.27, 4.02, 25.61),
        pedhash = `mp_m_boatstaff_01`,
        spawnpoint = {x = -833.2847, y = -1525.474, z = 1.1150941, a = 135.0},
    },

    -- maybe?
    aircraft = {}
}


local rentalsVehicles = {
    -- Boats
    boats = {
        {name = "Джет", model = 'seashark3', price = 150},
        {name = "Dinghy", model = 'dinghy3', price = 400},
        {name = "Tropic", model = 'tropic', price = 400},
        {name = "Marquis", model = 'marquis', price = 800},
        {name = "Tug", model = 'tug', price = 1200},
    },

    -- Cars
    cars = {
        {name = "Boat Trailer", model = "boattrailer", price = 500},
        {name = "Bison", model = "bison", price = 500},
        {name = "Futo", model = "futo", price = 500},
        {name = "Buccaneer", model = "buccaneer", price = 625},
        {name = "Coach", model = "coach", price = 800},
        {name = "Shuttle Bus", model = "rentalbus", price = 800},
        {name = "Tour Bus", model = "tourbus", price = 800},
        {name = "Limo", model = "stretch", price = 1500},
        {name = "Romero", model = "romero", price = 15800},
        {name = "Veto", model = "veto", price = 5000},
        {name = "Festival Bus", model = "pbus2", price = 10000},
    },

    -- maybe?
    aircraft = {}
}

RegisterNetEvent('nocore-rental:client:openMenu', function(data)
    rentalMenu = data.MenuType
    local contextMenu = {}

    contextMenu[#contextMenu+1] = {
        id = 1,
        header = "Наем на МПС",
        isMenuHeader = true,
        icon = 'fa-solid fa-file-signature',
    }
    if rentalMenu == "boats" then
        for i = 1, #rentalsVehicles.boats do
            contextMenu[#contextMenu+1] = {
            id = #contextMenu+1,
            header = rentalsVehicles.boats[i].name,
            txt = "Наеми "..rentalsVehicles.boats[i].name.." за $"..rentalsVehicles.boats[i].price,
            icon = 'fa-solid fa-sailboat',
            params = {
                event = "nocore-rental:client:spawncar",
                args = {
                    money = rentalsVehicles.boats[i].price,
                    model = rentalsVehicles.boats[i].model,
                }
            }
        }
        end
    elseif rentalMenu == "cars" then
        for i = 1, #rentalsVehicles.cars do
            contextMenu[#contextMenu+1] = {
            id = #contextMenu+1,
            header = rentalsVehicles.cars[i].name,
            txt = "Наеми "..rentalsVehicles.cars[i].name.." за $"..rentalsVehicles.cars[i].price,
            icon = 'fa-solid fa-car',
            params = {
                event = "nocore-rental:client:spawncar",
                args = {
                    money = rentalsVehicles.cars[i].price,
                    model = rentalsVehicles.cars[i].model,
                }
            }
        }
        end
    end
    contextMenu[#contextMenu+1] = {
        id = #contextMenu+1,
        header = "Върни МПС",
        txt = "",
        icon = 'fa-solid fa-angle-left',
        params = {
            event = "nocore-rental:client:return",
            args = {}
        }
    }
    contextMenu[#contextMenu+1] = {
        id = #contextMenu+1,
        header = "Затвори",
        txt = "",
        icon = 'fa-solid fa-xmark',
        params = {
            event = "nocore-context:close",
            args = {}
        }
    }
    exports['nocore-context']:openMenu(contextMenu)
end)

RegisterNetEvent('nocore-rental:client:spawncar', function(data)
    local player = PlayerPedId()
    local money = data.money
    local model = data.model

    if rentalMenu == "cars" then
        if IsAnyVehicleNearPoint(locations.cars.spawnpoint.x, locations.cars.spawnpoint.y, locations.cars.spawnpoint.z, 15.0) then
            Framework.Functions.Notify("Няма свободно място", "error", 4500)
            return
        end
    elseif rentalMenu == "boats" then
        if IsAnyVehicleNearPoint(locations.boats.spawnpoint.x, locations.boats.spawnpoint.y, locations.boats.spawnpoint.z, 15.0) then
            Framework.Functions.Notify("Няма свободно място", "error", 4500)
            return
        end
    end

    Framework.Functions.TriggerCallback("nocore-rental:server:CashCheck",function(money)
        if money then
            if rentalMenu == "cars" then
                Framework.Functions.SpawnVehicle(model, function(vehicle)
                    SetEntityHeading(vehicle, locations.cars.spawnpoint.w)
                    TaskWarpPedIntoVehicle(player, vehicle, -1)
                    exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
                    exports['nocore-fuel']:SetFuelLevel(vehicle, GetVehicleNumberPlateText(vehicle), 100, false)
                    SetVehicleEngineOn(vehicle, true, true)
                    SetVehicleDirtLevel(vehicle, 0.0)
                    SpawnVehicle = true
                end, locations.cars.spawnpoint, true)
            elseif rentalMenu == "boats" then
                Framework.Functions.SpawnVehicle(model, function(vehicle)
                    SetEntityHeading(vehicle, locations.boats.spawnpoint.w)
                    TaskWarpPedIntoVehicle(player, vehicle, -1)
                    exports['nocore-vehiclekeys']:SetVehicleKey(GetVehicleNumberPlateText(vehicle), true)
                    exports['nocore-fuel']:SetFuelLevel(vehicle, GetVehicleNumberPlateText(vehicle), 100, false)
                    SetVehicleEngineOn(vehicle, true, true)
                    SetVehicleDirtLevel(vehicle, 0.0)
                    SpawnVehicle = true
                end, locations.boats.spawnpoint, true)
            end
            Wait(1000)
            local vehicle = GetVehiclePedIsIn(player, false)
            local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            vehicleLabel = GetLabelText(vehicleLabel)
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent('nocore-rental:server:rentalpapers', plate, vehicleLabel)
        else
            Framework.Functions.Notify("Нямаш достатъчно пари", "error", 4500)
        end
    end, money)
end)

RegisterNetEvent('nocore-rental:client:return', function()
    if SpawnVehicle then
        Framework.Functions.Notify('Превозното средство е успешно върнато', 'success')
        TriggerServerEvent('nocore-rental:server:removepapers')
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        Wait(2000)
        Framework.Functions.DeleteVehicle(car)
    else
        Framework.Functions.Notify("Няма МПС за връщане")
    end
    SpawnVehicle = false
end)

local CreateNPC = function()
    -- Vehicle Rentals
    created_ped = CreatePed(5, locations.cars.pedhash, locations.cars.coords.x, locations.cars.coords.y, locations.cars.coords.z, locations.cars.coords.w, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)

    -- Boat Rentals
    created_ped = CreatePed(5, locations.boats.pedhash, locations.boats.coords.x, locations.boats.coords.y, locations.boats.coords.z, locations.boats.coords.w, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

local SpawnNPC = function()
    CreateThread(function()
        -- Vehicle Rentals
        RequestModel(locations.cars.pedhash)
        while not HasModelLoaded(locations.cars.pedhash) do
            Wait(1)
        end
        -- Boat Rentals
        RequestModel(locations.boats.pedhash)
        while not HasModelLoaded(locations.boats.pedhash) do
            Wait(1)
        end
        CreateNPC() 
    end)
end

CreateThread(function()
    SpawnNPC()
end)

CreateThread(function()
    exports['nocore-eye']:AddCircleZone("VehiclePed", vector3(109.9739, -1088.61, 28.302), 0.4, { 
        name = "vehicleped", 
        debugPoly = false,
        }, {
        options = {
            {
                type = "client",
                event = "nocore-rental:client:openMenu",
                icon = "fas fa-car",
                label = "Наеми кола",
                MenuType = "cars",
            },
        },
        distance = 3.0
    })

    exports['nocore-eye']:AddCircleZone("BoatPed", vector3(-753.5, -1512.27, 4.02), 0.4, { 
        name = "boatped", 
        debugPoly = false,
        }, {
        options = {
            {
                type = "client",
                event = "nocore-rental:client:openMenu",
                icon = "fa-solid fa-sailboat",
                label = "Наеми лодка",
                MenuType = "boats"
            },
        },
        distance = 3.0
    })
end)