function OpenPhone()
    SendNUIMessage({
        action = "openPhone"
    })
end

function ClosePhone()
    SendNUIMessage({
        action = 'closePhone'
    })
end

RegisterNetEvent('nocore-tilifon:client:start')
AddEventHandler('nocore-tilifon:client:start', function()
    TriggerServerEvent('Framework:Server:RemoveItem', 'burner-phone', 1)
    local number = 1
    if Config.Numbers[number] then
        LocalPlayer.state:set("inv_busy", true, true)
        exports['nocore-assets']:RequestAnimationDict("cellphone@")
        TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0, 3.0, -1, 50, 0, false, false, false)
        OpenPhone()
        Wait(500)
        TriggerEvent('nocore-sound:client:play', 'noconnection', 0.6)
        Wait(17500)
        ClosePhone()
        ClearPedTasks(PlayerPedId())
        LocalPlayer.state:set("inv_busy", false, true)
        if Config.Numbers[number].evt == "server" then
            TriggerServerEvent(Config.Numbers[number].ev)
        else
            TriggerEvent(Config.Numbers[number].ev)
        end
        TriggerServerEvent('nocore-tilifon:server:email', number)
    else
        return
    end
end)