-- Variables

local Framework = exports['no-core']:GetCoreObject()
local PlayerData = Framework.Functions.GetPlayerData()
local inInventory = false
local currentWeapon = nil
local CurrentWeaponData = {}
local currentOtherInventory = nil
local Drops = {}
local CurrentDrop = nil
local DropsNear = {}
local CurrentVehicle = nil
local CurrentGlovebox = nil
local CurrentStash = nil
local isCrafting = false
local isHotbar = false
local isOpeningInventory = false
local isInventoryDisabled = false
local itemInfos = {}
local showBlur = true

RegisterNUICallback('showBlur', function()
    Wait(50)
    TriggerEvent("lj-inventory:client:showBlur")
end) 
RegisterNetEvent("lj-inventory:client:showBlur", function()
    Wait(50)
    showBlur = not showBlur
end)

-- Functions

local function IsAbleToOpenInventory(skip)
    local ped = PlayerPedId()
    local L_isOpeningInventory = isOpeningInventory
    if skip then
        L_isOpeningInventory =  false
    end
    if exports['nocore-progressbar']:GetInventoryStatus()
    or isInventoryDisabled
    or L_isOpeningInventory
    or PlayerData.metadata["isdead"]
    or PlayerData.metadata["ishandcuffed"] 
    or IsPauseMenuActive()
    or IsEntityPlayingAnim(ped, "missminuteman_1ig_2", "handsup_base", 3)
    or IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3)
    or IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base", 3) then
        return false
    end
    return true
end

local function GetClosestVending()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local object = nil
    for _, machine in pairs(Config.VendingObjects) do
        local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.75, GetHashKey(machine), 0, 0, 0)
        if ClosestObject ~= 0 then
            if object == nil then
                object = ClosestObject
            end
        end
    end
    return object
end

local function ClosestContainer()
    for k, v in pairs(Config.Dumpsters) do
        local StartShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.1, 0)
        local EndShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 1.8, -0.4)
        local RayCast = StartShapeTestRay(StartShape.x, StartShape.y, StartShape.z, EndShape.x, EndShape.y, EndShape.z, 16, PlayerPedId(), 0)
        local Retval, Hit, Coords, Surface, EntityHit = GetShapeTestResult(RayCast)
        local BinModel = 0
        if EntityHit then
          BinModel = GetEntityModel(EntityHit)
        end
        if v['Model'] == BinModel then
         local EntityHitCoords = GetEntityCoords(EntityHit)
         if EntityHitCoords.x < 0 or EntityHitCoords.y < 0 then
             EntityHitCoords = {x = EntityHitCoords.x + 5000,y = EntityHitCoords.y + 5000}
         end
         return EntityHitCoords
        end
    end
end

local function CreateItemDrop(index)
    local dropItem = CreateObject(Config.ItemDropObject, DropsNear[index].coords.x, DropsNear[index].coords.y, DropsNear[index].coords.z, false, false, false)
    DropsNear[index].object = dropItem
    DropsNear[index].isDropShowing = true
    PlaceObjectOnGroundProperly(dropItem)
    FreezeEntityPosition(dropItem)
    SetEntityCollision(dropItem, false, false)
end

local function RemoveNearbyDrop(index)
    if DropsNear[index] then
        local dropItem = DropsNear[index].object
        if DoesEntityExist(dropItem) then
            DeleteEntity(dropItem)
        end

        DropsNear[index] = nil
        if Drops[index] then
            Drops[index].object = nil
            Drops[index].isDropShowing = nil
        end
    end
end

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function FormatWeaponAttachments(itemdata)
    local attachments = {}
    itemdata.name = itemdata.name:upper()
    if itemdata.info.attachments ~= nil and next(itemdata.info.attachments) ~= nil then
        for k, v in pairs(itemdata.info.attachments) do
            if Config.WeaponAttachments[itemdata.name] ~= nil then
                for key, value in pairs(Config.WeaponAttachments[itemdata.name]) do
                    if value.component == v.component then
                        table.insert(attachments, {
                            attachment = key,
                            label = value.label
                        })
                    end
                end
            end
        end
    end
    return attachments
