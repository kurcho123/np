Framework = exports['no-core']:GetCoreObject()
local DoingSomething = false
local currentVest = nil
local currentVestTexture = nil
local inFixGaragePoly = false
redbullshit = 0

CreateThread(function ()
    for k, v in pairs(Config.FixGarages) do
        if v.poly then
            local FixGarage = PolyZone:Create(v.coords, {
                name="FixGarage" ..k,
            })
            FixGarage:onPlayerInOut(function (isPointInside)
                inFixGaragePoly = isPointInside
            end)
        end
    end
end)

--[[
RegisterCommand("testprop", function(scr, args)
    exports['nocore-assets']:AddProp(args[1])
    Wait(5000)
    exports['nocore-assets']:RemoveProp()
end)
]]

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    TriggerServerEvent('nocore-items:updateJobType')
end)
-- Code

RegisterNetEvent('nocore-items:client:consumable')
AddEventHandler('nocore-items:client:consumable', function(ItemName, ItemSlot)
    local Consumable = Config.Consumables[ItemName]
    local ConsumableMetas = Consumable.Metas and type(Consumable.Metas) == "table" and next(Consumable.Metas) and Consumable.Metas or {}
    if Consumable.Drink and not ConsumableMetas["thirst"] then ConsumableMetas["thirst"] = math.random(25, 30) end
    if Consumable.Food and not ConsumableMetas["hunger"] then ConsumableMetas["hunger"] = math.random(25, 30) end
    local ProgressbarInfo = {
        Icon = Consumable.ProgressbarIcon or ItemName,
        Duration = Consumable.ProgressbarDuration or 5000,
        Label = Consumable.ProgressbarLabel or Consumable.Drink and "Пиеш.." or Consumable.Food and "Ядеш.." or "Използваш"
    }
    local ConsumableProp = Consumable.Prop or nil
    local ConsumableAnim = Consumable.Animation or Consumable.Drink and "coffee2" or Consumable.Food and "eat" or nil
    local ConsumableAnimDict = Consumable.AnimationDictionary or nil
    if ConsumableAnimDict then
        exports['nocore-assets']:RequestAnimationDict(ConsumableAnimDict)
        TaskPlayAnim(PlayerPedId(), ConsumableAnimDict, ConsumableAnim, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    elseif ConsumableAnim then
        TriggerEvent('dp:EmoteStart', {ConsumableAnim})
    end
    if ConsumableProp then
        exports['nocore-assets']:AddProp(ConsumableProp)
    end
    Framework.Functions.Progressbar("Consuming", ProgressbarInfo.Label, ProgressbarInfo.Duration, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function() -- Done
        Framework.Functions.TriggerCallback('nocore-items:server:remove:item', function(ItemRemoved)
            if ConsumableProp then
                exports['nocore-assets']:RemoveProp()
            end
            if ConsumableAnimDict then
                StopAnimTask(PlayerPedId(), ConsumableAnimDict, ConsumableAnim, 1.0)
            elseif ConsumableAnim then
                TriggerEvent('dp:EmoteCancel')
            end
            if ItemRemoved then
                if next(ConsumableMetas) then
                    local PlayerMeta = Framework.Functions.GetPlayerData().metadata
                    for k, v in pairs(ConsumableMetas) do
                        local newMeta = PlayerMeta[k] + v
                        TriggerServerEvent("Framework:Server:SetMetaData", k, newMeta)
                    end
                end
                TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items[ItemName], "remove")
                TriggerServerEvent('hud:server:RelieveStress', math.random(4, 5))
                if Consumable.Function and type(Consumable.Function) == "function" then
                    Consumable.Function()
                end
            end
        end, ItemName, 1, ItemSlot)
    end, function()
        if ConsumableProp then
            exports['nocore-assets']:RemoveProp()
        end
        if ConsumableAnimDict then
            StopAnimTask(PlayerPedId(), ConsumableAnimDict, ConsumableAnim, 1.0)
        elseif ConsumableAnim then
            TriggerEvent('dp:EmoteCancel')
        end
        Framework.Functions.Notify("Отменено..", "error")
    end, ProgressbarInfo.Icon)
end)


