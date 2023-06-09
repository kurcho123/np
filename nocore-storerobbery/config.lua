Config = {}

Config.minEarn = 100
Config.maxEarn = 450
Config.RegisterEarnings = math.random(Config.minEarn, Config.maxEarn)
Config.MinimumStoreRobberyPolice = 5

Config.Registers = {
    [1] = {x = -47.24, y = -1757.65, z = 29.53, robbed = false, time = 0, safeKey = 1, camId = 4},
    [2] = {x = -48.58, y = -1759.21, z = 29.59, robbed = false, time = 0, safeKey = 1, camId = 4},
    [3] = {x = -1486.26, y = -378.0, z = 40.16, robbed = false, time = 0, safeKey = 2, camId = 5},
    [4] = {x = -1222.03, y = -908.32, z = 12.32, robbed = false, time = 0, safeKey = 3, camId = 6},
    [5] = {x = -706.08, y = -915.42, z = 19.21, robbed = false, time = 0, safeKey = 4, camId = 7},
    [6] = {x = -706.16, y = -913.5, z = 19.21, robbed = false, time = 0, safeKey = 4, camId = 7},
    [7] = {x = 24.47, y = -1344.99, z = 29.49, robbed = false, time = 0, safeKey = 5, camId = 8},
    [8] = {x = 24.45, y = -1347.37, z = 29.49, robbed = false, time = 0, safeKey = 5, camId = 8},
    [9] = {x = 1134.15, y = -982.53, z = 46.41, robbed = false, time = 0, safeKey = 6, camId = 9},
    [10] = {x = 1165.05, y = -324.49, z = 69.2, robbed = false, time = 0, safeKey = 7, camId = 10},
    [11] = {x = 1164.7, y = -322.58, z = 69.2, robbed = false, time = 0, safeKey = 7, camId = 10},
    [12] = {x = 373.14, y = 328.62, z = 103.56, robbed = false, time = 0, safeKey = 8, camId = 11},
    [13] = {x = 372.57, y = 326.42, z = 103.56, robbed = false, time = 0, safeKey = 8, camId = 11},
    [14] = {x = -1818.9, y = 792.9, z = 138.08, robbed = false, time = 0, safeKey = 9, camId = 12},
    [15] = {x = -1820.17, y = 794.28, z = 138.08, robbed = false, time = 0, safeKey = 9, camId = 12},
    [16] = {x = -2966.46, y = 390.89, z = 15.04, robbed = false, time = 0, safeKey = 10, camId = 13},
    [17] = {x = -3041.14, y = 583.87, z = 7.9, robbed = false, time = 0, safeKey = 11, camId = 14},
    [18] = {x = -3038.92, y = 584.5, z = 7.9, robbed = false, time = 0, safeKey = 11, camId = 14},
    [19] = {x = -3244.56, y = 1000.14, z = 12.83, robbed = false, time = 0, safeKey = 12, camId = 15},
    [20] = {x = -3242.24, y = 999.98, z = 12.83, robbed = false, time = 0, safeKey = 12, camId = 15},
    [21] = {x = 549.42, y = 2669.06, z = 42.15, robbed = false, time = 0, safeKey = 13, camId = 16},
    [22] = {x = 549.05, y = 2671.39, z = 42.15, robbed = false, time = 0, safeKey = 13, camId = 16},
    [23] = {x = 1165.9, y = 2710.81, z = 38.15, robbed = false, time = 0, safeKey = 14, camId = 17},
    [24] = {x = 2676.02, y = 3280.52, z = 55.24, robbed = false, time = 0, safeKey = 15, camId = 18},
    [25] = {x = 2678.07, y = 3279.39, z = 55.24, robbed = false, time = 0, safeKey = 15, camId = 18},
    [26] = {x = 1958.96, y = 3741.98, z = 32.34, robbed = false, time = 0, safeKey = 16, camId = 19},
    [27] = {x = 1960.13, y = 3740.0, z = 32.34, robbed = false, time = 0, safeKey = 16, camId = 19},
    [28] = {x = 1728.86, y = 6417.26, z = 35.03, robbed = false, time = 0, safeKey = 17, camId = 20},
    [29] = {x = 1727.85, y = 6415.14, z = 35.03, robbed = false, time = 0, safeKey = 17, camId = 20},
    [30] = {x = -161.07, y = 6321.23, z = 31.5, robbed = false, time = 0, safeKey = 18, camId = 27},
    [31] = {x = 160.52, y = 6641.74, z = 31.6, robbed = false, time = 0, safeKey = 19, camId = 28},
    [32] = {x = 162.16, y = 6643.22, z = 31.6, robbed = false, time = 0, safeKey = 19, camId = 29},
    [33] = {x = -2070.25, y = -333.25, z = 13.31, robbed = false, time = 0, safeKey = 20, camId = 37},
    [34] = {x = -2072.17, y = -333.13, z = 13.31, robbed = false, time = 0, safeKey = 20, camId = 37},
    [35] = {x = 812.75, y = -783.19, z = 26.17, robbed = false, time = 0, safeKey = 21, camId = 38},
    [36] = {x = 812.86, y = -781.04, z = 26.17, robbed = false, time = 0, safeKey = 21, camId = 38},
}

