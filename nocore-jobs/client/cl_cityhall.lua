local Framework = exports['no-core']:GetCoreObject()
local IdTypes = {
  ["id-card"] = {
      label = "Лична Карта",
      item = "id-card"
  },
  ["Weapon"] = {
      label = "Лиценз за оръжие",
      item = "drive-card"
  },
  ["Drivers"] = {
      label = "Шофьорска Книжка",
      item = "drive-card"
  },
  ["Fishing"] = {
      label = "Лиценз за риболов",
      item = "drive-card"
  },
  ["Bar"] = {
      label = "Лиценз за бар",
      item = "drive-card"
  },
  ["Pilot"] = {
      label = "Пилотски лиценз",
      item = "drive-card"
  },
}
function changeJob(id)
  Framework.Functions.TriggerCallback('nocore-cityhall:server:ApplyJob', function(func)
  end, id)
  Framework.Functions.Notify("Честито, бяхте назначен на работа!", "info", 5000, "Община")
end

RegisterNUICallback('escape', function(data, cb)
  SetNuiFocus(false, false)
  SendNUIMessage({ show = false })
  cb(true)
end)

RegisterNUICallback('newJob', function(data, cb)
  SetNuiFocus(false, false)
  SendNUIMessage({ show = false })
  changeJob(data.job)
  cb(true)
end)

AddEventHandler('nocore-cityhall:client:open:nui', function()
  Citizen.SetTimeout(350, function()
    Framework.Functions.TriggerCallback("nocore-cityhall:server:getjob", function(job)
      SetNuiFocus(true, true)
      SendNUIMessage({ show = true, job = job })
    end)
  end)
end)

AddEventHandler('nocore-cityhall:client:dokumenti', function()
  local PlayerData = Framework.Functions.GetPlayerData()
  local licensesMeta = PlayerData.metadata["licences"]
  local sendMenu = {}
  sendMenu[#sendMenu+1] = {
      id = 1,
      header = "Документи",
      icon = 'fas fa-folder-open',
      isMenuHeader=true
  }
  sendMenu[#sendMenu+1] = {
    id = #sendMenu+1,
    header = "Лична карта",
    txt = "Вземи си Лична Карта за 50$",
    icon = 'fas fa-id-card',
    params = { 
        event = "requestId",
        args = {
          idType = "id-card"
        }}
      }
  for type,_ in pairs(licensesMeta) do
    if licensesMeta[type] then
        sendMenu[#sendMenu+1] = {
          id = #sendMenu+1,
          header = IdTypes[type].label,
          txt = "Вземи си " ..IdTypes[type].label.. " за 50$",
          icon = 'fas fa-id-card',
          params = { 
              event = "requestId",
              args = {
                idType = type
              }}
          }
      end
  end
  sendMenu[#sendMenu+1] = {
      id = #sendMenu+1,
      header = "Затвори",
      txt = "",
      icon = 'fas fa-xmark',
      params = { 
          event = "fakeevnettt",
          args = {}
      }
  }
    exports['nocore-context']:openMenu(sendMenu)
end)

AddEventHandler('requestId', function(data)
  local idType = data.idType
  TriggerServerEvent('nocore-cityhall:server:requestId', IdTypes[idType])
end)