RegisterNetEvent('nocore-items:client:use:armor')
AddEventHandler('nocore-items:client:use:armor', function()
    if not exports['nocore-progressbar']:GetTaskBarStatus() then
        local CurrentArmor = GetPedArmour(PlayerPedId())
        if CurrentArmor <= 100 and CurrentArmor + 50 <= 100 then
            local NewArmor = CurrentArmor + 50
            if CurrentArmor + 33 >= 100 or CurrentArmor >= 100 then
                NewArmor = 100
            end
            LocalPlayer.state:set("inv_busy", true, true)
            Framework.Functions.Progressbar("vest", "Слагаш си бронЖилетка..", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
                    if HasItem then
                        SetPedArmour(PlayerPedId(), NewArmor)
                        LocalPlayer.state:set("inv_busy", false, true)
                        TriggerServerEvent('Framework:Server:RemoveItem', 'armor', 1)
                        TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['armor'], "remove")
                        TriggerServerEvent('hospital:saveStatus', GetEntityHealth(PlayerPedId()),
                            GetPedArmour(PlayerPedId()))
                        Framework.Functions.Notify("Успешно", "success")
                    else
                        LocalPlayer.state:set("inv_busy", false, true)
                        Framework.Functions.Notify("Отменено..", "error")
                    end
                end, 'armor')
            end, function()
                LocalPlayer.state:set("inv_busy", false, true)
                Framework.Functions.Notify("Отменено..", "error")
            end)
        else
            Framework.Functions.Notify("Вече имате жилетка.", "error")
        end
    end
end)

RegisterNetEvent("nocore-items:client:use:heavy")
AddEventHandler("nocore-items:client:use:heavy", function()
    if not exports['nocore-progressbar']:GetTaskBarStatus() then
        LocalPlayer.state:set("inv_busy", true, true)
        Framework.Functions.Progressbar("use_heavyarmor", "Слагаш си бронЖилетка..", 5000, false,
            true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
                    if HasItem then
                        LocalPlayer.state:set("inv_busy", false, true)
                        TriggerServerEvent('Framework:Server:RemoveItem', 'heavy-armor', 1)
                        TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['heavy-armor'], "remove")
                        SetPedArmour(PlayerPedId(), 100)
                        TriggerServerEvent('hospital:saveStatus', GetEntityHealth(PlayerPedId()),
                            GetPedArmour(PlayerPedId()))
                    else
                        LocalPlayer.state:set("inv_busy", false, true)
                        Framework.Functions.Notify("Отменено..", "error")
                    end
                end, 'heavy-armor')
            end, function() -- Cancel
                LocalPlayer.state:set("inv_busy", false, true)
                Framework.Functions.Notify("Отменено..", "error")
            end)
    end
end)

RegisterNetEvent("nocore-items:client:reset:armor")
AddEventHandler("nocore-items:client:reset:armor", function()
    if not exports['nocore-progressbar']:GetTaskBarStatus() then
        local ped = PlayerPedId()
        if currentVest ~= nil and currentVestTexture ~= nil then
            Framework.Functions.Progressbar("remove-armor", "Махаш бронЖилетка..", 2500, false, false,
                {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true
                }, {}, {}, {}, function() -- Done
                    SetPedComponentVariation(PlayerPedId(), 9, currentVest, currentVestTexture, 2)
                    SetPedArmour(PlayerPedId(), 0)
                    TriggerServerEvent('hospital:saveStatus', GetEntityHealth(PlayerPedId()),
                        GetPedArmour(PlayerPedId()))
                    currentVest, currentVestTexture = nil, nil
                end)
        else
            Framework.Functions.Notify("Не носиш жилетка..", "error")
        end
    end
end)


RegisterNetEvent("nocore-items:client:box")
AddEventHandler("nocore-items:client:box", function()
    if HaveBagOnHead == false then
    local playerPed = PlayerPedId()
    Bag = CreateObject(`v_serv_abox_04`, 0, 0, 0, true, true, true) -- Create head bag object!
    AttachEntityToEntity(Bag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844), 0.2, 0.04, 0, 0, 270.0, 300.0, true, true, false, true, 1, true) -- Attach object to head
    HaveBagOnHead = true
    elseif HaveBagOnHead then
        DeleteEntity(Bag)
        SetEntityAsNoLongerNeeded(Bag)
        HaveBagOnHead = false
    end
end)

RegisterNetEvent("nocore-items:client:oxygen_mask")
AddEventHandler("nocore-items:client:oxygen_mask", function()
    local playerPed = PlayerPedId()
    local isPedswim1 = IsPedDiving(playerPed)
    local isPedswim2 = IsPedSwimming(playerPed)
    local isPedswim3 = IsPedSwimmingUnderWater(playerPed)

    if isPedswim1 or isPedswim2 or isPedswim3 then
        Framework.Functions.Notify('Не може да си сложите маската във водата!!')
    else
        TriggerEvent('dp:EmoteStart', {"shakeoff"})
        Framework.Functions.Progressbar('cleaningkit', 'Екипиране на акваланг', math.random(6000, 7000), false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('Framework:Server:RemoveItem', 'oxygen_mask', 1)
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local boneIndex = GetPedBoneIndex(playerPed, 12844)
            local boneIndex2 = GetPedBoneIndex(playerPed, 24818)

            Framework.Functions.SpawnObject('p_s_scuba_mask_s', {
                x = coords.x,
                y = coords.y,
                z = coords.z - 3
            }, function(object)
                Framework.Functions.SpawnObject('p_s_scuba_tank_s', {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z - 3
                }, function(object2)
                    AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
                    AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
                    SetPedDiesInWater(playerPed, false)
                    SetEntityProofs(object, false, false, false, false, false, false, false, false)
                    SetEntityProofs(object2, false, false, false, false, false, false, false, false)
                    Citizen.Wait(200000) -- Because we trigger hud with 200000ms
                    SetPedDiesInWater(playerPed, true)
                    DeleteObject(object)
                    DeleteObject(object2)
                    ClearPedSecondaryTask(playerPed)
                end)
            end)
            TriggerEvent('dp:EmoteStart', {"c"})
            Framework.Functions.Notify("Вие си сложихте акваланг", "success")
        end, function() -- Cancel
            TriggerEvent('dp:EmoteStart', {"c"})
            Framework.Functions.Notify("Отказахте се", "error")
        end)
    end
end)

