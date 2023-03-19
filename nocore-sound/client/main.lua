RegisterNetEvent('nocore-sound:client:play')
AddEventHandler('nocore-sound:client:play', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterCommand('miami',function()
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = "miami",
        transactionVolume   = 0.5
    })
end)