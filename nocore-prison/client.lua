Framework = exports['no-core']:GetCoreObject()

local pedSpawned = false
local prisonPed
local curWorking = false
local jobTasks = 0
local curJob = nil
local ball
local isPlaying = false
local hasBall = false
local ballObj
local ballID = 0
local ballBasket
local isPlayingBasket = false
local hasBasketBall = false
local ballBasketObj
local ballBasketID = 0
local garbagebag
local searched = {}
local trashCan
local JailTime = 0
local InJail = false
local AlertSended = false
local isLoggedIn = false

local Cop = nil
local Scaleform = nil
local Handle = nil
local MugshotBoard = nil
local MugshotOverlay = nil
local IsGoingToPhoto = false


RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
     isLoggedIn = true
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    InJail = false
    JailTime = 0
    isLoggedIn = false
end)

RegisterNetEvent('nocore-prison:client:set:in:jail')
AddEventHandler('nocore-prison:client:set:in:jail', function(Name, Months, CitizenId, Date)
    JailIntro(Name, Months, CitizenId, Date)
end)

function LoadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Citizen.Wait(10)
  end
end

function JobDone()
  if math.random(5, 100) <= 35 then
      Framework.Functions.Notify("Присъдата Ви беше намалена..")
      JailTime = JailTime - math.random(1, 2)
  end
end

function addToSet(set, key)
  set[key] = true
end

function tableHasKey(table,key)
  return table[key] ~= nil
end

function JailIntro(Name, Months, CitizenId, Date)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
      Citizen.Wait(100)
    end
    TriggerEvent('nocore-inventory:client:DisableInventory', true)
    InJail = true
    JailTime = Months
    local ped = PlayerPedId()
    SetEntityCoords(ped, vector3(1844.21, 2594.36, 45.02))
    SetEntityHeading(ped, 91.66)
    TriggerEvent('nocore-sound:client:play', 'handcuff', 0.4)
    FreezeEntityPosition(ped, true)
    IsGoingToPhoto = true
    AddMugshot(Name, Months, CitizenId, Date)
    TriggerServerEvent("prison:server:SetJailStatus", JailTime)
	TriggerServerEvent("prison:server:SaveJailItems", JailTime)
    DoScreenFadeIn(1000)
    Wait(10000)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
      Citizen.Wait(10)
    end
    TriggerEvent('nocore-sound:client:play', 'jail-door', 0.5)
    FreezeEntityPosition(PlayerPedId(), false)
    ResetMugshot()
    SetEntityCoords(ped,vector3(1774.09, 2481.72, 49.69))
    SetEntityHeading(ped, 27.36)
    DoScreenFadeIn(1000)
    IsGoingToPhoto = false
    TriggerServerEvent("nocore-prison:server:set:jail:items", Months)
    Framework.Functions.Notify("Бяхте изпратени в затвора за " ..Months.. " месеца", "info", 7500)
    TriggerEvent('nocore-inventory:client:DisableInventory', false)
end