RegisterNetEvent('nocore-items:client:use:napkin')
AddEventHandler('nocore-items:client:use:napkin', function()
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()

    if DoesEntityExist(Vehicle) and Distance <= 4.0 then
        TriggerEvent('dp:EmoteStart', {"maid"})
        Framework.Functions.Progressbar('cleaningkit', 'Почистване', math.random(6000, 10000), false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true
        }, {}, {}, {}, function() -- Done

            TriggerServerEvent('Framework:Server:RemoveItem', 'napkin', 1)
            TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['napkin'], "remove")

            SetVehicleDirtLevel(Vehicle, 0)
            TriggerEvent('dp:EmoteStart', {"c"})
            Framework.Functions.Notify("МПС-то е почистено", "success")
        end, function() -- Cancel
            TriggerEvent('dp:EmoteStart', {"c"})
            Framework.Functions.Notify("Отказахте почистването", "success")
        end)

        LocalPlayer.state:set("inv_busy", false, true)
    else
        Framework.Functions.Notify("Няма МПС наблизо", "error")
    end
end)

RegisterNetEvent('nocore-items:client:thermite')
AddEventHandler('nocore-items:client:thermite', function()
    local PlayerCoords = GetEntityCoords(PlayerPedId())
        TriggerEvent('dp:EmoteStart', {"kneel2"})
        Framework.Functions.Progressbar('thermtie-charge', 'Използваш термит', math.random(3000, 6000), false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function() -- Done

            TriggerServerEvent('Framework:Server:RemoveItem', 'thermite-charge', 1)
            TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['thermite-charge'], "remove")

            TriggerEvent("buddy_bobcat:thermite")
            TriggerEvent('dp:EmoteStart', {"c"})
            Framework.Functions.Notify("Поставено", "success")
        end, function() -- Cancel
            TriggerEvent('dp:EmoteStart', {"c"})
            Framework.Functions.Notify("Отказахте Поставянето", "success")
        end)

        LocalPlayer.state:set("inv_busy", false, true)

end)

RegisterNetEvent('nocore-items:client:ecu')
AddEventHandler('nocore-items:client:ecu', function()
    local playerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(playerPed)
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
    local VehicleDoor = 4
    if IsPedInAnyVehicle(playerPed) then Framework.Functions.Notify("Трябва да сте извън колата.", "error") return end
    if not GetControlOfEntity(Vehicle) then Framework.Functions.Notify("Има някой в колата.", "error") return end
    local EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, 2.5, 0)
    if IsBackEngine(GetEntityModel(Vehicle)) then
        EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, -2.5, 0)
        VehicleDoor = 5
    end
    if #(PlayerCoords - EnginePos) > 4.0 then Framework.Functions.Notify("Няма МПС наоколо.", "error") return end
    SetVehicleDoorOpen(Vehicle, VehicleDoor, false, false)
    Citizen.Wait(450)
    Framework.Functions.Progressbar("repair_vehicle", "Ръчкаш..", math.random(10000, 20000), false, true, 
    {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16
    }, {}, {}, function() -- Done
        Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
            if HasItem then
                TriggerServerEvent('Framework:Server:RemoveItem', 'ecu', 1)
                TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['ecu'], "remove")
                SetVehicleDoorShut(Vehicle, VehicleDoor, false)
                StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                if GetDriftTyresEnabled(Vehicle) then
                    SetDriftTyresEnabled(Vehicle, false)
                    Framework.Functions.Notify("Разръчка! Drift mode: OFF")
                else
                    SetDriftTyresEnabled(Vehicle, true)
                    Framework.Functions.Notify("Разръчка! Drift mode: ON")
                end
            else
                StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                Framework.Functions.Notify("Не успя!", "error")
                SetVehicleDoorShut(Vehicle, VehicleDoor, false)
            end
        end, 'ecu')
    end, function() -- Cancel
        StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
        Framework.Functions.Notify("Не успя!", "error")
        SetVehicleDoorShut(Vehicle, VehicleDoor, false)
    end)
end)


