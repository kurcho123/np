Shared = {}
Shared.Debug = false

Shared['PaletoHeist'] = {
    ['startHeist'] = {
        pos = vector3(-104.2561, 6474.5864, 31.645433),
    },
    ['requiredPoliceCount'] = 9,
    ['Restaurants'] = {
        'Yellow Jack',
        'Pacific Bluffs',
        'Tequila',
        'El Cafe Rojo De Madera',
        'Hookies'
    },
    ['safeTargets'] = {
        [1] = {coords = vector3(-97.44, 6464.37, 31.63), heading = 315, minZ = 31.88, maxZ = 32.13},
        [2] = {coords = vector3(-96.25, 6463.11, 31.63), heading = 315, minZ = 31.68, maxZ = 31.98},
        [3] = {coords = vector3(-96.9, 6463.69, 31.63), heading = 315, minZ = 31.23, maxZ = 31.83},
        [4] = {coords = vector3(-95.75, 6460.43, 31.63), heading = 45, minZ = 31.03, maxZ = 31.83},
        [5] = {coords = vector3(-96.98, 6459.23, 31.63), heading = 45, minZ = 31.68, maxZ = 32.08},
        [6] = {coords = vector3(-96.26, 6459.73, 31.63), heading = 45, minZ = 32.33, maxZ = 32.53},
        [7] = {coords = vector3(-99.32, 6458.84, 31.63), heading = 315, minZ = 32.38, maxZ = 32.73},
        [8] = {coords = vector3(-100.29, 6459.67, 31.63), heading = 315, minZ = 31.83, maxZ = 32.23},
        [9] = {coords = vector3(-100.88, 6460.31, 31.63), heading = 315, minZ = 31.83, maxZ = 32.23},
        [10] = {coords = vector3(-101.79, 6461.24, 31.63), heading = 315, minZ = 32.03, maxZ = 32.43}
    },
    ['vaultTrolleys'] = {
        'prop_gold_trolly',
        'prop_cash_trolly'
    }
}

Shared['YachtHeist'] = {
    ['startHeist'] = {
        pos = vector3(-2044.108, -1031.618, 11.980372),
    },
    ['requiredPoliceCount'] = 8,
    ['guardPeds'] = {
        { coords = vector3(-2071.162, -1017.135, 5.884149), heading = 339.5364, model = 's_m_y_blackops_01'},
        { coords = vector3(-2076.445, -1023.362, 5.8934292), heading = 165.52304, model = 's_m_y_blackops_01'},
        { coords = vector3(-2121.63, -1006.63, 8.01), heading = 248.59, model = 's_m_y_blackops_01'},
        { coords = vector3(-2084.43, -1017.56, 12.78), heading = 272.48, model = 's_m_y_blackops_01'},
        { coords = vector3(-2033.83, -1028.77, 5.88), heading = 235.21, model = 's_m_y_blackops_01'},
        { coords = vector3(-2038.58, -1040.2, 5.88), heading = 260.66, model = 's_m_y_blackops_01'},
    },
}

