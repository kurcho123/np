Config = Config or {}

Config.Locations = {
    ['Weapons'] = {
        ['X'] = -164.49942016602,
        ['Y'] = -153.75686645508,
        ['Z'] = 93.702461242676,
        ['H'] = 357.54333496094
    },
    ['Explosive'] = {
        ['X'] = 140.6533,
        ['Y'] = -574.33,
        ['Z'] = 22.066532,
        ['H'] = 105.54541
    }
}

Config.DItems = { 
  ['stolen-tv'] = {
    ['wires'] = {min = 1, max = 5},
  },
  ['stolen-ps5'] = {
    ['lcd'] = {min = 1, max = 1},
    ['wires'] = {min = 1, max = 2},
  },
  ['stolen-pc'] = {
    ['lcd'] = {min = 1, max = 2},
    ['wires'] = {min = 1, max = 5},
  },
  ['stolen-micro'] = {
    ['lcd'] = {min = 1, max = 1},
    ['wires'] = {min = 1, max = 4},
  },
  ['gaming-laptop'] = {
    ['flex-battery'] = {min = 1, max = 1},
  },
}

Config.ElectronicTable = {
  [1] = {['X'] = 606.66912, ['Y'] = -3092.812, ['Z'] = 6.0692615, ['H'] = 283.82287},
}

Config.Locale = "en"
Config.CraftingItems = {
    [1] = {
      name = "lockpick",
      amount = 50,
      info = {},
      costs = {
        ["metalscrap"] = 44,
        ["plastic"] = 64,
      },
      type = "item",
      slot = 1,
      threshold = 0,
      points = 4,
  },
  [2] = {
    name = "toolkit",
    amount = 50,
    info = {},
    costs = {
      ["metalscrap"] = 80,
      ["plastic"] = 120,
    },
    type = "item",
    slot = 2,
    threshold = 0,
    points = 4,
  },
  [3] = {
    name = "electronickit",
    amount = 50,
    info = {},
    costs = {
      ["metalscrap"] = 90,
      ["plastic"] = 150,
      ["aluminum"] = 60,
    },
    type = "item",
    slot = 3,
    threshold = 0,
    points = 4,
  },
  [4] = {
    name = "plastic-bag",
    amount = 500,
    info = {},
    costs = {
      ["plastic"] = 1,
    },
    type = "item",
    slot = 4,
    threshold = 0,
    points = 0,
  },
  [5] = {
    name = "autolockpick",
    amount = 50,
    info = {},
    costs = {
      ["glass"] = 150,
      ["rubber"] = 150,
      ["steel"] = 75,
    },
    type = "item",
    slot = 5,
    threshold = 74,
    points = 4,
  },
  [6] = {
    name = "gpshack",
    amount = 50,
    info = {},
    costs = {
      ["glass"] = 150,
      ["rubber"] = 150,
      ["steel"] = 75,
      ["copper"] = 100,
    },
    type = "item",
    slot = 6,
    threshold = 74,
    points = 4,
  },
  [7] = {
    name = "npv",
    amount = 50,
    info = {},
    costs = {
      ["electronickit"] = 1,
      ["glass"] = 150,
      ["rubber"] = 150,
    },
    type = "item",
    slot = 7,
    threshold = 74,
    points = 4,
  },
  [8] = {
    name = "pigtails",
    amount = 50,
    info = {},
    costs = {
      ["steel"] = 50,
      ["copper"] = 50,
    },
    type = "item",
    slot = 8,
    threshold = 75,
    points = 4,
  },
  [9] = {
    name = "pliers",
    amount = 50,
    info = {},
    costs = {
      ["iron"] = 100,
      ["aluminum"] = 100,
    },
    type = "item",
    slot = 9,
    threshold = 75,
    points = 4,
  },
  [10] = {
    name = "pistol-ammo",
    amount = 50,
    info = {},
    costs = {
      ["steel"] = 37,
      ["copper"] = 26,
      ["bulletshells"] = 1,
    },
    type = "item",
    slot = 10,
    threshold = 215,
    points = 4,
  },
  [11] = {
    name = "plate",
    amount = 50,
    info = {},
    costs = {
      ["iron"] = 66,
      ["steel"] = 88,
    },
    type = "item",
    slot = 11,
    threshold = 250,
    points = 4,
  },
  [12] = {
    name = "repairkit",
    amount = 50,
    info = {},
    costs = {
      ["metalscrap"] = 32,
      ["steel"] = 43,
      ["plastic"] = 61,
      ["ctoolbox"] = 1,
    },
    type = "item",
    slot = 12,
    threshold = 270,
    points = 4,
  },
  [13] = {
    name = "ironoxide",
    amount = 50,
    info = {},
    costs = {
      ["iron"] = 120,
      ["glass"] = 60,
    },
    type = "item",
    slot = 13,
    threshold = 300,
    points = 4,
  },
  [14] = {
    name = "aluminumoxide",
    amount = 50,
    info = {},
    costs = {
      ["aluminum"] = 120,
      ["glass"] = 60,
    },
    type = "item",
    slot = 14,
    threshold = 310,
    points = 4,
  },
  [15] = {
    name = "smoke",
    amount = 50,
    info = {},
    costs = {
      ["aluminum"] = 120,
      ["plastic"] = 60,
    },
    type = "item",
    slot = 15,
    threshold = 311,
    points = 4,
  },
}
Config.CraftingWeapons = {
    [1] = {
        name = "weapon_assaultrifle_mk2",
        amount = 50,
        info = {
            ammo = 30,
            quality = 100.0
        },
        costs = {
            ["rifle-body"] = 1,
            ["rifle-clip"] = 1,
            ["rifle-stock"] = 1,
            ["rifle-trigger"] = 1
        },
        type = "weapon",
        slot = 1,
        description = '[1x Rifle Body, 1x Rifle Clip, 1x Rifle Stock, 1x Rifle Trigger]'
    },
    [2] = {
        name = "rifle-ammo",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 64,
            ["steel"] = 46,
            ["copper"] = 35
        },
        type = "item",
        slot = 2,
        description = '[64x Metaal Schroot, 46x Staal, 35x Koper]'
    }
}

