
Config = {}

Config.Locations = {
    ["main"] = {
        label = "Cat Cafe",
        coords = vector3(-581.06, -1066.22, 22.34),
    }
}

Config.ActivePayments = {}

Config.PayPerTicket = 50  --How much per ticket given at the bank
--Config.PayPerTicket = math.random(40,60)  --Change to this to get between $40 and $60 per ticket

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.PatHeal = 2 			--how much you are healed by patting a cat, 2 hp seems resonable, enough not to be over powered and enough to draw people in.
							--set to 0 if you don't want to use this
							
Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.Items = {
    label = "Склад",
    slots = 45,
    items = {
        [1] = { name = "sugar", price = 5, amount = 500, info = {}, type = "item", slot = 1, },
        [2] = { name = "flour", price = 5, amount = 500, info = {}, type = "item", slot = 2, },
        [3] = { name = "nori", price = 5, amount = 500, info = {}, type = "item", slot = 3, },
        [4] = { name = "tofu", price = 5, amount = 500, info = {}, type = "item", slot = 4, },
        [5] = { name = "onion", price = 5, amount = 500, info = {}, type = "item", slot = 5, },
        [6] = { name = "boba", price = 5, amount = 500, info = {}, type = "item", slot = 6, },
        [7] = { name = "mint", price = 5, amount = 500, info = {}, type = "item", slot = 7, },
        [8] = { name = "orange", price = 5, amount = 500, info = {}, type = "item", slot = 8, },
        [9] = { name = "strawberry", price = 5, amount = 500, info = {}, type = "item", slot = 9, },
        [10] = { name = "blueberry", price = 5, amount = 500, info = {}, type = "item", slot = 10, },
        [11] = { name = "milk", price = 5, amount = 500, info = {}, type = "item", slot = 11, },
        [12] = { name = "rice", price = 5, amount = 500, info = {}, type = "item", slot = 12, },
        [13] = { name = "sake", price = 5, amount = 500, info = {}, type = "item", slot = 13, },
        [14] = { name = "noodles", price = 5, amount = 500, info = {}, type = "item", slot = 14, },
        [15] = { name = "burger-potato", price = 5, amount = 500, info = {}, type = "item", slot = 15, },
        [16] = { name = "burger-raw", price = 5, amount = 500, info = {}, type = "item", slot = 16, },
        [17] = { name = "burger-bun", price = 5, amount = 500, info = {}, type = "item", slot = 17, },
        [18] = { name = "burger-lettuce", price = 5, amount = 500, info = {}, type = "item", slot = 18, },
        [19] = { name = "eggs", price = 5, amount = 500, info = {}, type = "item", slot = 19, },
        [20] = { name = "cooking_oil", price = 5, amount = 500, info = {}, type = "item", slot = 20, },
        [21] = { name = "glaze", price = 5, amount = 500, info = {}, type = "item", slot = 21, },
        [22] = { name = "tomato", price = 5, amount = 500, info = {}, type = "item", slot = 22, },
        [23] = { name = "cucumber", price = 5, amount = 500, info = {}, type = "item", slot = 23, },
        [24] = { name = "ham", price = 5, amount = 500, info = {}, type = "item", slot = 24, },
        [25] = { name = "cheese", price = 5, amount = 500, info = {}, type = "item", slot = 25, },
        [26] = { name = "sauce", price = 5, amount = 500, info = {}, type = "item", slot = 26, },
        [27] = { name = "pasta", price = 5, amount = 500, info = {}, type = "item", slot = 27, },
        [28] = { name = "olives", price = 5, amount = 500, info = {}, type = "item", slot = 28, },
        [29] = { name = "basil", price = 5, amount = 500, info = {}, type = "item", slot = 29, },
        [30] = { name = "mozz", price = 5, amount = 500, info = {}, type = "item", slot = 30, },
        [31] = { name = "lettuce", price = 5, amount = 500, info = {}, type = "item", slot = 31, },
        [32] = { name = "pizzmushrooms", price = 5, amount = 500, info = {}, type = "item", slot = 32, },	
        [33] = { name = "squid", price = 5, amount = 500, info = {}, type = "item", slot = 33, },
        [34] = { name = "chickenbreast", price = 5, amount = 50, info = {}, type = "item", slot = 34, },
        [35] = { name = "rhinohorn", price = 5, amount = 50, info = {}, type = "item", slot = 35, },
		[36] = { name = "oystershell", price = 5, amount = 50, info = {}, type = "item", slot = 36, },
        [37] = { name = "beancoffee", price = 5, amount = 50, info = {}, type = "item", slot = 37, },
        [38] = { name = "malc", price = 5, amount = 500, info = {}, type = "item", slot = 38, },
        [39] = { name = "distilledwater", price = 5, amount = 500, info = {}, type = "item", slot = 39, },
        [40] = { name = "apple", price = 5, amount = 500, info = {}, type = "item", slot = 40, },
        [41] = { name = "banana", price = 5, amount = 500, info = {}, type = "item", slot = 41, },
        [42] = { name = "grapefruit", price = 5, amount = 500, info = {}, type = "item", slot = 42, },
        [43] = { name = "bigwatermelon", price = 5, amount = 500, info = {}, type = "item", slot = 43, },
        [44] = { name = "lemon", price = 5, amount = 500, info = {}, type = "item", slot = 44, },
        --[] = { name = "", price = 5, amount = 500, info = {}, type = "item", slot = , },
    }
}

Config.ItemsV = {
    label = "NORP VALENTINE'S DAY",
    slots = 1,
    items = {
        [1] = { name = "v_item1", price = 10000, amount = 500, info = {}, type = "item", slot = 1, },
        --[] = { name = "", price = 5, amount = 500, info = {}, type = "item", slot = , },
    }
}
