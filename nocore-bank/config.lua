Config = {}

Config.okokTextUI = true -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.IBANPrefix = "NL" -- the prefix of the IBAN

Config.IBANNumbers = 6 -- How many characters the IBAN has by default

Config.CustomIBANMaxChars = 10 -- How many characters the IBAN can have when changing it to a custom one (on Settings tab)

Config.CustomIBANAllowLetters = true -- If the custom IBAN can have letters or only numbers (on Settings tab)

Config.IBANChangeCost = 5000 -- How much it costs to change the IBAN to a custom one (on Settings tab)

Config.PINChangeCost = 1000 -- How much it costs to change the PIN (on Settings tab)

Config.AnimTime = 2 * 1000 -- 2 * 1000 = 2 seconds (ATM animation)

Config.ShowBankBlips = false -- true = show bank blips on the map | false = don't show blips

Config.BankLocations = { -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
	{blip = 108, blipColor = 2, blipScale = 0.9, x = 150.266, y = -1040.203, z = 29.374, blipText = "Bank", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.9, x = -1212.980, y = -330.841, z = 37.787, blipText = "Bank", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.9, x = -2962.582, y = 482.627, z = 15.703, blipText = "Bank", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.9, x = -109.1695, y = 6469.7983, z = 31.634134, blipText = "Bank", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.9, x = 314.187, y = -278.621, z = 54.170, blipText = "Bank", BankDistance = 3},
	{blip = 108, blipColor = 2, blipScale = 0.9, x = -351.534, y = -49.529, z = 49.042, blipText = "Bank", BankDistance = 3},
	{blip = 108, blipColor = 3, blipScale = 1.2, x = 259.42776, y = 220.9708, z = 106.28208, blipText = "Bank", BankDistance = 8},
	{blip = 108, blipColor = 2, blipScale = 0.9, x = 1175.064, y = 2706.643, z = 38.094, blipText = "Bank", BankDistance = 3},
}

Config.ATMDistance = 1.5 -- How close you need to be in order to access the ATM

Config.ATM = { -- ATM models, do not remove any
	{model = -870868698},
	{model = -1126237515},
	{model = -1364697528},
	{model = 506770882}
}

Config.Societies = { -- Which societies have bank accounts
	['police'] = 7,
	['taxi'] = 4,
	['ambulance'] = 4,
	['mechanic'] = 4,
	['judge'] = 5,
	['coffee'] = 3,
	['retro'] = 4,
	['fixit'] = 4,
	['cranberry'] = 3,
	['crastenburg'] = 3,
	['realestate'] = 3,
	['redcircle'] = 3,
	['burger'] = 4,
	['bennys'] = 3,
	['catcoffee'] = 3,
	['pizzathis'] = 4,
	['yacht'] = 4,
	['fraudauto'] = 4,
	['beanlegion'] = 4,
	['misfits'] = 3,
	['racemonkey'] = 2,
	['tehnicheski'] = 3,
	['blazeit'] = 3,
	['oldtown'] = 4,
}

