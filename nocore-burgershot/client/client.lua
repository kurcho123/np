local CurrentWorkObject = {}
local PlayerJob = {}
local LoggedIn = false
local InRange = false
Framework = exports['no-core']:GetCoreObject()

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.GetPlayerData(function(PlayerData)
      PlayerJob = PlayerData.job
    end)
    LoggedIn = true
end)

RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
	RemoveWorkObjects()
  LoggedIn = false
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    PlayerJob.onduty = Onduty
end)

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() == resourceName) then
      Framework.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
      end)
      LoggedIn = true
  end
end)

-- Code

-- // Loops \\ --

-- Citizen.CreateThread(function()
--   while true do
--       Citizen.Wait(4)
--       if LoggedIn and PlayerJob.name == 'burger' and PlayerJob.onduty then
--           local PlayerCoords = GetEntityCoords(PlayerPedId())
--           local Distance = #(vector3(-1192.77, -890.95, 13.98) - PlayerCoords)
--           InRange = false
--           if Distance < 40.0 then
--               InRange = true
--           end
--           if not InRange then
--             CheckDuty() 
--             Citizen.Wait(1500)
--           else
--             Citizen.Wait(1500)
--           end
--       else
--         Citizen.Wait(5000)
--       end
--   end
-- end)

-- // Events \\ --

RegisterNetEvent('nocore-burgershot:client:open:cashregister')
AddEventHandler('nocore-burgershot:client:open:cashregister', function(data)
  if data.job == 'burger' then
    OpenRegister()
  else
    OpenPayment()
  end
end)

function OpenPayment()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenPayment', payments = Config.ActivePayments})
end

function OpenRegister()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenRegister'})
end

RegisterNetEvent('nocore-burgershot:client:sync:register')
AddEventHandler('nocore-burgershot:client:sync:register', function(RegisterConfig)
  Config.ActivePayments = RegisterConfig
end)

RegisterNetEvent('nocore-burgershot:client:open:burgers')
AddEventHandler('nocore-burgershot:client:open:burgers', function()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Бургери",
        txt = "",
        isMenuHeader = true
    })
    for k, v in pairs(Config.Burgers) do
      table.insert(sendMenu,{
        id = #sendMenu+1,
        header = v.label,
        txt = '',
        params = { 
            event = "nocore-burgershot:client:create:burger",
            args = {
              BurgerType = v.item
            }
        }
    })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        params = { 
            event = "fakeevnettt",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end)

RegisterNetEvent('nocore-burgershot:client:open:drinks')
AddEventHandler('nocore-burgershot:client:open:drinks', function()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Напитки",
        txt = "",
        isMenuHeader = true
    })
    for k, v in pairs(Config.Drinks) do
      table.insert(sendMenu,{
        id = #sendMenu+1,
        header = v.label,
        txt = '',
        params = { 
            event = "nocore-burgershot:client:create:drink",
            args = {
              DrinkType = v.item
            }
        }
    })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        params = { 
            event = "fakeevnettt",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end)

RegisterNetEvent('nocore-burgershot:client:open:box')
AddEventHandler('nocore-burgershot:client:open:box', function(BoxId)
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", 'burgerbox_'..BoxId, {maxweight = 5000, slots = 3})
    TriggerEvent("nocore-inventory:client:SetCurrentStash", 'burgerbox_'..BoxId)
end)

RegisterNetEvent('nocore-burgershot:client:open:cold:storage')
AddEventHandler('nocore-burgershot:client:open:cold:storage', function()
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "burger_storage", {maxweight = 1000000, slots = 10})
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "burger_storage")
end)

RegisterNetEvent('nocore-burgershot:client:open:hot:storage')
AddEventHandler('nocore-burgershot:client:open:hot:storage', function()
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "heater", {maxweight = 1000000, slots = 10})
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "heater")
end)

RegisterNetEvent('nocore-burgershot:client:open:tray')
AddEventHandler('nocore-burgershot:client:open:tray', function(data)
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "foodtray"..data.Numbers, {label = 'Табла', maxweight = 100000, slots = 3})
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "foodtray"..data.Numbers)
end)

RegisterNetEvent('nocore-burgershot:client:create:burger')
AddEventHandler('nocore-burgershot:client:create:burger', function(data)
  Framework.Functions.TriggerCallback('nocore-burgershot:server:has:burger:items', function(HasBurgerItems)
    if HasBurgerItems then
      MakeBurger(data.BurgerType)
    else
      Framework.Functions.Notify("Липсват ви съставки, за да направите този бургер..", "error")
    end
  end)
end)

RegisterNetEvent('nocore-burgershot:client:create:drink')
AddEventHandler('nocore-burgershot:client:create:drink', function(data)
    MakeDrink(data.DrinkType)
end)

RegisterNetEvent('nocore-burgershot:client:bake:fries')
AddEventHandler('nocore-burgershot:client:bake:fries', function()
  Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
    if HasItem then
       MakeFries()
    else
      Framework.Functions.Notify("Нямате картофи..", "error")
    end
  end, 'burger-potato')
end)

RegisterNetEvent('nocore-burgershot:client:bake:meat')
AddEventHandler('nocore-burgershot:client:bake:meat', function()
  Framework.Functions.TriggerCallback('Framework:HasItem', function(HasItem)
    if HasItem then
       MakePatty()
    else
      Framework.Functions.Notify("Трябва ти малко месо..", "error")
    end
  end, 'burger-raw')
end)

-- // functions \\ --