end

local function IsBackEngine(vehModel)
    if BackEngineVehicles[vehModel] then return true end
    return false
end

local function OpenTrunk()
    local vehicle = Framework.Functions.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorOpen(vehicle, 4, false, false)
    else
        SetVehicleDoorOpen(vehicle, 5, false, false)
    end
end

local function CloseTrunk()
    local vehicle = Framework.Functions.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorShut(vehicle, 4, false)
    else
        SetVehicleDoorShut(vehicle, 5, false)
    end
end

local function closeInventory()
    SendNUIMessage({
        action = "close",
    })
end

RegisterNetEvent("nocore-inventory:client:Close", function()
    closeInventory()
end)

RegisterNetEvent("nocore-hospital:client:DoDeathOnPlayer", function()
    closeInventory()
end)

local function ToggleHotbar(toggle)
    local HotbarItems = {
        [1] = PlayerData.items[1],
        [2] = PlayerData.items[2],
        [3] = PlayerData.items[3],
        [4] = PlayerData.items[4],
        [5] = PlayerData.items[5],
        [31] = PlayerData.items[31],
    }

    if toggle then
        SendNUIMessage({
            action = "toggleHotbar",
            open = true,
            items = HotbarItems
        })
    else
        SendNUIMessage({
            action = "toggleHotbar",
            open = false,
        })
    end
end

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function openAnim()
    local ped = PlayerPedId()
    LoadAnimDict('pickup_object')
    TaskPlayAnim(ped,'pickup_object', 'putdown_low', 5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(500)
    StopAnimTask(ped, 'pickup_object', 'putdown_low', 1.0)
end

RegisterNUICallback('Notify', function(data)
    Framework.Functions.Notify(data.message, data.type)
end)

-- Events

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    LocalPlayer.state:set("inv_busy", false, true)
    PlayerData = Framework.Functions.GetPlayerData()
    Framework.Functions.TriggerCallback("nocore-inventory:server:GetCurrentDrops", function(theDrops)
		Drops = theDrops
	end)
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload', function()
    LocalPlayer.state:set("inv_busy", true, true)
    PlayerData = {}
end)

