Config = {}

Config.QBPermissionsUpdate = false -- set it to true if you have the latest Permissions update

----------------------------------------
Config.SetVisibility = true -- true = player will be invisible when chosing a vehicle

Config.SetInvincibility = true -- true = player will not die while test driving

Config.CheckForOfflineOrdersEvery = 10 -- In minutes | it'll check every x minutes for offline players with orders accepted, if someone is offline it'll cancel the order

Config.ShowVehicleShopBlip = false -- Activate/Deactivate Vehicle shop blips

Config.ShowOwnerBlip = false -- Activate/Deactivate owner blips

Config.ShowBuyVehicleShopBlip = false -- Activate/Deactivate buy shop blip

Config.ShowHasOwnerShopBlip = false -- Activate/Deactivate blip of shops with "hasOwner = false"

Config.TestDrive = true -- Activate/Deactivate test drive

-- Informations you need before using 'Config.AddVehiclesFromVehiclesFile':

-- All informations will be collected from the 'qb-core/shared/vehicles.lua' file
-- This is how a vehicle is added on that file:
--
-- ['nero'] = {
--	 ['name'] = 'Nero',
--	 ['brand'] = 'Truffade',
--	 ['model'] = 'nero',
--	 ['price'] = 200000,
--	 ['category'] = 'super',
--	 ['hash'] = `nero`,
--	 ['shop'] = 'luxury',
-- },
--
-- the 'shop' is what is set as 'type' in the database, you can either change the shops 'type' or the vehicle 'shop' to match one another
-- the categories may not be the same in the file and the shops so make sure to add/change or remove the ones you need here: 'Config.VehicleshopsCategories'
-- the 'price' will be set as the 'min_price' and the 'max_price' will be calculated this way: 'min_price + Config.MaxPriceAddition'
-- make sure you deactivate it once all the vehicles have been added otherwise it'll try to add them everytime the script is initialized
--
-- after starting the server/script you can check the progress on your server console

Config.AddVehiclesFromVehiclesFile = false -- if true it'll add all the vehicles form 'qb-core/shared/vehicles.lua' (turn off once used)

Config.MaxPriceAddition = 5000 -- This is how much will be added to the vehicle price to create the max_price
----------------------------------------

Config.DevMode = false -- Allows you to restart the script (IMPORTANT: only set this to true if you are configuring the script)

Config.EventPrefix = "okokVehicleshop" -- this will change the prefix of the events name so if Config.EventPrefix = "example" the events will be "example:event"

Config.QBCorePrefix = "Framework"

Config.qbPrefix = "no"

Config.TestDrivePlate = "TEST"

Config.UseOkokTextUI = true -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.UseokokRequests = false -- true = use okokRequests for hiring people | false = don't use okokRequests - https://okok.tebex.io/package/4724985

Config.UseSameImageForVehicles = true -- true = use the same image for all vehicles (vehicle.png) | false = use different images for each vehicle (vehicle_id.png)

Config.HideMinimap = false -- If true it'll hide the minimap when the vehicle shop menu is opened

Config.TimeBetweenTransition = 7000 -- how much time it stays in a camera before changing, in miliseconds

Config.TransitionTime = 4000 -- how much time it takes to go from one camera to another (camera movement), in miliseconds

Config.ShakeAmplitude = 0.2 -- camera shake

Config.UseKMh = true -- true = use KM/h | false = use miles/h

Config.MaxVehiclesSpeed = 300 -- Max speed a vehicle can go at (it is only used for UI purposes, it does NOT change the speed of a vehicle)

Config.TestDriveTime = 40 -- In seconds

Config.StopTestDriveCmd = "cancel" -- command to stop the test drive

Config.PlateLetters  = 4 -- How many letters the plate has

Config.PlateNumbers  = 4 -- How many numbers the plate has

Config.PlateUseSpace = false	-- If the plate uses spaces between letters and numbers

