Framework = exports['no-core']:GetCoreObject()
local MultiplierAmount = 0
local HasDot = false

-- Code
-- // Loops \\ --
CreateThread(function()
    while true do
        Wait(4)
        if LocalPlayer.state['isLoggedIn'] then
            local Weapon = GetSelectedPedWeapon(PlayerPedId())
            if Config.WeaponsList[Weapon] ~= nil and Config.WeaponsList[Weapon]['AmmoType'] ~= nil then
                if Config.WeaponsList[Weapon]['IdName'] ~= 'weapon_unarmed' then
                    if IsPedShooting(PlayerPedId()) then
                        if Config.WeaponsList[Weapon]['IdName'] == 'weapon_molotov' then
                            TriggerServerEvent('Framework:Server:RemoveItem', 'weapon_molotov', 1)
                            TriggerEvent('nocore-weapons:client:set:current:weapon', nil)
                            TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items['weapon_molotov'], 'remove')
                        elseif Config.WeaponsList[Weapon]['IdName'] == 'weapon_flare' then
                            TriggerServerEvent('Framework:Server:RemoveItem', 'weapon_flare', 1)
                            TriggerEvent('nocore-weapons:client:set:current:weapon', nil)
                            TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items['weapon_flare'], 'remove')
                        else
                            local WeaponBullets = GetAmmoInPedWeapon(PlayerPedId(), Weapon)
                            TriggerServerEvent("nocore-weapons:server:UpdateWeaponQuality", Config.CurrentWeaponData, 1)
                            if WeaponBullets == 1 then
                                TriggerServerEvent("nocore-weapons:server:UpdateWeaponAmmo", Config.CurrentWeaponData, 1)
                            else
                                TriggerServerEvent("nocore-weapons:server:UpdateWeaponAmmo", Config.CurrentWeaponData, tonumber(WeaponBullets))
                            end
                        end
                    end
                else
                    Wait(1000)
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
        Wait(500)
        if LocalPlayer.state['isLoggedIn'] then
            if IsPedArmed(PlayerPedId(), 6) then
                SendNUIMessage({
                    action = "toggle",
                    show = IsPlayerFreeAiming(PlayerId()),
                })
            else
                SendNUIMessage({
                    action = "toggle",
                    show = false,
                })
                Wait(250)
            end
        end
    end
end)

-- // Events \\ --
RegisterNetEvent('nocore-weapons:client:set:current:weapon')
AddEventHandler('nocore-weapons:client:set:current:weapon', function(data)
    if data ~= false then
        Config.CurrentWeaponData = data
    else
        Config.CurrentWeaponData = {}
    end
end)

RegisterNetEvent('nocore-weapons:client:set:quality')
AddEventHandler('nocore-weapons:client:set:quality', function(amount)
    if Config.CurrentWeaponData ~= nil and next(Config.CurrentWeaponData) ~= nil then
        TriggerServerEvent("nocore-weapons:server:SetWeaponQuality", Config.CurrentWeaponData, amount)
    end
end)

RegisterNetEvent("nocore-weapons:client:EquipAttachment")
AddEventHandler("nocore-weapons:client:EquipAttachment", function(ItemData, attachment)
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    local WeaponData = Config.WeaponsList[weapon]
    if weapon ~= GetHashKey("WEAPON_UNARMED") then
        WeaponData['IdName'] = WeaponData['IdName']:upper()
        if Config.WeaponAttachments[WeaponData['IdName']] ~= nil then
            if Config.WeaponAttachments[WeaponData['IdName']][attachment] ~= nil then
                TriggerServerEvent("nocore-weapons:server:EquipAttachment", ItemData, Config.CurrentWeaponData, Config.WeaponAttachments[WeaponData['IdName']][attachment])
            else
                Framework.Functions.Notify(_U("notsupported"), "error")
            end
        end
    else
        Framework.Functions.Notify(_U("noweapon"), "error")
    end
end)