RegisterNetEvent('Framework:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('nocore-inventory:client:CheckOpenState', function(type, id, label)
    local name = Framework.Shared.SplitStr(label, "-")[2]
    if type == "stash" then
        if name ~= CurrentStash or CurrentStash == nil then
            TriggerServerEvent('nocore-inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "trunk" then
        if name ~= CurrentVehicle or CurrentVehicle == nil then
            TriggerServerEvent('nocore-inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "glovebox" then
        if name ~= CurrentGlovebox or CurrentGlovebox == nil then
            TriggerServerEvent('nocore-inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "drop" then
        if name ~= CurrentDrop or CurrentDrop == nil then
            TriggerServerEvent('nocore-inventory:server:SetIsOpenState', false, type, id)
        end
    end
end)

RegisterNetEvent('nocore-weapons:client:set:current:weapon')
AddEventHandler('nocore-weapons:client:set:current:weapon', function(data, bool)
    CurrentWeaponData = data or {}
end)

RegisterNetEvent('nocore-inventory:client:ItemBox', function(itemData, type, amount)
    amount = amount or 1
    SendNUIMessage({
        action = "itemBox",
        item = itemData,
        type = type,
        itemAmount = amount
    })
end)

RegisterNetEvent('nocore-inventory:client:requiredItems', function(items, bool)
    local itemTable = {}
    if bool then
        for k, v in pairs(items) do
            itemTable[#itemTable+1] = {
                item = items[k].name,
                label = Framework.Shared.Items[items[k].name]["label"],
                image = items[k].image,
            }
        end
    end

    SendNUIMessage({
        action = "requiredItem",
        items = itemTable,
        toggle = bool
    })
end)

RegisterNetEvent('nocore-inventory:server:RobPlayer', function(TargetId)
    SendNUIMessage({
        action = "RobMoney",
        TargetId = TargetId,
    })
end)

RegisterNetEvent('nocore-inventory:client:DisableInventory', function(disable)
    isInventoryDisabled = disable
end)

RegisterNetEvent('nocore-inventory:client:OpenInventory', function(PlayerAmmo, inventory, other)
    if not IsEntityDead(PlayerPedId()) then
        --Wait(500)
        ToggleHotbar(false)
        if not IsAbleToOpenInventory(true) then
            print("nocore-inventory Disabled, after firs server")
            isOpeningInventory = false
            return
        end
        Framework.Functions.TriggerCallback('nocore-inventory:server:ConvertQuality', function(data)
            if not IsAbleToOpenInventory(true) then
                print("nocore-inventory Disabled, after second server")
                isOpeningInventory = false
            else
                if showBlur == true then
                    TriggerScreenblurFadeIn(1000)
                end
                SetNuiFocus(true, true)
                if other then
                    currentOtherInventory = other.name
                end
                inventory = data.inventory
                other = data.other
                if Framework.Functions.GetPlayerData().citizenid == 'KYA93491' or Framework.Functions.GetPlayerData().citizenid == 'IVO83687' then 
                    SendNUIMessage({
                        action = "open",
                        inventory = inventory,
                        slots = MaxInventorySlots,
                        other = other,
                        maxweight = 50000000,
                        Ammo = PlayerAmmo,
                        maxammo = Config.MaximumAmmoValues,
                    })
                else
                    SendNUIMessage({
                        action = "open",
                        inventory = inventory,
                        slots = MaxInventorySlots,
                        other = other,
                        maxweight = Framework.Config.Player.MaxWeight,
                        Ammo = PlayerAmmo,
                        maxammo = Config.MaximumAmmoValues,
                    })
                end
                isOpeningInventory = false
                inInventory = true
            end
        end, inventory, other)
    end
end)

RegisterNetEvent('nocore-inventory:client:UpdatePlayerInventory', function(isError)
    if Framework.Functions.GetPlayerData().citizenid == 'KYA93491' or Framework.Functions.GetPlayerData().citizenid == 'IVO83687' then 
        SendNUIMessage({
            action = "update",
            inventory = PlayerData.items,
            maxweight = 50000000,
            slots = MaxInventorySlots,
            error = isError,
        })
    else
        SendNUIMessage({
            action = "update",
            inventory = PlayerData.items,
            maxweight = Framework.Config.Player.MaxWeight,
            slots = MaxInventorySlots,
            error = isError,
        })
    end
end)

RegisterNetEvent('nocore-inventory:client:CraftItems', function(itemName, itemCosts, amount, toSlot, points, table)
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    Framework.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
        disableInventory = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("nocore-inventory:server:CraftItems", itemName, itemCosts, amount, toSlot, points, table)
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        Framework.Functions.Notify("Отказано", "error")
        isCrafting = false
	end, itemName)
end)

RegisterNetEvent('nocore-inventory:client:CraftAttachment', function(itemName, itemCosts, amount, toSlot, points)
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    Framework.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
        disableInventory = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("nocore-inventory:server:CraftAttachment", itemName, itemCosts, amount, toSlot, points)
        TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items[itemName], 'add')
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        Framework.Functions.Notify("Отказано", "error")
        isCrafting = false
	end, itemName)
end)

