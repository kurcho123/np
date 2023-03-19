Config = {}

Config.Debug = false

Config.ClothingCost = 100
Config.BarberCost = 100
Config.TattooCost = 100
Config.SurgeonCost = 100

Config.UseTarget = GetConvar("UseTarget", "false") == "true"

Config.EnablePedsForShops = true
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "admin"

Config.AlwaysKeepProps = false

Config.PersistUniforms = false -- Keeps Job / Gang Outfits on player reconnects / logout

Config.OnDutyOnlyClothingRooms = false -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 366,
        Color = 47,
        Scale = 0.7,
        Name = "Clothing Store",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.7,
        Name = "Barber",
    },
    ["tattoo"] = {
        Show = true,
        Sprite = 75,
        Color = 4,
        Scale = 0.7,
        Name = "Tattoo Shop",
    },
    -- ["surgeon"] = {
    --     Show = true,
    --     Sprite = 102,
    --     Color = 4,
    --     Scale = 0.7,
    --     Name = "Plastic Surgeon",
    -- }
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Open Clothing Store",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Open Barber Shop",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Open Tattoo Shop",
        distance = 3
    },
    -- ["surgeon"] = {
    --     model = "s_m_m_doctor_01",
    --     scenario = "WORLD_HUMAN_STAND_MOBILE",
    --     icon = "fas fa-scalpel",
    --     label = "Open Surgeon",
    --     distance = 3
    -- },
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Job / Gang Clothes Menu",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Outfits Menu",
        distance = 3
    },
}