RegisterNetEvent('nocore-items:client:use:fuel')
AddEventHandler('nocore-items:client:use:fuel', function()
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
    local Plate = GetVehicleNumberPlateText(Vehicle)
    local VehFuel = exports['nocore-fuel']:GetFuelLevel(Plate)

    if DoesEntityExist(Vehicle) and Distance <= 4.0 and not IsPedInAnyVehicle(PlayerPedId(), true) then
        exports['nocore-assets']:RequestAnimationDict("weapon@w_sp_jerrycan")
        TaskPlayAnim(PlayerPedId(), "weapon@w_sp_jerrycan", "fire", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
        Framework.Functions.Progressbar('cleaningkit', 'Зареждате мпс..', math.random(15000, 20000), false,
            true, {
                disableMovement = false,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true
            }, {}, {}, {}, function() -- Done
                TriggerServerEvent('Framework:Server:RemoveItem', 'fuel', 1)
                TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['fuel'], "remove")
                if(VehFuel + 40 >= 100) then
                    exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), 100, false)
                else
                    exports['nocore-fuel']:SetFuelLevel(Vehicle, GetVehicleNumberPlateText(Vehicle), VehFuel + 40, false)
                end
                StopAnimTask(PlayerPedId(), "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                Framework.Functions.Notify("МПС-то е заредено", "success")
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                Framework.Functions.Notify("Отказахте презареждането", "success")
            end)

        LocalPlayer.state:set("inv_busy", false, true)
    else
        Framework.Functions.Notify("Няма МПС наблизо", "error")
    end
end)

RegisterNetEvent('nocore-items:client:use:repairkit')
AddEventHandler('nocore-items:client:use:repairkit', function(plus)
    local playerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(playerPed)
    local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
    local VehicleEngineHealth = GetVehicleEngineHealth(Vehicle)
    local VehicleDoor = 4
    local item = "repairkit"
    if IsPedInAnyVehicle(playerPed) then Framework.Functions.Notify("Трябва да сте извън колата.", "error") return end
    if not GetControlOfEntity(Vehicle) then Framework.Functions.Notify("Има някой в колата.", "error") return end
    if VehicleEngineHealth >= 1000.0 then Framework.Functions.Notify("Колата е здрава.", "error") return end
    local NewHealth = VehicleEngineHealth + 250.0
    if plus or VehicleEngineHealth + 250.0 > 1000.0 then  NewHealth = 1000.0 end
    if plus and not (NearFixGarage() or inFixGaragePoly) then Framework.Functions.Notify("Не сте в сервиз.", "error") return end
    if plus then item = "advanced_repairkit" end
    local EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, 2.5, 0)
    if IsBackEngine(GetEntityModel(Vehicle)) then
        EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, -2.5, 0)
        VehicleDoor = 5
    end
    if #(PlayerCoords - EnginePos) > 4.0 then Framework.Functions.Notify("Няма МПС наоколо.", "error") return end
    SetVehicleDoorOpen(Vehicle, VehicleDoor, false, false)
    Citizen.Wait(450)
    LocalPlayer.state:set("inv_busy", true, true)
    Framework.Functions.Progressbar("repair_vehicle", "Поправяш..", math.random(10000, 20000), false, true, 
    {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16
    }, {}, {}, function() -- Done
        Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
            if HasItem then
                if math.random(1, 50) < 29 then
                    TriggerServerEvent('Framework:Server:RemoveItem', item, 1)
                    TriggerEvent("nocore-inventory:client:ItemBox",
                        Framework.Shared.Items[item], "remove")
                end
                LocalPlayer.state:set("inv_busy", false, true)
                SetVehicleDoorShut(Vehicle, VehicleDoor, false)
                StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                Framework.Functions.Notify("Поправено!")
                SetVehicleFixed(Vehicle)
                SetVehicleEngineHealth(Vehicle, NewHealth)
                for i = 1, 6 do
                    SetVehicleTyreFixed(Vehicle, i)
                end
            else
                LocalPlayer.state:set("inv_busy", false, true)
                StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                Framework.Functions.Notify("Не успя!", "error")
                SetVehicleDoorShut(Vehicle, VehicleDoor, false)
            end
        end, item)
    end, function() -- Cancel
        LocalPlayer.state:set("inv_busy", false, true)
        StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
        Framework.Functions.Notify("Не успя!", "error")
        SetVehicleDoorShut(Vehicle, VehicleDoor, false)
    end, item)
end)