RegisterNetEvent('nocore-prison:client:spawn:prison')
AddEventHandler('nocore-prison:client:spawn:prison', function()
  Citizen.SetTimeout(1550, function()
    Framework.Functions.GetPlayerData(function(PlayerData)
     local RandomStartPosition = Config.Locations['Spawns'][math.random(1, #Config.Locations['Spawns'])]
     TriggerEvent('nocore-sound:client:play', 'jail-door', 0.5)
     TriggerServerEvent("prison:server:SetJailStatus", JailTime)
     TriggerServerEvent("prison:server:SaveJailItems", JailTime)
     Citizen.Wait(450)
     SetEntityCoords(PlayerPedId(), RandomStartPosition['Coords']['X'], RandomStartPosition['Coords']['Y'], RandomStartPosition['Coords']['Z'] - 0.9, 0, 0, 0, false)
     SetEntityHeading(PlayerPedId(), RandomStartPosition['Coords']['H'])
     Citizen.Wait(1000)
     TriggerEvent('animations:client:EmoteCommandStart', {RandomStartPosition['Animation']})
     Citizen.Wait(2000)
     InJail = true
     JailTime = PlayerData.metadata["jailtime"]
     Framework.Functions.Notify("В затвора сте за "..JailTime.. " месеца", "info", 5000)
     DoScreenFadeIn(1000)
    end)
  end)
end)

local prisonPeds = {}

Citizen.CreateThread(function()
    local PrisonZone = CircleZone:Create(Config.PrisonZoneCoords, Config.PrisonZoneSize, {
        name = "prisonzone",
        debugPoly = Config.PrisonZoneDebug,
    })

    -- Prison Zone Triggers
    PrisonZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            for k, v in pairs(Config.NPCLocations) do
                TriggerEvent('nocore-prison:spawnPed',v.coords,v.heading,v.event,v.label,v.model,v.scenario,v.icon,v.event2,v.label2,v.headVar,k)
            end
        else
            for k, v in pairs(Config.NPCLocations) do
                if DoesEntityExist(prisonPeds['Prison-' .. k]) then
                    DeleteEntity(prisonPeds['Prison-' .. k])
                    exports['nocore-eye']:RemoveZone('Prison-' .. k)
                end
            end
        end
    end)
--   while true do
--       sleep = 5000
--       if LocalPlayer.state['isLoggedIn'] then
--         if InJail then
--             sleep = 5
--             local pedCoords = GetEntityCoords(PlayerPedId())
--             for k, v in pairs(Config.NPCLocations) do

--                 local dst = #(pedCoords - v.coords)
--                 if dst < 20 and not pedSpawned then
--                     TriggerEvent('nocore-prison:spawnPed',v.coords,v.heading,v.event,v.label,v.model,v.scenario,v.icon,v.event2,v.label2,v.headVar,v.gang)
--                     nearGang = v.gang
--                     pedSpawned = true
--                 else
--                     if DoesEntityExist(prisonPed) and pedSpawned then
--                         local dst2 = #(pedCoords - GetEntityCoords(prisonPed))
--                         if dst2 > 9 then
--                             pedSpawned = false
--                             DeleteEntity(prisonPed)
--                             nearGang = 'None'
--                         end
--                     end
--                 end

--             end
--         end
--     end
--       Wait(sleep)
--   end
end)

RegisterNetEvent('nocore-prison:spawnPed',function(coords,heading,event,label,model,scenario,icon,event2,label2,headVar,num)
  local hash = GetHashKey(model)

  if not HasModelLoaded(hash) then
      RequestModel(hash)
      Wait(10)
  end
  while not HasModelLoaded(hash) do
    Wait(10)
  end
  prisonPed = CreatePed(5, hash, coords, heading, false, false)
  FreezeEntityPosition(prisonPed, true)
  SetEntityInvincible(prisonPed, true)
  SetBlockingOfNonTemporaryEvents(prisonPed, true)
  if headVar ~= nil then
      SetPedComponentVariation(prisonPed,2,1,1,1)
      SetPedComponentVariation(prisonPed,0,headVar,headVar,headVar)
  end

  SetModelAsNoLongerNeeded(hash)

  if scenario ~= nil then
      TaskStartScenarioInPlace(prisonPed,scenario, 0, false)
  end
  exports['nocore-eye']:AddEntityZone('Prison-' ..num, prisonPed, {
    name="Prison-" ..num,
    debugPoly=false,
    useZ = true
      }, {
      options = {
        {
            event = event,
            icon = icon,
            label = label,
            canInteract = function ()
                return InJail
            end
        },
        {
            event = 'nocore-prison:turnInJob',
            icon = icon,
            label = "Свърших задачите",
            canInteract = function ()
                return InJail
            end
        },
      },
        distance = 1.5
      })
      prisonPeds['Prison-' .. num] = prisonPed
end)

RegisterNetEvent('nocore-prison:turnInJob',function()
  if curJob ~= nil then
      if curJob == 'Trash' and jobTasks >= 10 then
          if DoesEntityExist(trashCan) then
              DeleteEntity(trashCan)
          end
          if DoesEntityExist(garbagebag) then
              DetachEntity(garbagebag)
              DeleteEntity(garbagebag)
          end
          TriggerServerEvent('nocore-prison:turnInJob',curJob) -- Add reward here
          JobDone()
          curJob = nil
          curWorking = false
      elseif jobTasks >= 10 then
          TriggerServerEvent('nocore-prison:turnInJob',curJob) -- Add reward here
          Framework.Functions.Notify("Успешно свършихте задачите си", 'info', 10000)
          JobDone()
          curJob = nil
          curWorking = false
      elseif curJob ~= nil then
          Framework.Functions.Notify('Не сте свършили със задачите си ' .. jobTasks .. '/10', 'info', 10000)
      end
  end
end)

RegisterNetEvent('nocore-prison:client:enter:prison')
AddEventHandler('nocore-prison:client:enter:prison', function(Time, bool)
    JailTime = Time
    InJail = bool
end)

RegisterNetEvent('nocore-prison:client:set:alarm')
AddEventHandler('nocore-prison:client:set:alarm', function(bool)
  if bool then
    while not PrepareAlarm("PRISON_ALARMS") do
        Citizen.Wait(10)
    end
    StartAlarm("PRISON_ALARMS", true)
    Citizen.Wait(60 * 1000)
    StopAllAlarms(true)
  else
    StopAllAlarms(true)
  end
end)

RegisterNetEvent('nocore-prison:client:leave:prison')
AddEventHandler('nocore-prison:client:leave:prison', function()
  local RandomSeat = Config.Locations['Leave-Spawn'][math.random(1, #Config.Locations['Leave-Spawn'])]
  DoScreenFadeOut(1000)
  Citizen.Wait(1000)
  TriggerEvent('nocore-sound:client:play', 'jail-cell', 0.2)
  SetEntityCoords(PlayerPedId(), RandomSeat['Coords']['X'], RandomSeat['Coords']['Y'], RandomSeat['Coords']['Z'] - 0.9, 0, 0, 0, false)
  SetEntityHeading(PlayerPedId(), RandomSeat['Coords']['H'])
  Citizen.Wait(250)
  TriggerEvent('animations:client:EmoteCommandStart', {RandomSeat['Animation']})
  Citizen.Wait(2000)
  DoScreenFadeIn(1000)
end)

Citizen.CreateThread(function()
    local modelHash = GetHashKey("s_m_y_chef_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(50)
    end
    pedshop = CreatePed(0, modelHash, 1781.16, 2561.0, 44.67,true)
    FreezeEntityPosition(pedshop, true)
    SetEntityHeading(pedshop, 178.71)
    SetEntityInvincible(pedshop, true)
    SetBlockingOfNonTemporaryEvents(pedshop, true)
    TaskStartScenarioInPlace(pedshop, "WORLD_HUMAN_AA_SMOKE", 0, true)

    exports['nocore-eye']:AddBoxZone("PrisonShop", vector3(1780.94, 2560.1, 45.67), 4.0, 0.8, {
      name="PrisonShop",
      heading=270,
      minZ=44.67,
      maxZ=48.67
  }, {
      options = {
          {
              event = "nocore-prison:shop",
              icon = 'fas fa-circle',
              label = 'Магазин',
              canInteract = function()
                return InJail
            end,
          },
      },
          distance = 1.5
  })
end)

-- // Loops \\ --

Citizen.CreateThread(function()
-- 	while true do 
--     Citizen.Wait(4)
--     if LocalPlayer.state['isLoggedIn'] then
--         if InJail then
--         if JailTime > 0 then
--             Citizen.Wait(1000 * 60)
--             JailTime = JailTime - 1
--             TriggerServerEvent("nocore-prison:server:set:jail:state", JailTime)
--             if JailTime == 0 and not AlertSended then
--             AlertSended = true
--             JailTime = 0
--             TriggerServerEvent("nocore-prison:server:set:jail:leave")
--             Framework.Functions.Notify("Изтече Ви присъдата, можете да си тръгнете от телевизора", "success")
--             end
--         end
--         end
--     end
--   end
  while true do
    Wait(7)
        if LocalPlayer.state['isLoggedIn'] then
            if JailTime > 0 and InJail then
                Wait(1000 * 60)
                JailTime = JailTime - 1
                if JailTime <= 0 then
                    JailTime = 0
                    TriggerServerEvent("nocore-prison:server:set:jail:leave")
                    Framework.Functions.Notify("Присъдата Ви изтече, можете да си тръгнете от телевизора", "success")
                else
                    Framework.Functions.Notify("Остават Ви "..JailTime.. " месец/а", 'info', 5000)
                end
                TriggerServerEvent("nocore-prison:server:set:jail:state", JailTime)
            else
                Wait(5000)
            end
        end
    end
end)

Citizen.CreateThread(function()
	while true do
    Citizen.Wait(7)
    if LocalPlayer.state['isLoggedIn'] then
        if InJail then
        local PlayerCoords = GetEntityCoords(PlayerPedId())
        if (GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Config.Locations["Prison"]['Coords']['X'], Config.Locations["Prison"]['Coords']['Y'], Config.Locations["Prison"]['Coords']['Z'], false) > 202.0 and InJail) then
            InJail = false
            JailTime = 0
            AlertSended = false
            TriggerServerEvent("nocore-prison:server:set:jail:leave")
            TriggerServerEvent('nocore-prison:server:set:alarm', true)
            Framework.Functions.Notify("Избягахте! Изчезвайте от тук", "error")
        else
            Citizen.Wait(5000)
        end
        else
        Citizen.Wait(5000)
        end
    end
	end
end)

RegisterNetEvent('nocore-prison:client:leavezatvor', function()
    if InJail then
      if JailTime <= 0 then
          InJail = false
          AlertSended = false
          TriggerEvent('nocore-prison:client:leave:prison')
          TriggerServerEvent("prison:server:SetJailStatus", JailTime)
          TriggerServerEvent('prison:server:GiveJailItems')
      elseif JailTime == 1 then
          Framework.Functions.Notify("Остава Ви 1 месец", "info", 5000)
      else
          Framework.Functions.Notify("Остават Ви "..JailTime.." месеца", "info", 5000)
      end
    end
end)

RegisterNetEvent('nocore-prison:shop', function()
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "shop", "prison", Config.ShopItems)
end)


RegisterNetEvent('nocore-prison:openStash',function()
  TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "TrashCan", {
      maxweight = 100000,
      slots = 10,
  })
  TriggerEvent("nocore-inventory:client:SetCurrentStash", "TrashCan")
end)

CreateThread(function()
  local poopTable = {`prop_big_shit_02`}
  exports['nocore-eye']:AddTargetModel(poopTable, {
      options = {
          {
              event = "nocore-prison:pickUpPoop",
              icon = 'fas fa-hand-paper',
              label = 'Събирай',
          },

      },
      distance = 1.5
  })

  exports['nocore-eye']:AddBoxZone("PrisonStorage", vector3(1784.25, 2560.56, 45.67), 0.5, 0.5, {
      name="PrisonStorage",
      heading=0,
      debugPoly=false,
      minZ=45,
      maxZ=46
  }, {
      options = {
          {
              event = "nocore-prison:openStash",
              icon = 'fas fa-hand-paper',
              label = 'Отвори',
          },
      },
          distance = 1.5
  })

  exports['nocore-eye']:AddBoxZone("prisonleave", vector3(1754.23, 2474.04, 45.74), 1.6, 1.0, {
      name="prisonleave",
      heading=335,
      debugPoly=false,
      minZ=45.74 - 1,
      maxZ=45.74 + 1
    }, {
      options = {
          {
              event = 'nocore-prison:client:leavezatvor',
              icon = 'fas fa-sign-out-alt',
              label = 'Телевизор',
          },
      },
          distance = 2
  })

end)

function GetInJailStatus()
  return InJail
end

 function beginWork(job)
  curJob = job
  jobTasks = 0
  if curJob == 'Clean' then
      Framework.Functions.Notify('Отидете в лазарета и почистете бъркотията', 'info', 10000)
      TriggerEvent('nocore-prison:spawnDaPoop')
  end

  if curJob == 'Electrical' then
      Framework.Functions.Notify("Оправи електрически кутии около затвора, трябва да са 10", 'info', 10000)
      TriggerEvent('nocore-prison:electricalBoxes')
  end

  if curJob == 'Trash' then
      Framework.Functions.Notify('Съберете боклука от варелите и го донесете', 'info', 10000)
      TriggerEvent('nocore-prison:barrelTask')
  end

  if curJob == 'Toilet' then
      Framework.Functions.Notify('Изчистете малко тоалетни на долния етаж', 'info', 10000)
      TriggerEvent('nocore-prison:toiletBoxes')
  end
end

-- toiletni

RegisterNetEvent('nocore-prison:beginToilet',function()
  if not curWorking then
      curWorking = true
      beginWork('Toilet')
  else
      curWorking = false
  end
end)

RegisterNetEvent('nocore-prison:toiletBoxes',function()
  for k, v in pairs (Config.Toilets) do
      exports['nocore-eye']:AddBoxZone(k, v.coords, .5, .5, {
          name=k,
          heading=v.heading,
          debugPoly=false,
          minZ=v.coords.z,
          maxZ=v.coords.z+1
      }, {
          options = {
              {
                  event = "nocore-prison:useToilet",
                  icon = v.icon,
                  label = 'Почисти',
              },
          },
              distance = 1.5
      })

  end
end)

RegisterNetEvent('nocore-prison:useToilet',function()
  local ped = PlayerPedId()
  local pedCoords = GetEntityCoords(ped)
  for k, v in pairs (Config.Toilets) do
      local dst = #(pedCoords - v.coords)
      if dst < 2 then
          exports['nocore-eye']:RemoveZone(k)
          LoadAnimDict('amb@medic@standing@kneel@base')
          LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
          TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
          TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
          Wait(15000)
          ClearPedTasks(ped)
          jobTasks = jobTasks + 1
      end
  end
end)

-- laina

RegisterNetEvent('nocore-prison:beginClean',function()
  if not curWorking then
      curWorking = true
      beginWork('Clean')
  else
      curWorking = false
  end
end)

RegisterNetEvent('nocore-prison:spawnDaPoop',function()
  local radius = 5.0
  local poopLimit = 0
      while poopLimit < 11 do
          poopLimit = poopLimit + 1
      local x = 1766.03 + math.random(-radius,radius)
      local y = 2595.12 + math.random(-radius,radius)
          poop = CreateObject('prop_big_shit_02',x,y,45.73, -1,0,0,0)
          PlaceObjectOnGroundProperly(poop)
          FreezeEntityPosition(poop, true)
          Wait(100)
      end
end)

RegisterNetEvent('nocore-prison:pickUpPoop',function()
  local pedCoords = GetEntityCoords(PlayerPedId())
  local objectId = GetClosestObjectOfType(pedCoords, 2.0, GetHashKey("prop_big_shit_02"), false)
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
    TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
    Wait(15000)
    ClearPedTasks(PlayerPedId())
    jobTasks = jobTasks + 1
    DeleteEntity(objectId)
end)

-- 4i4o doktor

RegisterNetEvent('nocore-prison:useDoctor',function()
  SetEntityCoords(PlayerPedId(), 1761.87,2591.6,46.66)
  LoadAnimDict('anim@gangops@morgue@table@')
  TaskPlayAnim(PlayerPedId(), 'anim@gangops@morgue@table@' , 'body_search' ,8.0, -8.0, -1, 1, 0, false, false, false )
  SetEntityHeading(PlayerPedId(), 266.96)
  Wait(20000)
  TriggerEvent('nocore-hospital:client:revive')
  SetEntityHealth(PlayerPedId(),200)
  ClearPedTasks(PlayerPedId())
end)

-- Electrical

RegisterNetEvent('nocore-prison:beginElectrical',function()
  if not curWorking then
      curWorking = true
      beginWork('Electrical')
  else
      curWorking = false
  end
end)

RegisterNetEvent('nocore-prison:electricalBoxes',function()
  for k, v in pairs (Config.ElectricalBoxes) do
      exports['nocore-eye']:AddBoxZone(k, v.coords, 1, 2, {
          name=k,
          heading=v.heading,
          debugPoly=false,
          minZ=v.coords.z,
          maxZ=v.coords.z+1
      }, {
          options = {
              {
                  event = "nocore-prison:useElectricalBox",
                  icon = v.icon,
                  label = 'Поправи',
              },
          },
              distance = 1.5
      })

  end
end)

RegisterNetEvent('nocore-prison:useElectricalBox',function()
  local ped = PlayerPedId()
  local pedCoords = GetEntityCoords(ped)
  for k, v in pairs (Config.ElectricalBoxes) do
      local dst = #(pedCoords - v.coords)
      if dst < 2 then
        exports['nocore-eye']:RemoveZone(k)
        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, false)
        Wait(15000)
        ClearPedTasks(ped)
        jobTasks = jobTasks + 1
    end
  end
end)

