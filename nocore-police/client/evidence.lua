local shotAmount = 0
local GunShotAlert = false

local Hairs = {}
local Casings = {}
local Blooddrops = {}
local SlimeDrops = {}
local Fingerprints = {}

local HairNear = {}
local CasingsNear = {}
local BlooddropsNear = {}
local SlimeDropsNear = {}
local FingerprintsNear = {}
local CurrentStatusList = {}

local CurrentHair = nil
local CurrentCasing = nil
local CurrentBlooddrop = nil
local CurrentSlimeDrop = nil
local CurrentFingerprint = nil

local WhitelistedWeapons = {
    `weapon_unarmed`,
    `weapon_snowball`,
    `weapon_stungun`,
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

local function WhitelistedWeapon(weapon)
    for i=1, #WhitelistedWeapons do
        if WhitelistedWeapons[i] == weapon then
            return true
        end
    end
    return false
end

-- // Loops \\ --
AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		Citizen.SetTimeout(1000, function()
			CurrentStatusList = Config.StatusList
		end)
	end
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
	Citizen.SetTimeout(1000, function()
		CurrentStatusList = Config.StatusList
	end)
end)

CreateThread(function() -- Gunpowder Status when shooting
    while true do
        Wait(1)
        local ped = PlayerPedId()
        if IsPedShooting(ped) then
            local weapon = GetSelectedPedWeapon(ped)
            if not WhitelistedWeapon(weapon) then
                shotAmount = shotAmount + 1
                if shotAmount > 5 then
                    if math.random(1, 10) <= 7 then --70% chance to get gunpowder status
                        SetStatus('gunpowder', math.random(300, 360)) -- 5/6 min
                    end
                end
                DropBulletCasing(weapon)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(2000)
        if Config.waterClean and (CurrentStatusList["gunpowder"] ~= nil and CurrentStatusList["gunpowder"].time > 0) then
            ped = PlayerPedId()
			time = math.random(7000,12000)
            if IsEntityInWater(ped) then
				Framework.Functions.Notify('You begin cleaning off the Gunshot Residue... stay in the water', 'inform', 5000)
				Wait(100)
				Framework.Functions.Progressbar("remove-object", "Миеш GSR..", time, false, true, {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false
				}, {}, {}, {}, function() -- Done
					if IsEntityInWater(ped) then
						CurrentStatusList['gunpowder'].time = 0
						Framework.Functions.Notify('You washed off all the Gunshot Residue in the water','success', 5000)
					else
						Framework.Functions.Notify('You left the water too early and did not wash off the gunshot residue.','error', 5000)
					end
				end, function() -- Cancel
					Framework.Functions.Notify("Прекратено..", "error")
					Wait(time)
				end)
				Wait(time)
            else
				Wait(time)
			end
        end
    end
end)

CreateThread(function()
	while true do
		Wait(10000)
		if isLoggedIn then
			for k, v in pairs(CurrentStatusList) do
				if CurrentStatusList[k].time > 0 then
					CurrentStatusList[k].time = CurrentStatusList[k].time - 10
					if CurrentStatusList[k].time < 0 then CurrentStatusList[k].time = 0 end
				end
			end
			TriggerServerEvent("nocore-police:server:UpdateStatus", CurrentStatusList)
		end
	end
end)

