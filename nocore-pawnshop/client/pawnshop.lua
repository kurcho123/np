local CheckingPress = false
Citizen.CreateThread(function()
    local PawnShop = BoxZone:Create(vector3(450.02, -801.64, 27.49), 4.0, 3.0, {
        name="pawnshop",
        heading=0.0,
        debugPoly=false,
        minZ=27.49 - 4,
        maxZ=27.49 + 4
    })

    PawnShop:onPlayerInOut(function(isPointInside)
        if isPointInside then
            if GetClockHours() >= 6 and GetClockHours() <= 18 then
                exports['okokTextUI']:Open('<b>[E] Продай</b>', 'purple', 'right')
                CheckForEPressPawnShop()
            else
                exports['okokTextUI']:Open('<b>Затворено</b>', 'darkred', 'right')
            end
        else
            exports['okokTextUI']:Close()
            CheckingPress = false
        end
    end)
end)
function CheckForEPressPawnShop()
    CheckingPress = true
    Citizen.CreateThread(function()
        while CheckingPress do
            Citizen.Wait(1)
            if IsControlJustReleased(0, 38) then
                exports['okokTextUI']:Close()
                SellGoldItems()
                CheckingPress = false
                return
            end
        end
    end)
end

function SellGoldItems()
    Framework.Functions.TriggerCallback('nocore-pawnshop:server:has:gold', function(HasGold)
        if HasGold then
         Framework.Functions.Progressbar("sell-gold", "Продаваш...", math.random(5000, 7000), false, true, {
             disableMovement = true,
             disableCarMovement = true,
             disableMouse = false,
             disableCombat = true,
             disableInventory = true,
         }, {}, {}, {}, function() -- Done
             TriggerServerEvent('nocore-pawnshop:server:sell:gold:items')
             StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
         end, function() -- Cancel
             StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
             Framework.Functions.Notify("Прекратено", "error")
         end)
        else
            Framework.Functions.Notify("Нямаш нищо за продаване", "error")
        end
    end)
end