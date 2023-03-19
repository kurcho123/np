local Framework = exports[Config.CorePrefix]:GetCoreObject()
local isCrafting = false

RegisterNetEvent('nocore-weapons:client:set:current:weapon')
AddEventHandler('nocore-weapons:client:set:current:weapon', function(data)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
end)

RegisterNetEvent("nocore-spraykit:use")
AddEventHandler("nocore-spraykit:use", function()
    if CurrentWeaponData ~= nil and not isCrafting then
        local weapon = CurrentWeaponData.name:upper()
        openUI(string.sub(weapon, -3) == 'MK2')
    else
        --print('noweapon')
    end
end)

RegisterNetEvent("nocore-spraykit:client:addTint")
AddEventHandler("nocore-spraykit:client:addTint", function(thint)
    if CurrentWeaponData ~= nil then
        local Weapon = CurrentWeaponData.name:upper()
        SetPedWeaponTintIndex(PlayerPedId(), GetHashKey(Weapon), tonumber(thint))
    else
        --print('noweapon')
    end
end)

function openUI(ev)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open",
        mk2 = ev
    })
end

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('SetSkin', function(data)
    local ped = PlayerPedId()
    isCrafting = true
    Framework.Functions.Progressbar("spraying_weapon", "Spraying weapon..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
        disableInventory = true,
	}, {
		animDict = "anim@amb@business@weed@weed_inspecting_high_dry@",
		anim = "weed_inspecting_high_base_inspector",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
        isCrafting = false
        TriggerServerEvent("nocore-spraykit:server:EquipTint", CurrentWeaponData, tonumber(data.tint))
	end, function() -- Cancel
		StopAnimTask(ped, "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
        Framework.Functions.Notify("Failed..", "error")
        isCrafting = false
	end, Config.SprayKitItem)
end)

--[[ RegisterCommand('spraykit', function()
    openUI(ev)
end) ]]