RegisterNetEvent('nocore-items:client:use:advanced_repairkit')
AddEventHandler('nocore-items:client:use:advanced_repairkit', function()
    if not exports['nocore-progressbar']:GetTaskBarStatus() and (NearFixGarage() or inFixGaragePoly) then
        local playerPed = PlayerPedId()
        local PlayerCoords = GetEntityCoords(playerPed)
        local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
        if GetVehicleEngineHealth(Vehicle) < 1001.0 then
            if Distance < 4.0 and not IsPedInAnyVehicle(playerPed) then
                local EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, 2.5, 0)
                if IsBackEngine(GetEntityModel(Vehicle)) then
                    EnginePos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, -2.5, 0)
                end
                if #(PlayerCoords - EnginePos) < 4.0 then
                    local VehicleDoor = nil
                    if IsBackEngine(GetEntityModel(Vehicle)) then
                        VehicleDoor = 5
                    else
                        VehicleDoor = 4
                    end
                    SetVehicleDoorOpen(Vehicle, VehicleDoor, false, false)
                    Citizen.Wait(450)
                    LocalPlayer.state:set("inv_busy", true, true)
                    Framework.Functions.Progressbar("repair_vehicle", "Поправяш..", math.random(10000, 20000),
                        false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                            disableInventory = true,
                        }, {
                            animDict = "mini@repair",
                            anim = "fixing_a_player",
                            flags = 16
                        }, {}, {}, function() -- Done
                        Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
                            if HasItem then
                                if math.random(1, 50) < 10 then
                                    TriggerServerEvent('Framework:Server:RemoveItem', 'advanced_repairkit', 1)
                                    TriggerEvent("nocore-inventory:client:ItemBox",
                                        Framework.Shared.Items['advanced_repairkit'], "remove")
                                end
                                LocalPlayer.state:set("inv_busy", false, true)
                                SetVehicleDoorShut(Vehicle, VehicleDoor, false)
                                StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                                Framework.Functions.Notify("Поправено!")
                                SetVehicleFixed(Vehicle)
                                for i = 1, 6 do
                                    SetVehicleTyreFixed(Vehicle, i)
                                end
                            else
                                LocalPlayer.state:set("inv_busy", false, true)
                                StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                                Framework.Functions.Notify("Не успя!", "error")
                                SetVehicleDoorShut(Vehicle, VehicleDoor, false)
                            end
                        end, 'advanced_repairkit')
                    end, function() -- Cancel
                        LocalPlayer.state:set("inv_busy", false, true)
                        StopAnimTask(playerPed, "mini@repair", "fixing_a_player", 1.0)
                        Framework.Functions.Notify("Не успя!", "error")
                        SetVehicleDoorShut(Vehicle, VehicleDoor, false)
                    end)
                end
            else
                Framework.Functions.Notify("Няма МПС на близо.", "error")
            end
        end
    end
end)

RegisterNetEvent('nocore-items:client:dobbel')
AddEventHandler('nocore-items:client:dobbel', function(Amount, Sides)
    local DiceResult = {}
    for i = 1, Amount do
        table.insert(DiceResult, math.random(1, Sides))
    end
    local RollText = CreateRollText(DiceResult, Sides)
    TriggerEvent('nocore-items:client:dice:anim')
    Citizen.SetTimeout(1900, function()
        TriggerServerEvent('nocore-sound:server:play:distance', 2.0, 'dice', 0.5)
        TriggerServerEvent('nocore-assets:server:display:text', RollText)
    end)
end)

RegisterNetEvent('nocore-items:client:coinflip')
AddEventHandler('nocore-items:client:coinflip', function()
    local CoinFlip = {}
    local Random = math.random(1, 2)
    if Random <= 1 then
        CoinFlip = 'Стотинка: ~g~Ези'
    else
        CoinFlip = 'Стотинка: ~y~Тура'
    end
    TriggerEvent('nocore-items:client:dice:anim')
    Citizen.SetTimeout(1900, function()
        TriggerServerEvent('nocore-sound:server:play:distance', 2.0, 'coin', 0.5)
        TriggerServerEvent('nocore-assets:server:display:text', CoinFlip)
    end)
end)

RegisterNetEvent('nocore-items:client:dice:anim')
AddEventHandler('nocore-items:client:dice:anim', function()
    exports['nocore-assets']:RequestAnimationDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(PlayerPedId(), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1500)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('nocore-items:client:use:duffel-bag')
AddEventHandler('nocore-items:client:use:duffel-bag', function(BagId)
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", 'tas_' .. BagId, {
        maxweight = 25000,
        slots = 3
    })
    TriggerEvent("nocore-inventory:client:SetCurrentStash", 'tas_' .. BagId)
end)

RegisterNetEvent("nocore-items:client:GetStopSign")
AddEventHandler("stopsign:client:GetStopSign", function()
    local coords = GetEntityCoords(PlayerPedId())
    local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, -949234773, false, false, false)
    SetEntityAsMissionEntity(obj, true, true)
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Framework.Functions.Progressbar("robbing_sign", "Stealing Stop Sign..", math.random(5000, 7000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, function()
    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@base", "base", 1.0)
        TriggerServerEvent("stopsign:server:additem")
        DeleteEntity(obj)
    end)
end)

RegisterNetEvent("nocore-items:spawnchair2")
AddEventHandler("nocore-items:spawnchair2", function()
    pladchair()
end)