RegisterNetEvent('nocore-weapons:client:reload:ammo')
AddEventHandler('nocore-weapons:client:reload:ammo', function(AmmoType, AmmoName)
    local Weapon = GetSelectedPedWeapon(PlayerPedId())
    local WeaponBullets = GetAmmoInPedWeapon(PlayerPedId(), Weapon)
    if Config.WeaponsList[Weapon] ~= nil and Config.WeaponsList[Weapon]['AmmoType'] ~= nil then
        -- print(GetMaxAmmoInClip(PlayerPedId(), Weapon))
        -- print(GetMaxAmmo(PlayerPedId(), Weapon))
        -- print(WeaponBullets)
        --Максимум патрони Патрони за пълнител
        local NewAmmo = WeaponBullets + Config.WeaponsList[Weapon]['MagAmmo']
        if NewAmmo > Config.WeaponsList[Weapon]['MaxAmmo'] then
            NewAmmo = Config.WeaponsList[Weapon]['MaxAmmo']
        end
        if Config.WeaponsList[Weapon]['AmmoType'] == AmmoType then
            if WeaponBullets ~= Config.WeaponsList[Weapon]['MaxAmmo'] then
                Framework.Functions.Progressbar("taking_bullets", _U("loadbullets"), Config.WeaponsList[Weapon]['Wait'], false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                    disableInventory = true
                }, {}, {}, {}, function()-- Done
                    -- Remove Item Trigger.
                    TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items[AmmoName], "remove")
                    TriggerServerEvent('Framework:Server:RemoveItem', AmmoName, 1)
                    SetAmmoInClip(PlayerPedId(), Weapon, 0)
                    SetPedAmmo(PlayerPedId(), Weapon, NewAmmo)
                    TriggerServerEvent("nocore-weapons:server:UpdateWeaponAmmo", Config.CurrentWeaponData, tonumber(NewAmmo))
                    Framework.Functions.Notify("+ " .. Config.WeaponsList[Weapon]['MagAmmo'] .. "x (" .. Config.WeaponsList[Weapon]['Name'] .. ")", "success")
                end, function()
                    Framework.Functions.Notify(_U("failed"), "error")
                end)
            else
                Framework.Functions.Notify(_U("alreadyloaded"), "error")
            end
        end
    end
end)

RegisterNetEvent('nocore-weapons:client:set:ammo')
AddEventHandler('nocore-weapons:client:set:ammo', function(Amount)
    local Weapon = GetSelectedPedWeapon(PlayerPedId())
    local WeaponBullets = GetAmmoInPedWeapon(PlayerPedId(), Weapon)
    local NewAmmo = WeaponBullets + tonumber(Amount)
    if Config.WeaponsList[Weapon] ~= nil and Config.WeaponsList[Weapon]['AmmoType'] ~= nil then
        SetAmmoInClip(PlayerPedId(), Weapon, 0)
        SetPedAmmo(PlayerPedId(), Weapon, tonumber(NewAmmo))
        TriggerServerEvent("nocore-weapons:server:UpdateWeaponAmmo", Config.CurrentWeaponData, tonumber(NewAmmo))
        Framework.Functions.Notify("" .. Amount .. 'x (' .. Config.WeaponsList[Weapon]['Name'] .. ')', "success", 4500)
    end
end)

RegisterNetEvent('nocore-weapons:client:remove:dot')
AddEventHandler('nocore-weapons:client:remove:dot', function()
    if not IsPlayerFreeAiming(PlayerId()) then
        SendNUIMessage({
            action = "toggle",
            show = false,
        })
    end
end)

RegisterNetEvent("nocore-weapons:client:addAttachment")
AddEventHandler("nocore-weapons:client:addAttachment", function(component)
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    local WeaponData = Config.WeaponsList[weapon]
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(WeaponData['IdName']), GetHashKey(component))
end)

-- // Functions \\ --
function GetAmmoType(Weapon)
    if Config.WeaponsList[Weapon] ~= nil then
        return Config.WeaponsList[Weapon]['AmmoType']
    end
end


-- CONFIG --
-- local InVeh = false

-- RegisterNetEvent('baseevents:leftVehicle')
-- AddEventHandler('baseevents:leftVehicle', function(veh, seat, class, netId)
--     InVeh = false
--     SetPlayerCanDoDriveBy(PlayerId(), true)
-- end)

-- RegisterNetEvent('baseevents:enteredVehicle')
-- AddEventHandler('baseevents:enteredVehicle', function(veh, seat, class, netId)
--     InVeh = true
--     local Vehicle = veh
--     local vehicleClass = class
--     local playerPed = PlayerPedId()
--     CreateThread(function()
--         while InVeh do
--             Wait(1000)
--             if GetPedInVehicleSeat(Vehicle, -1) == playerPed and vehicleClass ~= 8 and vehicleClass ~= 13 then
--                 SetPlayerCanDoDriveBy(PlayerId(), false)
--             else
--                 SetPlayerCanDoDriveBy(PlayerId(), true)
--             end
--         end
--     end)
-- end)


