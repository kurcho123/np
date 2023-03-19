Config = {}

Config.VendingObjects = {
    "prop_vend_soda_01",
    "prop_vend_soda_02",
    "prop_vend_water_01"
}

Config.CleanupDropTime = 15 * 60
Config.MaxDropViewDistance = 12.5
Config.UseItemDrop = true
Config.ItemDropObject = `sf_prop_sf_backpack_01a`

Config.VendingItem = {
    [1] = {
        name = "chocolade",
        price = 70,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "donut",
        price = 90,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "water",
        price = 50,
        amount = 50,
        info = {},
        type = "item",
        slot = 3,
    },
}

MaxInventorySlots = 41

Config.TrunkClasses = {
    [0] = {['MaxWeight'] = 14000, ['MaxSlots'] = 3},
    [1] = {['MaxWeight'] = 25000, ['MaxSlots'] = 5},
    [2] = {['MaxWeight'] = 25000, ['MaxSlots'] = 5},
    [3] = {['MaxWeight'] = 14000, ['MaxSlots'] = 3},
    [4] = {['MaxWeight'] = 14000, ['MaxSlots'] = 3},
    [5] = {['MaxWeight'] = 14000, ['MaxSlots'] = 3},
    [6] = {['MaxWeight'] = 14000, ['MaxSlots'] = 3},
    [7] = {['MaxWeight'] = 14000, ['MaxSlots'] = 3},
    [9] = {['MaxWeight'] = 25000, ['MaxSlots'] = 5},
    [10] = {['MaxWeight'] = 160000, ['MaxSlots'] = 5},
    [11] = {['MaxWeight'] = 160000, ['MaxSlots'] = 5},
    [12] = {['MaxWeight'] = 160000, ['MaxSlots'] = 5},
    [13] = {['MaxWeight'] = 160000, ['MaxSlots'] = 5},
    [14] = {['MaxWeight'] = 10000, ['MaxSlots'] = 5},
    [15] = {['MaxWeight'] = 10000, ['MaxSlots'] = 5},
    [17] = {['MaxWeight'] = 10000, ['MaxSlots'] = 5},
    [18] = {['MaxWeight'] = 55000, ['MaxSlots'] = 5},
    [19] = {['MaxWeight'] = 160000, ['MaxSlots'] = 10},
    [20] = {['MaxWeight'] = 160000, ['MaxSlots'] = 10},
}

Config.Dumpsters = {
    [1] = {['Model'] = 666561306,    ['Name'] = 'Blauwe Bak'},
    [2] = {['Model'] = 218085040,    ['Name'] = 'Licht Blauwe Bak'},
    [3] = {['Model'] = -58485588,    ['Name'] = 'Grijze Bak'},
    [4] = {['Model'] = 682791951,    ['Name'] = 'Grote Blauwe Bak'},
    [5] = {['Model'] = -206690185,   ['Name'] = 'Grote Groene Bak'},
    [6] = {['Model'] = 364445978,    ['Name'] = 'Grote Groene Bak'},
    [7] = {['Model'] = 143369,       ['Name'] = 'Kleine Bak'},
    [8] = {['Model'] = -2140438327,  ['Name'] = 'Unknow Bak'},
    [9] = {['Model'] = -1851120826,  ['Name'] = 'Unknow Bak'},
    [10] = {['Model'] = -1543452585, ['Name'] = 'Unknow Bak'},
    [11] = {['Model'] = -1207701511, ['Name'] = 'Unknow Bak'},
    [12] = {['Model'] = -918089089,  ['Name'] = 'Unknow Bak'},
    [13] = {['Model'] = 1511880420,  ['Name'] = 'Unknow Bak'},
    [14] = {['Model'] = 1329570871,  ['Name'] = 'Unknow Bak'},
}


BackEngineVehicles = {
    [`ninef`] = true,
    [`adder`] = true,
    [`vagner`] = true,
    [`t20`] = true,
    [`infernus`] = true,
    [`zentorno`] = true,
    [`reaper`] = true,
    [`comet2`] = true,
    [`comet3`] = true,
    [`jester`] = true,
    [`jester2`] = true,
    [`cheetah`] = true,
    [`cheetah2`] = true,
    [`prototipo`] = true,
    [`turismor`] = true,
    [`pfister811`] = true,
    [`ardent`] = true,
    [`nero`] = true,
    [`nero2`] = true,
    [`tempesta`] = true,
    [`vacca`] = true,
    [`bullet`] = true,
    [`osiris`] = true,
    [`entityxf`] = true,
    [`turismo2`] = true,
    [`fmj`] = true,
    [`re7b`] = true,
    [`tyrus`] = true,
    [`italigtb`] = true,
    [`penetrator`] = true,
    [`monroe`] = true,
    [`ninef2`] = true,
    [`stingergt`] = true,
    [`surfer`] = true,
    [`surfer2`] = true,
    [`gp1`] = true,
    [`autarch`] = true,
    [`tyrant`] = true,
    [`deluxo6str`] = true,
    [`comet6`] = true,
}

Config.MaximumAmmoValues = {
    ["pistol"] = 250,
    ["smg"] = 250,
    ["shotgun"] = 200,
    ["rifle"] = 250,
}
