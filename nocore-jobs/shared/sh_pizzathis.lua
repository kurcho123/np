Config = {}

Config.Locations = { ["main"] = { label = "Pizza This", coords = vector3(806.97, -759.59, 26.78) } }

Config.PayPerTicket = 50  --How much per ticket given at the bank

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.FoodItems = {
    label = "Food Fridge Store",
    slots = 3,
    items = {
        [1] = { name = "tiramisu", price = 15, amount = 50, info = {}, type = "item", slot = 1, },	
        [2] = { name = "gelato", price = 15, amount = 50, info = {}, type = "item", slot = 2, },	
        [3] = { name = "medfruits", price = 15, amount = 50, info = {}, type = "item", slot = 3, },
    }
}