CreateThread(function()
	while true do 
		Wait(1)
		if isLoggedIn then
		if PlayerJob.name == "police" and onDuty then
		if CurrentCasing ~= nil then 
			local pos = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Casings[CurrentCasing].coords.x, Casings[CurrentCasing].coords.y, Casings[CurrentCasing].coords.z, true) < 1.5 then
				Framework.Functions.ShowFloatingHelpNotify(Casings[CurrentCasing].coords.x, Casings[CurrentCasing].coords.y, Casings[CurrentCasing].coords.z, "~g~G~w~ - Втулка от куршум ~b~#"..Casings[CurrentCasing].type)
				if IsControlJustReleased(0, Config.Keys["G"]) then
					-- PickUp Event
					local StreetLabel = Framework.Functions.GetStreetLabel()
					local AmmoType = exports['nocore-weapons']:GetAmmoType(Casings[CurrentCasing].type)
					local info = {label = "Гилза", type = "casing", street = StreetLabel:gsub("%'", ""), ammolabel = Config.AmmoLabels[AmmoType], ammotype = Casings[CurrentCasing].type, serie = Casings[CurrentCasing].serie}
					TriggerServerEvent("nocore-police:server:AddEvidenceToInventory", 'casing', CurrentCasing, info)
				end
			end
		end

		if CurrentBlooddrop ~= nil then 
			local pos = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Blooddrops[CurrentBlooddrop].coords.x, Blooddrops[CurrentBlooddrop].coords.y, Blooddrops[CurrentBlooddrop].coords.z, true) < 1.5 then
				Framework.Functions.ShowFloatingHelpNotify(Blooddrops[CurrentBlooddrop].coords.x, Blooddrops[CurrentBlooddrop].coords.y, Blooddrops[CurrentBlooddrop].coords.z, "~g~G~w~ - Кръвна проба")
				if IsControlJustReleased(0, Config.Keys["G"]) then
					-- PickUp Event
					local StreetLabel = Framework.Functions.GetStreetLabel()
					local info = {label = "Кръвна проба", type = "blood", street = StreetLabel:gsub("%'", ""), bloodtype = Blooddrops[CurrentBlooddrop].bloodtype}
					TriggerServerEvent("nocore-police:server:AddEvidenceToInventory", 'blood', CurrentBlooddrop, info)
				end
			end
		end

		if CurrentFingerprint ~= nil then 
			local pos = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Fingerprints[CurrentFingerprint].coords.x, Fingerprints[CurrentFingerprint].coords.y, Fingerprints[CurrentFingerprint].coords.z, true) < 1.5 then
				Framework.Functions.ShowFloatingHelpNotify(Fingerprints[CurrentFingerprint].coords.x, Fingerprints[CurrentFingerprint].coords.y, Fingerprints[CurrentFingerprint].coords.z, "~g~G~w~ - Пръстов отпечатък")
				if IsControlJustReleased(0, Config.Keys["G"]) then
					-- PickUp Event
					local StreetLabel = Framework.Functions.GetStreetLabel()
					local info = {label = "Пръстов отпечатък", type = "fingerprint", street = StreetLabel:gsub("%'", ""), fingerprint = Fingerprints[CurrentFingerprint].fingerprint}
					TriggerServerEvent("nocore-police:server:AddEvidenceToInventory", 'finger', CurrentFingerprint, info)
				end
			end
		end

		if CurrentHair ~= nil then 
			local pos = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Hairs[CurrentHair].coords.x, Hairs[CurrentHair].coords.y, Hairs[CurrentHair].coords.z, true) < 1.5 then
				Framework.Functions.ShowFloatingHelpNotify(Hairs[CurrentHair].coords.x, Hairs[CurrentHair].coords.y, Hairs[CurrentHair].coords.z, "~g~G~w~ - Проба от коса")
				if IsControlJustReleased(0, Config.Keys["G"]) then
					-- PickUp Event
					local StreetLabel = Framework.Functions.GetStreetLabel()
					local info = {label = "Косъм", type = "hair", street = StreetLabel:gsub("%'", ""), hair = Hairs[CurrentHair].hair}
					TriggerServerEvent("nocore-police:server:AddEvidenceToInventory", 'hair', CurrentHair, info)
				end
			end
		end

		if CurrentSlimeDrop ~= nil then 
			local pos = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, SlimeDrops[CurrentSlimeDrop].coords.x, SlimeDrops[CurrentSlimeDrop].coords.y, SlimeDrops[CurrentSlimeDrop].coords.z, true) < 1.5 then
				Framework.Functions.ShowFloatingHelpNotify(SlimeDrops[CurrentSlimeDrop].coords.x, SlimeDrops[CurrentSlimeDrop].coords.y, SlimeDrops[CurrentSlimeDrop].coords.z, "~g~G~w~ - Слузна проба")
				if IsControlJustReleased(0, Config.Keys["G"]) then
					-- PickUp Event
					local StreetLabel = Framework.Functions.GetStreetLabel()
					local info = {label = "Слюнка", type = "slime", street = StreetLabel:gsub("%'", ""), slime = SlimeDrops[CurrentSlimeDrop].slime}
					TriggerServerEvent("nocore-police:server:AddEvidenceToInventory", 'slime', CurrentSlimeDrop, info)
				end
			end
		end
	else
		Wait(1000)
	end
	  else
		Wait(1000)
	 end
	end