-- nie sme edni trashove

RegisterNetEvent('nocore-prison:beginTrash',function()
  if not curWorking then
      curWorking = true
      beginWork('Trash')
  else
      curWorking = false
  end
end)

RegisterNetEvent('nocore-prison:barrelTask',function()
  local trashBarrel = {
  `prop_barrel_03d`,
  }
  exports['nocore-eye']:AddTargetModel(trashBarrel,  {
          options = {
              {
              event = "nocore-prison:emptyBarrel",
              icon = "fas fa-hand-paper",
              label = "Изпразни",
              },
          },
          distance = 2.5
  })

  local hash = GetHashKey('prop_bin_08open')

  if not HasModelLoaded(hash) then
      RequestModel(hash)
      Wait(10)
  end
  while not HasModelLoaded(hash) do
      Wait(10)
  end
  trashCan = CreateObject(hash,1718.88,2567.78,45.73, -1,0,0,0)
  PlaceObjectOnGroundProperly(trashCan)
  SetModelAsNoLongerNeeded(hash)
  FreezeEntityPosition(trashCan,true)

  exports['nocore-eye']:AddEntityZone('trashCan', trashCan, {
          name="trashCan",
          debugPoly=false,
          useZ = true
            }, {
            options = {
              {
              event = "nocore-prison:turnInTrash",
              icon = 'fas fa-trash',
              label = 'Изхвърли боклука',
              },
            },
              distance = 1.5
            })
end)