RegisterNetEvent('nocore-inventory:client:PickupSnowballs', function()
    local ped = PlayerPedId()
    LoadAnimDict('anim@mp_snowball')
    TaskPlayAnim(ped, 'anim@mp_snowball', 'pickup_snowball', 3.0, 3.0, -1, 0, 1, 0, 0, 0)
    Framework.Functions.Progressbar("pickupsnowball", "Collecting snowballs..", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(ped)
        TriggerServerEvent('Framework:Server:AddItem', "snowball", 1)
        TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items["snowball"], "add")
    end, function() -- Cancel
        ClearPedTasks(ped)
        Framework.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('nocore-inventory:client:UseSnowball', function(amount)
    local ped = PlayerPedId()
    GiveWeaponToPed(ped, `weapon_snowball`, amount, false, false)
    SetPedAmmo(ped, `weapon_snowball`, amount)
    SetCurrentPedWeapon(ped, `weapon_snowball`, true)
end)

RegisterNetEvent('nocore-inventory:client:UseWeapon', function(weaponData, shootbool)
    local weaponName = tostring(weaponData.name)
    if currentWeapon == weaponName then
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(PlayerPedId(), true)
        TriggerEvent('nocore-weapons:client:set:current:weapon', nil)
        currentWeapon = nil
    elseif weaponName == "weapon_stickybomb" then
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
        TriggerServerEvent('Framework:Server:RemoveItem', weaponName, 1)
        TriggerEvent('nocore-weapons:client:set:current:weapon', weaponData)
        currentWeapon = weaponName
    elseif weaponName == "weapon_molotov" then
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
        TriggerEvent('nocore-weapons:client:set:current:weapon', weaponData)
        currentWeapon = weaponName
        
    elseif weaponName == "weapon_katanas" then
        TriggerEvent('animations:client:EmoteCommandStart', {"bringiton"})
     
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
        TriggerEvent('nocore-weapons:client:set:current:weapon', weaponData)
        currentWeapon = weaponName

    elseif weaponName == "weapon_flare" then
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
        TriggerEvent('nocore-weapons:client:set:current:weapon', weaponData)
        currentWeapon = weaponName
    elseif weaponName == "weapon_railgun" then
        if Framework.Functions.GetPlayerData().job.name == 'police' then
            TriggerEvent('nocore-weapons:client:set:current:weapon', weaponData)
            Framework.Functions.TriggerCallback("nocore-weapon:server:GetWeaponAmmo", function(result)
                local ammo = tonumber(result)
                GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), ammo, false, false)
                SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), ammo)
                SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
                if weaponData.info.attachments ~= nil then
                    for _, attachment in pairs(weaponData.info.attachments) do
                        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponName), GetHashKey(attachment.component))
                    end
                end
                if weaponData.info.tint ~= nil then
                    SetPedWeaponTintIndex(PlayerPedId(), GetHashKey(weaponName), weaponData.info.tint)
                end
                currentWeapon = weaponName
            end, CurrentWeaponData)
        else
            Framework.Functions.Notify("Ти не можеш да използваш това оръжие!", "error") 
        end
    else    
        TriggerEvent('nocore-weapons:client:set:current:weapon', weaponData)
        Framework.Functions.TriggerCallback("nocore-weapon:server:GetWeaponAmmo", function(result)
            local ammo = tonumber(result)
            if weaponName == "weapon_petrolcan" or weaponName == "weapon_fireextinguisher" then 
                ammo = 4000 
            end
            GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), ammo, false, false)
            SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), ammo)
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
            if weaponData.info.attachments ~= nil then
                for _, attachment in pairs(weaponData.info.attachments) do
                    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponName), GetHashKey(attachment.component))
                end
                if weaponName == 'weapon_switchblade' then
                    SetFollowPedCamViewMode(4)
                end
            end
            if weaponData.info.tint ~= nil then
                SetPedWeaponTintIndex(PlayerPedId(), GetHashKey(weaponName), weaponData.info.tint)
            end
            currentWeapon = weaponName
        end, CurrentWeaponData)
    end
end)

RegisterNetEvent('nocore-inventory:client:CheckWeapon', function(weaponName)
    local ped = PlayerPedId()
    if currentWeapon == weaponName then
        TriggerEvent('weapons:ResetHolster')
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(ped, true)
        currentWeapon = nil
    end
end)

RegisterNetEvent('nocore-inventory:client:AddDropItem', function(dropId, player, coords)
    local forward = GetEntityForwardVector(GetPlayerPed(GetPlayerFromServerId(player)))
	local x, y, z = table.unpack(coords + forward * 0.5)
    Drops[dropId] = {
        id = dropId,
        coords = {
            x = x,
            y = y,
            z = z - 0.3,
        },
    }
end)

RegisterNetEvent('nocore-inventory:client:RemoveDropItem', function(dropId)
    Drops[dropId] = nil
    if Config.UseItemDrop then RemoveNearbyDrop(dropId) else DropsNear[dropId] = nil end
end)

