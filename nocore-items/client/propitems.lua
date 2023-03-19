local HasItem, AddedProp = false, false
local PropItems = {
    ['stolen-micro'] = {
        Prop = 'StolenMicro'
    },
    ['stolen-tv'] = {
        Prop = 'StolenTv'
    },
    ['duffel-bag'] = {
        Prop = 'Duffel' 
    },
    ['stolen-pc'] = {
        Prop = 'StolenPc'
    },
    ['stolen-ps5'] = {
        Prop = 'PS5'
    },
    ['box'] = {
        Prop = 'Box'
    }
}

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        SpawnProps()
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    SetTimeout(1250, function()
        SpawnProps()
        Wait(350)
    end)
end)
-- Code

RegisterNetEvent('nocore-inventory:OnItemAdd')
AddEventHandler('nocore-inventory:OnItemAdd', function(ItemName, Amount)
    for k, v in pairs(PropItems) do
        if ItemName == k then
            if not AddedProp then
                AddedProp = true
                AddPropToHands(v.Prop)
            end
        end
    end
end)

RegisterNetEvent('nocore-inventory:OnItemRemove')
AddEventHandler('nocore-inventory:OnItemRemove', function(ItemName, Amount, HaveLeftSome)
    for k, v in pairs(PropItems) do
        if ItemName == k and not HaveLeftSome then
            if AddedProp then
                AddedProp = false
                RemovePropFromHands()
            end
        end
    end
end)

-- // Functions \\ --

function SpawnProps()
    for k, v in pairs(PropItems) do
        Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
            if HasItem then
                if not AddedProp then
                    AddedProp = true
                    AddPropToHands(v.Prop)
                end
            end
        end, k)
        Wait(1000)
    end
end

function AddPropToHands(PropName)
    HasItem = true
    exports['nocore-assets']:AddProp(PropName)
    if PropName ~= 'Duffel' then
        exports['nocore-assets']:RequestAnimationDict("anim@heists@box_carry@")
        TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
        DisableContorlsAndStartAnimationCheckLoop()
    end
end


function DisableContorlsAndStartAnimationCheckLoop()
    CreateThread(function()
        SetPedConfigFlag(PlayerPedId(), 146, true)
        while HasItem do
            Wait(1)
            DisableControlAction(2, 22, true)
            DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing
            DisableControlAction(0, 24, true) -- disable attack
            DisableControlAction(0, 25, true) -- disable aim
            DisableControlAction(1, 37, true) -- disable weapon select
            DisableControlAction(0, 47, true) -- disable weapon
            DisableControlAction(0, 58, true) -- disable weapon
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 142, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
        end
        SetPedConfigFlag(PlayerPedId(), 146, false)
    end)
    CreateThread(function()
        while HasItem do
            Wait(4)
            print(IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3))
            if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3) then
                exports['nocore-assets']:RequestAnimationDict("anim@heists@box_carry@")
                TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
            else
                Wait(100)
            end
        end
    end)
end

function RemovePropFromHands()
    HasItem = false
    exports['nocore-assets']:RemoveProp()
    StopAnimTask(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 1.0)
end