BeanLegion = {
	Debug = false,

	Gabz = true,
	UncleJust = false,
	CheckMarks = true,

	DesertItems = {
		label = "Desert Store",
		slots = 4,
		items = {
			[1] = { name = "donut", price = 10, amount = 50, info = {}, type = "item", slot = 1, },
			[2] = { name = "chocolade", price = 10, amount = 50, info = {}, type = "item", slot = 2, },
			[3] = { name = "watermelon", price = 10, amount = 50, info = {}, type = "item", slot = 3, },
			[4] = { name = "cheesecake", price = 10, amount = 50, info = {}, type = "item", slot = 4, },
		},
	},
	SodaItems = {
		label = "Soda Storage",
		slots = 2,
		items = {
			[1] = { name = "ecola", price = 10, amount = 50, info = {}, type = "item", slot = 1, },
			[2] = { name = "sprunk", price = 10, amount = 50, info = {}, type = "item", slot = 2, },
		},
	},

	Locations = {
		[1] = {
			label = "beanlegion", -- Set this to the required job
			zones = {
			vector2(137.44329833984, -1019.5242919922),
			vector2(122.99235534668, -1058.451171875),
			vector2(101.35326385498, -1048.4799804688),
			vector2(115.27521514893, -1011.9081420898)
			},
			blip = vector3(120.27, -1038.09, 29.28),
			blipcolor = 56,
		},
	}
}

Crafting = {
	Slush = {
		[1] = { ['bigfruit'] = { ['watermelon'] = 1, ['distilledwater'] = 1, ['orange'] = 1, ['sugar'] = 1, }, },
	},
	Drinks = {
		[1] = { ['highnoon'] = { ['beancoffee'] = 1, ['distilledwater'] = 1, ['orange'] = 1, }, },
		[2] = { ['speedball'] = { ['beancoffee'] = 3, ['sugar'] = 1, }, },
		[3] = { ['gunkaccino'] = { ['beancoffee'] = 1, ['sugar'] = 2, ['cheesecake'] = 1, }, },
		[4] = { ['bratte'] = { ['beancoffee'] = 2, ['sugar'] = 5, }, },
		[5] = { ['flusher'] = { ['beancoffee'] = 1, ['distilledwater'] = 1, ['orange'] = 1, ['chickenbreast'] = 1, }, },
		[6] = {	['ecocoffee'] = { ['beancoffee'] = 1, ['distilledwater'] = 1, ['milk'] = 1, }, },
		[7] = {	['caffeagra'] = { ['beancoffee'] = 1, ['rhinohorn'] = 2, ['oystershell'] = 1, }, },
	},
}