RegisterNetEvent('nocore-prison:turnInTrash',function()
  if DoesEntityExist(garbagebag) then
      DetachEntity(garbagebag)
      DeleteEntity(garbagebag)
      jobTasks = jobTasks + 5
  end
end)


RegisterNetEvent('nocore-prison:emptyBarrel',function()
  local pedCoords = GetEntityCoords(PlayerPedId())
  local objectId = GetClosestObjectOfType(pedCoords, 5.0, GetHashKey("prop_barrel_03d"), false)
  local alreadySearched = tableHasKey(searched,objectId)
  TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
  Wait(15000)
  ClearPedTasksImmediately(PlayerPedId())
  if alreadySearched then
      Framework.Functions.Notify('Не намери нищо', 'info', 10000)
  else
      if DoesEntityExist(garbagebag) then
          Framework.Functions.Notify('Не можеш да носиш повече торби', 'info', 10000)
      else
          jobTasks = jobTasks + 5
          addToSet(searched,objectId)
          garbagebag = CreateObject(GetHashKey("prop_cs_street_binbag_01"), 0, 0, 0, true, true, true) -- creates object
          AttachEntityToEntity(garbagebag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
          local doMath = math.random(1,100)
          if doMath < 20 then
              local item = Config.RandomTrashReward[math.random(#Config.RandomTrashReward)]
              TriggerServerEvent('nocore-prison:tryTakeItem',item)
          end
      end
  end
end)

-- Basketball Stuff
RegisterCommand('basketball',function()
    if InJail then
        TriggerEvent('nocore-prison:throwBasketBall')
    end
end)

RegisterCommand('joinbasketball',function()
    if InJail then
        isPlayingBasket = true
        Framework.Functions.Notify('Влязохте в играта', 'info', 10000)
        getBasketBall()
    end
end)
RegisterCommand('leavebasketball',function()
    if InJail then
        isPlayingBasket = false
        hasBasketBall = false
        Framework.Functions.Notify('Излязохте от играта', 'info', 10000)
    end
end)

RegisterNetEvent('nocore-prison:throwBasketBall',function()
      hasBasketBall = false
      local hash = 'prop_bskball_01'
      local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-1.0))
      RequestModel(hash)
      while not HasModelLoaded(hash) do Citizen.Wait(0) end
      ballBasketObj = CreateObjectNoOffset(hash, x, y, z, true, false)
      ballBasketID = NetworkGetNetworkIdFromEntity(ballBasketObj)
      SetModelAsNoLongerNeeded(hash)
      AttachEntityToEntity(ballBasketObj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
      local forwardVector = GetEntityForwardVector(PlayerPedId())
      local force = 35.0
      local animDict = "amb@world_human_cheering@male_a"
      local anim = "base"
      ClearPedTasks(PlayerPedId())
      while (not HasAnimDictLoaded(animDict)) do
          RequestAnimDict(animDict)
          Citizen.Wait(5)
      end
      TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
      Wait(700)
      ClearPedTasks(PlayerPedId())
      DetachEntity(ballBasketObj)
      ApplyForceToEntity(ballBasketObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z + 15,0,0,0,0,false,true,true,false,true)
      TriggerServerEvent('nocore-prison:syncBasketBall', ballBasketID)
      isPlayingBasket = true
      getBasketBall()
end)

function getBasketBall()
    CreateThread(function()
        while isPlayingBasket do
            Wait(0)
            if hasBasketBall then
                if IsControlJustReleased(0,38) then
                    hasBasketBall = false
                    local hash = 'prop_bskball_01'
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-1.0))
                    RequestModel(hash)
                    while not HasModelLoaded(hash) do Citizen.Wait(0) end
                    ballBasketObj = CreateObjectNoOffset(hash, x, y, z, true, false)
                    ballBasketID = NetworkGetNetworkIdFromEntity(ballBasketObj)
                    SetModelAsNoLongerNeeded(hash)
                    AttachEntityToEntity(ballBasketObj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
                    local forwardVector = GetEntityForwardVector(PlayerPedId())
                    local force = 35.0
                    local animDict = "amb@world_human_cheering@male_a"
                    local anim = "base"
                    ClearPedTasks(PlayerPedId())
                    while (not HasAnimDictLoaded(animDict)) do
                        RequestAnimDict(animDict)
                        Citizen.Wait(5)
                    end
                    TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
                    Wait(700)
                    ClearPedTasks(PlayerPedId())
                    DetachEntity(ballBasketObj)
                    ApplyForceToEntity(ballBasketObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z + 15,0,0,0,0,false,true,true,false,true)
                    TriggerServerEvent('nocore-prison:syncBasketBall', ballBasketID)
                    isPlayingBasket = true
                end
            else
                local ballCoords = GetEntityCoords(ballBasket)
                DrawMarker(20, ballCoords.x, ballCoords.y, ballCoords.z+0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 228, 71, 12, 80, 1, 1, 0, 1)
                    local dst = #(GetEntityCoords(ballBasket) - GetEntityCoords(PlayerPedId()))
                    if dst < 1 then
                        hasBasketBall = true
                        Framework.Functions.Notify('Имаш топката. Хвърли я с E', 'info', 10000)
                        TriggerServerEvent('nocore-prison:sendDeleteBasketBall',ballBasketID)
                    end
            end
        end
    end)
end

RegisterNetEvent('nocore-prison:syncBasketBall',function(ballBasketID)
    ballBasket = NetworkGetEntityFromNetworkId(ballBasketID)
    hasBasketBall = false
end)

RegisterNetEvent('nocore-prison:deleteBasketBall',function()
    DeleteEntity(ballBasket)
end)

-- Recreational Stuff

RegisterCommand('throw',function()
    if InJail then
        TriggerEvent('nocore-prison:throwBall')
    end
end)

RegisterCommand('join',function()
    if InJail then
        isPlaying = true
        Framework.Functions.Notify('Влязохте в играта', 'info', 10000)
        getBall()
    end
end)
RegisterCommand('leave',function()
    if InJail then
        isPlaying = false
        hasBall = false
        Framework.Functions.Notify('Излязохте от играта', 'info', 10000)
    end
end)


RegisterNetEvent('nocore-prison:throwBall',function()
    hasBall = false
    local hash = 'prop_tennis_ball'
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-1.0))
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(0) end
    ballObj = CreateObjectNoOffset(hash, x, y, z, true, false)
    ballID = NetworkGetNetworkIdFromEntity(ballObj)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(ballObj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
    local forwardVector = GetEntityForwardVector(PlayerPedId())
    local force = 50.0
    local animDict = "melee@unarmed@streamed_variations"
    local anim = "plyr_takedown_front_slap"
    ClearPedTasks(PlayerPedId())
    while (not HasAnimDictLoaded(animDict)) do
        RequestAnimDict(animDict)
        Citizen.Wait(5)
    end
    TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
    Wait(500)
    DetachEntity(ballObj)
    ApplyForceToEntity(ballObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z,0,0,0,0,false,true,true,false,true)
    TriggerServerEvent('nocore-prison:syncBall', ballID)
    isPlaying = true
    getBall()
end)

