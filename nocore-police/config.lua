Config = {}
nocoreBoatshop = nocoreBoatshop or {}
local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Config.RandomStr = function(length)
	if length > 0 then
		return Config.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Config.RandomInt = function(length)
	if length > 0 then
		return Config.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end
nocoreBoatshop.PoliceBoat = vector3(-800.67, -1494.54, 1.59)

nocoreBoatshop.PoliceBoatSpawn = vector4(-793.58, -1501.4, 0.12, 111.5)

nocoreBoatshop.PoliceBoat2 = vector3(-279.41, 6635.09, 7.51)


nocoreBoatshop.PoliceBoatSpawn2 = vector4(-293.10, 6642.69, 0.15, 65.5)

Config.CurrentId = nil

Config.Debug = true
Config.DebugZones = false

Config.waterClean = true
Config.waterCleanTime = 5000

Config.IsEscorted = false
Config.IsHandCuffed = false
Config.UsingDispatch = true

Config.Keys = {["E"] = 38, ["G"] = 47, ["H"] = 74}

Config.AmmoLabels = {
 ["AMMO_PISTOL"] = "9x19mm Парабелум куршум",
 ["AMMO_SMG"] = "9x19mm Парабелум куршум",
 ["AMMO_RIFLE"] = "7.62x39mm куршум",
 ["AMMO_MG"] = "7.92x57mm Маузер куршум",
 ["AMMO_SHOTGUN"] = "12-габаритен куршум",
 ["AMMO_SNIPER"] = "Куршум с голям калибър",
}

Config.StatusList = {
	["fight"] = {time = 0, text = "Червени ръце"},
	["widepupils"] = {time = 0, text = "Разширени зеници"},
	["redeyes"] = {time = 0, text = "Червени очи"},
	["weedsmell"] = {time = 0, text = "Мирише на трева"},
	["gunpowder"] = {time = 0, text = "Следи от барут по дрехите"},
	["chemicals"] = {time = 0, text = "Мирише на химикали"},
	["heavybreath"] = {time = 0, text = "Диша тежко"},
	["sweat"] = {time = 0, text = "Много се поти"},
  ["handbleed"] = {time = 0, text = "Кръв по ръцете"},
	["confused"] = {time = 0, text = "Объркан"},
  ["alcohol"] = {time = 0, text = "Дъха мирише на алкохол"},
	["heavyalcohol"] = {time = 0, text = "Мирише много на алкохол"},
}

Config.SilentWeapons = {
 "WEAPON_UNARMED",
 "WEAPON_SNOWBALL",
 "WEAPON_PETROLCAN",
 "WEAPON_STUNGUN",
 "WEAPON_FIREEXTINGUISHER",
}

Config.WeaponHashGroup = {
 [416676503] =   {['name'] = "Пистолет"},
 [860033945] =   {['name'] = "Помпа"},
 [970310034] =   {['name'] = "Полу Автоматично"},
 [1159398588] =  {['name'] = "Автоматично"},
 [-1212426201] = {['name'] = "Снайпер"},
 [-1569042529] = {['name'] = "Тежка"},
 [1548507267] =  {['name'] = "Граната"},
}

Config.Locations2 = {
  ["vehicle"] = {
    ["x"] = 445.5,
    ["y"] = -994.35,
    ["z"] = 25.22,
    ["h"] = 97.5,
  }
}