Config.OrderCompletedPercentage = 10 -- When a employee completes the misson he will get this percentage as a reward, 10 = 10%

Config.HireRange = 3 -- How close a player needs to be to be in the hiring range

Config.AdminCommand = "vsadmin" -- command to open the admin menu

Config.OwnerBuyVehiclePercentage = 10 -- How much of a discount the owner has to order a vehicle (bases on the min. price)

Config.SellBusinessReceivePercentage = 50 -- How much a player will receive for selling his business (in percentage, 50 = 50%)

Config.ClearMoneyWhenBusinessIsSold = false -- true = remove the money from the society when sold | false = do not remove the money

Config.MaxDealershipsPerPlayer = 1 -- How many vehicle shops a player can own

Config.MaxEmployeesPerDealership = 10 -- How many employees a vehicle shop can hire

Config.EnableSellVehicle = false -- Allows players to sell their vehicles for a percentage of the vehicle's min price

Config.VehicleShopBuyVehicle = false -- true = when selling a bought vehicle the money will be discounted from the vehicle shop and the vehicle added to the stock | false = vehicle shop will not be charged or receive the vehicle

Config.VehicleSellPercentage = 40 -- 40 = seller will receive 40% of the vehicle min. price

Config.EnableOkokBankingTransactions = true -- true = when you buy a vehicle a transaction is added (okokBanking)

Config.AdminGroups = { -- Admin groups that can access the admin menu
	"god",
	"admin"
}

Config.JobRanks = { -- These are the ranks available on the vehicle shops, you can add or remove as many as you want but leave at least 1
	"Newbie",		-- ID: 1
	"Experienced",	-- ID: 2
	"Expert",		-- ID: 3
	"Sub-Owner"		-- ID: 4 
}

Config.SubOwnerRank = 4 -- ID of the rank that will work as a secondary owner

Config.MissionForStock = false -- false = when you order a vehicle, the vehicle shop will instantly receive it without doing any order/mission

Config.VehicleShopBoat = {} -- What shops after buying a vehicle add it to the player_boats table in the db

Config.TruckBlip = {blipId = 67, blipColor = 2, blipScale = 0.9, blipText = "Truck"} -- Blip of the truck when someone accepts an order

Config.TrailerBlip = {blipId = 515, blipColor = 2, blipScale = 0.9, blipText = "Trailer"} -- Blip of the trailer when someone accepts an order (for vehicle shops with big vehicles)

Config.OrderBlip = {blipId = 478, blipColor = 5, blipText = "Order"}  -- Blip of the ordered vehicle when someone accepts an order

Config.TowMarker = {id = 21, size = {x = 0.5, y = 0.5, z = 0.5}, color = {r = 94, g = 255, b = 155}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0} -- The marker to tow a vehicle when someone accepts an order

Config.SmallTowTruckID = "flatbed"

Config.BigTowTruckID = "Hauler"

Config.TrailerID = "TRFlat"

