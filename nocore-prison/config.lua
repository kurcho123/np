Config = Config or {}

Config.PrisonZoneCoords = vector3(1689.65, 2575.7, 178.53)
Config.PrisonZoneSize = 150.0
Config.PrisonZoneDebug = false

Config.Locations = {
    ['Prison'] = {
        ['Coords'] = {
            ['X'] = 1693.33,
            ['Y'] = 2569.51,
            ['Z'] = 45.55,
            ['H'] = nil
        }
    },
    ['Spawns'] = {
        [1] = {
            ['Animation'] = "bumsleep",
            ['Coords'] = {
                ['X'] = 1760.403,
                ['Y'] = 2498.699,
                ['Z'] = 45.80,
                ['H'] = 5.63
            }
        },
        [2] = {
            ['Animation'] = "lean",
            ['Coords'] = {
                ['X'] = 1783.706,
                ['Y'] = 2553.636,
                ['Z'] = 45.72,
                ['H'] = 88.50
            }
        },
        [3] = {
            ['Animation'] = "lean",
            ['Coords'] = {
                ['X'] = 1760.653,
                ['Y'] = 2541.365,
                ['Z'] = 45.73,
                ['H'] = 100
            }
        },
        [4] = {
            ['Animation'] = "chair4",
            ['Coords'] = {
                ['X'] = 1715.19,
                ['Y'] = 2553.58,
                ['Z'] = 45.56,
                ['H'] = 179.84
            }
        }
    },
    ['Leave-Spawn'] = {
        [1] = {
            ['Animation'] = "chair",
            ['Coords'] = {
                ['X'] = 1836.519,
                ['Y'] = 2582.729,
                ['Z'] = 46.01,
                ['H'] = 270.49
            }
        },
        [2] = {
            ['Animation'] = "chair",
            ['Coords'] = {
                ['X'] = 1836.519,
                ['Y'] = 2581.205,
                ['Z'] = 46.01,
                ['H'] = 275.63
            }
        },
        [3] = {
            ['Animation'] = "chair",
            ['Coords'] = {
                ['X'] = 1842.509,
                ['Y'] = 2591.147,
                ['Z'] = 46.01,
                ['H'] = 178.87
            }
        }
    }
}

Config.NPCLocations = {
    ['Cleaner'] = {
        coords =vector3(1771.72,2568.38,44.73),
        heading = 92.06,
        event = 'nocore-prison:beginClean',
        label = 'Започни работа',
        model = 's_m_m_janitor',
        icon = 'fas fa-clipboard-list'
    },
    
    ['Electrical'] = {
        coords =vector3(1760.12,2519.22,44.57),
        heading =251.62,
        event = 'nocore-prison:beginElectrical',
        label = 'Започни работа',
        model = 's_m_y_construct_02',
        scenario = 'WORLD_HUMAN_WELDING',
        icon = 'fas fa-clipboard-list'
    },
    
    ['Trash'] = {
        coords =vector3(1720.16,2566.8,44.57),
        heading =140.98,
        event = 'nocore-prison:beginTrash',
        label = 'Започни работа',
        model = 's_m_y_garbage',
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        icon = 'fas fa-clipboard-list'
    },
    
    ['Toilets'] = {
        coords =vector3(1774.0,2492.91,44.74),
        heading =120.51,
        event = 'nocore-prison:beginToilet',
        label = 'Започни работа',
        model = 's_m_y_dwservice_01',
        scenario = 'WORLD_HUMAN_JANITOR',
        icon = 'fas fa-clipboard-list'
    },
    
    ['Doctor'] = {
        coords =vector3(1765.23,2598.29,44.73),
        heading =183.49,
        event = 'nocore-prison:useDoctor',
        label = 'Излекувай се',
        model = 's_m_m_doctor_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        icon = 'fas fa-clipboard-list'
    },
    
    ['RecPed1'] = {
        coords =vector3(1698.87,2534.47,44.56),
        heading =290.66,
        event = 'nocore-prison:teachRec',
        label = 'Как да играя',
        model = 'u_m_y_prisoner_01',
        scenario = 'WORLD_HUMAN_LEANING',
        icon = 'fas fa-clipboard-list'
    },
}

Config.ElectricalBoxes = {
	[0] = {coords =vector3(1737.28, 2504.12, 45.57), heading =345, icon = 'fas fa-bolt' },
	[1] = {coords =vector3(1707.47, 2480.61, 45.56), heading =45, icon = 'fas fa-bolt' },
	[2] = {coords =vector3(1700.58, 2474.36, 45.56), heading =45, icon = 'fas fa-bolt' },
	[3] = {coords =vector3(1679.32, 2479.88, 45.56), heading =315, icon = 'fas fa-bolt' },
	[4] = {coords =vector3(1643.95, 2490.21, 45.56), heading =5, icon = 'fas fa-bolt' },
	[5] = {coords =vector3(1621.76, 2507.63, 45.56), heading =95, icon = 'fas fa-bolt' },
	[6] = {coords =vector3(1609.42, 2539.23, 45.56), heading =315, icon = 'fas fa-bolt' },
	[7] = {coords =vector3(1608.5, 2567.46, 45.56), heading =40, icon = 'fas fa-bolt' },
	[8] = {coords =vector3(1629.76, 2564.96, 45.56), heading =355, icon = 'fas fa-bolt' },
	[9] = {coords =vector3(1652.51, 2565.2, 45.56), heading =0, icon = 'fas fa-bolt' },
}

Config.Toilets = {
	[0] = {coords =vector3(1776.93, 2481.57, 44.74), heading =0, icon = 'fas fa-toilet' },
	[1] = {coords =vector3(1767.83, 2502.79, 44.74), heading =30, icon = 'fas fa-toilet' },
	[2] = {coords =vector3(1764.67, 2501.03, 44.74), heading =30, icon = 'fas fa-toilet' },
	[3] = {coords =vector3(1773.74, 2479.75, 44.74), heading =0, icon = 'fas fa-toilet' },
	[4] = {coords =vector3(1761.51, 2499.17, 44.74), heading =30, icon = 'fas fa-toilet' },
	[5] = {coords =vector3(1770.65, 2477.99, 44.74), heading =0, icon = 'fas fa-toilet' },
	[6] = {coords =vector3(1767.43, 2476.06, 44.74), heading =0, icon = 'fas fa-toilet'},
	[7] = {coords =vector3(1755.19, 2495.65, 44.74), heading =30, icon = 'fas fa-toilet' },
	[8] = {coords =vector3(1752.07, 2493.72, 44.74), heading =30, icon = 'fas fa-toilet' },
	[9] = {coords =vector3(1764.28, 2474.32, 44.74), heading =0, icon = 'fas fa-toilet' },
	[10] = {coords =vector3(1749.0, 2491.94, 44.74), heading =30, icon = 'fas fa-toilet'},
	[11] = {coords =vector3(1761.19, 2472.5, 44.74), heading =0, icon = 'fas fa-toilet' },
	[12] = {coords =vector3(1758.13, 2470.47, 44.74), heading =30, icon = 'fas fa-toilet' },
}

Config.RandomTrashReward = {
    'plastic', 
    'metalscrap', 
    'copper', 
    'aluminum', 
    'iron', 
    'steel', 
    'rubber', 
    'glass'
}
Config.ShopItems = {
    label = "Prison Shop",
    slots = 5,
    items = {
        [1] = {
            name = "sandwich",
            price = 60,
            amount = 1,
            info = {},
            type = "item",
            slot = 1
        },
        [2] = {
            name = "water",
            price = 60,
            amount = 1,
            info = {},
            type = "item",
            slot = 2
        }
    }
}