RegisterNetEvent('nocore-inventory:client:DropItemAnim', function()
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Wait(7)
    end
    TaskPlayAnim(ped, "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
    Wait(2000)
    ClearPedTasks(ped)
end)

RegisterNetEvent('nocore-inventory:client:SetCurrentStash', function(stash)
    CurrentStash = stash
end)

-- Commands

RegisterCommand('closeinv', function()
    closeInventory()
end, false)

RegisterCommand('inventory', function()
    local ped = PlayerPedId()
    if not IsAbleToOpenInventory()then
        print("nocore-inventory Disabled, on command")
        return
    end
    if not isCrafting and not inInventory then
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] then
            isOpeningInventory = true
            local curVeh = nil
            local VendingMachine = GetClosestVending()
            local DumpsterFound = ClosestContainer()

            if IsPedInAnyVehicle(ped) then -- Is Player In Vehicle
                local vehicle = GetVehiclePedIsIn(ped, false)
                CurrentGlovebox = exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(vehicle))
                curVeh = vehicle
                CurrentVehicle = nil
            else
                local vehicle = Framework.Functions.GetClosestVehicle()
                if vehicle ~= 0 and vehicle ~= nil then
                    local pos = GetEntityCoords(ped)
                    local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                    end
                    if #(pos - trunkpos) < 1.5 and not IsPedInAnyVehicle(ped) then
                        if GetVehicleDoorLockStatus(vehicle) < 2 then
                            CurrentVehicle = exports['nocore-fakeplate']:GetRealPlate(GetVehicleNumberPlateText(vehicle))
                            curVeh = vehicle
                            CurrentGlovebox = nil
                        else
                            Framework.Functions.Notify("Автомобилът е заключен..", "error")
                            isOpeningInventory = false
                            return
                        end
                    else
                        CurrentVehicle = nil
                    end
                else
                    CurrentVehicle = nil
                end
            end

            if CurrentVehicle then -- Trunk
                local vehicleClass = GetVehicleClass(curVeh)
                local other = {
                    maxweight = Config.TrunkClasses[vehicleClass]['MaxWeight'],
                    slots = Config.TrunkClasses[vehicleClass]['MaxSlots']
                }
                local frameworkvehicle = Framework.Functions.GetVehicle(curVeh)
                if frameworkvehicle ~= nil then
                    other.maxweight = frameworkvehicle.trunkspace
                    other.slots = frameworkvehicle.trunkslots
                end
                TriggerServerEvent("nocore-inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
                OpenTrunk()
            elseif CurrentGlovebox then
                TriggerServerEvent("nocore-inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
            elseif CurrentDrop then
                TriggerServerEvent("nocore-inventory:server:OpenInventory", "drop", CurrentDrop)
            elseif VendingMachine then
                local ShopItems = {}
                ShopItems.label = "Vending Machine"
                ShopItems.items = Config.VendingItem
                ShopItems.slots = #Config.VendingItem
                TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "Vendingshop_"..math.random(1, 99), ShopItems)
            -- elseif DumpsterFound then
            --     local Dumpster = 'Container | '..math.floor(DumpsterFound.x).. ' | '..math.floor(DumpsterFound.y)..' |'
            --     TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", Dumpster, {maxweight = 1000000, slots = 15})
            --     TriggerEvent("nocore-inventory:client:SetCurrentStash", Dumpster)
            else
                TriggerServerEvent("nocore-inventory:server:OpenInventory")
                openAnim()
            end
        end
    end
end)

RegisterNetEvent('nocore-inventory:client:openVending', function ()
    local ShopItems = {}
    ShopItems.label = "Vending Machine"
    ShopItems.items = Config.VendingItem
    ShopItems.slots = #Config.VendingItem
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "Vendingshop_"..math.random(1, 99), ShopItems)
end)

RegisterKeyMapping('inventory', 'Open Inventory', 'keyboard', 'TAB')

RegisterCommand('hotbar', function()
    isHotbar = not isHotbar
    if IsAbleToOpenInventory() then
        ToggleHotbar(isHotbar)
    end
end)

RegisterKeyMapping('hotbar', 'Toggles keybind slots', 'keyboard', 'z')

