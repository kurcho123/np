Config = Config or {}

Config.CurrentWeaponData = nil

Config.DurabilityBlockedWeapons = {"weapon_unarmed", "weapon_knuckle", "weapon_molotov", "weapon_flare", "weapon_stickybomb", "weapon_book", "weapon_cash", "weapon_brick", "weapon_bread","weapon_wrench","weapon_hammer","weapon_knife","weapon_shiv","weapon_switchblade","weapon_hatchet","weapon_flashlight","weapon_nightstick",}
Config.DurabilityMultiplier = {['weapon_m700'] = 0.17, ['weapon_carbinerifle_mk2'] = 0.17, ['weapon_stungun'] = 0.17, ['weapon_assaultrifle_mk2'] = 0.17, ['weapon_heavypistol'] = 0.17, ['weapon_pistol_mk2'] = 0.17, ['weapon_snspistol_mk2'] = 0.17, ['weapon_snspistol'] = 0.17, ['weapon_nightstick'] = 0.5, ['weapon_flashlight'] = 0.5, ['weapon_switchblade'] = 0.5, ['weapon_wrench'] = 0.5, ['weapon_hatchet'] = 0.5, ['weapon_knife'] = 0.5,['weapon_shiv'] = 0.5, ['weapon_hammer'] = 0.5, ['weapon_bread'] = 0.5, ['weapon_sawnoffshotgun'] = 0.17, ['weapon_appistol'] = 0.17, ['weapon_g17'] = 0.17, ['weapon_machinepistol'] = 0.17, ['weapon_vintagepistol'] = 0.17, ['weapon_combatpistol'] = 0.17, ['weapon_microsmg'] = 0.17, ['weapon_pistol'] = 0.17, ['weapon_pistol50'] = 0.17, ['weapon_ceramicpistol'] = 0.17, ['weapon_gadgetpistol'] = 0.17, ['weapon_railgun'] = 0.17}
Config.Locale = "en"
Config.WeaponsList = {
 -- // Unarmed \\ --
 [GetHashKey('weapon_unarmed')]     = {['Name'] = 'Hands',       ['IdName'] = 'weapon_unarmed',     ['AmmoType'] = nil,          ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_nightstick')]  = {['Name'] = 'Baton',       ['IdName'] = 'weapon_nightstick',  ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_flashlight')]  = {['Name'] = 'Zaklamp',     ['IdName'] = 'weapon_flashlight',  ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_hatchet')]     = {['Name'] = 'Hakbijl',     ['IdName'] = 'weapon_hatchet',     ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_switchblade')] = {['Name'] = 'Klapmes',     ['IdName'] = 'weapon_switchblade', ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_knife')]       = {['Name'] = 'Keuken Mes',  ['IdName'] = 'weapon_knife',       ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_shiv')]       = {['Name'] = 'Shiv',  ['IdName'] = 'weapon_shiv',       ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_hammer')]      = {['Name'] = 'Hammer',      ['IdName'] = 'weapon_hammer',      ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_wrench')]      = {['Name'] = 'Moersleutel', ['IdName'] = 'weapon_wrench',      ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_knuckle')]     = {['Name'] = 'Knuckle',     ['IdName'] = 'weapon_knuckle',     ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_bread')]       = {['Name'] = 'Stokbrood',   ['IdName'] = 'weapon_bread',       ['AmmoType'] = 'AMMO_MELEE', ['MaxAmmo'] = nil, ['Wait'] = math.random(4000, 6000), ['Recoil'] = nil},
 [GetHashKey('weapon_molotov')]     = {['Name'] = 'Molotov Cocktail', ['IdName'] = 'weapon_molotov',['AmmoType'] = 'AMMO_FIRE',  ['MaxAmmo'] = nil, ['Recoil'] = nil},
 [GetHashKey('weapon_flare')]       = {['Name'] = 'Flare',       ['IdName'] = 'weapon_flare',       ['AmmoType'] = 'AMMO_FIRE',  ['MaxAmmo'] = nil, ['Recoil'] = nil},
 [GetHashKey('weapon_stickybomb')]       = {['Name'] = 'Sticky Bomb',       ['IdName'] = 'weapon_stickybomb',       ['AmmoType'] = 'AMMO_FIRE',  ['MaxAmmo'] = nil, ['Recoil'] = nil},
 [GetHashKey('weapon_cash')]       = {['Name'] = 'Cash',       ['IdName'] = 'weapon_cash',       ['AmmoType'] = 'AMMO_FIRE',  ['MaxAmmo'] = nil, ['Recoil'] = nil},
 [GetHashKey('weapon_brick')]       = {['Name'] = 'Brick',       ['IdName'] = 'weapon_brick',       ['AmmoType'] = 'AMMO_FIRE',  ['MaxAmmo'] = nil, ['Recoil'] = nil},
 [GetHashKey('weapon_book')]       = {['Name'] = 'Book',       ['IdName'] = 'weapon_book',       ['AmmoType'] = 'AMMO_FIRE',  ['MaxAmmo'] = nil, ['Recoil'] = nil},
 -- // Stun GUN \\ --
 [GetHashKey('weapon_stungun')]        = {['Name'] = 'Stun Gun',        ['IdName'] = 'weapon_stungun',         ['AmmoType'] = 'AMMO_TAZER',  ['MaxAmmo'] = 2,  ['MagAmmo'] = 2, ['Wait'] = math.random(15000, 20000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 -- // Pistols \\ --
 [GetHashKey('weapon_snspistol_mk2')]  = {['Name'] = 'Sns Pistol',     ['IdName'] = 'weapon_snspistol_mk2',   ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_snspistol')]  = {['Name'] = 'Paintball Gun',     ['IdName'] = 'weapon_snspistol',   ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_pistol')]         = {['Name'] = 'Pistol',         ['IdName'] = 'weapon_pistol',          ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_pistol_mk2')]     = {['Name'] = 'Pistol Mk2',     ['IdName'] = 'weapon_pistol_mk2',      ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_heavypistol')]    = {['Name'] = 'Heavy Pistol',   ['IdName'] = 'weapon_heavypistol',     ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_vintagepistol')]  = {['Name'] = 'Klasiek Pistol', ['IdName'] = 'weapon_vintagepistol',   ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_combatpistol')]   = {['Name'] = 'Combat Pistol',  ['IdName'] = 'weapon_combatpistol',    ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_pistol50')]       = {['Name'] = 'Pistol 50cal',   ['IdName'] = 'weapon_pistol50',        ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_ceramicpistol')]  = {['Name'] = 'Ceramic Pistol', ['IdName'] = 'weapon_ceramicpistol',   ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_g17')]            =  {['Name'] = 'Glock 17',      ['IdName'] = 'weapon_g17',   ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 

 [GetHashKey('weapon_gadgetpistol')]   = {['Name'] = 'Gadget Pistool',  ['IdName'] = 'weapon_gadgetpistol',    ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 
 --[[ Police Pistol ]]
 [GetHashKey('weapon_appistol')]       = {['Name'] = 'AP Pistool',        ['IdName'] = 'weapon_appistol',      ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 60, ['MagAmmo'] = 20, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 
 
 -- // SMG Pistols \\ --    
 [GetHashKey('weapon_machinepistol')]  = {['Name'] = 'Machine Pistool',   ['IdName'] = 'weapon_machinepistol', ['AmmoType'] = 'AMMO_PISTOL', ['MaxAmmo'] = 120, ['MagAmmo'] = 12, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 [GetHashKey('weapon_microsmg')]       = {['Name'] = 'MircoSMG',          ['IdName'] = 'weapon_microsmg',      ['AmmoType'] = 'AMMO_SMG',    ['MaxAmmo'] = 120, ['MagAmmo'] = 16, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.3, ['Recoil2'] = 4},
 -- // Shotguns \\ --
 [GetHashKey('weapon_sawnoffshotgun')]  = {['Name'] = 'Korte Shotgun',   ['IdName'] = 'weapon_sawnoffshotgun', ['AmmoType'] = 'AMMO_SHOTGUN', ['MaxAmmo'] = 16, ['MagAmmo'] = 2, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.5, ['Recoil2'] = 4},
 -- // Rifles \\ --
 [GetHashKey('weapon_carbinerifle_mk2')]  = {['Name'] = 'Carbine Rifle',   ['IdName'] = 'weapon_carbinerifle_mk2', ['AmmoType'] = 'AMMO_RIFLE', ['MaxAmmo'] = 120, ['MagAmmo'] = 30, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.7, ['Recoil2'] = 4},
 [GetHashKey('weapon_assaultrifle_mk2')]  = {['Name'] = 'Assault Rifle',   ['IdName'] = 'weapon_assaultrifle_mk2', ['AmmoType'] = 'AMMO_RIFLE', ['MaxAmmo'] = 120, ['MagAmmo'] = 30, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.7, ['Recoil2'] = 4},
 [GetHashKey('weapon_railgun')]  = {['Name'] = 'EMP Gun',   ['IdName'] = 'weapon_railgun', ['AmmoType'] = 'AMMO_TAZER', ['MaxAmmo'] = 1, ['MagAmmo'] = 1, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.7, ['Recoil2'] = 4},
 -- // Hunting \\ --
 [GetHashKey('weapon_m700')]  = {['Name'] = 'Hunting Rifle',   ['IdName'] = 'weapon_m700', ['AmmoType'] = 'AMMO_RIFLE', ['MaxAmmo'] = 15, ['MagAmmo'] = 3, ['Wait'] = math.random(4000, 6000), ['Recoil'] = 0.7, ['Recoil2'] = 4},
}

Config.WeaponAttachments = {
    ["WEAPON_SNSPISTOL_MK2"] = {
        ["pistol_suppressor02"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor02",
        },
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_SNSPISTOL_MK2_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_flashlight03"] = {
            component = "COMPONENT_AT_PI_FLSH_03",
            label = "Flashlight",
            item = "pistol_flashlight03",
        },
        ["pistol_scope02"] = {
            component = "COMPONENT_AT_PI_RAIL_02",
            label = "Mounted Scope",
            item = "pistol_scope02",
        },
        ["pistol_compensator01"] = {
            component = "COMPONENT_AT_PI_COMP_02",
            label = "Compensator",
            item = "pistol_compensator01",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_suppressor01"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor01",
        },
    },
    ["WEAPON_PISTOL"] = {
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_PISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_flashlight01"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight01",
        },
        ["pistol_suppressor02"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor02",
        },
    },
    ["WEAPON_COMBATPISTOL"] = {
        ["pistol_suppressor02"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor02",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight01",
        },
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
    },
    ["WEAPON_PISTOL_MK2"] = {
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_PISTOL_MK2_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_scope"] = {
            component = "COMPONENT_AT_PI_RAIL",
            label = "Scope",
            item = "pistol_scope",
        },
        ["pistol_flashlight02"] = {
            component = "COMPONENT_AT_PI_FLSH_02",
            label = "Flashlight",
            item = "pistol_flashlight02",
        },
        ["pistol_suppressor02"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor02",
        },
        ["pistol_compensator01"] = {
            component = "COMPONENT_AT_PI_COMP",
            label = "Compensator",
            item = "pistol_compensator01",
        },
    },
    ["WEAPON_PISTOL50"] = {
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_PISTOL50_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_flashlight01"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight01",
        },
        ["rifle_suppressor02"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor02",
        },
    },
    ["WEAPON_HEAVYPISTOL"] = {
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_HEAVYPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_flashlight01"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight01",
        },
        ["pistol_suppressor01"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor01",
        },
    },
    ["WEAPON_G17"] = {
        ["pistol_extendedclip01"] = {
            component = "COMPONENT_G17_CLIP_03",
            label = "Extended Clip",
            item = "pistol_extendedclip01",
        },
        ["pistol_flashlight01"] = {
            component = "COMPONENT_G17_FLASH_01",
            label = "Flashlight",
            item = "pistol_flashlight01",
        },
        --[[ ["pistol_suppressor01"] = {
            component = "COMPONENT_G17_SUPPRESSOR_03",
            label = "Suppressor",
            item = "pistol_suppressor01",
        }, ]]
    },
}
        