Config.CraftingExplosive = {
    [1] = {
        name = "bomb-timer",
        amount = 50,
        info = {},
        costs = {
            ["lcd"] = 1,
            ["wires"] = 5
        },
        type = "item",
        slot = 1,
        threshold = 0,
        points = 1
    },
    [2] = {
        name = "explosive-b",
        amount = 50,
        info = {},
        costs = {
            ["glue"] = 17,
            ["plastic"] = 150,
            ["rubber"] = 250
        },
        type = "item",
        slot = 2,
        threshold = 25,
        points = 2
    },
    [3] = {
        name = "explosive_lv1",
        amount = 50,
        info = {},
        costs = {
            ["bomb-timer"] = 1,
            ["duct-tape"] = 2,
            ["explosive-b"] = 2
        },
        type = "item",
        slot = 3,
        threshold = 50,
        points = 2
    },
    [4] = {
        name = "explosive_lv2",
        amount = 50,
        info = {},
        costs = {
            ["bomb-timer"] = 1,
            ["duct-tape"] = 2,
            ["explosive-b"] = 4
        },
        type = "item",
        slot = 4,
        threshold = 75,
        points = 3
    },
    [5] = {
        name = "explosive_lv3",
        amount = 50,
        info = {},
        costs = {
            ["bomb-timer"] = 1,
            ["duct-tape"] = 3,
            ["explosive-a"] = 6
        },
        type = "item",
        slot = 5,
        threshold = 100,
        points = 4
    },
    [6] = {
        name = "explosive_lv4",
        amount = 50,
        info = {},
        costs = {
            ["bomb-timer"] = 1,
            ["duct-tape"] = 3,
            ["explosive-a"] = 10
        },
        type = "item",
        slot = 6,
        threshold = 125,
        points = 5
    },
    [7] = {
      name = "thermalbomb_lv2",
      amount = 50,
      info = {},
      costs = {
          ["thermite"] = 3,
          ["thermite-charge"] = 1,
          ["glass"] = 200,
          ["aluminum"] = 200

      },
      type = "item",
      slot = 7,
      threshold = 150,
      points = 5
  },
}