Shared['ArtHeist'] = {
    ['nextRob'] = 1800, -- seconds for next heist
    ['startHeist'] ={ -- heist start coords
        pos = vector3(244.346, 374.012, 105.738),
        peds = {
            {pos = vector3(244.346, 374.012, 105.738), heading = 156.39, ped = 's_m_m_highsec_01'},
            {pos = vector3(243.487, 372.176, 105.738), heading = 265.63, ped = 's_m_m_highsec_02'},
            {pos = vector3(245.074, 372.730, 105.738), heading = 73.3, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['sellPainting'] ={ -- sell painting coords
        pos = vector3(288.558, -2981.1, 5.90696),
        peds = {
            {pos = vector3(288.558, -2981.1, 5.90696), heading = 135.88, ped = 's_m_m_highsec_01'},
            {pos = vector3(287.190, -2980.9, 5.72252), heading = 218.0, ped = 's_m_m_highsec_02'},
            {pos = vector3(287.731, -2982.6, 5.82852), heading = 336.08, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['painting'] = {
        {
            rewardItem = 'paint2', -- u need add item to database
            paintingPrice = '300', -- price of the reward item for sell
            scenePos = vector3(1400.486, 1164.55, 113.4136), -- animation coords
            sceneRot = vector3(0.0, 0.0, -90.0), -- animation rotation
            object = 'ch_prop_vault_painting_01e', -- object (https://mwojtasik.dev/tools/gtav/objects/search?name=ch_prop_vault_painting_01)
            objectPos = vector3(1400.946, 1164.55, 114.5336), -- object spawn coords
            objHeading = 270.0 -- object spawn heading
        },
        {
            rewardItem = 'paint6',
            paintingPrice = '300',
            scenePos = vector3(1408.175, 1144.014, 113.4136),
            sceneRot = vector3(0.0, 0.0, 180.0),
            object = 'ch_prop_vault_painting_01i',
            objectPos = vector3(1408.175, 1143.564, 114.5336),
            objHeading = 180.0
        },
        {
            rewardItem = 'paint5',
            paintingPrice = '300',
            scenePos = vector3(1407.637, 1150.74, 113.4136),
            sceneRot = vector3(0.0, 0.0, 0.0),
            object = 'ch_prop_vault_painting_01h',
            objectPos = vector3(1407.637, 1151.17, 114.5336),
            objHeading = 0.0
        },
        {
            rewardItem = 'paint1',
            paintingPrice = '300',
            scenePos = vector3(1408.637, 1150.74, 113.4136),
            sceneRot = vector3(0.0, 0.0, 0.0),
            object = 'ch_prop_vault_painting_01j',
            objectPos = vector3(1408.637, 1151.17, 114.5336),
            objHeading = 0.0
        },
        {
            rewardItem = 'paint3',
            paintingPrice = '300',
            scenePos = vector3(1397.586, 1165.579, 113.4136),
            sceneRot = vector3(0.0, 0.0, 90.0),
            object = 'ch_prop_vault_painting_01f',
            objectPos = vector3(1397.136, 1165.579, 114.5336),
            objHeading = 90.0
        },
        {
            rewardItem = 'paint4',
            paintingPrice = '300',
            scenePos = vector3(1397.976, 1165.679, 113.4136),
            sceneRot = vector3(0.0, 0.0, 0.0),
            object = 'ch_prop_vault_painting_01g',
            objectPos = vector3(1397.936, 1166.079, 114.5336),
            objHeading = 0.0
        },
    },
    ['robs'] = {
        {
            scenePos2 = vector3(1403.9499, 1150.3206, 114.33367),
        },
        {
            scenePos2 = vector3(1393.6846, 1146.9033, 114.33367),
        },
        {
            scenePos2 = vector3(1394.2216, 1150.1176, 114.33367),
        },
        {
            scenePos2 = vector3(1400.0253, 1139.6287, 114.33365),
        },
        {
            scenePos2 = vector3(1400.0253, 1139.6287, 114.33365),
        },
        {
            scenePos2 = vector3(1402.2371, 1132.2868, 114.33362),
        },
        {
            scenePos2 = vector3(1396.7918, 1129.2, 114.33362),
        },
        {
            scenePos2 = vector3(1394.8829, 1135.2126, 114.33365),
        },
        {
            scenePos2 = vector3(1394.4633, 1137.7006, 114.3335),
        },
        {
            scenePos2 = vector3(1395.3498, 1157.333, 114.3336),
        },
        {
            scenePos2 = vector3(1394.1054, 1160.5213, 114.37241),
        },
        {
            scenePos2 = vector3(1405.0505, 1165.2678, 114.33432),
        },
        {
            scenePos2 = vector3(1394.0949, 1150.1964, 111.45599),
        },
        {
            scenePos2 = vector3(1397.999, 1144.7502, 110.74029),
        },
        {
            scenePos2 = vector3(1406.824, 1146.6386, 110.71122),
        },
        {
            scenePos2 = vector3(1404.7121, 1140.5179, 110.71113),
        },
        {
            scenePos2 = vector3(1400.35, 1140.5378, 110.71112),
        },
        {
            scenePos2 = vector3(1395.7657, 1141.8726, 110.71118),
        },
    },
    ['objects'] = { -- dont change (required)
        'hei_p_m_bag_var22_arm_s',
        'w_me_switchblade'
    },
    ['animations'] = { -- dont change (required)
        {"top_left_enter", "top_left_enter_ch_prop_ch_sec_cabinet_02a", "top_left_enter_ch_prop_vault_painting_01a", "top_left_enter_hei_p_m_bag_var22_arm_s", "top_left_enter_w_me_switchblade"},
        {"cutting_top_left_idle", "cutting_top_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_idle_ch_prop_vault_painting_01a", "cutting_top_left_idle_hei_p_m_bag_var22_arm_s", "cutting_top_left_idle_w_me_switchblade"},
        {"cutting_top_left_to_right", "cutting_top_left_to_right_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_to_right_ch_prop_vault_painting_01a", "cutting_top_left_to_right_hei_p_m_bag_var22_arm_s", "cutting_top_left_to_right_w_me_switchblade"},
        {"cutting_top_right_idle", "_cutting_top_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_right_idle_ch_prop_vault_painting_01a", "cutting_top_right_idle_hei_p_m_bag_var22_arm_s", "cutting_top_right_idle_w_me_switchblade"},
        {"cutting_right_top_to_bottom", "cutting_right_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_right_top_to_bottom_ch_prop_vault_painting_01a", "cutting_right_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_right_top_to_bottom_w_me_switchblade"},
        {"cutting_bottom_right_idle", "cutting_bottom_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_idle_ch_prop_vault_painting_01a", "cutting_bottom_right_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_idle_w_me_switchblade"},
        {"cutting_bottom_right_to_left", "cutting_bottom_right_to_left_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_to_left_ch_prop_vault_painting_01a", "cutting_bottom_right_to_left_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_to_left_w_me_switchblade"},
        {"cutting_bottom_left_idle", "cutting_bottom_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_left_idle_ch_prop_vault_painting_01a", "cutting_bottom_left_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_left_idle_w_me_switchblade"},
        {"cutting_left_top_to_bottom", "cutting_left_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_left_top_to_bottom_ch_prop_vault_painting_01a", "cutting_left_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_left_top_to_bottom_w_me_switchblade"},
        {"with_painting_exit", "with_painting_exit_ch_prop_ch_sec_cabinet_02a", "with_painting_exit_ch_prop_vault_painting_01a", "with_painting_exit_hei_p_m_bag_var22_arm_s", "with_painting_exit_w_me_switchblade"},
    },
}

Shared['RockerHeist'] = {
    ['startHeist'] ={
        pos = vector3(2447.5568, 4977.5508, 51.564777),
    },
    ['requiredPoliceCount'] = 7,
    ['guardPeds'] = {
            { coords = vector3(2450.4387, 4967.0751, 46.571578), heading = 189.55087, model = 's_m_y_blackops_01'},
            { coords = vector3(2447.6115, 4968.854, 51.567813), heading = 206.52728, model = 's_m_y_blackops_01'},
            { coords = vector3(2459.685, 4976.9355, 51.567813), heading = 266.34524, model = 's_m_y_blackops_01'},
            { coords = vector3(2436.1562, 4980.1372, 46.571395), heading = 87.57537, model = 's_m_y_blackops_01'},
            { coords = vector3(2449.6799, 4981.9677, 46.810501), heading = 80.379066, model = 's_m_y_blackops_01'},
            { coords = vector3(2450.6953, 4977.0195, 46.809833), heading = 129.43528, model = 's_m_y_blackops_01'},
            { coords = vector3(2440.3127, 4976.5156, 46.810592), heading = 240.05364, model = 's_m_y_blackops_01'},
            { coords = vector3(2433.7917, 4966.4018, 46.810592), heading = 294.10525, model = 's_m_y_blackops_01'},
            { coords = vector3(2447.5153, 4977.0332, 51.564865), heading = 314.49313, model = 's_m_y_blackops_01'},
            { coords = vector3(2435.383, 4967.8334, 42.347572), heading = 112.78779, model = 's_m_y_blackops_01'},
            { coords = vector3(2431.5031, 4971.1293, 42.347572), heading = 160.50036, model = 's_m_y_blackops_01'},
    },
    ['robs'] = {
        {
            robPos = vector3(2445.32, 4983.6176, 46.809864),
            loc = 'gore'
        },
        {
            robPos = vector3(2443.2573, 4977.3867, 46.810604),
            loc = 'gore'
        },
        {
            robPos = vector3(2438.1782, 4963.6699, 46.8106),
            loc = 'gore'
        },
        {
            robPos = vector3(2431.6547, 4971.2768, 42.347602),
            loc = 'dolu'
        },
        {
            robPos = vector3(2439.8608, 4968.5415, 51.564872),
            loc = 'gore'
        },
        {
            robPos = vector3(2445.4821, 4988.4516, 46.810588),
            loc = 'gore'
        },
    },
}

Shared.groveBobcatGuards = {
	[1] = {
		pos = {896.1457, -2132.5039, 31.2303, 356.1608},
		ped = 'mp_s_m_armoured_01',
		weapon = 'WEAPON_PISTOL',
		armour = 200
	},
	[2] = {
		pos = {898.3466, -2129.1311, 31.2303, 3.7665},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_CARBINERIFLE_MK2',
		armour = 200
	},
	[3] = {
		pos = {896.3973, -2124.4341, 31.2303, 332.7293},
		ped = 'mp_s_m_armoured_01',
		weapon = 'WEAPON_CARBINERIFLE_MK2',
		armour = 200
	},
	[4] = {
		pos = {891.4799, -2134.0090, 31.2303, 269.0237},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_PISTOL',
		armour = 200
	},
	[5] = {
		pos = {898.1379, -2121.7278, 31.2303, 226.4685},
		ped = 's_m_m_armoured_02',
		weapon = 'WEAPON_PISTOL',  
		armour = 200
	}
}

Shared['VangelicoHeist'] = {
    ['requiredPoliceCount'] = 0, -- required police count for start heist
    ['nextRob'] = 3600, -- seconds for next heist
    ['startHeist'] ={ -- heist start coords
        pos = vector3(-846.42, -1307.5, 5.00017),
        peds = {
            {pos = vector3(-846.73, -1306.4, 5.00018), heading = 174.22, ped = 's_m_m_highsec_01'},
            {pos = vector3(-845.40, -1306.7, 5.00018), heading = 131.78, ped = 's_m_m_highsec_02'},
            {pos = vector3(-845.61, -1308.2, 5.00018), heading = 79.42, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['gasMask'] = {
        itemName = 'gasmask', -- item name for gasmask
        clothNumber = 69 -- you can change, this is my choise
    },
    ['requiredItems'] = { -- add item to database
        'drill',
        'bag'
    },
    ['smashRewards'] = { -- you can add new smash reward items
        {item = 'gold-rolex'},
        {item = 'diamond-ring'},
        {item = 'gold-necklace'},
    },
    ['smashWeapons'] = { -- you can add new smash required weapons
        'WEAPON_ASSAULTRIFLE',
        'WEAPON_CARBINERIFLE_MK2',
        'WEAPON_MICROSMG',
        'WEAPON_BULLPUPRIFLE',
    },
    ['finishHeist'] = {
        buyerPos = vector3(832.607, -2954.4, 4.90086)
    }
}

Shared['VangelicoInside'] = {
    ['glassCutting'] = {
        displayPos = vector3(-617.4622, -227.4347, 37.057),
        displayHeading = -53.06,
        rewardPos = vector3(-617.4622, -227.4347, 38.0861),
        rewardRot = vector3(360.0, 0.0, 70.0),
        rewards = {
            {
                object = {model = 'h4_prop_h4_diamond_01a', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 70.0)},
                item = 'vanDiamond',
                price = 320,
            },
            {
                object = {model = 'h4_prop_h4_art_pant_01a', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 70.0)},
                item = 'vanPanther',
                price = 320,
            },
            {
                object = {model = 'h4_prop_h4_necklace_01a', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_neck_disp_01a', rot = vector3(360.0, 0.0, -60.0)},
                item = 'vanNecklace',
                price = 320,
            },
            {
                object = {model = 'h4_prop_h4_t_bottle_02b', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 70.0)},
                item = 'vanBottle',
                price = 320,
            },
        }
    },
    ['smashScenes'] = {
        {
            objPos = vector3(-627.735, -234.439, 37.875),
            scenePos = vector3(-628.187, -233.538, 37.0946),
            sceneRot = vector3(0.0, 0.0, -144.0),
            oldModel = 'des_jewel_cab_start',
            newModel = 'des_jewel_cab_end'
        },
        {
            objPos = vector3(-626.716, -233.685, 37.8583),
            scenePos = vector3(-627.136, -232.775, 37.0946),
            sceneRot = vector3(0.0, 0.0, -144.0),
            oldModel = 'des_jewel_cab_start',
            newModel = 'des_jewel_cab_end'
        },
        {
            objPos = vector3(-627.35, -234.947, 37.8531),
            scenePos = vector3(-626.62, -235.725, 37.0946),
            sceneRot = vector3(0.0, 0.0, 36.0),
            oldModel = 'des_jewel_cab3_start',
            newModel = 'des_jewel_cab3_end'
        },
        {
            objPos = vector3(-626.298, -234.193, 37.8492),
            scenePos = vector3(-625.57, -234.962, 37.0946),
            sceneRot = vector3(0.0, 0.0, 36.0),
            oldModel = 'des_jewel_cab4_start',
            newModel = 'des_jewel_cab4_end'
        },
        {
            objPos = vector3(-626.399, -239.132, 37.8616),
            scenePos = vector3(-626.894, -238.2, 37.0856),
            sceneRot = vector3(0.0, 0.0, -144.0),
            oldModel = 'des_jewel_cab2_start',
            newModel = 'des_jewel_cab2_end'
        },
        {
            objPos = vector3(-625.376, -238.358, 37.8687),
            scenePos = vector3(-625.867, -237.458, 37.0946),
            sceneRot = vector3(0.0, 0.0, -144.0),
            oldModel = 'des_jewel_cab3_start',
            newModel = 'des_jewel_cab3_end'
        },
        {
            objPos = vector3(-625.517, -227.421, 37.86),
            scenePos = vector3(-624.738, -228.2, 37.0946),
            sceneRot = vector3(0.0, 0.0, 36.0),
            oldModel = 'des_jewel_cab3_start',
            newModel = 'des_jewel_cab3_end'
        },
        {
            objPos = vector3(-624.467, -226.653, 37.861),
            scenePos = vector3(-623.688, -227.437, 37.0946),
            sceneRot = vector3(0.0, 0.0, 36.0),
            oldModel = 'des_jewel_cab4_start',
            newModel = 'des_jewel_cab4_end'
        },
        {
            objPos = vector3(-623.8118, -228.6336, 37.8522),
            scenePos = vector3(-624.293, -227.831, 37.0946),
            sceneRot = vector3(0.0, 0.0, -143.511),
            oldModel = 'des_jewel_cab2_start',
            newModel = 'des_jewel_cab2_end'
        },
        {
            objPos = vector3(-624.1267, -230.7476, 37.8618),
            scenePos = vector3(-624.939, -231.247, 37.0946),
            sceneRot = vector3(0.0, 0.0, -54.13),
            oldModel = 'des_jewel_cab4_start',
            newModel = 'des_jewel_cab4_end'
        },
        {
            objPos = vector3(-621.7181, -228.9636, 37.8425),
            scenePos = vector3(-620.864, -228.481, 37.0946),
            sceneRot = vector3(0.0, 0.0, 126.925),
            oldModel = 'des_jewel_cab3_start',
            newModel = 'des_jewel_cab3_end'
        },
        {
            objPos = vector3(-622.7541, -232.614, 37.8638),
            scenePos = vector3(-623.3596, -233.2296, 37.0946),
            sceneRot = vector3(0.0, 0.0, -52.984),
            oldModel = 'des_jewel_cab_start',
            newModel = 'des_jewel_cab_end'
        },
        {
            objPos = vector3(-620.3262, -230.829, 37.8578),
            scenePos = vector3(-619.408, -230.1969, 37.0946),
            sceneRot = vector3(0.0, 0.0, 126.352),
            oldModel = 'des_jewel_cab_start',
            newModel = 'des_jewel_cab_end'
        },
        {
            objPos = vector3(-620.6465, -232.9308, 37.8407),
            scenePos = vector3(-620.184, -233.729, 37.0946),
            sceneRot = vector3(0.0, 0.0, 36.398),
            oldModel = 'des_jewel_cab4_start',
            newModel = 'des_jewel_cab4_end'
        },
        {
            objPos = vector3(-619.978, -234.93, 37.8537),
            scenePos = vector3(-620.44, -234.084, 37.0946),
            sceneRot = vector3(0, 0, -144.0),
            oldModel = 'des_jewel_cab_start',
            newModel = 'des_jewel_cab_end'
        },
        {
            objPos = vector3(-618.937, -234.16, 37.8425),
            scenePos = vector3(-619.39, -233.32, 37.0946),
            sceneRot = vector3(0, 0, -144.0),
            oldModel = 'des_jewel_cab3_start',
            newModel = 'des_jewel_cab3_end'
        },
        {
            objPos = vector3(-620.163, -226.212, 37.8266),
            scenePos = vector3(-620.797, -226.79, 37.0946),
            sceneRot = vector3(0, 0, -54.0),
            oldModel = 'des_jewel_cab_start',
            newModel = 'des_jewel_cab_end'
        },
        {
            objPos = vector3(-619.384, -227.259, 37.8342),
            scenePos = vector3(-620.055, -227.817, 37.0856),
            sceneRot = vector3(0, 0, -54.0),
            oldModel = 'des_jewel_cab2_start',
            newModel = 'des_jewel_cab2_end'
        },
        {
            objPos = vector3(-618.019, -229.115, 37.8302),
            scenePos = vector3(-618.679, -229.704, 37.0946),
            sceneRot = vector3(0, 0, -54.0),
            oldModel = 'des_jewel_cab3_start',
            newModel = 'des_jewel_cab3_end'
        },
        {
            objPos = vector3(-617.249, -230.156, 37.8201),
            scenePos = vector3(-617.937, -230.731, 37.0856),
            sceneRot = vector3(0, 0, -54.0),
            oldModel = 'des_jewel_cab2_start',
            newModel = 'des_jewel_cab2_end'
        },
    },
    ['painting'] = {
        {
            rewardItem = 'paint1', -- u need add item to database
            paintingPrice = '300', -- price of the reward item for sell
            scenePos = vector3(-626.70, -228.3, 38.06), -- animation coords
            sceneRot = vector3(0.0, 0.0, 90.0), -- animation rotation
            object = 'ch_prop_vault_painting_01g', -- object (https://mwojtasik.dev/tools/gtav/objects/search?name=ch_prop_vault_painting_01)
            objectPos = vector3(-627.20, -228.31, 38.06), -- object spawn coords
            objHeading = 94.75 -- object spawn heading
        },
        {
            rewardItem = 'paint2',
            paintingPrice = '300', 
            scenePos = vector3(-622.97, -225.54, 38.06), 
            sceneRot = vector3(0.0, 0.0, -20.0),
            object = 'ch_prop_vault_painting_01f', 
            objectPos = vector3(-622.80, -225.14, 38.06), 
            objHeading = 345.85
        },
        {
            rewardItem = 'paint3',
            paintingPrice = '300', 
            scenePos = vector3(-617.48, -233.22, 38.06), 
            sceneRot = vector3(0.0, 0.0, -90.0),
            object = 'ch_prop_vault_painting_01h', 
            objectPos = vector3(-617.00, -233.22, 38.06), 
            objHeading = 269.53
        },
        {
            rewardItem = 'paint4',
            paintingPrice = '300', 
            scenePos = vector3(-621.25, -235.78, 38.06), 
            sceneRot = vector3(0.0, 0.0, 160.0),
            object = 'ch_prop_vault_painting_01j', 
            objectPos = vector3(-621.25, -236.38, 38.06), 
            objHeading = 161.22
        },
    }
}

Strings = {
    ['start_heist'] = 'Натисни ~INPUT_CONTEXT~ за да спреш електричеството',
    ['goto_vangelico'] = 'Отиди до маркираната локация и хвърли димката си там.',
    ['wait_nextrob'] = 'Ще трябва да изчакаш малко',
    ['minute'] = 'Мин.',
    ['start_stealing'] = 'Натисни ~INPUT_CONTEXT~ за да откраднеш картината',
    ['cute_right'] = 'Натисни ~INPUT_CONTEXT~ за да отрежеш на дясно',
    ['cute_left'] = 'Натисни ~INPUT_CONTEXT~ за да отрежеш на ляво',
    ['cute_down'] = 'Натисни ~INPUT_CONTEXT~ за да отрежеш на долу',
    ['glass_cut'] = 'Натисни ~INPUT_CONTEXT~ за да отрежеш стаклото',
    ['smash'] = 'Натисни ~INPUT_CONTEXT~ за да разбиеш витрината',
    ['throw_gas_blip'] = 'Throw Gas',
    ['good_shot'] = 'Димката е пусната, не забравяй да си сложиш противогас!',
    ['need_switchblade'] = 'Трябва ти switchblade.',
    ['need_rifle'] = 'Трябва ти по-тежко оръжие.',
    ['need_this'] = 'Трябва ти: ',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',
    ['buyer_blip'] = 'Buyer',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Vangelico Store robbery alert! Check your gps.',
}

Overheat = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'h4_prop_h4_cutter_01a',
    },
    ['animations'] = {
        {'enter', 'enter_bag', 'enter_cutter', 'enter_glass_display'},
        {'idle', 'idle_bag', 'idle_cutter', 'idle_glass_display'},
        {'cutting_loop', 'cutting_loop_bag', 'cutting_loop_cutter', 'cutting_loop_glass_display'},
        {'overheat_react_01', 'overheat_react_01_bag', 'overheat_react_01_cutter', 'overheat_react_01_glass_display'},
        {'success', 'success_bag', 'success_cutter', 'success_glass_display_cut'},
    },
    ['scenes'] = {},
    ['sceneObjects'] = {},
}

ArtHeist = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'w_me_switchblade'
    },
    ['animations'] = { 
        {"top_left_enter", "top_left_enter_ch_prop_ch_sec_cabinet_02a", "top_left_enter_ch_prop_vault_painting_01a", "top_left_enter_hei_p_m_bag_var22_arm_s", "top_left_enter_w_me_switchblade"},
        {"cutting_top_left_idle", "cutting_top_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_idle_ch_prop_vault_painting_01a", "cutting_top_left_idle_hei_p_m_bag_var22_arm_s", "cutting_top_left_idle_w_me_switchblade"},
        {"cutting_top_left_to_right", "cutting_top_left_to_right_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_to_right_ch_prop_vault_painting_01a", "cutting_top_left_to_right_hei_p_m_bag_var22_arm_s", "cutting_top_left_to_right_w_me_switchblade"},
        {"cutting_top_right_idle", "_cutting_top_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_right_idle_ch_prop_vault_painting_01a", "cutting_top_right_idle_hei_p_m_bag_var22_arm_s", "cutting_top_right_idle_w_me_switchblade"},
        {"cutting_right_top_to_bottom", "cutting_right_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_right_top_to_bottom_ch_prop_vault_painting_01a", "cutting_right_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_right_top_to_bottom_w_me_switchblade"},
        {"cutting_bottom_right_idle", "cutting_bottom_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_idle_ch_prop_vault_painting_01a", "cutting_bottom_right_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_idle_w_me_switchblade"},
        {"cutting_bottom_right_to_left", "cutting_bottom_right_to_left_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_to_left_ch_prop_vault_painting_01a", "cutting_bottom_right_to_left_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_to_left_w_me_switchblade"},
        {"cutting_bottom_left_idle", "cutting_bottom_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_left_idle_ch_prop_vault_painting_01a", "cutting_bottom_left_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_left_idle_w_me_switchblade"},
        {"cutting_left_top_to_bottom", "cutting_left_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_left_top_to_bottom_ch_prop_vault_painting_01a", "cutting_left_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_left_top_to_bottom_w_me_switchblade"},
        {"with_painting_exit", "with_painting_exit_ch_prop_ch_sec_cabinet_02a", "with_painting_exit_ch_prop_vault_painting_01a", "with_painting_exit_hei_p_m_bag_var22_arm_s", "with_painting_exit_w_me_switchblade"},
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}

Shared["DigitalDen"] = {
    Timeout = 60 * (60 * 1000),
    TimeForLock = 5 * (60 *1000),
    RequiredCops = 4,
    Locations = {
        [1] = {
            pzname = "DigitalDen-1",
            coords = vector3(1136.11, -472.75, 66.26),
            heading = 77,
            isOpened = false,
            isBusy = false,
            Rewards = {
                [1] = {
                    ["item"] = "laptop",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                },
                [2] = {
                    ["item"] = "gaming-laptop",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                },
                [3] = {
                    ["item"] = "burner-phone",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                }
            }
        },
        [2] = {
            pzname = "DigitalDen-2",
            coords = vector3(1131.86, -477.19, 66.48),
            heading = 345,
            isOpened = false,
            isBusy = false,
            Rewards = {
                [1] = {
                    ["item"] = "stolen-pc",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                }
            }
        },
        [3] = {
            pzname = "DigitalDen-3",
            coords = vector3(1135.46, -475.23, 66.26),
            heading = 255,
            isOpened = false,
            isBusy = false,
            Rewards = {
                [1] = {
                    ["item"] = "stolen-tv",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                }
            }
        },
        [4] = {
            pzname = "DigitalDen-4",
            coords = vector3(1133.9, -468.59, 66.49),
            heading = 346,
            isOpened = false,
            isBusy = false,
            Rewards = {
                [1] = {
                    ["item"] = "weapon_flashlight",
                    ["weapon"] = true,
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                },
                [2] = {
                    ["item"] = "burner-phone",
                    ["weapon"] = true,
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                }
            }
        },
        [5] = {
            pzname = "DigitalDen-5",
            coords = vector3(1128.86, -475.5, 66.49),
            heading = 256,
            isOpened = false,
            isBusy = false,
            Rewards = {
                [1] = {
                    ["item"] = "tablet",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 2
                    },
                },
                [2] = {
                    ["item"] = "burner-phone",
                    ["weapon"] = true,
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                }
            }
        },
        [6] = {
            pzname = "DigitalDen-6",
            coords = vector3(1132.57, -465.85, 66.49),
            heading = 345,
            isOpened = false,
            isBusy = false,
            Rewards = {
                [1] = {
                    ["item"] = "tablet",
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 2
                    },
                },
                [2] = {
                    ["item"] = "radio",
                    ["weapon"] = true,
                    ["amount"] = {
                        ["min"] = 1,
                        ["max"] = 1
                    },
                }
            }
        }
    }
}

Shared['TrainHeist'] = {
    ['requiredPoliceCount'] = 8, -- required police count for start heists
    ['nextRob'] = 3600, -- seconds for next heist (1h - 3600) (2h - 7200)
    ['reward'] = {
        itemName = 'gold-bar', -- gold item name
        grabCount = 25, -- gold grab count
        sellPrice = 150 -- buyer sell price
    },
    ['startHeist'] ={ -- heist start coords
        pos = vector3(-687.82, -2417.1, 13.9445),
        peds = {
            {pos = vector3(-686.43, -2417.5, 13.8945), heading = 23.22, ped = 's_m_m_highsec_01'},
            {pos = vector3(-687.82, -2417.1, 13.8945), heading = 320.78, ped = 's_m_m_highsec_02'},
            {pos = vector3(-688.89, -2416.3, 13.8945), heading = 291.42, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['guardPeds'] = { -- guard ped list (you can add new)
            { coords = vector3(2850.67, 4535.49, 45.3924), heading = 270.87, model = 's_m_y_blackops_01'},
            { coords = vector3(2856.28, 4544.12, 45.3354), heading = 177.93, model = 's_m_y_blackops_01'},
            { coords = vector3(2869.90, 4530.26, 47.7877), heading = 354.93, model = 's_m_y_blackops_01'},
            { coords = vector3(2859.08, 4519.85, 47.9145), heading = 177.88, model = 's_m_y_blackops_01'},
            { coords = vector3(2843.78, 4521.66, 47.4138), heading = 268.28, model = 's_m_y_blackops_01'},
            { coords = vector3(2856.90, 4526.85, 48.6552), heading = 268.3, model = 's_m_y_blackops_01'},
            { coords = vector3(2878.67, 4556.77, 48.4119), heading = 359.44, model = 's_m_y_blackops_01'},
            { coords = vector3(2886.69, 4556.21, 48.4262), heading = 265.05, model = 's_m_y_blackops_01'},
            { coords = vector3(2913.4692, 4499.5947, 54.844097), heading = 265.05, model = 's_m_y_blackops_01'},
            { coords = vector3(2825.0058, 4588.5942, 48.232109), heading = 265.05, model = 's_m_y_blackops_01'},
            { coords = vector3(2866.0256, 4401.8544, 72.744247), heading = 265.05, model = 's_m_y_blackops_01'},
    },
    ['finishHeist'] = { -- finish heist coords
        buyerPos = vector3(-1690.6, -916.19, 6.78323)
    },
    ['MaxAttachmentsOnTable'] = 5, -- Maximum attachments on 1 table.
    ['setupTrain'] = { -- train and containers coords
        pos = vector3(2872.028, 4544.253, 47.758),
        part = vector3(2883.305, 4557.646, 47.758),
        heading = 140.0,
        ['containers'] = {
            {
                pos = vector3(2885.97, 4560.83, 48.0551), 
                heading = 320.0, 
                lock = {pos = vector3(2884.76, 4559.38, 49.22561), taken = false},
                table = vector3(2886.55, 4561.53, 48.23),
                attachments = {
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2886.05, 4561.93, 49.13)},
                    {object = "w_at_pi_supp_2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2887.05, 4561.13, 49.14)},
                    {object = "w_pi_sns_pistol_mag2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2886.576, 4561.482, 49.13465)},
                    {object = "w_at_pi_flsh", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2886.621, 4561.051, 49.13465)},
                    {object = "w_at_pi_flsh_2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2886.823, 4561.056, 49.13465)},
                    {object = "w_at_pi_snsmk2_flsh_1", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2887.008, 4561.533, 49.13465)},
                    {object = "w_at_pi_comp_1", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2887.032, 4560.707, 49.13465)},
                    {object = "w_at_pi_rail_1", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2885.78, 4561.994, 49.13465)},
                    {object = "w_at_pi_rail_2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2887.447, 4561.104, 49.13465)},
                    {object = "w_at_ar_supp_02", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2886.417, 4561.833, 49.13465)},
                    {object = "w_at_pi_flsh_2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2886.235, 4561.533, 49.13465)},
                    {object = "w_at_pi_supp_2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2885.841, 4561.708, 49.13465)},
                    --{object = "w_sr_sniperrifle_luxe", rot = {90.0, -80.0, 120.0}, forcedrop = true, pos = vector3(2885.983, 4562.438, 49.26496)},
                },
            },
            {
                pos = vector3(2880.97, 4554.83, 48.0551), 
                heading = 140.0, 
                lock = {pos = vector3(2882.15, 4556.26, 49.22561), taken = false},
                table = vector3(2880.45, 4554.23, 48.23),
                attachments = {
                    {object = "w_pi_sns_pistolmk2_mag2", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2881.05, 4553.93, 49.14)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2880.25, 4554.63, 49.14)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2881.009, 4553.39, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2881.33, 4553.79, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2880.436, 4554.06, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2880.586, 4554.582, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2879.663, 4554.394, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2879.852, 4554.992, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2880.209, 4554.168, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2880.84, 4554.273, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2880.675, 4553.61, 49.13465)},
                    {object = "w_at_pi_supp", rot = {90.0, 0.0, 120.0}, forcedrop = true, pos = vector3(2879.871, 4554.674, 49.13465)},
                } 
            }
        }
    },
    ['AttachmentModels'] = {
        'w_at_pi_supp',
        'w_at_pi_supp_2',
        'w_pi_sns_pistol_mag2',
        'w_at_pi_flsh',
        'w_at_pi_flsh_2',
        'w_at_pi_snsmk2_flsh_1',
        'w_at_pi_comp_1',
        'w_at_pi_rail_1',
        'w_at_pi_rail_2',
        'w_at_ar_supp_02'
    }
}

TrainAnimation = {
    ['objects'] = {
        'tr_prop_tr_grinder_01a',
        'ch_p_m_bag_var02_arm_s'
    },
    ['animations'] = {
        {'action', 'action_container', 'action_lock', 'action_angle_grinder', 'action_bag'}
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}