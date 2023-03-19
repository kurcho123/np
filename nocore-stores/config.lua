Config = Config or {}

Config.Products = {
    ['Shops'] = {
      [1] = {
        name = "water",
        price = 45,
        amount = 100,
        info = {},
        type = "item",
        slot = 1,
      },
      [2] = {
        name = "sandwich",
        price = 64,
        amount = 100,
        info = {},
        type = "item",
        slot = 2,
      },
    },
    ['Weed'] = {
      [1] = {
        name = "joint",
        price = 75,
        amount = 1000,
        info = {},
        type = "item",
        slot = 1,
      },
      [2] = {
        name = "rolling-paper",
        price = 15,
        amount = 450,
        info = {},
        type = "item",
        slot = 2,
      },
    },
    ['Sea'] = {
      [1] = {
        name = "fishrod",
        price = 450,
        amount = 100,
        info = {},
        type = "item",
        slot = 1,
      },
    },
    ['Hardware'] = {
      [1] = {
        name = "lockpick",
        price = 450,
        amount = 100,
        info = {},
        type = "item",
        slot = 1,
      },
      [2] = {
        name = "toolkit",
        price = 550,
        amount = 100,
        info = {},
        type = "item",
        slot = 2,
       },
    },
    ['Hardware-2'] = {
      [1] = {
        name = "repairkit",
        price = 750,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
      },
      [2] = {
        name = "drill",
        price = 1500,
        amount = 5,
        info = {},
        type = "item",
        slot = 2,
      },
      [3] = {
        name = "radio",
        price = 950,
        amount = 50,
        info = {},
        type = "item",
        slot = 3,
       },
       [4] = {
        name = "dice",
        price = 15,
        amount = 50,
        info = {},
        type = "item",
        slot = 4,
       },
       [5] = {
        name = "coin",
        price = 15,
        amount = 50,
        info = {},
        type = "item",
        slot = 5,
       },
       [6] = {
        name = "fishingbait",
        price = 10,
        amount = 50,
        info = {},
        type = "item",
        slot = 6,
       },
       [7] = {
        name = "cups",
        price = 250,
        amount = 500,
        info = {},
        type = "item",
        slot = 7,
       },
       [8] = {
        name = "fishingrod",
        price = 500,
        amount = 50,
        info = {},
        type = "item",
        slot = 8,
       },
       [9] = {
        name = "bag",
        price = 75,
        amount = 50,
        info = {},
        type = "item",
        slot = 9,
       },
       [10] = {
        name = "scissor",
        price = 25,
        amount = 50,
        info = {},
        type = "item",
        slot = 10,
       },
       [11] = {
        name = "oxygen_mask",
        price = 550,
        amount = 50,
        info = {},
        type = "item",
        slot = 11,
       },
       [12] = {
        name = "parachute",
        price = 1500,
        amount = 50,
        info = {},
        type = "item",
        slot = 12,
       },
       [13] = {
        name = "chair1",
        price = 1500,
        amount = 5,
        info = {},
        type = "item",
        slot = 13,
       },
       [14] = {
        name = "chair2",
        price = 500,
        amount = 5,
        info = {},
        type = "item",
        slot = 14,
       },
       [15] = {
        name = "chair3",
        price = 2500,
        amount = 5,
        info = {},
        type = "item",
        slot = 15,
       },
       [16] = {
        name = "drone",
        price = 1500,
        amount = 5,
        info = {},
        type = "item",
        slot = 16,
       },
       [17] = {
        name = "rubberband",
        price = 25,
        amount = 50,
        info = {},
        type = "item",
        slot = 17,
       },
       [18] = {
        name = "money-case",
        price = 5000,
        amount = 1,
        info = {},
        type = "item",
        slot = 18,
       },
       [19] = {
        name = "spray_can",
        price = 500,
        amount = 50,
        info = {},
        type = "item",
        slot = 19,
       },
       [20] = {
        name = "flex1",
        price = 1500,
        amount = 50,
        info = {},
        type = "item",
        slot = 20,
       },
--[[        [18] = {
        name = "weapon_flare",
        price = 500,
        amount = 5,
        info = {},
        type = "weapon",
        slot = 18,
       }, ]]
    },
    ['Ammunations'] = {
      [1] = {
        name = "weapon_bat",
        price = 750,
        amount = 50,
        info = {
            serie = "",   
            melee = false,
            quality = 100.0,         
        },
        type = "weapon",
        slot = 1,
       },
      [2] = {
        name = "weapon_snspistol_mk2",
        price = 750,
        amount = 50,
        info = {
            serie = "",   
            melee = false,
            quality = 100.0,         
        },
        type = "weapon",
        slot = 2,
       },
      [3] = {
        name = "weapon_vintagepistol",
        price = 750,
        amount = 50,
        info = {
            serie = "",   
            melee = false,
            quality = 100.0,         
        },
        type = "weapon",
        slot = 3,
       },
      [4] = {
        name = "weapon_appistol",
        price = 750,
        amount = 50,
        info = {
            serie = "",   
            melee = false,
            quality = 100.0,         
        },
        type = "weapon",
        slot = 4,
       },
    },
}

