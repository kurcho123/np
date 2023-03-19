local Framework = exports['no-core']:GetCoreObject()

local onDuty = false
local Peds = {}
local Targets = {}
local searchProps = {}
local Props = {}
local scrapPool = {
	--{ model = ``, xPos = , yPos = , zPos = , xRot = , yRot = , zRot = },
	--{ model = `sf_prop_sf_art_box_cig_01a`, xPos = 0.16, yPos = -0.06, zPos = 0.21, xRot = 52.0, yRot = 288.0, zRot = 175.0},
	{ model = `hei_prop_drug_statue_box_01`, xPos = 0.08, yPos = 0.05, zPos = 0.06, xRot = 7.0, yRot = 198.0, zRot = 145.0},
	{ model = `prop_mat_box`, xPos = 0.0, yPos = 0.28, zPos = 0.36, xRot = 136.0, yRot = 114.0, zRot = 181.0},
	{ model = `prop_box_ammo03a`, xPos = -0.08, yPos = 0.04, zPos = 0.32, xRot = 76.0, yRot = 110.0, zRot = 185.0},
	{ model = `prop_rub_scrap_06`, xPos = 0.01, yPos = 0.02, zPos = 0.27, xRot = 85.0, yRot = 371.0, zRot = 177.0 },
	{ model = `prop_cs_cardbox_01`, xPos = 0.04, yPos = 0.04, zPos = 0.28, xRot = 52.0, yRot = 294.0, zRot = 177.0 },
	{ model = `v_ret_gc_bag01`, xPos = 0.16, yPos = 0.08, zPos = 0.24, xRot = 68.0, yRot = 394.0, zRot = 141.0 },
	{ model = `prop_ld_suitcase_01`, xPos = -0.04, yPos = 0.06, zPos = 0.31, xRot = -2.0, yRot = 21.0, zRot = 155.0 },
	{ model = `v_ind_cs_toolbox2`, xPos = 0.04, yPos = 0.12, zPos = 0.29, xRot = 56.0, yRot = 287.0, zRot = 169.0 },
}

