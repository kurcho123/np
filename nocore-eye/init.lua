function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = false

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {

}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
	options = {
		{
			event = "nocore-eye:client:vizitka",
			icon = "fas fa-address-card",
			label = "Визитна картичка",
		},
        {
            event = "nocore-vehiclekeys:client:give:key:menu",
            icon = "fas fa-key",
            label = "Дай ключ",
        },
        {
            event = "nocore-eye:client:givemoney:keyboard",
            icon = "fas fa-wallet",
            label = "Дай кеш",
        },
        {
            event = "nocore-police:client:cuff:target",
            icon = "fas fa-hands",
            label = "Cuff / Uncuff",
            item = 'handcuffs',
        },
        {
            event = "nocore-police:client:steal:closest",
            icon = "fas fa-mask",
            label = "Обери",
			citizenid = {
				["DNY60145"] = true, -- Kalin4o
				["LSJ35199"] = true, -- Denev
				["LUE89797"] = true, -- Zero fucks given
				["KYA93491"] = true, -- Албанеца
				["HLX73498"] = true, --EsPiOBG
				["BGH09008"] = true, -- Infernal
				["QKI27480"] = true, -- Viktor
				["EGP19908"] = true, -- qncho
				["UFF70968"] = true, -- Doctora
				["QPV48910"] = true, -- Labadaicho
				["LBF44219"] = true, -- Ka1canov
				["MWP30733"] = true, -- Simeon
				["QHK78843"] = true, -- Foxy
				["ASF89061"] = true, -- BAMBUM
				["WHM63334"] = true, -- Cobrata
				["VHZ07318"] = true, -- Nasko
				["TPH82421"] = true, -- ! m1tkooo
				["XSP27287"] = true, -- FPS misho
			},
            canInteract = function(entity)
                local searchPlayerPed = GetPlayerPed((NetworkGetPlayerIndexFromPed(entity)))
                if IsEntityPlayingAnim(searchPlayerPed, 'random@mugging3', 'handsup_standing_base', 3) or IsEntityPlayingAnim(searchPlayerPed, 'dead', 'dead_a', 3) or IsEntityPlayingAnim(searchPlayerPed, 'mp_arresting', 'idle', 3) then
                    return true
                else
                    return false
                end
            end,
        },
        {
            event = "nocore-hospital:client:revive:target",
            icon = "fas fa-stethoscope",
            label = "Помогни",
            job = "ambulance",
            duty = true,
            canInteract = function(entity)
                local searchPlayerPed = GetPlayerPed((NetworkGetPlayerIndexFromPed(entity)))
                if IsEntityPlayingAnim(searchPlayerPed, 'dead', 'dead_a', 3) then
                    return true
                else
                    return false
                end
            end,
        },
        {
            event = "nocore-hospital:client:heal:target",
            icon = "fas fa-stethoscope",
            label = "Превържи",
            job = "ambulance",
            duty = true,
        },

        {
            event = "nocore-hospital:client:take:blood:target",
            icon = "fas fa-tint",
            label = "Вземи кръвна проба",
            job = "ambulance",
            duty = true,
        },
  },
  distance = 2.5,
}