Config.Shops = {
  [1] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 25.92,
      ['Y'] = -1346.68,
      ['Z'] = 29.49,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [2] = {
    ['Name'] = 'LTD Gasoline',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -48.09,
      ['Y'] = -1757.16,
      ['Z'] = 29.42,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [3] = {
    ['Name'] = 'LTD Gasoline',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -707.78,
      ['Y'] = -913.96,
      ['Z'] = 19.21,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [4] = {
    ['Name'] = 'Rob\'s Liquor',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -1222.86,
      ['Y'] = -907.16,
      ['Z'] = 12.32,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [5] = {
    ['Name'] = 'Rob\'s Liquor',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 1135.79,
      ['Y'] = -981.91,
      ['Z'] = 46.41,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [6] = {
    ['Name'] = 'Rob\'s Liquor',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -159.94,
      ['Y'] = 6322.61,
      ['Z'] = 31.58,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [7] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 162.10,
      ['Y'] = 6641.16,
      ['Z'] = 31.69,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [8] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 1729.43,
      ['Y'] = 6415.32,
      ['Z'] = 35.03,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [9] = {
    ['Name'] = 'LTD Gasoline',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 1698.82,
      ['Y'] = 4924.58,
      ['Z'] = 42.06,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [10] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 2678.00,
      ['Y'] = 3281.03,
      ['Z'] = 55.24,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [11] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 1961.00,
      ['Y'] = 3741.30,
      ['Z'] = 32.34,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [12] = {
    ['Name'] = 'Rob\'s Liquor',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 1166.12,
      ['Y'] = 2709.18,
      ['Z'] = 38.15,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [13] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 547.99,
      ['Y'] = 2670.43,
      ['Z'] = 42.15,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [14] = {
    ['Name'] = 'LTD Gasoline',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -1820.98,
      ['Y'] = 792.98,
      ['Z'] = 138.116,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [15] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -3243.04,
      ['Y'] = 1001.49,
      ['Z'] = 12.83,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [16] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -3040.01,
      ['Y'] = 585.66,
      ['Z'] = 7.9,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [17] = {
    ['Name'] = 'Rob\'s Liquor',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -2967.93,
      ['Y'] = 391.03,
      ['Z'] = 15.04,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [18] = {
    ['Name'] = 'Rob\'s Liquor',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -1487.37,
      ['Y'] = -379.13,
      ['Z'] = 40.16,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [19] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 374.08,
      ['Y'] = 326.64,
      ['Z'] = 103.56,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [20] = {
    ['Name'] = '24/7 Avond Winkel',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 2556.50,
      ['Y'] = 382.16,
      ['Z'] = 108.62,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [21] = {
    ['Name'] = 'LTD Gasoline',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 1163.50,
      ['Y'] = -323.27,
      ['Z'] = 69.20,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [22] = {
    ['Name'] = 'LTD Gasoline',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 812.83898,
      ['Y'] = -782.6729,
      ['Z'] = 26.174955,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [23] = {
    ['Name'] = 'Slotenmaker',
    ['Type'] = 'Hardware',
    ['Coords'] = {
      ['X'] = -1193.7508544922,
      ['Y'] = -216.47694396973,
      ['Z'] = 37.944828033447,
    },
    ['Product'] = Config.Products["Hardware"]
  },
  [24] = {
    ['Name'] = 'Hardware Store',
    ['Type'] = 'Hardware',
    ['Coords'] = {
      ['X'] = 44.74,
      ['Y'] = -1748.21,
      ['Z'] = 29.52,
    },
    ['Product'] = Config.Products["Hardware-2"]
  },
  [25] = {
    ['Name'] = 'Hardware Store',
    ['Type'] = 'Hardware',
    ['Coords'] = {
      ['X'] = 2748.84,
      ['Y'] = 3472.50,
      ['Z'] = 55.67,
    },
    ['Product'] = Config.Products["Hardware-2"]
  },
  [26] = {
    ['Name'] = 'Weed Store',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -1171.89,
      ['Y'] = -1572.03,
      ['Z'] = 4.66,
    },
    ['Product'] = Config.Products["Weed"]
  },
  [27] = {
    ['Name'] = 'Sea Store',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -1686.52,
      ['Y'] = -1072.51,
      ['Z'] = 13.15,
    },
    ['Product'] = Config.Products["Sea"]
  },
  [28] = {
    ['Name'] = 'Ammunation',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 21.2,
      ['Y'] = -1106.44,
      ['Z'] = 29.8,
    },
    ['Product'] = Config.Products["Ammunations"]
  },
  [29] = {
    ['Name'] = 'Ammunation',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -662.79,
      ['Y'] = -934.98,
      ['Z'] = 21.83,
    },
    ['Product'] = Config.Products["Ammunations"]
  },
  [30] = {
    ['Name'] = 'Hardware Store',
    ['Type'] = 'Hardware',
    ['Coords'] = {
      ['X'] = -11.788822174072,
      ['Y'] = 6499.97265625,
      ['Z'] = 31.494564056396
    },
    ['Product'] = Config.Products["Hardware-2"]
  },
  [31] = {
    ['Name'] = 'West Eclipse Boulevard Xero',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = -2070.46,
      ['Y'] = -331.96,
      ['Z'] = 13.32,
    },
    ['Product'] = Config.Products["Shops"]
  },
  [32] = {
    ['Name'] = 'Na Albaneca Magazina',
    ['Type'] = 'Store',
    ['Coords'] = {
      ['X'] = 812.86352539063,
      ['Y'] = -781.04681396484,
      ['Z'] = 26.174961090088,
    },
    ['Product'] = Config.Products["Shops"]
  },
}