end)

CreateThread(function()
	while true do
		Wait(10)
		if isLoggedIn then 
			if PlayerJob.name == "police" and onDuty then
				if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FLASHLIGHT") then
					if next(Casings) ~= nil then
						local pos = GetEntityCoords(PlayerPedId(), true)
						for k, v in pairs(Casings) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								CasingsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentCasing = k
								end
							else
								CasingsNear[k] = nil
							end
						end
					else
						CasingsNear = {}
					end

					if next(Blooddrops) ~= nil then
						local pos = GetEntityCoords(PlayerPedId(), true)
						for k, v in pairs(Blooddrops) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								BlooddropsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentBlooddrop = k
								end
							else
								BlooddropsNear[k] = nil
							end
						end
					else
						BlooddropsNear = {}
					end

					if next(Fingerprints) ~= nil then
						local pos = GetEntityCoords(PlayerPedId(), true)
						for k, v in pairs(Fingerprints) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								FingerprintsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentFingerprint = k
								end
							else
								FingerprintsNear[k] = nil
							end
						end
					else
						FingerprintsNear = {}
					end

					if next(Hairs) ~= nil then
						local pos = GetEntityCoords(PlayerPedId(), true)
						for k, v in pairs(Hairs) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								HairNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentHair = k
								end
							else
								HairNear[k] = nil
							end
						end
					else
						HairNear = {}
					end

					if next(SlimeDrops) ~= nil then
						local pos = GetEntityCoords(PlayerPedId(), true)
						for k, v in pairs(SlimeDrops) do
							if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 12.5 then
								SlimeDropsNear[k] = v
								if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
									CurrentSlimeDrop = k
								end
							else
								SlimeDropsNear[k] = nil
							end
						end
					else
						SlimeDropsNear = {}
					end
				else
					CurrentHair = nil
                    CurrentCasing = nil 
					CurrentBlooddrop = nil
					CurrentSlimeDrop = nil
                    CurrentFingerprint = nil
					Wait(1000)
				end
			else
				Wait(5000)
			end
		end
    end
end)

CreateThread(function()
    while true do
        Wait(1)
		if isLoggedIn then
           if FingerprintsNear ~= nil then
		    	if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FLASHLIGHT") then
		    		if PlayerJob.name == "police" and onDuty then
		    			for k, v in pairs(FingerprintsNear) do
		    				if v ~= nil then
		    					DrawMarker(32, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.45, 0.1, 89, 29, 138, 255, false, false, false, true, false, false, false)
		    				end
		    			end
		    		end
		    	else
		    	  Wait(1000)
		    	end
		    else
		      Wait(1000)
           end

           if CasingsNear ~= nil then
            if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FLASHLIGHT") then
				if PlayerJob.name == "police" and onDuty then
					for k, v in pairs(CasingsNear) do
						if v ~= nil then
							DrawMarker(32, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.45, 0.1, 50, 0, 250, 255, false, false, false, true, false, false, false)
				   		end
				   	end
				   end
			    else
			    	Wait(1000)
               end
             else
               Wait(1000)
		   end
		   
		   if HairNear ~= nil then
            if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FLASHLIGHT") then
				if PlayerJob.name == "police" and onDuty then
					for k, v in pairs(HairNear) do
						if v ~= nil then
							DrawMarker(32, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.45, 0.1, 247, 184, 10, 255, false, false, false, true, false, false, false)
				   		end
				   	end
				   end
			    else
			    	Wait(1000)
               end
             else
               Wait(1000)
		   end
		   
		   if SlimeDropsNear ~= nil then
            if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FLASHLIGHT") then
				if PlayerJob.name == "police" and onDuty then
					for k, v in pairs(SlimeDropsNear) do
						if v ~= nil then
							DrawMarker(32, v.coords.x, v.coords.y, v.coords.z - 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.45, 0.1, 23, 173, 12, 255, false, false, false, true, false, false, false)
				   		end
				   	end
				   end
			    else
			    	Wait(1000)
               end
             else
               Wait(1000)
           end

           if BlooddropsNear ~= nil then
           if IsPlayerFreeAiming(PlayerId()) and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FLASHLIGHT") then
            if PlayerJob.name == "police" and onDuty then
                for k, v in pairs(BlooddropsNear) do
                    if v ~= nil then
                        DrawMarker(32, v.coords.x, v.coords.y, v.coords.z - 0.03, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.45, 0.1, 250, 0, 50, 255, false, false, false, true, false, false, false)
                    end
                    end
                 end
               else
                   Wait(1000)
               end
             else
             Wait(1000)
           end
        end
    end
end)

