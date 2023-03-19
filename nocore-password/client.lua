RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenVaultGame(callback, lenght, time)
  Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({type = "open", lenght = lenght, time = time})
end