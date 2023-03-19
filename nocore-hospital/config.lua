Config = Config or {}

Config.Keys = {["E"] = 38, ["T"] = 245, ["V"] = 0, ["ESC"] = 322, ["F1"] = 288, ["HOME"] = 213}

Config.Locale = "en"
Config.IsDeath = false
Config.IsInBed = false
Config.Timer = 300

Config.RespawnPrice = 2000 

Config.OnOxy = false

Config.BedPayment = 1000

Config.MaxBodyPartHealth = 5

Config.MaxAmbulanceToUseAutoRevive = 3

Config.CurrentPain = {}

Config.Locations = { -- vector3(353.38, -1399.63, 32.5)
  ["CheckIn"] = vector3(353.38, -1399.63, 32.5),
  ['Duty'] = {
    [1] = {['X'] = -432.4795, ['Y'] = -318.4946, ['Z'] = 34.910785},
  },
  ['Shop'] = {
    [1] = {['X'] = 376.50646, ['Y'] = -829.6978, ['Z'] = 29.291391}, -- 376.50646, -829.6978, 29.291391, 95.213195
  },
  ['Storage'] = { -- vector3(355.69, -1413.06, 32.5)
    [1] = {['X'] = 355.69, ['Y'] = -1413.06, ['Z'] = 32.5},
  },
  ['Boss'] = { -- vector3(351.25, -1414.26, 32.5)
    [1] = {['X'] = 351.25, ['Y'] = -1414.26, ['Z'] = 32.5},
  },
  ['Teleporters'] = {
    ['ToHeli'] =  {['X'] = -452.4141, ['Y'] = -288.5147, ['Z'] = 34.945022},
    ['ToHospitalFirst'] = {['X'] = -452.5021, ['Y'] = -288.3874, ['Z'] = -130.8453},

    ['ToHospitalSecond'] = {['X'] = -493.5164, ['Y'] = -327.176, ['Z'] = 42.307243},
    ['ToLower'] = {['X'] = -440.6251, ['Y'] = -339.7842, ['Z'] = 78.31269},

    ['ToCourtUP'] = {['X'] = 329.38632, ['Y'] = -1650.522, ['Z'] = 32.531719},
    ['ToCourtDOWN'] = {['X'] = 329.22952, ['Y'] = -1650.503, ['Z'] = 60.533729},
  },
  ['Helipad'] = {
    ['Spawn'] = {['x'] = 299.6702, ['y'] = -1453.1982, ['z'] = 46.5097, ['a'] = 141.144},
    ['Spawner'] = vector3(339.5722, -1430.0456, 46.5070),
  },
  ['Garage'] = {
    [1] = {
     ['X'] = -491.4574, 
     ['Y'] = -333.0402, 
     ['Z'] = 34.368343,
     ['Spawns'] = {
        [1] = {
         ['X'] = 333.75,
         ['Y'] = -574.79,
         ['Z'] = 28.79,
         ['H'] = 341.55,
        },
        [2] = {
         ['X'] = 327.38,
         ['Y'] = -570.27,
         ['Z'] = 28.79,
         ['H'] = 340.72,
        },
      },
   },
   [2] = {
    ['X'] = 352.17, 
    ['Y'] = -587.87, 
    ['Z'] = 74.16,
    ['Spawns'] = nil
  },
},
}