function getBall()
    CreateThread(function()
        while isPlaying do
            Wait(0)
            if hasBall then
                if IsControlJustReleased(0,38) then
                    hasBall = false
                    local hash = 'prop_tennis_ball'
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-1.0))
                    RequestModel(hash)
                    while not HasModelLoaded(hash) do Citizen.Wait(0) end
                    ballObj = CreateObjectNoOffset(hash, x, y, z, true, false)
                    ballID = NetworkGetNetworkIdFromEntity(ballObj)
                    SetModelAsNoLongerNeeded(hash)
                    AttachEntityToEntity(ballObj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
                    local forwardVector = GetEntityForwardVector(PlayerPedId())
                    local force = 50.0
                    local animDict = "melee@unarmed@streamed_variations"
                    local anim = "plyr_takedown_front_slap"
                    ClearPedTasks(PlayerPedId())
                    while (not HasAnimDictLoaded(animDict)) do
                        RequestAnimDict(animDict)
                        Citizen.Wait(5)
                    end
                    TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
                    Wait(500)
                    DetachEntity(ballObj)
                    ApplyForceToEntity(ballObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z,0,0,0,0,false,true,true,false,true)
                    TriggerServerEvent('nocore-prison:syncBall', ballID)
                    isPlaying = true
                end
            else
              local ballCoords = GetEntityCoords(ball)
              DrawMarker(20, ballCoords.x, ballCoords.y, ballCoords.z+0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 228, 71, 12, 80, 1, 1, 0, 1)
                  local dst = #(GetEntityCoords(ball) - GetEntityCoords(PlayerPedId()))
                  if dst < 1 then
                    hasBall = true
                    Framework.Functions.Notify('Имаш топката. Хвърли я с E', 'info', 10000)
                    TriggerServerEvent('nocore-prison:sendDeleteBall',ballID)
                end
            end
        end
    end)
