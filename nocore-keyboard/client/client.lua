local p = nil

RegisterNUICallback('dataPost', function(data, cb)
  SetNuiFocus(false)
  p:resolve(data)
  p = nil
  cb({})
end)

RegisterNUICallback("cancel", function(_, cb)
  SetNuiFocus(false)
  p:resolve(nil)
  p = nil
  cb({})
end)

function KeyboardInput(data)
  Wait(150)
  if not data then return end
  if p then return end
  
  p = promise.new()

  SetNuiFocus(true, true)

  for i=1, #data do 
    data[i]['value'] = ""
  end

  SendReactMessage("OPEN_MENU", data)

  return Citizen.Await(p)
end

exports("KeyboardInput", KeyboardInput)