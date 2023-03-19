Recycle = {
	Debug = false, -- Toggle Debug Mode
	Blips = true, -- Enable Blips?
	BlipNamer = false, -- Enable to Name Blips different things, disable if you already have too many blips as this will group them together
	Pedspawn = true, -- Do you want to spawn peds for main locations?
	img = "nocore-inventory/html/images/", -- Set this to your inventory
	EnableOpeningHours = true, -- Enable opening hours? If disabled you can always open the pawnshop.
	OpenHour = 9, -- From what hour should the pawnshop be open?
	CloseHour = 21, -- From what hour should the pawnshop be closed?
	PayAtDoor = nil, -- Set to nil stop turn this off, set to a number to enable

	OutsideTele = vector4(746.83, -1399.66, 26.6, 230.732),
	InsideTele = vector4(993.16, -3097.61, -39.90, 82.95),

	Locations =  {
		['Trade'] ={
			{ name = "Recyclable Trader", coords = vector4(997.48, -3097.44, -39.0, 234.53), blipTrue = false, sprite = 365, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
	},
	TradeTable = {
		"copper",
		"plastic",
		"metalscrap",
		"steel",
		"glass",
		"iron",
		"rubber",
		"aluminum",
	},
	RecycleAmounts = {
		recycleMin = 1,
		recycleMax = 5,

		tenMin = 2,
		tenMax = 5,

		hundMin = 5,
		hundMax = 14,

		thouMin = 10,
		thouMax = 28,
	}
}