function SpawnWorkObjects()
  for k, v in pairs(Config.WorkProps) do
    exports['nocore-assets']:RequestModelHash(v['Prop'])
    WorkObject = CreateObject(GetHashKey(v['Prop']), v["Coords"]["X"], v["Coords"]["Y"], v["Coords"]["Z"], false, false, false)
    SetEntityHeading(WorkObject, v['Coords']['H'])
    if v['PlaceOnGround'] then
    	PlaceObjectOnGroundProperly(WorkObject)
    end
    if not v['ShowItem'] then
    	SetEntityVisible(WorkObject, false)
    end
    SetModelAsNoLongerNeeded(WorkObject)
    FreezeEntityPosition(WorkObject, true)
    SetEntityInvincible(WorkObject, true)
    table.insert(CurrentWorkObject, WorkObject)
    Citizen.Wait(50)
  end
end

function MakeBurger(BurgerName)
  Citizen.SetTimeout(750, function()
    LocalPlayer.state:set("inv_busy", true, true)
    exports['nocore-assets']:RequestAnimationDict("mini@repair")
    TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_ped" ,3.0, 3.0, -1, 8, 0, false, false, false)
    Framework.Functions.Progressbar("open-brick", "Приготвяш бургер..", 7500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('nocore-burgershot:server:finish:burger', BurgerName)
        LocalPlayer.state:set("inv_busy", false, true)
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
    end, function()
        LocalPlayer.state:set("inv_busy", false, true)
        Framework.Functions.Notify("Отмененo..", "error")
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
    end)
  end)
end

function MakeFries()
  LocalPlayer.state:set("inv_busy", true, true)
  TriggerEvent("nocore-sound:client:play", "baking", 0.7)
  exports['nocore-assets']:RequestAnimationDict("amb@prop_human_bbq@male@base")
  TaskPlayAnim(PlayerPedId(), "amb@prop_human_bbq@male@base", "base" ,3.0, 3.0, -1, 8, 0, false, false, false)
  exports['nocore-assets']:AddProp('Fork')
  Framework.Functions.Progressbar("open-brick", "Пържиш картофки..", 6500, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
  }, {}, {}, {}, function() -- Done
      exports['nocore-assets']:RemoveProp()
      TriggerServerEvent('nocore-burgershot:server:finish:fries')
      LocalPlayer.state:set("inv_busy", false, true)
      StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
  end, function()
      exports['nocore-assets']:RemoveProp()
      LocalPlayer.state:set("inv_busy", false, true)
      Framework.Functions.Notify("Отмененo..", "error")
      StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
  end)
end

function MakePatty()
  LocalPlayer.state:set("inv_busy", true, true)
  TriggerEvent("nocore-sound:client:play", "baking", 0.7)
  exports['nocore-assets']:RequestAnimationDict("amb@prop_human_bbq@male@base")
  TaskPlayAnim(PlayerPedId(), "amb@prop_human_bbq@male@base", "base" ,3.0, 3.0, -1, 8, 0, false, false, false)
  exports['nocore-assets']:AddProp('Spatula')
  Framework.Functions.Progressbar("open-brick", "Приготвяш бургер..", 6500, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
  }, {}, {}, {}, function() -- Done
      exports['nocore-assets']:RemoveProp()
      TriggerServerEvent('nocore-burgershot:server:finish:patty')
      LocalPlayer.state:set("inv_busy", false, true)
      StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
  end, function()
      exports['nocore-assets']:RemoveProp()
      LocalPlayer.state:set("inv_busy", false, true)
      Framework.Functions.Notify("Отмененo..", "error")
      StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
  end)
end

function MakeDrink(DrinkName)
  LocalPlayer.state:set("inv_busy", true, true)
  TriggerEvent("nocore-sound:client:play", "pour-drink", 0.4)
  exports['nocore-assets']:RequestAnimationDict("amb@world_human_hang_out_street@female_hold_arm@idle_a")
  TaskPlayAnim(PlayerPedId(), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a" ,3.0, 3.0, -1, 8, 0, false, false, false)
  Framework.Functions.Progressbar("open-brick", "Приготвяш напитка..", 6500, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
  }, {}, {}, {}, function() -- Done
      TriggerServerEvent('nocore-burgershot:server:finish:drink', DrinkName)
      LocalPlayer.state:set("inv_busy", false, true)
      StopAnimTask(PlayerPedId(), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", 1.0)
  end, function()
      LocalPlayer.state:set("inv_busy", false, true)
      Framework.Functions.Notify("Отмененo..", "error")
      StopAnimTask(PlayerPedId(), "amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", 1.0)
  end)
end

function CheckDuty()
  if Framework.Functions.GetPlayerData().job.name =='burger' and Framework.Functions.GetPlayerData().job.onduty then
     TriggerServerEvent('Framework:ToggleDuty')
     Framework.Functions.Notify("Отдалечи се твърде много от работното си място!", "error")
  end
end

function RemoveWorkObjects()
  for k, v in pairs(CurrentWorkObject) do
  	 DeleteEntity(v)
  end
end

function GetActiveRegister()
  return Config.ActivePayments
end

RegisterNUICallback('Click', function()
  PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
  PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('AddPrice', function(data)
  TriggerServerEvent('nocore-burgershot:server:add:to:register', data.Price, data.Note)
end)

RegisterNUICallback('PayReceipt', function(data)
  TriggerServerEvent('nocore-burgershot:server:pay:receipt', data.Price, data.Note, data.Id)
end)

RegisterNUICallback('CloseNui', function()
  SetNuiFocus(false, false)
end)