RegisterNetEvent("nocore-items:spawnchair1")
AddEventHandler("nocore-items:spawnchair1", function()
    greenchair()
end)

RegisterNetEvent("nocore-items:spawnchair3")
AddEventHandler("nocore-items:spawnchair3", function()
    purplechair()
end)

RegisterNetEvent("nocore-items:client:UseStopsign")
AddEventHandler("nocore-items:client:UseStopsign", function()
    TriggerEvent('dp:EmoteStart', {"stopsign"})
end)

RegisterNetEvent('nocore-items:client:useparachute')
AddEventHandler('nocore-items:client:useparachute',function()
    if not HasPedGotWeapon(PlayerPedId(), `GADGET_PARACHUTE`, false) then
        TriggerEvent('dp:EmoteStart', {"shakeoff"})
            Framework.Functions.Progressbar('cleaningkit', 'Екипиране на парашут', math.random(4000, 6000), false, true, {
                disableMovement = false,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function() -- Done
                GiveWeaponToPed(PlayerPedId(), `GADGET_PARACHUTE`, 150, true, true)
                SetPedComponentVariation(PlayerPedId(), 5, 3, 0, 0)
                TriggerServerEvent('Framework:Server:RemoveItem', 'parachute', 1)
                TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['parachute'], "remove")
                UseParachute()
                TriggerEvent('dp:EmoteStart', {"c"})
                Framework.Functions.Notify("Вие си сложихте парашут", "success")
            end, function() -- Cancel
                TriggerEvent('dp:EmoteStart', {"c"})
                Framework.Functions.Notify("Отказахте се", "error")
            end)
    else
        Framework.Functions.Notify("Вече имаш парашут..", "error")
    end
end)

function UseParachute()
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            if GetPedParachuteState(ped) == 2 then
                OpenParachute()
                return
            end
        end
    end)
end

local lendingcw = {
    [0] = 2000,
    [1] = 2000,
    [2] = 2000,
    [3] = 2000,
}

function OpenParachute()
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            local lending = GetPedParachuteLandingType(ped) 
            if lending == 3 or lending == 2 or lending == 1 or lending == 0 then
                PadnaParachute()
                return
            end
            
        end
    end)
end

function PadnaParachute()
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(200)
            local IsPedOnFoot = IsPedOnFoot(ped) 
            local IsPedRagdoll = IsPedRagdoll(ped) 
            if IsPedOnFoot and not IsPedRagdoll then
                Citizen.Wait(4000)
                RemoveWeaponFromPed(ped, `GADGET_PARACHUTE`)
                SetPedComponentVariation(ped, 5, 0, 0, 1)
                return
            end
        end
    end)
end

--  // Functions \\ --