local function pairsByKeys(t) local a = {} for n in pairs(t) do a[#a+1] = n end table.sort(a)	local i = 0	local iter = function () i = i + 1 if a[i] == nil then return nil else return a[i], t[a[i]]	end	end	return iter end
local time = 1000
local function loadModel(model) if not HasModelLoaded(model) then
	while not HasModelLoaded(model) do if time > 0 then time = time - 1 RequestModel(model)
		else time = 1000 print("^5Debug^7: ^3LoadModel^7: ^2Timed out loading model ^7'^6"..model.."^7'") break end
		Wait(10) end
	end
end
local function unloadModel(model) if Recycle.Debug then print("^5Debug^7: ^2Removing Model^7: '^6"..model.."^7'") end SetModelAsNoLongerNeeded(model) end
local function loadAnimDict(dict) if Recycle.Debug then print("^5Debug^7: ^2Loading Anim Dictionary^7: '^6"..dict.."^7'") end while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(5) end end
local function unloadAnimDict(dict) if Recycle.Debug then print("^5Debug^7: ^2Removing Anim Dictionary^7: '^6"..dict.."^7'") end RemoveAnimDict(dict) end
local function destroyProp(entity) if Recycle.Debug then print("^5Debug^7: ^2Destroying Prop^7: '^6"..entity.."^7'") end SetEntityAsMissionEntity(entity) Wait(5) DetachEntity(entity, true, true) Wait(5) DeleteObject(entity) end
local function conVector3(vector) return vector3(vector.x, vector.y, vector.z) end

--- Blips + Peds
CreateThread(function()
	JobLocation = PolyZone:Create({
		vector2(992.39141845703, -3113.3854980469),
		vector2(1028.5169677734, -3113.1450195312),
		vector2(1027.978515625, -3088.9782714844),
		vector2(992.19049072266, -3089.8234863281)
	},
	{ name = "Recycling", debugPoly = Recycle.Debug })
	JobLocation:onPlayerInOut(function(isPointInside)
		if not isPointInside then
			EndJob() ClearProps()
			if onDuty == true then
				onDuty = false
			end
		else MakeProps()
		end
	end)

	for _, v in pairs(Recycle.Locations) do
		for i = 1, #v do
			local v = v[i]
			if Recycle.Blips and v.blipTrue then
				local blip = AddBlipForCoord(v.coords)
				SetBlipAsShortRange(blip, true)
				SetBlipSprite(blip, v.sprite)
				SetBlipColour(blip, v.col)
				SetBlipScale(blip, 0.7)
				SetBlipDisplay(blip, 6)
				BeginTextCommandSetBlipName('STRING')
				if Recycle.BlipNamer then AddTextComponentString(v.name)
				else AddTextComponentString("Recycling") end
				EndTextCommandSetBlipName(blip)
			end
			if Recycle.Pedspawn then
				if not Peds[v.name..i] then
					loadModel(v.model)
					Peds[v.name..i] = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z-1.03, v.coords[4], false, false)
					SetEntityInvincible(Peds[v.name..i], true)
					SetBlockingOfNonTemporaryEvents(Peds[v.name..i], true)
					FreezeEntityPosition(Peds[v.name..i], true)
					TaskStartScenarioInPlace(Peds[v.name..i], v.scenario, 0, true)
				end
			end
		end
	end

	Targets["RecyclingEnter"] =
		exports['nocore-eye']:AddBoxZone("RecyclingEnter", vector3(746.82, -1398.93, 26.55), 0.4, 1.6, { name="RecyclingEnter", debugPoly=Recycle.Debug, minZ=25.2, maxZ=28.0 },
			{ options = { { event = "nocore-recycle:TeleWareHouse", icon = "fas fa-recycle", label = "Влез", enter = true }, },
			distance = 1.5 })

	Targets["RecyclingExit"] =
		exports['nocore-eye']:AddBoxZone("RecyclingExit", vector3(991.97, -3097.81, -39.0), 1.6, 0.4, { name="RecyclingExit", debugPoly=Recycle.Debug, useZ=true, },
			{ options = { { event = "nocore-recycle:TeleWareHouse", icon = "fas fa-recycle", label = "Излез", enter =  false }, },
			distance = 1.5 })

	Targets["RecycleDuty"] =
		exports['nocore-eye']:AddCircleZone("RecycleDuty", vector3(995.36, -3099.91, -39.2), 0.45, { name="RecycleDuty", debugPoly=Recycle.Debug, useZ=true, },
			{ options = { { event = "nocore-recycle:dutytoggle", icon = "fas fa-hard-hat", label = "Смяна" }, },
			distance = 1.5 })
	--Recyclable Material Trader
	for i = 1, #Recycle.Locations["Trade"] do
		Targets["Trade"..i] =
			exports['nocore-eye']:AddCircleZone("Trade"..i, conVector3(Recycle.Locations["Trade"][i].coords), 1.1, { name="Trade"..i, debugPoly=Recycle.Debug, useZ=true, },
				{ options = { { event = "nocore-recycle:Trade:Menu", icon = "fas fa-box", label = "Обмени материали"  }, },
				distance = 1.5 })
	end
end)
---- Render Props -------
function MakeProps()
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_SC_02`,		1003.63, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_prop_crate_wlife_bc`,		1018.18, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_watch`,			1013.33, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_SHide`,			1018.18, -3096.95, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Oegg`,			1006.05, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_MiniG`,			1018.18, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_FReel`,			1008.48, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,		1015.75, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_BC`,		1018.18, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_BC`,		1003.63, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Art_02_SC`,		1010.90, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_SC_02`,		1010.90, -3096.95, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_clothing_BC`,		1008.48, -3096.95, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_biohazard_BC`,	1010.90, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_BC_02`,		1006.05, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Art_BC`,			1015.75, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Money_BC`,		1003.63, -3096.95, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_clothing_SC`,		1013.33, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Art_02_BC`,		1013.33, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Money_SC`,		1010.90, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Med_SC`,			1008.48, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_SC_02`,		1008.48, -3108.50, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_racks_BC`,	1003.63, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Money_SC`,		1006.05, -3096.95, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Money_SC`,		1015.75, -3091.60, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_SC_02`,		1015.75, -3096.95, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_SC`,		1006.05, -3102.80, -39.99, 0, 0, 0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_BC_02`,		1013.33, -3096.95, -39.99, 0, 0, 0)
	--These needed headings adjusting
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_BC_02`,		1026.75, -3096.43, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], -90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_BC`,		1026.75, -3106.52, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], -90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Bull_BC_02`,		1026.75, -3091.59, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], -90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_racks_SC`,	1026.75, -3111.38, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], -90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Jewels_BC`,		1026.75, -3108.88, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], -90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_XLDiam`,			1026.75, -3094.01, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], -90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Art_02_BC`,		993.355, -3106.60, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], 90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Art_SC`,			993.355, -3111.30, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], 90.0)
	searchProps[#searchProps+1] = CreateObject(`ex_Prop_Crate_Art_BC`,			993.355, -3108.95, -39.99, 0, 0, 0) SetEntityHeading(searchProps[#searchProps], 90.0)

	--Second Level
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1006.05, -3096.95, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_prop_crate_wlife_sc`,			1003.63, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_prop_crate_jewels_racks_sc`,		1003.63, -3091.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_SC`,				1013.33, -3096.95, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_SC`,				1008.48, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Tob_SC`,				1018.18, -3096.95, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_SC`,				1013.33, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_biohazard_BC`,		1003.63, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_RW`,			1013.33, -3091.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Ammo_BC`,				1013.33, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_BC`,				1003.63, -3096.95, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_biohazard_SC`,		1006.05, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1015.75, -3096.95, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_HighEnd_pharma_SC`,	1015.75, -3091.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_SC`,				1018.18, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_BC`,				1018.18, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1008.48, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_HighEnd_pharma_BC`,	1018.18, -3091.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_BC`,				1015.75, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_furJacket_SC`,		1006.05, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Expl_bc`,				1010.90, -3102.80, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1010.90, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_BC`,				1010.90, -3096.95, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Tob_SC`,				1010.90, -3091.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_SC`,				1015.75, -3108.50, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1008.48, -3091.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1008.48, -3096.60, -37.81, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_SC`,			1006.05, -3091.60, -37.81, 0, 0, 0)
	--These needed headings adjusting
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Med_BC`,				1026.75, -3106.52, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1026.75, -3111.38, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Narc_BC`,				1026.75, -3091.59, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Narc_SC`,				1026.75, -3094.01, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Med_SC`,				1026.75, -3108.88, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_pharma_SC`,			1026.75, -3096.43, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Bull_BC_02`,			993.355, -3106.60, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], 90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Bull_BC_02`,			993.355, -3111.30, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], 90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Bull_SC_02`,			993.355, -3108.95, -37.81, 0, 0, 0) SetEntityHeading(Props[#Props], 90.0)

	--Third Level
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1013.33, -3102.80, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1015.75, -3102.80, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Art_BC`,				1013.33, -3108.50, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Art_BC`,				1015.75, -3108.50, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_clothing_BC`,			1018.18, -3096.95, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Gems_BC`,				1003.63, -3108.50, -35.61, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Wlife_BC`,			1018.18, -3091.60, -35.74, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Med_BC`,				1008.48, -3091.60, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Wlife_BC`,			1015.75, -3091.60, -35.74, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1008.48, -3096.95, -35.60, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1010.90, -3096.95, -35.60, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1010.90, -3091.60, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_furJacket_BC`,		1013.33, -3091.60, -35.74, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_HighEnd_pharma_BC`,	1003.63, -3091.60, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Art_02_BC`,			1013.33, -3096.95, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Tob_BC`,				1010.90, -3108.50, -35.75, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Art_02_BC`,			1018.18, -3108.50, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1003.63, -3096.95, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1006.05, -3096.95, -35.60, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1006.05, -3102.80, -35.60, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Art_BC`,				1015.75, -3096.95, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1010.90, -3102.80, -35.60, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				1008.48, -3102.80, -35.60, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1006.05, -3091.60, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1006.05, -3108.50, -35.62, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Tob_BC`,				1018.18, -3102.80, -35.75, 0, 0, 0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Tob_BC`,				1008.48, -3108.50, -35.75, 0, 0, 0)
	--These needed headings adjusting
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1026.75, -3106.52, -35.62, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1026.75, -3108.88, -35.62, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Closed_BC`,			1026.75, -3111.38, -35.62, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_furJacket_BC`,		1026.75, -3091.59, -35.74, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_furJacket_BC`,		1026.75, -3094.01, -35.74, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_furJacket_BC`,		1026.75, -3096.43, -35.74, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				993.355, -3106.60, -35.60, 0, 0, 0) SetEntityHeading(Props[#Props], 90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_BC`,				993.355, -3111.30, -35.60, 0, 0, 0) SetEntityHeading(Props[#Props], 90.0)
	Props[#Props+1] = CreateObject(`ex_Prop_Crate_Elec_SC`,				993.355, -3108.95, -35.62, 0, 0, 0) SetEntityHeading(Props[#Props], 90.0)

	--Props[#Props+1] = CreateObject(`prop_toolchest_05`,					1002.04, -3108.36, -39.99, 0, 0, 0) SetEntityHeading(Props[#Props], -90.0)
	loadModel(`ex_Prop_Crate_Closed_BC`)
	TrollyProp = CreateObject(`ex_Prop_Crate_Closed_BC`, 999.32, -3093.2, -39.78, 0, 0, 0) FreezeEntityPosition(TrollyProp, true) SetEntityHeading(TrollyProp, 166.38)
	for k in pairs(scrapPool) do loadModel(scrapPool[k].model) end
end
function EndJob()
	if Targets["Package"] then exports["nocore-eye"]:RemoveTargetEntity(randPackage, "Търси") end
	if Targets["DropOff"] then exports["nocore-eye"]:RemoveTargetEntity(TrollyProp, "Остави") end
	for i = 1, #searchProps do SetEntityDrawOutline(searchProps[i], false) end
	randPackage = nil
	if scrapProp then
		destroyProp(scrapProp)
		scrapProp = nil
	end
end

function ClearProps()
	for _, v in pairs(searchProps) do unloadModel(GetEntityModel(v)) DeleteObject(v) end searchProps = {}
	for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteObject(v) end Props = {}
	for k in pairs(scrapPool) do unloadModel(scrapPool[k].model) end
	if Targets["DropOff"] then exports["nocore-eye"]:RemoveTargetEntity(TrollyProp, "Остави") end
	unloadModel(GetEntityModel(TrollyProp)) DeleteObject(TrollyProp)
end

--Pick one of the crates for the player to choose, generate outline + target
function PickRandomPackage()
	--If somehow already exists, remove target
	if Targets["Package"] then exports["nocore-eye"]:RemoveTargetEntity(randPackage, "Търси") end
	--Pick random prop to use
	randPackage = searchProps[math.random(1, #searchProps)]
	SetEntityDrawOutline(randPackage, true)
	SetEntityDrawOutlineColor(255, 255, 255, 1.0)
	SetEntityDrawOutlineShader(1)
	--Generate Target Location on the selected package
	Targets["Package"] =
		exports['nocore-eye']:AddTargetEntity(randPackage,
			{ options = { { event = "nocore-recycle:PickupPackage:Start", icon = 'fas fa-magnifying-glass', label = 'Търси', } },
			distance = 2.5,	})
end
--Event to enter and exit warehouse
RegisterNetEvent("nocore-recycle:TeleWareHouse", function(data)
	if data.enter then
		if Recycle.EnableOpeningHours then
			local ClockTime = GetClockHours()
			if ClockTime >= Recycle.OpenHour and ClockTime <= Recycle.CloseHour - 1 then
				if (ClockTime >= Recycle.OpenHour and ClockTime < 24) or (ClockTime <= Recycle.CloseHour -1 and ClockTime > 0) then
					if Recycle.PayAtDoor then
						local p = promise.new()	Framework.Functions.TriggerCallback("nocore-recycle:GetCash", function(cb) p:resolve(cb) end)
						if Citizen.Await(p) >= Recycle.PayAtDoor then TriggerServerEvent("nocore-recycle:DoorCharge")
						else TriggerEvent("Framework:Notify", "Not Enough Cash", "error") return end
					end
					DoScreenFadeOut(500)
					while not IsScreenFadedOut() do	Citizen.Wait(10) end
					SetEntityCoords(PlayerPedId(), Recycle.InsideTele)
					DoScreenFadeIn(500)
				else
					TriggerEvent("Framework:Notify", "We're currently closed, we're open from "..Recycle.OpenHour..":00am till "..Recycle.CloseHour..":00pm", "error")
				end
			else
				TriggerEvent("Framework:Notify", "We're currently closed, we're open from "..Recycle.OpenHour..":00 until "..Recycle.CloseHour..":00pm", "error")
			end
		else
			DoScreenFadeOut(500)
			while not IsScreenFadedOut() do	Citizen.Wait(10) end
			SetEntityCoords(PlayerPedId(), Recycle.InsideTele)
			DoScreenFadeIn(500)
		end
	else
		EndJob() -- Resets outlines + targets if needed
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do	Citizen.Wait(10) end
		if onDuty then TriggerEvent('nocore-recycle:dutytoggle') end
		SetEntityCoords(PlayerPedId(), Recycle.OutsideTele)
		DoScreenFadeIn(500)
	end
end)

RegisterNetEvent("nocore-recycle:PickupPackage:Start", function()
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true)
	Framework.Functions.Progressbar("open_locker_drill", "Търсене", 5000, false, true, {
		disableMovement = true,	disableCarMovement = true, disableMouse = false, disableCombat = true, disableInventory = true, }, {}, {}, {}, function() -- Done
		ClearPedTasksImmediately(PlayerPedId())
		TriggerEvent("nocore-recycle:PickupPackage:Hold")
	end, function() -- Cancel
	end, "fas fa-magnifying-glass")
end)
RegisterNetEvent("nocore-recycle:PickupPackage:Hold", function()
	--Clear current target info
	exports["nocore-eye"]:RemoveTargetEntity(randPackage, "Търси")
	SetEntityDrawOutline(randPackage, false)
	randPackage = nil

	--Make prop to put in hands
	loadAnimDict("anim@heists@box_carry@")
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
	v = scrapPool[math.random(1, #scrapPool)]
    loadModel(v.model)
    scrapProp = CreateObject(v.model, GetEntityCoords(PlayerPedId(), true), true, true, true)
    AttachEntityToEntity(scrapProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), v.xPos, v.yPos, v.zPos, v.xRot, v.yRot, v.zRot, 20.0, true, true, false, true, 1, true)
	--Create target for drop off location
	SetEntityDrawOutline(TrollyProp, true)
	SetEntityDrawOutlineColor(255, 255, 255, 1.0)
	SetEntityDrawOutlineShader(1)
	Targets["DropOff"] =
		exports['nocore-eye']:AddTargetEntity(TrollyProp,
			{ options = { { event = "nocore-recycle:PickupPackage:Finish", icon = 'fas fa-recycle', label = 'Остави', } },
			distance = 2.5,	})

end)

RegisterNetEvent("nocore-recycle:PickupPackage:Finish", function()
	--Once this is triggered it can't be stopped, so remove the target and prop
	if Targets["DropOff"] then exports["nocore-eye"]:RemoveTargetEntity(TrollyProp, "Остави") Targets["DropOff"] = nil end
	SetEntityDrawOutline(TrollyProp, false) destroyProp(TrollyProp) TrollyProp = nil
	--Remove and the whole prop, seen as how no ones nocore-eye works and its my fault 😊
	TrollyProp = CreateObject(`ex_Prop_Crate_Closed_BC`, 999.32, -3093.2, -39.78, 0, 0, 0) FreezeEntityPosition(TrollyProp, true) SetEntityHeading(TrollyProp, 166.38)

	--Load and Start animation
	local dict = "mp_car_bomb" loadAnimDict("mp_car_bomb")
	local anim = "car_bomb_mechanic"
	FreezeEntityPosition(PlayerPedId(), true)
	Wait(100)
	TaskPlayAnim(PlayerPedId(), dict, anim, 3.0, 3.0, -1, 2.0, 0, 0, 0, 0)
	Wait(3000)
	--When animation is complete
	--Empty hands
	destroyProp(scrapProp)
    scrapProp = nil
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
	TriggerServerEvent('nocore-recycle:getrecyclablematerial') -- Give rewards
	PickRandomPackage()
end)

RegisterNetEvent('nocore-recycle:dutytoggle', function()
	onDuty = not onDuty
	if onDuty then TriggerEvent('Framework:Notify', 'Влязохте на смяна', 'success') PickRandomPackage()
	else TriggerEvent('Framework:Notify', 'Излязохте от смяна', 'error') EndJob() end
end)

local Selling = false
RegisterNetEvent('nocore-recycle:SellAnim', function(item)
	for _, v in pairs (Peds) do
		if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(v)) < 3 then
			Selling = true
			loadAnimDict("mp_common")
			loadAnimDict("amb@prop_human_atm@male@enter")
			local model = `prop_paper_bag_small`
			loadModel(model)
			if bag == nil then bag = CreateObject(model, 0.0, 0.0, 0.0, true, false, false) end
			AttachEntityToEntity(bag, v, GetPedBoneIndex(v, 57005), 0.1, -0.0, 0.0, -90.0, 0.0, 0.0, true, true, false, true, 1, true)
			--Calculate if you're facing the ped--
			ClearPedTasksImmediately(v)
			if not IsPedHeadingTowardsPosition(PlayerPedId(), GetEntityCoords(v), 20.0) then TaskTurnPedToFaceCoord(PlayerPedId(), GetEntityCoords(v), 1500) Wait(1500) end
			TaskPlayAnim(PlayerPedId(), "amb@prop_human_atm@male@enter", "enter", 1.0, 1.0, 0.3, 16, 0.2, 0, 0, 0)	--Start animations
            TaskPlayAnim(v, "mp_common", "givetake2_b", 1.0, 1.0, 0.3, 16, 0.2, 0, 0, 0)
			Wait(1000)
			AttachEntityToEntity(bag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.1, -0.0, 0.0, -90.0, 0.0, 0.0, true, true, false, true, 1, true)
            Wait(1000)
            StopAnimTask(PlayerPedId(), "amb@prop_human_atm@male@enter", "enter", 1.0)
			StopAnimTask(v, "mp_common", "givetake2_b", 1.0)
			TaskStartScenarioInPlace(v, "WORLD_HUMAN_CLIPBOARD", -1, true)
			unloadAnimDict("mp_common")
			unloadAnimDict("amb@prop_human_atm@male@enter")
			destroyProp(bag) unloadModel(model)
			bag = nil
			-- for k in pairs(Recycle.Prices) do
			-- 	if k == item then TriggerServerEvent('nocore-recycle:Selling:Mat', item) Selling = false return end
			-- end
			TriggerServerEvent("nocore-recycle:TradeItems", item)
			Selling = false
		end
	end
end)

RegisterNetEvent('nocore-recycle:Trade:Menu', function()
	if Selling then return end
	local p = promise.new() Framework.Functions.TriggerCallback("nocore-recycle:GetRecyclable", function(cb) p:resolve(cb) end) local amount = Citizen.Await(p)
	local tradeMenu = {
		{ icon = "recyclablematerial", header = "Обменяне на материали", txt = "Имате: "..amount, isMenuHeader = true },
		{ icon = "fas fa-xmark", header = "", txt = "Затвори", params = { event = "nocore-recycle:CloseMenu" } } }
	if amount >= 1 then tradeMenu[#tradeMenu+1] = { icon = "recyclablematerial", header = "Обменете 1 Материал", params = { event = "nocore-recycle:SellAnim", args = 1 } } end
	if amount >= 10 then tradeMenu[#tradeMenu+1] = { icon = "recyclablematerial", header = "Обменете 10 Материала", params = { event = "nocore-recycle:SellAnim", args = 2 } } end
	if amount >= 100 then tradeMenu[#tradeMenu+1] = { icon = "recyclablematerial", header = "Обменете 100 Материала", params = { event = "nocore-recycle:SellAnim", args = 3 } } end
	if amount >= 1000 then tradeMenu[#tradeMenu+1] = { icon = "recyclablematerial", header = "Обменете 1000 Материала", params = { event = "nocore-recycle:SellAnim", args = 4 } } end
	if #tradeMenu > 2 then exports['nocore-context']:openMenu(tradeMenu)
	else TriggerEvent("Framework:Notify", "Нямате нищо за обменяне", "error") end
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports['nocore-eye']:RemoveZone(k) end
	for _, v in pairs(Peds) do unloadModel(GetEntityModel(v)) DeletePed(v) end
	for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteObject(v) end
	for _, v in pairs(searchProps) do unloadModel(GetEntityModel(v)) DeleteObject(v) end
	unloadModel(GetEntityModel(TrollyProp)) DeleteObject(TrollyProp)
	unloadModel(GetEntityModel(scrapProp)) DeleteObject(scrapProp)
	for _, v in pairs(searchProps) do unloadModel(GetEntityModel(v)) DeleteObject(v) end
end)