Config.Stands = { -- Vehicle shops informations
	{
		name = "PDM", -- name of the vehicle shop
		licenseType = "", -- if you want to use a license system you'll need to set it up on sv_utils.lua
		currency = "bank", -- used to buy/sell the business and buy vehicle
		hasOwner = false, -- true = this vehicle shop can have a owner and will need maintenance to have stock | false = no owner and with vehicles all the time, price = max_price set on the database
		coords = {x = -32.94263, y = -1097.403, z = 27.27441}, -- Marker/Shop position
		sellVehicleCoords = {x = -44.72, y = -1082.12, z = 25.50},
		sellVehicleMarker = {id = 1, color = {r = 255, g = 0, b = 0, a = 90}, size = {x = 4.0, y = 4.0, z = 1.5}, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the sell vehicle marker
		ownerCoords = {x = -31.66, y = -1114.00, z = 26.42}, -- Marker/Shop position for owner/employees
		spawnFlatbedPos = {x = -16.95, y = -1105.34, z = 26.67, h = 160.0}, -- Where the flatbed/truck is spawned for the orders
		towCoords = {bone = 20, xPos = -0.5, yPos = -5.0, zPos = 1.0},
		missionsVehicleSpawn = {},
		radius = 1, -- Interaction radius for the markers
		price = 10000, -- Price of the vehicle shop
		blip = {blipId = 225, blipColor = 3, blipScale = 0.9, blipText = "Vehicleshop"}, -- Blip informations for vehicleshop blip
		ownerBlip = {blipId = 225, blipColor = 2, blipScale = 0.9, blipText = "Vehicleshop Panel"}, -- Blip informations for shops you own/work for
		buyBlip = {blipId = 225, blipColor = 1, blipScale = 0.9, blipText = "Vehicleshop to buy"}, -- Blip informations for shop on sale
		marker = {id = 20, color = {r = 94, g = 255, b = 155}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the vehicle shop
		ownerMarker = {id = 21, color = {r = 94, g = 255, b = 155}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the owning menu
		bigVehicles = false, -- Set to true if it's airplanes/helicopters/etc... it'll use a truck instead of a flatbed to get the ordered vehicles
		type = "vehicles", -- Type of shop (will change displayed vehicles) | CAN be repeated on other shops
		id = "pdm", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
}

Config.ShowVehicle = { -- Display vehicle
	["pdm"] = { -- ID of the vehicle shop vector4(-47.76331, -1091.947, 27.031707, 30.805671)
		position = {x = -47.76331, y = -1091.947, z = 27.031707, h = 30.805671}, -- Where to spawn the display vehicles
		noVehicleCam = {x = -47.76331-1.49, y = -1091.947+7.65, z = 27.031707+1.15}, -- Camera position when there is no vehicle to be displayed
		testDrive = {x = -1733.25, y = -2901.43, z = 13.94, h = 330.0}, -- Where to start the test drive
		vehicleSpawn = { -- Where the vehicle spawns when bought
			{x = -9.728793, y = -1095.846, z = 26.740125, h = 68.664154},
			{x = -11.92633, y = -1101.739, z = 26.654026, h = 69.039352},
			{x = -13.67495, y = -1107.723, z = 26.654083, h = 70.369361},
		},
	},
}

Config.TransitionCamerasOffset = { -- Cameras positions, you can add as many as you wish
	["pdm"] = { -- ID of the vehicle shop
		{x = 1.49, y = 7.65, z = 1.15}, 
		{x = 14.0, y = 5.0, z = 0.6},
		{x = 7.0, y = -5.0, z = 1.5},
		{x = -15.0, y = -3.0, z = 1.6},
	},
}

Config.VehicleshopsCategories = { -- Categories shown on the vehicle shops, this is used to set the vehicles category
	["vehicles"] = { -- TYPE of the vehicle shop
		{display = "Custom", id = "custom"},
		{display = "Project", id = "new"},
		{display = "MUSCLE", id = "muscle"},
		{display = "SEDANS", id = "sedans"},
		{display = "SPORTS CLASSICS", id = "sportsclassics"},
		{display = "SUPER", id = "super"},
		{display = "COUPES", id = "coupes"},
		{display = "COMPACTS", id = "compacts"},
		{display = "MOTORCYCLES", id = "motorcycles"},
		{display = "VANS", id = "vans"},
		{display = "SUVS", id = "suvs"},
		{display = "SPORTS", id = "sports"},
		{display = "OFF-ROAD", id = "offroad"},
	},
}

Config.UseColorID = true -- Will set the vehicle color based on the color ID: https://wiki.rage.mp/index.php?title=Vehicle_Colors

Config.colors = { -- The vehicle colors, this will update the UI as well (it needs to be 10 colors, do NOT remove, add or change the color names)
	color1 = {255, 255, 255, id = 134}, -- The 4th number is the color id for the car if Config.UseColorID = true
	color2 = {0, 0, 0, id = 0},
	color3 = {150, 150, 150, id = 4},
	color4 = {255, 0, 0, id = 27},
	color5 = {255, 150, 0, id = 41},
	color6 = {255, 230, 0, id = 89},
	color7 = {0, 255, 0, id = 55},
	color8 = {0, 0, 255, id = 79},
	color9 = {76, 0, 255, id = 145},
	color10 = {255, 0, 255, id = 137},
}

Config.TextUI = { -- Text UI texts
	['open_shop'] = { 			text = '[E] Отвори ${shop_name}', 										color = 'purple', side = 'right'},
	['buy_business'] = { 		text = '[E] to buy ${name} for ${price}$', 								color = 'purple', side = 'right'},
	['access_business'] = { 	text = '[E] to access ${name}', 										color = 'purple', side = 'right'},
	['tow'] = { 				text = '[E] To tow', 													color = 'purple', side = 'right'},
	['sell_vehicle'] = { 		text = '[E] To sell vehicle', 											color = 'purple', side = 'right'},
}

Config.HelpNotification = { -- Used when Config.UseTextUI = false
	['open_shop'] = { 			text = '[E] To open ${shop_name}',										type = 'success', time = 5000},
	['buy_business'] = { 		text = '[E] to buy ${name} for ${price}$',								type = 'success', time = 5000},
	['access_business'] = { 	text = '[E] to access ${name}',											type = 'success', time = 5000},
	['tow'] = { 				text = '[E] To tow',													type = 'success', time = 5000},
	['sell_vehicle'] = { 		text = '[E] To sell vehicle',													type = 'success', time = 5000},
}

Config.NotificationsText = { -- Notifications texts
	['success_cancel'] = {		title = "Vehicle Shop", 		text = "Successfully canceled the order",											time = 5000, type = "success"},
	['fail_cancel'] = {			title = "Vehicle Shop", 		text = "Failed to cancel the order",												time = 5000, type = "error"},
	['cant_access'] = {			title = "Vehicle Shop", 		text = "You don't have permission to access this shop",								time = 5000, type = "error"},
	['no_license'] = {			title = "Vehicle Shop", 		text = "You have no license to buy this vehicle",									time = 5000, type = "error"},
	['all_occupied'] = {		title = "Vehicle Shop", 		text = "All vehicle entrances are occupied",										time = 5000, type = "error"},
	['failed_to_load'] = {		title = "Vehicle Shop", 		text = "Failed to load the vehicle", 												time = 5000, type = "error"},
	['bus_no_money'] = {		title = "Vehicle Shop", 		text = "This business doesn't have enough money", 									time = 5000, type = "error"},
	['success_sell'] = {		title = "Vehicle Shop", 		text = "You sold ${vehicle_name} for ${price}$ successfully", 						time = 5000, type = "success"},
	['not_in_correct_v'] = {	title = "Vehicle Shop", 		text = "You are not in the correct vehicle", 										time = 5000, type = "error"},
	['dont_sell'] = {			title = "Vehicle Shop", 		text = "This vehicle shop don't buy this vehicle", 									time = 5000, type = "error"},
	['not_your_vehicle'] = {	title = "Vehicle Shop", 		text = "You don't own this vehicle", 												time = 5000, type = "error"},
	['not_in_vehicle'] = {		title = "Vehicle Shop", 		text = "You need to be on a vehicle", 												time = 5000, type = "error"},
	['not_admin'] = {			title = "Vehicle Shop", 		text = "You don't have permission to access the admin menu", 						time = 5000, type = "error"},
	['inside_vehicle'] = {		title = "Vehicle Shop", 		text = "You can't access the vehicle shop inside a vehicle", 						time = 5000, type = "error"},
	['load_vehicle'] = {		title = "Vehicle Shop", 		text = "Превозното средство зарежда, моля изчакай", 												time = 3000, type = "info"},
	['stop_testdrive'] = {		title = "Vehicle Shop", 		text = "Stopping the test drive", 													time = 5000, type = "success"},
	['not_testdriving'] = {		title = "Vehicle Shop", 		text = "You are not on a test drive", 												time = 5000, type = "error"},
	['fill_fields'] = {			title = "Vehicle Shop", 		text = "Please fill the input field", 												time = 5000, type = "error"},
	['already_accepted'] = {	title = "Vehicle Shop", 		text = "You already accepted an order, complete it before accepting another",		time = 5000, type = "error"},
	['not_selected_hire'] = {	title = "Vehicle Shop", 		text = "No one was selected", 														time = 5000, type = "error"},
	['ordered_success'] = {		title = "Vehicle Shop", 		text = "You ordered x${amount} ${vehicle_name} successfully!", 						time = 5000, type = "success"},
	['some_wrong'] = {			title = "Vehicle Shop", 		text = "Something went wrong!", 													time = 5000, type = "error"},
	['not_enough_money'] = {	title = "Vehicle Shop", 		text = "You don't have enough money", 												time = 5000, type = "error"},
	['not_enough_money_s'] = {	title = "Vehicle Shop", 		text = "Your society doesn't have enough money", 									time = 5000, type = "error"},
	['accepted_order'] = {		title = "Vehicle Shop", 		text = "You accepted an order successfully", 										time = 5000, type = "success"},
	['someone_accepted'] = {	title = "Vehicle Shop", 		text = "Someone has already accepted this order", 									time = 5000, type = "error"},
	['finished_order'] = {		title = "Vehicle Shop", 		text = "You successfully finished the order and received ${reward}$", 				time = 5000, type = "success"},
	['no_ads_cancel'] = {		title = "Vehicle Shop", 		text = "You don't have any ads to cancel", 											time = 5000, type = "error"},
	['veh_not_available'] = {	title = "Vehicle Shop", 		text = "This vehicle isn't available", 												time = 5000, type = "error"},
	['price_not_valid'] = {		title = "Vehicle Shop", 		text = "This is not a valid price", 												time = 5000, type = "error"},
	['employee_not_exist'] = {	title = "Vehicle Shop", 		text = "This employee does not exist", 												time = 5000, type = "error"},
	['not_enough_to_sell'] = {	title = "Vehicle Shop", 		text = "You don't have enough vehicles to sell", 									time = 5000, type = "error"},
	['got_hired'] = {			title = "Vehicle Shop", 		text = "You got hired by ${shop_name}", 											time = 5000, type = "info"},
	['got_fired'] = {			title = "Vehicle Shop", 		text = "You got fired by ${shop_name}", 											time = 5000, type = "info"},
	['success_hired'] = {		title = "Vehicle Shop", 		text = "You successfully hired ${hired_name}", 										time = 5000, type = "success"},
	['success_fired'] = {		title = "Vehicle Shop", 		text = "You successfully fired ${fired_name}", 										time = 5000, type = "success"},
	['success_added_ad'] = {	title = "Vehicle Shop", 		text = "Added x${amount} ${vehicle_name} ads", 										time = 5000, type = "success"},
	['deposited'] = {			title = "Vehicle Shop", 		text = "Deposited ${amount}$ successfully", 										time = 5000, type = "success"},
	['withdrawn'] = {			title = "Vehicle Shop", 		text = "Whitdrawn ${amount}$ successfully", 										time = 5000, type = "success"},
	['bought_veh'] = {			title = "Vehicle Shop", 		text = "Закупихте ${vehicle_name} за ${vehiclePrice}$", 								time = 5000, type = "success"},
	['change_money'] = {		title = "Vehicle Shop", 		text = "Changed the ${shop_name} money to ${money} successfully", 					time = 5000, type = "success"},
	['change_info'] = {			title = "Vehicle Shop", 		text = "Changed the ${vehicle_name} informations successfully", 					time = 5000, type = "success"},
	['remove_veh'] = {			title = "Vehicle Shop", 		text = "Removed the ${vehicle_name} successfully", 									time = 5000, type = "success"},
	['created_veh'] = {			title = "Vehicle Shop", 		text = "Created a ${vehicle_name} successfully", 									time = 5000, type = "success"},
	['cancel_ads'] = {			title = "Vehicle Shop", 		text = "Canceled x${amount} ${vehicle_name} ads", 									time = 5000, type = "success"},
	['updated_price'] = {		title = "Vehicle Shop", 		text = "Updated price of ${vehicle_name} to ${amount}$", 							time = 5000, type = "success"},
	['change_rank'] = {			title = "Vehicle Shop", 		text = "${name} is now a ${job}", 													time = 5000, type = "success"},
	['already_rank'] = {		title = "Vehicle Shop", 		text = "${name} is already a ${job}", 												time = 5000, type = "error"},
	['already_employee'] = {	title = "Vehicle Shop", 		text = "${name} is your employee already", 											time = 5000, type = "error"},
	['max_shops'] = {			title = "Vehicle Shop", 		text = "You can't buy more dealerships",											time = 5000, type = "error"},
	['got_to_truck'] = {		title = "Vehicle Shop", 		text = "Go get the order marked in your minimap", 									time = 5000, type = "info"},
	['not_towing'] = {			title = "Vehicle Shop", 		text = "You need to be closer to the ordered vehicle", 								time = 5000, type = "error"},
	['towed'] = {				title = "Vehicle Shop",			text = "You successfully towed the ordered vehicle", 								time = 5000, type = "success"},
	['sold_business'] = {		title = "Vehicle Shop", 		text = "You successfully sold ${shop} for ${amount}$", 								time = 5000, type = "success"},
	['leave_business'] = {		title = "Vehicle Shop", 		text = "You successfully left ${shop}", 											time = 5000, type = "success"},
	['min_max_price'] = {		title = "Vehicle Shop", 		text = "The minimum price needs to be less than the maximum price", 				time = 5000, type = "error"},
	['owner_changed'] = {		title = "Vehicle Shop", 		text = "${owner} is now the owner of ${shop}", 										time = 5000, type = "success"},
	['max_employees'] = {		title = "Vehicle Shop", 		text = "You can only hire ${employees} employees", 									time = 5000, type = "error"},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to webhook.lua, line 1

Config.BotName = 'NoLag Logs' -- Write the desired bot name

Config.ServerName = 'NoLag' -- Write your server's name

Config.IconURL = 'https://imgur.com/YrMroDA.png' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.BuyBusinessWebhook = true
Config.BuyBusinessWebhookColor = '65280'

Config.SellBusinessWebhook = true
Config.SellBusinessWebhookColor = '16711680'

Config.DepositWebhook = true
Config.DepositWebhookColor = '16776960'

Config.WithdrawWebhook = true
Config.WithdrawWebhookColor = '16776960'

Config.StartOrderWebhook = true
Config.StartOrderWebhookColor = '16742656'

Config.EndOrderWebhook = true
Config.EndOrderWebhookColor = '16742656'

Config.HireWebhook = true
Config.HireWebhookColor = '4223487'

Config.FireWebhook = true
Config.FireWebhookColor = '4223487'

Config.BuyVehicleWebhook = true
Config.BuyVehicleWebhookColor = '65535'

Config.ADStockWebhook = true
Config.ADStockWebhookColor = '7209071'

Config.CancelStockWebhook = true
Config.CancelStockWebhookColor = '7209071'

Config.BuyStockWebhook = true
Config.BuyStockWebhookColor = '7209071'

Config.EditEmployeeRankWebhook = true
Config.EditEmployeeRankWebhookColor = '4223487'

Config.QuitJobWebhook = true
Config.QuitJobWebhookColor = '16711680'