-- // Events \\ --

RegisterNetEvent('nocore-police:client:AddBlooddrop')
AddEventHandler('nocore-police:client:AddBlooddrop', function(bloodId, bloodtype, coords)
    Blooddrops[bloodId] = {
		bloodtype = bloodtype,
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
	}
end)

RegisterNetEvent('nocore-police:client:AddFingerPrint')
AddEventHandler('nocore-police:client:AddFingerPrint', function(fingerId, fingerprint, coords)
    Fingerprints[fingerId] = {
		fingerprint = fingerprint,
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
	}
end)

RegisterNetEvent('nocore-police:client:AddHair')
AddEventHandler('nocore-police:client:AddHair', function(hairId, hair, coords)
    Hairs[hairId] = {
		hair = hair,
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
    }
end)

RegisterNetEvent('nocore-police:client:AddSlime')
AddEventHandler('nocore-police:client:AddSlime', function(slimeId, slime, coords)
    SlimeDrops[slimeId] = {
		slime = slime,
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
    }
end)

RegisterNetEvent('nocore-police:client:AddCasing')
AddEventHandler('nocore-police:client:AddCasing', function(casingId, weapon, coords, serie)
    Casings[casingId] = {
		type = weapon,
		serie = serie ~= nil and serie or "Serie nummer niet zichtbaar..",
		coords = {
			x = coords.x,
			y = coords.y, 
			z = coords.z - 0.9,
		}
    }
end)

RegisterNetEvent("nocore-police:client:RemoveDnaId")
AddEventHandler("nocore-police:client:RemoveDnaId", function(Type, DnaId)
	if Type == 'casing' then
	 Casings[DnaId] = nil
	 CasingsNear[DnaId] = nil
	 CurrentCasing = nil
	elseif Type == 'finger' then
	 Fingerprints[DnaId] = nil
	 FingerprintsNear[DnaId] = nil
	 CurrentFingerprint = nil
	elseif Type == 'blood' then
	 Blooddrops[DnaId] = nil
	 BlooddropsNear[DnaId] = nil
	 CurrentBlooddrop = nil
	elseif Type == 'hair' then
	 Hairs[DnaId] = nil
	 HairNear[DnaId] = nil
	 CurrentHair = nil
	elseif Type == 'slime' then
	 SlimeDrops[DnaId] = nil
	 SlimeDropsNear[DnaId] = nil
	 CurrentSlimeDrop = nil
	end
end)

RegisterNetEvent('nocore-police:client:SetStatus')
AddEventHandler('nocore-police:client:SetStatus', function(statusId, time)
	Status = statusId
	Time = time
	SetStatus(Status, Time)
end)

function SetStatus(statusId, time)
	Status = statusId
	Time = time
	if Time < 0 then return end
	if CurrentStatusList[Status] == nil then return end
	CurrentStatusList[Status].time = Time
	TriggerServerEvent("nocore-police:server:UpdateStatus", CurrentStatusList)
end

-- // Functions \\ --

function DropBulletCasing(Weapon)
 local RandomX = math.random() + math.random(-1, 1)
 local RandomY = math.random() + math.random(-1, 1)
 local Coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), RandomX, RandomY, 0)
 TriggerServerEvent("nocore-police:server:CreateCasing", Weapon, Coords)
 Wait(300)
end

function IsWeaponSilent(Weapon)
	local IsSilent = false
	 for k, v in pairs(Config.SilentWeapons) do
	  if GetHashKey(v) == Weapon then		
	  	IsSilent = true
	  end
	 end
 return IsSilent
end

function GetWeaponCategory(Weapon)
	local WeaponCategory = 'Onbekend'
	local WeaponGroupHash = GetWeapontypeGroup(Weapon)
	if Config.WeaponHashGroup[WeaponGroupHash] ~= nil then 
		WeaponCategory = Config.WeaponHashGroup[WeaponGroupHash]['name']
	end
	return WeaponCategory
end