Config.Locations = {
    ["PoliceStation"] = {
      [1] = {["x"] = 473.78, ["y"] = -992.64, ["z"] = 26.27, ["h"] = 0.0},
      [2] = {["x"] = -445.87, ["y"] = 6013.88, ["z"] = 31.71, ["h"] = 0.0},
      [3] = {["x"] = 1874.7329101562, ["y"] = 3705.0905761719, ["z"] = 32.855007171631, ["h"] = 0.0}
    },
    ["EvidenceRoom"] = {
      [1] = {["x"] = 381.15615844727, ["y"] = -1609.1856689453, ["z"] = 30.202714920044, ["h"] = 0.0},
      [2] = {["x"] = -445.87, ["y"] = 6013.88, ["z"] = 31.71,["h"] = 0.0 },
      [3] = {["x"] = 1874.7329101562, ["y"] = 3705.0905761719, ["z"] = 32.855007171631, ["h"] = 0.0},
      [4] = {["x"] = 381.38592529297, ["y"] = 796.57354736328, ["z"] = 190.49029541016, ["h"] = 0.0},
      [5] = {['x'] = 1826.5712, ['y'] = 3677.8271, ['z'] = 34.189189, ['h'] = 0.0 },
      [6] = { ['x'] = 845.93634, ['y'] = -1297.623, ['z'] = 28.244918, ['h'] = 0.0 }
    },
    ['checkin'] = {
      [1] = {['X'] = 441.27, ['Y'] = -981.96, ['Z'] = 30.68},
    },
    ['fingerprint'] = {
      [1] = {['X'] = 473.19, ['Y'] = -1007.45, ['Z'] = 26.27},
    },
    ['personal-safe'] = {
      [1] = { ['X'] = 381.16564, ['Y'] = -1609.173, ['Z'] = 30.202711, ['H'] = 232.42622 },
      [2] = { ['X'] = -445.7427, ['Y'] = 6018.5029, ['Z'] = 36.995658, ['H'] = 42.217906 },
      [3] = { ['X'] = 1822.4462, ['Y'] = 3668.2199, ['Z'] = 34.189216, ['H'] = 122.70767 },
      [4] = { ['X'] = 836.33276, ['Y'] = -1287.2, ['Z'] = 28.244935, ['H'] = 94.434494 }
    },
    ['boss'] = {
      [1] = {['X'] = 460.55288, ['Y'] = -985.4736, ['Z'] = 30.728073},
    },
    ['Helipad'] = { -- 449.25427, -981.4015, 43.69168
      ['Spawn'] = {['x'] = 449.25427, ['y'] = -981.4015, ['z'] = 43.69168, ['a'] = 20.283187}
    },
    ['impound'] = { x = 387.47308349609, y = -1636.8209228516, z = 28.618518829346, h = 319.32260131836},
    ['work-shops'] = {
      [1] = {['X'] = 482.63, ['Y'] = -996.21, ['Z'] = 30.68},
    },
    ['garage'] = {
        [1] = {
         ['X'] = 441.05, 
         ['Y'] = -992.93, 
         ['Z'] = 25.69,
         ['Spawns'] = {
            [1] = {
             ['X'] = 436.87,
             ['Y'] = -994.17,
             ['Z'] = 25.69,
             ['H'] = 88.02,
            },
            [2] = {
             ['X'] = 437.08,
             ['Y'] = -988.96,
             ['Z'] = 25.89,
             ['H'] = 90.94,
            },
            [3] = {
             ['X'] = 445.19,
             ['Y'] = -991.56,
             ['Z'] = 25.69,
             ['H'] = 268.71,
            },
          },
       },
       [2] = {
        ['X'] = 1862.9927, 
        ['Y'] = 3695.8588, 
        ['Z'] = 33.974567,
        ['Spawns'] = {
          [1] = {
            ['X'] = 1862.9566, ['Y'] = 3695.8747, ['Z'] = 33.550548, ['H'] = 121.28893,
          },
          [2] = {
          ['X'] = 1865.0668, ['Y'] = 3692.5141, ['Z'] = 33.550624, ['H'] = 119.58419,
          },
          [3] = {
          ['X'] = 1861.4515, ['Y'] = 3699.5612, ['Z'] = 33.550098, ['H'] = 120.11874,
          },
        },
      },
    },
}

Config.AllowedVehicles = {
  [1] = {model = "sahp", label = "Cadet"},
  [2] = {model = "sahp2", label = "Police Patrol"},
  [3] = {model = "sahp3", label = "Suv Patrol"},
  [4] = {model = "sahp5", label = "Suv Patrol 2"},
  [5] = {model = "sahpb", label = "Bike Patrol"},
  [6] = {model = "sahpb2", label = "Bike Patrol 2"},
  [7] = {model = "pbus", label = "Police Bus"},
  [8] = {model = "polvacca", label = "Police Highspeed"},
  }

Config.Objects = {
  ["cone"] = {model = `prop_roadcone02a`, freeze = false},
  ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
  ["schot"] = {model = `prop_snow_sign_road_06g`, freeze = true},
  ["tent"] = {model = `prop_gazebo_03`, freeze = true},
  ["light"] = {model = `prop_worklight_03b`, freeze = true},
  ["medbag"] = {model = `prop_cs_shopping_bag`, freeze = true},
  ["deff"] = {model = `prop_ld_case_01`, freeze = true},
  ["toolbox"] = {model = `ch_prop_toolbox_01a`, freeze = true},
}

