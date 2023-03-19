if IsDuplicityVersion() then
  -- server Side
  Events = {}
  if Config.UsingESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Events = {
      onLogout = 'esx:onPlayerLogout'
    }
  elseif Config.UsingQB then
    QBCore = exports['no-core']:GetCoreObject()
  end
else
  -- client side
  Events = {}
  GetData = nil -- used for job detection
  if Config.UsingESX then
    ESX = nil
    CreateThread(function()
      while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(1)
      end
      GetData = ESX.GetPlayerData
    end)
    Events = {
      onLoaded = 'esx:playerLoaded',
      onUnload = 'esx:onPlayerLogout'
    }
  elseif Config.UsingQB then
    QBCore = exports['no-core']:GetCoreObject()
    GetData = QBCore.Functions.GetPlayerData
    Events = {
      onLoaded = 'Framework:Client:OnPlayerLoaded',
      onUnload = 'Framework:Client:OnPlayerUnload'
    }
  end
end