Config.Stores = {
    [1] = {shopType = "clothing", coords = vector4(1693.2, 4828.11, 42.07, 188.66), width = 4, length = 4, showBlip = true}, -- showBlip overrides the blip visibilty configured above for the group
    [2] = {shopType = "clothing", coords = vector4(-705.5, -149.22, 37.42, 122), width = 4, length = 4},
    [3] = {shopType = "clothing", coords = vector4(-1192.61, -768.4, 17.32, 216.6), width = 4, length = 4},
    [4] = {shopType = "clothing", coords = vector4(425.91, -801.03, 29.49, 177.79), width = 4, length = 4},
    [5] = {shopType = "clothing", coords = vector4(-168.73, -301.41, 39.73, 238.67), width = 4, length = 4},
    [6] = {shopType = "clothing", coords = vector4(75.39, -1398.28, 29.38, 6.73), width = 4, length = 4},
    [7] = {shopType = "clothing", coords = vector4(-827.39, -1075.93, 11.33, 294.31), width = 4, length = 4},
    [8] = {shopType = "clothing", coords = vector4(-1445.86, -240.78, 49.82, 36.17), width = 4, length = 4},
    [9] = {shopType = "clothing", coords = vector4(9.22, 6515.74, 31.88, 131.27), width = 4, length = 4},
    [10] = {shopType = "clothing", coords = vector4(615.35, 2762.72, 42.09, 170.51), width = 4, length = 4},
    [11] = {shopType = "clothing", coords = vector4(1191.61, 2710.91, 38.22, 269.96), width = 4, length = 4},
    [12] = {shopType = "clothing", coords = vector4(-3171.32, 1043.56, 20.86, 334.3), width = 4, length = 4},
    [13] = {shopType = "clothing", coords = vector4(-1105.52, 2707.79, 19.11, 317.19), width = 4, length = 4},
    [14] = {shopType = "clothing", coords = vector4(-1207.65, -1456.89, 4.37, 38.59), width = 4, length = 4},
    [15] = {shopType = "clothing", coords = vector4(124.82, -224.36, 54.56, 335.41), width = 2, length = 2},
    [16] = {shopType = "barber", coords = vector4(-814.22, -183.7, 37.57, 116.91), width = 2, length = 2},
    [17] = {shopType = "barber", coords = vector4(136.78, -1708.4, 29.29, 144.19), width = 2, length = 2},
    [18] = {shopType = "barber", coords = vector4(-1282.57, -1116.84, 6.99, 89.25), width = 2, length = 2},
    [19] = {shopType = "barber", coords = vector4(1931.41, 3729.73, 32.84, 212.08), width = 2, length = 2},
    [20] = {shopType = "barber", coords = vector4(1212.8, -472.9, 65.2, 60.94), width = 2, length = 2},
    [21] = {shopType = "barber", coords = vector4(-32.9, -152.3, 56.1, 335.22), width = 2, length = 2},
    [22] = {shopType = "barber", coords = vector4(-278.1, 6228.5, 30.7, 49.32), width = 2, length = 2},
    [23] = {shopType = "tattoo", coords = vector4(1322.6, -1651.9, 51.2, 42.47), width = 2, length = 2},
    [24] = {shopType = "tattoo", coords = vector4(-1154.01, -1425.31, 4.95, 23.21), width = 2, length = 2},
    [25] = {shopType = "tattoo", coords = vector4(322.62, 180.34, 103.59, 156.2), width = 2, length = 2},
    [26] = {shopType = "tattoo", coords = vector4(-3169.52, 1074.86, 20.83, 253.29), width = 2, length = 2},
    [27] = {shopType = "tattoo", coords = vector4(1864.1, 3747.91, 33.03, 17.23), width = 2, length = 2},
    [28] = {shopType = "tattoo", coords = vector4(-294.24, 6200.12, 31.49, 195.72), width = 2, length = 2},
    [29] = {shopType = "clothing", coords = vector4(351.44, -1411.098, 32.504, 331), width = 4, length = 4, showBlip = false},
    [30] = {shopType = "clothing", coords = vector4(362.2520, -1593.33, 24.714, 50.45), width = 4, length = 4, showBlip = false},
    [31] = {shopType = "clothing", coords = vector4(801.59, -830.29, 26.34, 0.0), width = 2, length = 2, showBlip = false},
    [32] = {shopType = "clothing", coords = vector4(-742.72, 504.3, 109.57, 25.0), width = 1.6, length = 4.0, showBlip = false},
    [33] = {shopType = "clothing", coords = vector4(810.56, -759.83, 31.27, 90.0), width = 6.6, length = 2.6, showBlip = false},
    [34] = {shopType = "clothing", coords = vector4(1840.67, 3680.05, 34.19, 30.0), width = 4.8, length = 3.0, showBlip = false},
    [35] = {shopType = "clothing", coords = vector4(-438.53, 6010.12, 37.0, 45.0), width = 3.6, length = 3.2, showBlip = false},
    [36] = {shopType = "clothing", coords = vector4(853.74, -1312.63, 28.24, 0.0), width = 4.0, length = 3.0, showBlip = false},
    [37] = {shopType = "clothing", coords = vector4(481.08, -1324.55, 29.21, 0.0), width = 4.0, length = 3.0, showBlip = false},
    [38] = {shopType = "clothing", coords = vector4(567.17, -2779.7, 6.09, 0.0), width = 4.0, length = 3.0, showBlip = false},
    [39] = {shopType = "clothing", coords = vector4(555.79, -2772.59, 6.09, 0.0), width = 4.0, length = 3.0, showBlip = false},
    [40] = {shopType = "clothing", coords = vector4(868.83, -1539.38, 30.24, 207.58), width = 5.0, length = 3.0, showBlip = false},
    [41] = {shopType = "tattoo", coords = vector4(862.94, -1552.64, 30.26, 306.99), width = 4, length = 4},
}

Config.ClothingRooms = {
    [1] = {requiredJob = "police", isGang = false, coords = vector4(462.85, -999.21, 30.69, 93.35), width = 3, length = 3},
    [2] = {requiredJob = "police", isGang = false, coords = vector4(301.58, -598.82, 43.29, 79.61), width = 3, length = 3}, -- Right double door in Hospital Map that is on QBCore GitHub
}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[
    [1] = {
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        width = 3,
        length = 3,
        citizenIDs = {
            "BHH65156",
        }
    },
    ]]--
}

Config.Outfits = {}