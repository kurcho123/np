RegisterNUICallback("getBank", function(data, cb)
  local balance = Phone.API.TriggerServerEvent('bank:get')
  cb(balance)
end)

RegisterNUICallback("transfer", function(data, cb)
  Phone.API.TriggerServerEvent('bank:transfer', data.id, tonumber(data.amt), data.accounttype)
  cb("OK")
end)