Config.Safes = {
    [1] = {x = -43.43, y = -1748.3, z = 29.42, h = 52.5, type = "keypad", robbed = false, camId = 4}, 
    [2] = {x = -1478.94, y = -375.5, z = 39.16, h = 229.5, type = "padlock", robbed = true, camId = 5},
    [3] = {x = -1220.85, y = -916.05, z = 11.32, h = 229.5, type = "padlock", robbed = true, camId = 6},
    [4] = {x = -709.74, y = -904.15, z = 19.21, h = 229.5, type = "keypad", robbed = false, camId = 7},
    [5] = {x = 31.039337, y = -1339.358, z = 29.496965, type = "keypad", robbed = false, camId = 8},
    [6] = {x = 1126.77, y = -980.1, z = 45.41, type = "padlock", robbed = true, camId = 9},
    [7] = {x = 1159.46, y = -314.05, z = 69.2, type = "keypad", robbed = false, camId = 10},
    [8] = {x = 380.89135, y = 332.46771, z = 103.56632, type = "keypad", robbed = false, camId = 11},
    [9] = {x = -1829.27, y = 798.76, z = 138.19, type = "keypad", robbed = false, camId = 12},
    [10] = {x = -2959.64, y = 387.08, z = 14.04, type = "padlock", robbed = true, camId = 13},
    [11] = {x = -3048.632, y = 588.11688, z = 7.9088616, type = "keypad", robbed = false, camId = 14},
    [12] = {x = -3249.704, y = 1007.0072, z = 12.830643, type = "keypad", robbed = false, camId = 15},
    [13] = {x = 543.69635, y = 2662.5446, z = 42.156452, type = "keypad", robbed = false, camId = 16},
    [14] = {x = 1169.31, y = 2717.79, z = 37.15, type = "padlock", robbed = true, camId = 17},
    [15] = {x = 2674.268, y = 3289.0588, z = 55.241069, type = "keypad", robbed = false, camId = 18},
    [16] = {x = 1961.738, y = 3750.3139, z = 32.343708, type = "keypad", robbed = false, camId = 19},
    [17] = {x = 1737.2591, y = 6419.5043, z = 35.037155, type = "keypad", robbed = false, camId = 20},
    [18] = {x = -168.40, y = 6318.80, z = 30.58, type = "padlock", robbed = true, camId = 27},
    [19] = {x = 170.82835, y = 6642.6777, z = 31.700822, type = "keypad", robbed = false, camId = 30},
    [20] = {x = -2060.50, y = -330.63, z = 13.31, type = "keypad", robbed = false, camId = 37},
    [21] = {x = 819.186, y = -774.593, z = 26.175, type = "keypad", robbed = false, camId = 39},
}

Config.ResetTimeRegister = 30
Config.ResetTimeSafe = 60

Config.MaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [18] = true,
    [26] = true,
    [52] = true,
    [53] = true,
    [54] = true,
    [55] = true,
    [56] = true,
    [57] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [112] = true,
    [113] = true,
    [114] = true,
    [118] = true,
    [125] = true,
    [132] = true,
}
Config.FemaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [19] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [67] = true,
    [68] = true,
    [69] = true,
    [70] = true,
    [71] = true,
    [129] = true,
    [130] = true,
    [131] = true,
    [135] = true,
    [142] = true,
    [149] = true,
    [153] = true,
    [157] = true,
    [161] = true,
    [165] = true,
}