Config.Peds = {
	[1] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'a_c_sloth', -- This is the ped model that is going to be spawning at the given coords
	-- model = 'mp_m_freemode_01', -- This is the ped model that is going to be spawning at the given coords
	appearance = json.decode(''),
	coords = vector4(-551.8923, -203.2262, 37.77417, 333.42), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = false, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	animDict = 'mp_sleep', -- This is the animation dictionairy to load the animation to play from (OPTIONAL)
	anim = 'sleep_loop', -- This is the animation that will play chosen from the animDict, this will loop the whole time the ped is spawned (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Работа', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			TriggerEvent("nocore-cityhall:client:open:nui")
		  end,
		},
		{
			num = 2,
			event = "nocore-cityhall:client:dokumenti",
			icon = "fas fa-id-card-alt",
			label = "Документи"
		}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [2] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'cs_old_man1a', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(-1193.086, -216.2008, 37.944816, 151.98707), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			TriggerEvent("nocore-stores:client:open:shop")
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [3] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_gardener_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(46.45, -1749.53, 29.63, 43.75), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			TriggerEvent("nocore-stores:client:open:shop")
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [4] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_gardener_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(2748.7214, 3472.4809, 55.677143, 247.99102), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			TriggerEvent("nocore-stores:client:open:shop")
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [5] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_gardener_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(-11.79454, 6499.9726, 31.498649, 49.406322), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			TriggerEvent("nocore-stores:client:open:shop")
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [6] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'mp_m_waremech_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(-703.8441, -783.1864, 37.222267, 210.43853), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  job = {["mechanic"] = 3},
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			local Items = {
				[1] = {
					name = "repairkit",
					price = 300,
					amount = 25,
					info = {},
					type = "item",
					slot = 1,
				},
				[2] = {
					name = "advanced_repairkit",
					price = 330,
					amount = 25,
					info = {},
					type = "item",
					slot = 2,
				},
				[3] = {
				  name = "napkin",
				  price = 10,
				  amount = 25,
				  info = {},
				  type = "item",
				  slot = 3,
			  	}
			}
			local ShopAxel = {label = "Axel", items = Items, slots = #Items}
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "Mechanic_Axel", ShopAxel)
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [7] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'a_m_y_vinewood_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(1132.72, -471.0, 71.91, 265.09), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	appearance = json.decode('{"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":7},{"texture":0,"drawable":-1,"prop_id":6},{"texture":0,"drawable":-1,"prop_id":2},{"texture":0,"drawable":-1,"prop_id":1}],"eyeColor":-1,"model":"a_m_y_vinewood_01","faceFeatures":{"eyeBrownHigh":0,"noseWidth":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakSize":0,"chinBoneLowering":0,"eyesOpening":0,"nosePeakLowering":0,"nosePeakHigh":0,"cheeksWidth":0,"lipsThickness":0,"chinHole":0,"neckThickness":0,"cheeksBoneHigh":0,"noseBoneTwist":0,"eyeBrownForward":0,"noseBoneHigh":0,"jawBoneBackSize":0,"chinBoneSize":0,"jawBoneWidth":0},"headOverlays":{"blemishes":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"makeUp":{"color":0,"opacity":0,"style":0,"secondColor":0},"chestHair":{"color":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0},"blush":{"color":0,"style":0,"opacity":0}},"tattoos":[],"headBlend":{"skinMix":0,"shapeMix":0,"thirdMix":0,"shapeFirst":0,"shapeSecond":0,"skinFirst":0,"skinSecond":0,"shapeThird":0,"skinThird":0},"hair":{"color":-1,"highlight":-1,"style":-1,"texture":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":5,"drawable":1},{"texture":1,"component_id":3,"drawable":3},{"texture":0,"component_id":4,"drawable":0},{"texture":-1,"component_id":6,"drawable":-1},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":11,"drawable":2},{"texture":0,"component_id":1,"drawable":-1},{"texture":1,"component_id":9,"drawable":3}]}'),
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_SMOKING_POT', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			local Items = {
				[1] = {
					name = "ghack",
					price = 250,
					amount = 25,
					info = {},
					type = "item",
					slot = 1,
				},
				[2] = {
				  name = "phone",
				  price = 500,
				  amount = 25,
				  info = {},
				  type = "item",
				  slot = 2,
				},
			}
			local Shop = {label = "G2A", items = Items, slots = #Items}
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "G2A_Shop", Shop)
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [8] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'mp_m_weapexp_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4( 17.31495, -1107.42, 29.797208, 163.56416), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			local Items = {
				[1] = {
					name = "weapon_flare",
					price = 500,
					amount = 50,
					info = {
					  quality = 100,
					  mele = false
					},
					type = "weapon",
					slot = 1,
				},
				[2] = {
					name = "weapon_flashlight",
					price = 1000,
					amount = 50,
					info = {
					  quality = 100,
					  mele = true,
					},
					type = "weapon",
					slot = 2,
				},
			}
			local Shop = {label = "Weapon", items = Items, slots = #Items}
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "Weapon_Shop", Shop)
		  end,
		}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [9] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_gardener_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(-1748.184, -726.0238, 10.423287, 269.44128), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			num = 1,
			event = "nocore-gardenjob:npc",
			icon = "fas fa-dot-circle",
			label = "Започни/Свърши работа",
			job = "gardener",
		},
		{
			num = 2,
			event = "nocore-gardenjob:npcgaraj",
			icon = "fas fa-dot-circle",
			label = "Вземи градинарско МПС",
			job = "gardener",
		}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [10] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_gardener_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(452.12756, -621.9975, 28.559743, 280.77264), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			num = 1,
			event = "nocore-busdriver:start",
			icon = "fas fa-dot-circle",
			label = "Започни работа",
			job = "busdriver",
		},
		{
			num = 2,
			event = "nocore-busdriver:bus",
			icon = "fas fa-dot-circle",
			label = "Вземи автобус",
			job = "busdriver",
		},
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [11] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'a_m_m_farmer_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(585.93609, 2782.3044, 43.48122, 4.262341), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	spawnNow = true,
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			event = "nocore-catcafe:Shop",
			icon = "fas fa-dot-circle",
			label = "Склад",
		},
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [12] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'U_F_M_CasinoCash_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(990.79, 30.95, 71.466339, 58.76), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_STAND_IMPATIENT', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			num = 1,
			event = "nocore-casino:buyChips",
			icon = "fas fa-coins",
			label = "Купи чипове",
		},
		{
			num = 2,
			event = "nocore-casino:exchangeChips",
			icon = "fas fa-coins",
			label = "Обмени чипове",
		},
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [13] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'g_m_y_lost_03', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(1320.8813, 4314.5991, 38.14529, 48.692424), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_SMOKING_POT', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			num = 1,
			event = "nocore-heists:rockerHeist:start",
			icon = "fas fa-handshake",
			label = "Дай му ключ за Harley"
		}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [14] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_lathandy_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(441.487, -595.172, 28.72, 350.55), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_SMOKING_POT', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			event = "nocore-busdriver:stow",
			icon = "fas fa-forward",
			label = "Върни автобуса",
			job = 'busdriver'
		}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [15] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 's_m_m_doctor_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(355.08, -1399.95, 32.5, 53.75), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_SMOKING_POT', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{
			--event = "nocore-hospital:client:checkIn",
			icon = "fas fa-hospital-user",
			targeticon = "fas fa-hospital-user",
			label = "Чекиране ($1000)",
			action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
				PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
				TriggerEvent("nocore-hospital:client:checkIn")
			end,
		},
		{
			--event = "nocore-hospital:client:OpenShop",
			icon = "fas fa-cart-shopping",
			label = "Аптека",
			action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
				PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
				TriggerEvent("nocore-hospital:client:OpenShop")
			end,
		}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },  [16] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'mp_m_waremech_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(539.48, -183.03, 53.49, 77.69), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  job = {["fixit"] = 3},
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			local Items = {
				[1] = {
					name = "repairkit",
					price = 300,
					amount = 25,
					info = {},
					type = "item",
					slot = 1,
				},
				[2] = {
					name = "advanced_repairkit",
					price = 330,
					amount = 25,
					info = {},
					type = "item",
					slot = 2,
				},
				[3] = {
				  name = "napkin",
				  price = 10,
				  amount = 25,
				  info = {},
				  type = "item",
				  slot = 3,
			  	}
			}
			local ShopAxel = {label = "Axel", items = Items, slots = #Items}
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "Mechanic_Axel", ShopAxel)
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
  [16] = { -- This MUST be a number (UNIQUE), if you make it a string it won't be able to delete peds spawned with the export
	model = 'mp_m_waremech_01', -- This is the ped model that is going to be spawning at the given coords
	coords = vector4(539.48, -183.03, 54.49, 77.69), -- This is the coords that the ped is going to spawn at, always has to be a vector4 and the w value is the heading
	minusOne = true, -- Set this to true if your ped is hovering above the ground but you want it on the ground (OPTIONAL)
	freeze = true, -- Set this to true if you want the ped to be frozen at the given coords (OPTIONAL)
	invincible = true, -- Set this to true if you want the ped to not take any damage from any source (OPTIONAL)
	blockevents = true, -- Set this to true if you don't want the ped to react the to the environment (OPTIONAL)
	flag = 1, -- This is the flag of the animation to play, for all the flags, check the TaskPlayAnim native here https://docs.fivem.net/natives/?_0x5AB552C6 (OPTIONAL)
	scenario = 'WORLD_HUMAN_CLIPBOARD', -- This is the scenario that will play the whole time the ped is spawned, this cannot pair with anim and animDict (OPTIONAL)
	target = { -- This is the target options table, here you can specify all the options to display when targeting the ped (OPTIONAL)
	  useModel = false, -- This is the option for which target function to use, when this is set to true it'll use AddTargetModel and add these to al models of the given ped model, if it is false it will only add the options to this specific ped
	  options = { -- This is your options table, in this table all the options will be specified for the target to accept
		{ -- This is the first table with options, you can make as many options inside the options table as you want
		  num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
		  icon = 'fas fa-handshake', -- This is the icon that will display next to this trigger option
		  label = 'Говори с човек', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
		  job = {["fixit"] = 3},
		  action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
			PlayAmbientSpeech1(entity, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL")
			local Items = {
				[1] = {
					name = "repairkit",
					price = 300,
					amount = 25,
					info = {},
					type = "item",
					slot = 1,
				},
				[2] = {
					name = "advanced_repairkit",
					price = 330,
					amount = 25,
					info = {},
					type = "item",
					slot = 2,
				},
				[3] = {
				  name = "napkin",
				  price = 10,
				  amount = 25,
				  info = {},
				  type = "item",
				  slot = 3,
			  	}
			}
			local ShopAxel = {label = "Fixit", items = Items, slots = #Items}
            TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "Fixit", ShopAxel)
		  end,}
	  },
	  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
	},
	currentpednumber = 0, -- This is the current ped number, this will be assigned when spawned, you can leave this out because it will always be created (OPTIONAL)
  },
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end
local function DutyCheck() return true end

CreateThread(function()
	local state = GetResourceState('no-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('no-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local Framework = exports['no-core']:GetCoreObject()
		local PlayerData = Framework.Functions.GetPlayerData()

		ItemCheck = function(items)
			local isTable = type(items) == 'table'
			local isArray = isTable and table.type(items) == 'array' or false
			local finalcount = 0
			local count = 0
			if isTable then for _ in pairs(items) do finalcount += 1 end end
			for _, v in pairs(PlayerData.items) do
				if isTable then
					if isArray then -- Table expected in this format {'itemName1', 'itemName2', 'etc'}
						for _, item in pairs(items) do
							if v and v.name == item then
								count += 1
							end
						end
					else -- Table expected in this format {['itemName'] = amount}
						local itemAmount = items[v.name]
						if itemAmount and v and v.amount >= itemAmount then
							count += 1
						end
					end
					if count == finalcount then -- This is to make sure it checks all items in the table instead of only one of the items
						return true
					end
				else -- When items is a string
					if v and v.name == items then
						return true
					end
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		DutyCheck = function(bool)
			return bool and PlayerData.job.onduty
		end

		RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
			PlayerData = Framework.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('Framework:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('Framework:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('Framework:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('Framework:Player:SetPlayerData', function(val)
			PlayerData = val
		end)

		RegisterNetEvent('Framework:Client:SetDuty', function(Onduty)
			PlayerData.job.onduty = Onduty
		end)

	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.duty and not DutyCheck(data.duty) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end