end

RegisterNetEvent('nocore-prison:syncBall',function(ballID)
    ball = NetworkGetEntityFromNetworkId(ballID)
    hasBall = false
end)

RegisterNetEvent('nocore-prison:deleteBall',function()
    DeleteEntity(ball)
end)

RegisterNetEvent('nocore-prison:teachRec',function()
    Framework.Functions.Notify('/throw за да хвърляте топка към стената', 'info', 10000)
    Wait(10000)
    Framework.Functions.Notify('/join за да влезете в същестуваща игра', 'info', 10000)
    Wait(10000)
    Framework.Functions.Notify('/leave за да излезете от игра', 'info', 10000)
    Wait(10000)
    Framework.Functions.Notify('Целта е да хвърлите топката към стената и да я хванете, преди да излезе. [E] за да хвърляш уловената топка.', 'info', 10000)
end)

-- // MugShot Board \\ --

Citizen.CreateThread(function()
  Scaleform = LoadScaleform("mugshot_board_01")
  Handle = CreateNamedRenderTargetForModel("ID_Text", GetHashKey("prop_police_id_text"))
  while Handle do
     if IsGoingToPhoto then
      SetTextRenderId(Handle)
      Set_2dLayer(4)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
      DrawScaleformMovie(Scaleform, 0.405, 0.37, 0.81, 0.74, 255, 255, 255, 255, 0)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
      SetTextRenderId(GetDefaultScriptRendertargetRenderId())
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
      Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
      Wait(0)
     else
         Citizen.Wait(1500)
     end
  end
end)