Config.Items = {
  label = "Police Armmory",
  slots = 30,
  citems = {
      [1] = {
        name = "weapon_g17",
        price = 0,
        amount = 1,
        info = {
            serie = "",  
            melee = false,
            quality = 100.0,
            attachments = {{component = "COMPONENT_G17_FLASH_01", label = "Flashlight"}}
        },
        type = "weapon",
        slot = 1,
        rank = 7,
      },
      [2] = {
        name = "weapon_stungun",
        price = 0,
        amount = 1,
        info = {
          serie = "",   
          melee = false,
          quality = 100.0,
          ammo = 1,
          tint = 5,
        },
        type = "weapon",
        slot = 2,
        rank = 0,
      },
      [3] = {
        name = "weapon_carbinerifle_mk2",
        price = 0,
        amount = 1,
        info = {
          serie = "",  
          melee = false,
          quality = 100.0,
          attachments = {{component = "COMPONENT_AT_SCOPE_MEDIUM_MK2", label = "Scope"}, {component = "COMPONENT_AT_MUZZLE_05", label = "Muzzle Demper"}, {component = "COMPONENT_AT_AR_AFGRIP_02", label = "Grip"}, {component = "COMPONENT_AT_AR_FLSH", label = "Falshlight"}}    
        },
        type = "weapon",
        slot = 3,
        rank = 7,
      },
      [4] = {
        name = "weapon_flashlight",
        price = 0,
        amount = 1,
        info = {
          melee = true,
          quality = 100.0
        },
        type = "weapon",
        slot = 4,
        rank = 0,
      },
      [5] = {
        name = "weapon_nightstick",
        price = 0,
        amount = 1,
        info = {
          melee = true,
          quality = 100.0
        },
        type = "weapon",
        slot = 5,
        rank = 0,
      },
      [6] = {
        name = "weapon_railgun",
        price = 0,
        amount = 1,
        info = {
          quality = 100.0
        },
        type = "weapon",
        slot = 6,
        rank = 4,
      },
      [7] = {
        name = "pistol-ammo",
        price = 1,
        amount = 50,
        info = {},
        type = "item",
        slot = 7,
        rank = 0,
      },
      [8] = {
        name = "rifle-ammo",
        price = 1,
        amount = 50,
        info = {},
        type = "item",
        slot = 8,
        rank = 0,
      },
      [9] = {
        name = "taser-ammo",
        price = 1,
        amount = 50,
        info = {},
        type = "item",
        slot = 9,
        rank = 0,
      },
      [10] = {
        name = "armor",
        price = 150,
        amount = 50,
        info = {},
        type = "item",
        slot = 10,
        rank = 0,
      },
      [11] = {
        name = "heavy-armor",
        price = 350,
        amount = 50,
        info = {},
        type = "item",
        slot = 11,
        rank = 0,
      },
      [12] = {
        name = "handcuffs",
        price = 0,
        amount = 1,
        info = {},
        type = "item",
        slot = 12,
        rank = 0,
      },
      [13] = {
        name = "empty_evidence_bag",
        price = 0,
        amount = 50,
        info = {},
        type = "item",
        slot = 13,
        rank = 0,
      },
      [14] = {
        name = "radio",
        price = 0,
        amount = 50,
        info = {},
        type = "item",
        slot = 14,
        rank = 0,
      },
      [15] = {
        name = "police_stormram",
        price = 0,
        amount = 50,
        info = {},
        type = "item",
        slot = 15,
        rank = 3,
      },
      [16] = {
        name = "binoculars",
        price = 300,
        amount = 50,
        info = {},
        type = "item",
        slot = 16,
        rank = 0,
      },
      [17] = {
        name = "breathalyzer",
        price = 200,
        amount = 50,
        info = {},
        type = "item",
        slot = 17,
        rank = 0,
      },
      [18] = {
        name = "diktofon",
        price = 200,
        amount = 50,
        info = {
          power = false
        },
        type = "item",
        slot = 18,
        rank = 0,
      },
      [19] = {
        name = "parachute",
        price = 550,
        amount = 50,
        info = {},
        type = "item",
        slot = 19,
        rank = 0,
      },
      [20] = {
        name = "oxygen_mask",
        price = 550,
        amount = 50,
        info = {},
        type = "item",
        slot = 20,
        rank = 0,
      },
      [21] = {
        name = "police-megaphone",
        price = 550,
        amount = 50,
        info = {},
        type = "item",
        slot = 21,
        rank = 7,
      },
      [22] = {
        name = "spikestrip",
        price = 0,
        amount = 1,
        info = {},
        type = "item",
        slot = 22,
        rank = 1,
      },
      [23] = {
        name = "pistol_flashlight01",
        price = 0,
        amount = 50,
        info = {},
        type = "item",
        slot = 23,
        rank = 7,
      },
      [24] = {
        name = "pistol_extendedclip01",
        price = 0,
        amount = 50,
        info = {},
        type = "item",
        slot = 24,
        rank = 7,
      },
   }
}