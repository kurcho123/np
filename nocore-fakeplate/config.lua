

Config = {
    CorePrefix = 'no-core', -- Core Prefix
    CoreName = 'Framework', -- Core Prefix
    ToolkitItem = 'toolkit', -- Toolkit Item Name
    FakePlateItem = 'fakeplate', -- FakePlate Item Name
    InventoryBoxEvent = 'nocore-inventory:client:ItemBox', -- Inventory Box Event
    AllVehicles = false, -- Get fake license plate of all vehicles? if set to false then you need to add the vehicle with exports['nocore-fakeplate']:AddPlate(Plate)
    GetPlateOnRemove = false, 
    Nolag = true,
    QbMenu = false, -- Use qb-menu
    UseDpEmotes = false, -- Use dpemotes?
    Progressbar = {
        Duration = 5000,
        Label = 'Changing license plate..'
    },
    ContextMenu = {
        Header = "Toolkit",
        Change = {
            Header = "Change license plate",
            Info = "Switch the plate with fake plate",
        },
        Remove = {
            Header = "Remove license plate",
            Info = "Get the plate as item",
        },
        Close = "Close",
    },
    Mysql = "ghmattisql", -- ghmattisql, oxmysql, mysql-async
    Database = {
        OwnedVehiclesTable = 'characters_vehicles',
        PlateColumn = 'plate'
    },
    FakePlateAccess = {
        [1] = {coords = vector3(1174.9943, 2640.6381, 37.753833), job = 'oldtown', jobGrade = 3, distance = 10},
        [2] = {coords = vector3(1133.89, -793.34, 57.09), job = 'misfits', jobGrade = 2, distance = 10},
        [3] = {coords = vector3(534.9, -180.67, 54.32), job = 'fixit', jobGrade = 2, distance = 10},
        [4] = {coords = vector3(914.92, -1559.53, 30.74), job = 'jamals', jobGrade = 0, distance = 30},
    }
}