-- // Functions \\ --

function AddMugshot(Name, Months, CitizenId, Date)
 local PlayerCoords = GetEntityCoords(PlayerPedId())
 -- Set Information --
 PushScaleformMovieFunction(Scaleform, "SET_BOARD")
 PushScaleformMovieFunctionParameterString("POLICE LOS SANTOS")
 PushScaleformMovieFunctionParameterString(Date) -- Datum
 PushScaleformMovieFunctionParameterString("Sentenced for "..Months.." Month(s)")  -- Veroordeeld
 PushScaleformMovieFunctionParameterString(Name) -- Voornaam en Achternaam
 PushScaleformMovieFunctionParameterFloat(0.0)
 PushScaleformMovieFunctionParameterString(CitizenId) -- CitizenId
 PushScaleformMovieFunctionParameterFloat(0.0)
 PopScaleformMovieFunctionVoid()
 -- Add Prop --
 RequestModel(GetHashKey("prop_police_id_board"))
 RequestModel(GetHashKey("prop_police_id_text"))
 exports['nocore-assets']:RequestAnimationDict("mp_character_creation@lineup@male_a")
 while not HasModelLoaded(GetHashKey("prop_police_id_board")) or not HasModelLoaded(GetHashKey("prop_police_id_text")) do
   Wait(1)
 end
 MugshotBoard = CreateObject(GetHashKey("prop_police_id_board"), PlayerCoords, false, true, false)
 MugshotOverlay = CreateObject(GetHashKey("prop_police_id_text"), PlayerCoords, false, true, false)
 AttachEntityToEntity(MugshotOverlay, MugshotBoard, -1, 4103, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
 SetModelAsNoLongerNeeded(GetHashKey("prop_police_id_board"))
 SetModelAsNoLongerNeeded(GetHashKey("prop_police_id_text"))
 SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), 1)
 AttachEntityToEntity(MugshotBoard, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
 TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_a", "loop_raised", 8.0, 8.0, -1, 49, 0, false, false, false)
end

function ResetMugshot()
 DeleteObject(MugshotOverlay)
 DeleteObject(MugshotBoard)
 ClearPedSecondaryTask(PlayerPedId())
 PushScaleformMovieFunction(Scaleform, "SET_BOARD")
 PushScaleformMovieFunctionParameterString("")
 PushScaleformMovieFunctionParameterString('')  -- Datum
 PushScaleformMovieFunctionParameterString("") -- Veroordeeld
 PushScaleformMovieFunctionParameterString('') -- Voornaam en Achternaam
 PushScaleformMovieFunctionParameterFloat(0.0)
 PushScaleformMovieFunctionParameterString('') -- CitizenId
 PushScaleformMovieFunctionParameterFloat(0.0)
 PopScaleformMovieFunctionVoid()
end

function CreateNamedRenderTargetForModel(name, model)
  local Handle = 0
  if not IsNamedRendertargetRegistered(name) then
      RegisterNamedRendertarget(name, 0)
  end
  if not IsNamedRendertargetLinked(model) then
      LinkNamedRendertarget(model)
  end
  if IsNamedRendertargetRegistered(name) then
      Handle = GetNamedRendertargetRenderId(name)
  end
  return Handle
 end

 function LoadScaleform(Scaleform)
  local Handle = RequestScaleformMovie(Scaleform)
  if Handle ~= 0 then
      while not HasScaleformMovieLoaded(Handle) do
          Citizen.Wait(0)
      end
  end
  return Handle
end

function CallScaleformMethod(Scaleform, method, ...)
 local t
 local args = { ... }
 BeginScaleformMovieMethod(Scaleform, method)
 for k, v in ipairs(args) do
     t = type(v)
     if t == 'string' then
         PushScaleformMovieMethodParameterString(v)
     elseif t == 'number' then
         if string.match(tostring(v), "%.") then
             PushScaleformMovieFunctionParameterFloat(v)
         else
             PushScaleformMovieFunctionParameterInt(v)
         end
     elseif t == 'boolean' then
         PushScaleformMovieMethodParameterBool(v)
     end
 end
 EndScaleformMovieMethod()
end