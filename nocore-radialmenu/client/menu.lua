local showMenu = false
local MAX_MENU_ITEMS = 7

local isLoggedIn = false
local openmenu = false


if Config.Debug then
    AddEventHandler('onResourceStart', function(resourceName)
        if (GetCurrentResourceName() == resourceName) then
            Citizen.SetTimeout(1250, function()
                TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
                Citizen.Wait(100)
                isLoggedIn = true
                Framework.Functions.TriggerCallback('nocore-radialmenu:server:HasItem', function(HasItem)
                        HasHandCuffs = HasItem
                end, 'handcuffs')
            end)
        end
    end)
end

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1250, function()
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)    
        Citizen.Wait(100)
        isLoggedIn = true
        Framework.Functions.TriggerCallback('nocore-radialmenu:server:HasItem', function(HasItem)
            HasHandCuffs = HasItem
        end, 'handcuffs')
    end)
end)


RegisterNetEvent('Framework:Client:OnPlayerUnload')
AddEventHandler('Framework:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

-- Code

RegisterCommand('+radialmenu', function()
    openmenu = true
end, false)
RegisterCommand('-radialmenu', function()
    openmenu = false
end, false)

RegisterKeyMapping('+radialmenu', 'Отвори Radial Menu', 'keyboard', 'GRAVE')

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if isLoggedIn then
           if openmenu and GetLastInputMethod(2) and showMenu then
               showMenu = false
               SetNuiFocus(false, false)
           end
           if openmenu and GetLastInputMethod(2) then
               showMenu = true
             if showMenu == true then
               DisableControlAction(0, 289, true)  
               DisableControlAction(0, 288, true)  
             end
            local enabledMenus = {}
               for _, menuConfig in ipairs(Config.Menu) do
                   if menuConfig:enableMenu() then
                       local dataElements = {}
                       local hasSubMenus = false
                       if menuConfig.subMenus ~= nil and #menuConfig.subMenus > 0 then
                           hasSubMenus = true
                           local previousMenu = dataElements
                           local currentElement = {}
                           for i = 1, #menuConfig.subMenus do
                               currentElement[#currentElement+1] = Config.SubMenus[menuConfig.subMenus[i]]
                               currentElement[#currentElement].id = menuConfig.subMenus[i]
                               currentElement[#currentElement].enableMenu = nil
   
                               if i % MAX_MENU_ITEMS == 0 and i < (#menuConfig.subMenus - 1) then
                                   previousMenu[MAX_MENU_ITEMS + 1] = {
                                       id = "_more",
                                       title = "More",
                                       icon = "#more",
                                       items = currentElement
                                   }
                                   previousMenu = currentElement
                                   currentElement = {}
                               end
                           end
                           if #currentElement > 0 then
                               previousMenu[MAX_MENU_ITEMS + 1] = {
                                   id = "_more",
                                   title = "More",
                                   icon = "#more",
                                   items = currentElement
                               }
                           end
                           dataElements = dataElements[MAX_MENU_ITEMS + 1].items
   
                       end
                       enabledMenus[#enabledMenus+1] = {
                           id = menuConfig.id,
                           title = menuConfig.displayName,
                           close = menuConfig.close,
                           functiontype = menuConfig.functiontype,
                           functionParameters = menuConfig.functionParameters,
                           functionName = menuConfig.functionName,
                           icon = menuConfig.icon,
                       }
                       if hasSubMenus then
                           enabledMenus[#enabledMenus].items = dataElements
                       end
                   end
               end
               SendNUIMessage({
                   state = "show",
                   data = enabledMenus,
                   menuKeyBind = 'F1'
               })
               SetCursorLocation(0.5, 0.5)
               SetNuiFocus(true, true)
               PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
               while showMenu == true do Citizen.Wait(100) end
               Citizen.Wait(100)
               while openmenu and GetLastInputMethod(2) do Citizen.Wait(100) end
           end
         else
            Citizen.Wait(150)
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if isLoggedIn then
            Framework.Functions.TriggerCallback('nocore-radialmenu:server:HasItem', function(HasItem)
                if HasItem then
                    HasHandCuffs = true
                else
                    HasHandCuffs = false
                end
            end, 'handcuffs')
            Citizen.Wait(250)
        else
            Citizen.Wait(250)
        end
    end
end)]]

RegisterNetEvent("nocore-core:client:closeui")
AddEventHandler("nocore-core:client:closeui", function()
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
end)

RegisterNetEvent('nocore-hospital:client:DoDeathOnPlayer', function()
  showMenu = false
  SetNuiFocus(false, false)
  SendNUIMessage({
      state = 'destroy'
  })
end)

RegisterNUICallback('closemenu', function(data, cb)
 showMenu = false
 SetNuiFocus(false, false)
 SetTimeout(100, function()
    SendNUIMessage({
        state = 'destroy'
    })
 end)
 PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", true)
 cb('ok')
end)

RegisterNUICallback('triggerAction', function(data, cb)
 if data.type == 'client' then
     TriggerEvent(data.action, data.parameters)
 elseif data.type == 'server' then 
     TriggerServerEvent(data.action, data.parameters)
 elseif data.type == 'command' then
    ExecuteCommand(data.action)
 end
 cb('ok')
end)