function loadAnimDict(dict)
    while(not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function NearFixGarage()
    for k, v in pairs(Config.FixGarages) do
        if not v.poly then
            local Distance = #(GetEntityCoords(PlayerPedId()) - v.coords)
            local checkDistance = v.checkDistance or 10
            if Distance < checkDistance then
                return true
            end
        end
    end
    return false
end

function IsBackEngine(Vehicle)
    for _, model in pairs(Config.BackEngineVehicles) do
        if joaat(model) == Vehicle then
            return true
        end
    end
    return false
end

function CreateRollText(rollTable, sides)
    local s = "~g~Зарове~s~: "
    local total = 0
    for k, roll in pairs(rollTable, sides) do
        total = total + roll
        if k == 1 then
            s = s .. roll .. "/" .. sides
        else
            s = s .. " | " .. roll .. "/" .. sides
        end
    end
    s = s .. " | (Total: ~g~" .. total .. "~s~)"
    return s
end


attachedProp = 0

function attachAProp(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
	removeAttachedProp()
	attachModel = joaat(attachModelSent)
	boneNumber = boneNumberSent 
	local bone = GetPedBoneIndex(PlayerPedId(), boneNumberSent)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Citizen.Wait(100)
	end
	attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
	AttachEntityToEntity(attachedProp, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(attachModel)
end

function removeAttachedProp()
	DeleteEntity(attachedProp)
	attachedProp = 0
end

function loadModel(modelName)
    RequestModel(joaat(modelName))
    while not HasModelLoaded(joaat(modelName)) do
        RequestModel(joaat(modelName))
        Citizen.Wait(1)
    end
end
 
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function greenchair()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if not haschairalready then
            haschairalready = true
        local coords = GetEntityCoords(PlayerPedId())
        local animDict = "timetable@ron@ig_3_couch"
        local animation = "base"
    --	SetEntityCoords(PlayerPedId(),coords.x,coords.y,coords.z - 0.68) -- Temporary Freezing Entity for proper placement of chair (Not Required)
    --	FreezeEntityPosition(PlayerPedId(),true) -- Entity Froze (Secondary Check)
        attachAProp("prop_skid_chair_01", 0, 0, 0.0, -0.22, 3.4, 0.4, 180.0, 0.0, false, false, false, false, 2, true)
        loadAnimDict(animDict)
        local animLength = GetAnimDuration(animDict, animation)
        TaskPlayAnim(PlayerPedId(), animDict, animation, 1.0, 4.0, animLength, 1, 0, 0, 0, 0)
        else
            haschairalready = false
            FreezeEntityPosition(PlayerPedId(),false)
            removeAttachedProp()
            ClearPedTasks(PlayerPedId())
        end
    end
end

function pladchair()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if not haschairalready then
            haschairalready = true
        local coords = GetEntityCoords(PlayerPedId())
        local animDict = "timetable@ron@ig_3_couch"
        local animation = "base"
    --	SetEntityCoords(PlayerPedId(),coords.x,coords.y,coords.z - 0.68) -- Temporary Freezing Entity for proper placement of chair (Not Required)
    --	FreezeEntityPosition(PlayerPedId(),true) -- Entity Froze (Secondary Check)
        attachAProp("hei_prop_hei_skid_chair", 0, 0, 0.0, -0.22, 3.4, 0.4, 180.0, 0.0, false, false, false, false, 2, true)
        loadAnimDict(animDict)
        local animLength = GetAnimDuration(animDict, animation)
        TaskPlayAnim(PlayerPedId(), animDict, animation, 1.0, 4.0, animLength, 1, 0, 0, 0, 0)
        else
            haschairalready = false
            FreezeEntityPosition(PlayerPedId(),false)
            removeAttachedProp()
            ClearPedTasks(PlayerPedId())
        end
    end
end

function purplechair()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if not haschairalready then
            haschairalready = true
        local coords = GetEntityCoords(PlayerPedId())
        local animDict = "timetable@ron@ig_3_couch"
        local animation = "base"
    --	SetEntityCoords(PlayerPedId(),coords.x,coords.y,coords.z - 0.68) -- Temporary Freezing Entity for proper placement of chair (Not Required)
    --	FreezeEntityPosition(PlayerPedId(),true) -- Entity Froze (Secondary Check)
        attachAProp("prop_skid_chair_02", 0, 0, 0.0, -0.22, 3.4, 0.4, 180.0, 0.0, false, false, false, false, 2, true)
        loadAnimDict(animDict)
        local animLength = GetAnimDuration(animDict, animation)
        TaskPlayAnim(PlayerPedId(), animDict, animation, 1.0, 4.0, animLength, 1, 0, 0, 0, 0)
        else
            haschairalready = false
            FreezeEntityPosition(PlayerPedId(),false)
            removeAttachedProp()
            ClearPedTasks(PlayerPedId())
        end
    end
end

RegisterCommand('clearprop', function()
	FreezeEntityPosition(PlayerPedId(),false)
	removeAttachedProp()
end)

local LaptopSlot = nil
local laptop = nil

RegisterNetEvent("nocore-items:client:use:gaming-laptop")
AddEventHandler("nocore-items:client:use:gaming-laptop", function(laptopslot)
    LaptopSlot = laptopslot
    if not IsPedInAnyVehicle(PlayerPedId(), true) then
        TriggerEvent('dp:EmoteStart', {"meditate"})
        Wait(150)
        TriggerEvent('dp:EmoteStart', {"type"})
        local coords = GetEntityCoords(PlayerPedId())
        local forward = GetEntityForwardVector(PlayerPedId())
        local x, y, z = table.unpack(coords + forward * 0.65)
        laptop = CreateObject(`h4_prop_h4_laptop_01a`, x, y, z, true, true, false)
        SetEntityHeading(laptop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(laptop)
    end
    TriggerEvent("OpenLaptop:JS")
    Citizen.Wait(1000)
    TriggerEvent('dp:EmoteStart', {"type"})
end)

RegisterNetEvent("nocore-items:client:close:gaming-laptop")
AddEventHandler("nocore-items:client:close:gaming-laptop", function()
    if laptop ~= nil then
        TriggerEvent('dp:EmoteStart', {"c"})
        DeleteEntity(laptop)
        laptop = nil
    end
end)

RegisterNetEvent("nocore-items:client:damage:gaming-laptop")
AddEventHandler("nocore-items:client:damage:gaming-laptop", function(damage)
    if LaptopSlot ~= nil then
        TriggerServerEvent("nocore-items:server:damage:laptop", LaptopSlot, damage)
    end
end)

RegisterNetEvent("nocore-items:client:cash:rubberband")
AddEventHandler("nocore-items:client:cash:rubberband", function(Slot)
    Framework.Functions.Progressbar('rubberband', 'Правите пачка', 5000, false, true, {
     disableMovement = false,
     disableCarMovement = true,
     disableMouse = false,
     disableCombat = true,
     disableInventory = true,
    }, {}, {}, {}, function() -- Done
        Framework.Functions.TriggerCallback('nocore-items:server:cash:rubberband', function(cb)
            if cb then
                LocalPlayer.state:set("inv_busy", false, true)
                Framework.Functions.Notify("alolo..", "success")
            else
                LocalPlayer.state:set("inv_busy", false, true)
                Framework.Functions.Notify("Отменено..", "error")
            end
        end, Slot)
    end, function() -- Cancel
        LocalPlayer.state:set("inv_busy", false, true)
        Framework.Functions.Notify("Отменено..", "error")
    end)
end)

RegisterNetEvent("nocore-items:client:cash:money-stack")
AddEventHandler("nocore-items:client:cash:money-stack", function(Slot)
    Framework.Functions.Progressbar('money-stack', 'Разваляте пачка', 5000, false, true, {
     disableMovement = false,
     disableCarMovement = true,
     disableMouse = false,
     disableCombat = true,
     disableInventory = true,
    }, {}, {}, {}, function() -- Done
        Framework.Functions.TriggerCallback('nocore-items:server:cash:money-stack', function(cb)
            if cb then
                LocalPlayer.state:set("inv_busy", false, true)
                Framework.Functions.Notify("alolo..", "success")
            else
                LocalPlayer.state:set("inv_busy", false, true)
                Framework.Functions.Notify("Отменено..", "error")
            end
        end, Slot)
    end, function() -- Cancel
        LocalPlayer.state:set("inv_busy", false, true)
        Framework.Functions.Notify("Отменено..", "error")
    end)
end)

RegisterNetEvent("nocore-items:client:fell")
AddEventHandler("nocore-items:client:fell", function()
    FellOver()
end)

function GetControlOfEntity(entity)
    NetworkRequestControlOfEntity(entity)
    return NetworkHasControlOfEntity(entity)
end

function FellOver()
    local ped = PlayerPedId()
    local IsInVehicle = IsPedInAnyVehicle(ped, false)
    if IsInVehicle then
        local veh = GetVehiclePedIsIn(ped, false)
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
        TriggerEvent('animations:client:WalkCommandStart', {"drunk3"})
        Citizen.Wait(800)
        ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.6)
        Citizen.Wait(500)
        TaskVehicleTempAction(ped, veh, math.random(10,11), 500) -- 7 - turn left a bit, 8 - turn right a bit
		Citizen.Wait(500)
        Framework.Functions.Notify("Не се чувствате добре.")
        Citizen.Wait(3000)
        Framework.Functions.Notify("Вие ви се свят..")
        Citizen.Wait(1000)
        TaskVehicleTempAction(ped, veh, math.random(10,11), 500) -- 7 - turn left a bit, 8 - turn right a bit
        Citizen.Wait(5000)
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
        ClearTimecycleModifier()
        StopScreenEffect('DeathFailOut')
    else
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
        TriggerEvent('animations:client:WalkCommandStart', {"drunk3"})
        Wait(800)
        ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.6)
        Wait(500)
        Framework.Functions.Notify("Не се чувствате добре.")
        Wait(3000)
        Framework.Functions.Notify("Вие ви се свят..")
        Wait(1000)
        exports['nocore-assets']:RequestAnimationDict("random@drunk_driver_1")
        TaskPlayAnim(ped, 'random@drunk_driver_1', 'drunk_fall_over', 1.0, -1.0, 5000, 0, 1, false, false, false)

        Wait(5000)
        Framework.Functions.Notify("Припаднахте!")
        DoScreenFadeOut(100)
        SetPedToRagdoll(ped, 40000, 40000, 0, 0, 0, 0)
        StartScreenEffect('DeathFailOut', 0, true)
        SetTimecycleModifier("hud_def_blur")
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        Wait(1000)
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
        DoScreenFadeIn(1000)
        Wait(38000)

        DoScreenFadeOut(100)
        Wait(750)
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.5)
        TriggerEvent('animations:client:WalkCommandStart', {"reset"})
        ClearTimecycleModifier()
        StopScreenEffect('DeathFailOut')
        DoScreenFadeIn(1000)
    end
end

RegisterNetEvent('rockstarEditor', function()
    exports['nocore-context']:openMenu({
        {
            id = 1,
            header = "Дрон Меню",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Започни Запис",
            txt = "",
            params = {
                event = "rockstarEditor:Options",
                args = {
                    func = 'start',
                }
            }
        },
        {
            id = 3,
            header = "Спри запис",
            txt = "",
            params = {
                event = "rockstarEditor:Options",
                args = {
                    func = 'stop',
                }
            }
        },
        {
            id = 4,
            header = "Спри и Запази",
            txt = "",
            params = {
                event = "rockstarEditor:Options",
                args = {
                    func = 'save',
                }
            }
        },
    })
end)

AddEventHandler('rockstarEditor:Options', function(data)
    if data.func == 'start' then
        StartRecording(1)
    elseif data.func == 'stop' then
        StopRecordingAndDiscardClip()
    elseif data.func == 'save' then
        StopRecordingAndSaveClip()
    end
end)