for i = 1, 5 do
    RegisterCommand('slot' .. i,function()
        local ped = PlayerPedId()
        if IsAbleToOpenInventory() then
            if i == 6 then
                i = MaxInventorySlots
            end
            TriggerServerEvent("nocore-inventory:server:UseItemSlot", i)
        end
    end)
    RegisterKeyMapping('slot' .. i, 'Uses the item in slot ' .. i, 'keyboard', i)
end

RegisterNetEvent('nocore-inventory:client:giveAnim', function()
    if not IsPedInAnyVehicle(PlayerPedId()) then
        LoadAnimDict('mp_common')
	    TaskPlayAnim(PlayerPedId(), 'mp_common', 'givetake1_b', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
    end
end)

-- NUI

RegisterNUICallback('RobMoney', function(data)
    TriggerServerEvent("nocore-police:server:rob:player", data.TargetId)
end)

RegisterNUICallback('Notify', function(data)
    Framework.Functions.Notify(data.message, data.type)
end)

RegisterNUICallback('GetWeaponData', function(data, cb)
    local data = {
        WeaponData = Framework.Shared.Items[data.weapon],
        AttachmentData = FormatWeaponAttachments(data.ItemData)
    }
    cb(data)
end)

RegisterNUICallback('RemoveAttachment', function(data, cb)
    local WeaponData = Framework.Shared.Items[data.WeaponData.name]
    local Attachment = Config.WeaponAttachments[WeaponData.name:upper()][data.AttachmentData.attachment]
    Framework.Functions.TriggerCallback('nocore-weapons:server:RemoveAttachment', function(NewAttachments)
        if NewAttachments ~= false then
            local Attachies = {}
            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            for k, v in pairs(NewAttachments) do
                for wep, pew in pairs(Config.WeaponAttachments[WeaponData.name:upper()]) do
                    if v.component == pew.component then
                        table.insert(Attachies, {
                            attachment = pew.item,
                            label = pew.label,
                        })
                    end
                end
            end
            local DJATA = {
                Attachments = Attachies,
                WeaponData = WeaponData,
            }
            cb(DJATA)
        else
            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            cb({})
        end
    end, data.AttachmentData, data.WeaponData)
end)

RegisterNUICallback('getCombineItem', function(data, cb)
    cb(Framework.Shared.Items[data.item])
end)

RegisterNUICallback("CloseInventory", function()
    if currentOtherInventory == "none-inv" then
        CurrentDrop = nil
        CurrentVehicle = nil
        CurrentGlovebox = nil
        CurrentStash = nil
        SetNuiFocus(false, false)
        inInventory = false
        TriggerScreenblurFadeOut(1000)
        ClearPedTasks(PlayerPedId())
        return
    end
    if CurrentVehicle ~= nil then
        CloseTrunk()
        TriggerServerEvent("nocore-inventory:server:SaveInventory", "trunk", CurrentVehicle)
        CurrentVehicle = nil
    elseif CurrentGlovebox ~= nil then
        TriggerServerEvent("nocore-inventory:server:SaveInventory", "glovebox", CurrentGlovebox)
        CurrentGlovebox = nil
    elseif CurrentStash ~= nil then
        TriggerServerEvent("nocore-inventory:server:SaveInventory", "stash", CurrentStash)
        CurrentStash = nil
    else
        TriggerServerEvent("nocore-inventory:server:SaveInventory", "drop", CurrentDrop)
        CurrentDrop = nil
    end
    Wait(50)
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    inInventory = false
    TriggerEvent("nocore-inventory:client:onClose")
end)

RegisterNUICallback("UseItem", function(data)
    TriggerServerEvent("nocore-inventory:server:UseItem", data.inventory, data.item)
end)

RegisterNUICallback("combineItem", function(data)
    Wait(150)
    TriggerServerEvent('nocore-inventory:server:combineItem', data.reward, data.fromItem, data.toItem)
end)

RegisterNUICallback('combineWithAnim', function(data)
    local ped = PlayerPedId()
    local combineData = data.combineData
    local aDict = combineData.anim.dict
    local aLib = combineData.anim.lib
    local animText = combineData.anim.text
    local animTimeout = combineData.anim.timeOut

    Framework.Functions.Progressbar("combine_anim", animText, animTimeout, false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {
        animDict = aDict,
        anim = aLib,
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, aDict, aLib, 1.0)
        TriggerServerEvent('nocore-inventory:server:combineItem', combineData.reward, data.requiredItem, data.usedItem)
    end, function() -- Cancel
        StopAnimTask(ped, aDict, aLib, 1.0)
        Framework.Functions.Notify("Отказано!", "error")
    end, combineData.reward)
end)

RegisterNUICallback("SetInventoryData", function(data)
    TriggerServerEvent("nocore-inventory:server:SetInventoryData", data.fromInventory, data.toInventory, data.fromSlot, data.toSlot, data.fromAmount, data.toAmount)
end)

RegisterNUICallback("PlayDropSound", function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback("PlayDropFail", function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback("GiveItem", function(data)
    local player, distance = Framework.Functions.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
    if player ~= -1 and distance < 3 then
        if (data.inventory == 'player') then
            local playerId = GetPlayerServerId(player)
            SetCurrentPedWeapon(PlayerPedId(),'WEAPON_UNARMED',true)
            TriggerServerEvent("nocore-inventory:server:GiveItem", playerId, data.item.name, data.amount, data.item.slot)
        else
            Framework.Functions.Notify("Не притежаваш този предмет!", "error")
        end
    else
        Framework.Functions.Notify("Няма никой наоколо!", "error")
    end
end)

-- Threads

CreateThread(function()
    while true do
        Citizen.Wait(0)
        BlockWeaponWheelThisFrame()
        DisableControlAction(0, 37, true)
        -- DisableControlAction(0, 199, true) 
    end
end)

CreateThread(function()
    while true do
        local sleep = 100
        if DropsNear ~= nil then
            for k, v in pairs(DropsNear) do
                if DropsNear[k] ~= nil then
                    if Config.UseItemDrop then
                        if not v.isDropShowing then
                            CreateItemDrop(k)
                        end
                    else
                        sleep = 1
                        DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        if Drops and next(Drops) then
            local pos = GetEntityCoords(PlayerPedId(), true)
            for k, v in pairs(Drops) do
                if Drops[k] then
                    local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                    if dist < Config.MaxDropViewDistance then
                        DropsNear[k] = v
                        if dist < 2 then
                            CurrentDrop = k
                        else
                            CurrentDrop = nil
                        end
                    else
                        if Config.UseItemDrop and DropsNear[k] then
                            RemoveNearbyDrop(k)
                        else
                            DropsNear[k] = nil
                        end
                    end
                end
            end
        else
            DropsNear = {}
        end
        Wait(500)
    end
end)

RegisterNetEvent("nocore-inventory:client:ShowId")
AddEventHandler("nocore-inventory:client:ShowId", function(character)
    local gender = "Мъж"
    if character.gender == 1 then
        gender = "Жена"
    end
    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message normal"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>ЕГН:</strong> {1} <br><strong>Име:</strong> {2} <br><strong>Фамилия:</strong> {3} <br><strong>Дата на раждане:</strong> {4} <br><strong>Пол:</strong> {5} <br><strong>Националност:</strong> {6}</div></div>',
        args = {'Лична карта', character.citizenid, character.firstname, character.lastname, character.birthdate, gender, character.nationality}
    })
end)

RegisterNetEvent("nocore-inventory:client:ShowDriverLicense")
AddEventHandler("nocore-inventory:client:ShowDriverLicense", function(character)
    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message normal"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Име:</strong> {1} <br><strong>Фамилия:</strong> {2} <br><strong>Дата на раждане:</strong> {3} <br><strong>Категории:</strong> {4}</div></div>',
        args = {'Шофьорска книжка', character.firstname, character.lastname, character.birthdate, character.type}
    })
end)

AddEventHandler('onResourceStop', function(name)
    if name == GetCurrentResourceName() and Config.UseItemDrop then
        for k, _ in pairs(DropsNear) do
            RemoveNearbyDrop(k)
        end
    end
end)