Config.BodyHealth = {
 ['HEAD'] =       {['Name'] = 'главата',         ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['NECK'] =       {['Name'] = 'вратът',           ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['LOWER_BODY'] = {['Name'] = 'долната част на тялото', ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['UPPER_BODY'] = {['Name'] = 'горната част на тялото', ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['SPINE'] =      {['Name'] = 'гръдният кош',           ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['LARM'] =       {['Name'] = 'лявата ръка',    ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = true},
 ['RARM'] =       {['Name'] = 'дясната ръка',   ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = true},
 ['LHAND'] =      {['Name'] = 'лявата китка',   ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['RHAND'] =      {['Name'] = 'дясната китка',  ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = false},
 ['LLEG'] =       {['Name'] = 'левият крак',   ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = true},
 ['RLEG'] =       {['Name'] = 'десният крак',  ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = true},
 ['LFOOT'] =      {['Name'] = 'лявото стъпало',   ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = true},
 ['RFOOT'] =      {['Name'] = 'дясното стъпало',  ['Health'] = 4, ['Pain'] = false, ['IsDead'] = false, ['CanDie'] = true},
}

Config.Beds = { --vector3(365.02, -1403.01, 33.5)
  [1] = {['X'] = 361.39 , ['Y'] = -1407.6, ['Z'] = 36.52, ['H'] = 143.08, ['Busy'] = false, ['Hash'] = 2117668672},
--[[   [2] = {['x'] = -466.6002, ['y'] = -282.8008, ['z'] = 35.837352, ['h'] = 203.22, ['Busy'] = false, ['Hash'] = 2117668672},
  [3] = {['x'] = -469.8717, ['y'] = -284.2185, ['z'] = 35.835052, ['h'] = 204.21202, ['Busy'] = false, ['Hash'] = 2117668672},
  [4] = {['x'] = -466.8845, ['y'] = -291.3658, ['z'] = 35.835052, ['h'] = 28.438417, ['Busy'] = false, ['Hash'] = 2117668672},
  [5] = {['x'] = -463.6585, ['y'] = -290.0639, ['z'] = 35.833225, ['h'] = 25.089698, ['Busy'] = false, ['Hash'] = 2117668672}, ]]
}

Config.BodyParts = {
  [0]     = 'NONE',
  [31085] = 'HEAD',
  [31086] = 'HEAD',
  [39317] = 'NECK',
  [57597] = 'SPINE',
  [23553] = 'SPINE',
  [24816] = 'SPINE',
  [24817] = 'SPINE',
  [24818] = 'SPINE',
  [10706] = 'UPPER_BODY',
  [64729] = 'UPPER_BODY',
  [11816] = 'LOWER_BODY',
  [45509] = 'LARM',
  [61163] = 'LARM',
  [18905] = 'LHAND',
  [4089] = 'LFINGER',
  [4090] = 'LFINGER',
  [4137] = 'LFINGER',
  [4138] = 'LFINGER',
  [4153] = 'LFINGER',
  [4154] = 'LFINGER',
  [4169] = 'LFINGER',
  [4170] = 'LFINGER',
  [4185] = 'LFINGER',
  [4186] = 'LFINGER',
  [26610] = 'LFINGER',
  [26611] = 'LFINGER',
  [26612] = 'LFINGER',
  [26613] = 'LFINGER',
  [26614] = 'LFINGER',
  [58271] = 'LLEG',
  [63931] = 'LLEG',
  [2108] = 'LFOOT',
  [14201] = 'LFOOT',
  [40269] = 'RARM',
  [28252] = 'RARM',
  [57005] = 'RHAND',
  [58866] = 'RFINGER',
  [58867] = 'RFINGER',
  [58868] = 'RFINGER',
  [58869] = 'RFINGER',
  [58870] = 'RFINGER',
  [64016] = 'RFINGER',
  [64017] = 'RFINGER',
  [64064] = 'RFINGER',
  [64065] = 'RFINGER',
  [64080] = 'RFINGER',
  [64081] = 'RFINGER',
  [64096] = 'RFINGER',
  [64097] = 'RFINGER',
  [64112] = 'RFINGER',
  [64113] = 'RFINGER',
  [36864] = 'RLEG',
  [51826] = 'RLEG',
  [20781] = 'RFOOT',
  [52301] = 'RFOOT',  
}

Config.Items = {
  label = "Аптека",
  slots = 4,
  items = {
      [1] = {
          name = "bandage",
          price = 100,
          amount = 50,
          info = {},
          type = "item",
          slot = 1,
      },
      [2] = {
        name = "gasmask1",
        price = 10000,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
      [3] = {
          name = "painkillers",
          price = 50,
          amount = 50,
          info = {},
          type = "item",
          slot = 3,
      },
      [4] = {
          name = "weapon_fireextinguisher",
          price = 1000,
          amount = 50,
          info = {
            quality = 100.0,
          },
          type = "item",
          slot = 4,
      },
      [5] = {
        name = "spirt",
        price = 10,
        amount = 500,
        info = {},
        type = "item",
        slot = 5,
    }
  }
}

Config.Elevators = {
  [1] = {
      [1] = {
          Spawn = { x = 345.98, y = -1409.615, z = 32.510 },
      },
      [2] = {
          Spawn = { x = 347.75283, y = -1407.717, z = 32.510444 },
      },
  },
  [2] = {
      [1] = {
          Spawn = { x = 346.077, y = -1409.8120, z = 36.812},
      },
      [2] = {
          Spawn = { x= 347.6369, y = -1407.61, z = 36.516174},
      },
  },
  [3] = {
      [1] = {
          Spawn = { x = 342.123, y = -1425.914, z = 46.509},
      },
      [2] = {
          Spawn = { x = 339.87359, y = -1424.33, z = 46.509178},
      },
  },
}