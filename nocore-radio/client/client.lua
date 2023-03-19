Framework = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if Framework == nil then
            TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
            Citizen.Wait(200)
        end
    end
end)

-- Code

local radioMenu = false
local isLoggedIn = false

function enableRadio(enable)
  if enable then
    SetNuiFocus(enable, enable)
    PhonePlayIn()
    SendNUIMessage({
      type = "open",
    })
    radioMenu = enable
  end
end
--[[
CreateThread(function()
  while true do
    if Framework then
      if LocalPlayer.state.isLoggedIn then
        Framework.Functions.TriggerCallback('nocore-radio:server:GetItem', function(hasItem)
          if not hasItem then
            if exports.tokovoip_script ~= nil and next(exports.tokovoip_script) ~= nil then
                exports["pma-voice"]:removePlayerFromRadio()
                exports["pma-voice"]:SetRadioChannel(0)
                exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
                Framework.Functions.Notify('Вие сменихте текущата честота!', 'error')
            end
          end
        end, "radio")
      end
    end

    Wait(10000)
  end
end)
]]
RegisterNetEvent('nocore-inventory:OnItemRemove')
AddEventHandler('nocore-inventory:OnItemRemove', function(ItemName, Amount, HaveLeftSome)
    if ItemName == 'radio' then
      Framework.Functions.TriggerCallback('nocore-radio:server:GetItem', function(hasItem)
        if not hasItem then
            exports["pma-voice"]:removePlayerFromRadio()
            exports["pma-voice"]:SetRadioChannel(0)
            exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
            Framework.Functions.Notify('Вие сменихте текущата честота!', 'error')
        end
      end, "radio")
    end
end)


RegisterNetEvent('nocore-radio:client:joinRadio')
AddEventHandler('nocore-radio:client:joinRadio', function(data)
  local _source = source
  local PlayerData = Framework.Functions.GetPlayerData()
  local playerName = GetPlayerName(PlayerId())
  --local getPlayerRadioChannel = exports["pma-voice"]:GetPlayersInRadioChannel(playerName, "radio:channel")

  if tonumber(data[1]) <= Config.MaxFrequency then
    --if tonumber(data[1]) ~= tonumber(getPlayerRadioChannel) then
      if tonumber(data[1]) <= Config.RestrictedChannels then
        if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'doctor') then
          exports["pma-voice"]:removePlayerFromRadio()
          exports["pma-voice"]:SetRadioChannel(tonumber(data[1]));
          exports["pma-voice"]:addPlayerToRadio(tonumber(data[1]))
          exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
          if SplitStr(data[1], ".")[2] ~= nil and SplitStr(data[1], ".")[2] ~= "" then 
            Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data[1] .. ' MHz </b>', 'success')
          else
            Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data[1] .. '.00 MHz </b>', 'success')
          end
        else
          Framework.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
        end
      end

      if tonumber(data[1]) > Config.RestrictedChannels then
        exports["pma-voice"]:removePlayerFromRadio()
        exports["pma-voice"]:SetRadioChannel(tonumber(data[1]));
        exports["pma-voice"]:addPlayerToRadio(tonumber(data[1]))
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        if SplitStr(data[1], ".")[2] ~= nil and SplitStr(data[1], ".")[2] ~= "" then 
          Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data[1] .. ' MHz </b>', 'success')
        else
          Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data[1] .. '.00 MHz </b>', 'success')
        end
      end
    --else
    --  if SplitStr(data[1], ".")[2] ~= nil and SplitStr(data[1], ".")[2] ~= "" then 
    --    Framework.Functions.Notify(Config.messages['you_on_radio'] .. data[1] .. ' MHz </b>', 'error')
    --  else
    --    Framework.Functions.Notify(Config.messages['you_on_radio'] .. data[1] .. '.00 MHz </b>', 'error')
    --  end
    --end
  else
    Framework.Functions.Notify('Тази честота не е валидна.', 'error')
  end
end)

RegisterNUICallback('joinRadio', function(data, cb)
  local _source = source
  local PlayerData = Framework.Functions.GetPlayerData()
  local playerName = GetPlayerName(PlayerId())
  --local getPlayerRadioChannel = exports["pma-voice"]:GetPlayersInRadioChannel(playerName, "radio:channel")

  if tonumber(data.channel) <= Config.MaxFrequency then
    --if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
      if tonumber(data.channel) <= 5 then
        if(PlayerData.job.name == 'police' ) then
          exports["pma-voice"]:removePlayerFromRadio()
          exports["pma-voice"]:SetRadioChannel(tonumber(data.channel));
          exports["pma-voice"]:addPlayerToRadio(tonumber(data.channel))
          exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
          if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
            Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
          else
            Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
          end
        elseif (tonumber(data.channel) ~= 5) then
          Framework.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
        end
      end
      if (tonumber(data.channel) == 5) or (tonumber(data.channel) == 6) or (tonumber(data.channel) == 7) or (tonumber(data.channel) == 8) or (tonumber(data.channel) == 9) or (tonumber(data.channel) == 10) then
      if(PlayerData.job.name == 'ambulance' ) then
        exports["pma-voice"]:removePlayerFromRadio()
        exports["pma-voice"]:SetRadioChannel(tonumber(data.channel));
        exports["pma-voice"]:addPlayerToRadio(tonumber(data.channel))
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
      elseif (tonumber(data.channel) ~= 5) then
        Framework.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
      end
    end
      if tonumber(data.channel) > Config.RestrictedChannels then
        exports["pma-voice"]:removePlayerFromRadio()
        exports["pma-voice"]:SetRadioChannel(tonumber(data.channel));
        exports["pma-voice"]:addPlayerToRadio(tonumber(data.channel))
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
          Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
        else
          Framework.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
        end
      end
    --else
    --  if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
    --    Framework.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. ' MHz </b>', 'error')
    --  else
    --    Framework.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. '.00 MHz </b>', 'error')
    --  end
    --end
  else
    Framework.Functions.Notify('Тази честота не е валидна.', 'error')
  end
  cb('ok')
end)

RegisterNUICallback('leaveRadio', function(data, cb)
  local playerName = GetPlayerName(PlayerId())
  --local getPlayerRadioChannel = exports["pma-voice"]:GetPlayersInRadioChannel(playerName, "radio:channel")
  --if getPlayerRadioChannel == "nil" then
  --  Framework.Functions.Notify(Config.messages['not_on_radio'], 'error')
  --else
    exports["pma-voice"]:removePlayerFromRadio()
    exports["pma-voice"]:SetRadioChannel(0)
    exports["pma-voice"]:SetMumbleProperty("radioEnabled", false)
    if SplitStr(getPlayerRadioChannel, ".")[2] ~= nil and SplitStr(getPlayerRadioChannel, ".")[2] ~= "" then 
      Framework.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. ' MHz </b>', 'error')
    else
      Framework.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>', 'error')
    end
    
  --end
  cb('ok')
end)

RegisterNUICallback("volumeUp", function()
	if RadioVolume <= 95 then
		RadioVolume = RadioVolume + 5
		Framework.Functions.Notify("Ти увеличи звука на: " .. RadioVolume, "success")
		exports["pma-voice"]:setRadioVolume(RadioVolume)
	else
		Framework.Functions.Notify("Радиото е увеличено на максималното!", "error")
	end
end)

RegisterNUICallback("volumeDown", function()
	if RadioVolume >= 10 then
		RadioVolume = RadioVolume - 5
		Framework.Functions.Notify("Ти увеличи звука на: "  .. RadioVolume, "success")
		exports["pma-voice"]:setRadioVolume(RadioVolume)
	else
		Framework.Functions.Notify("Радиото е намалено на минималното!", "error")
	end
end)

RegisterNUICallback("increaseradiochannel", function(data, cb)
  local newChannel = RadioChannel + 1
  exports["pma-voice"]:SetRadioChannel(newChannel)
  Framework.Functions.Notify("Ти влезна в станция: " .. newChannel, "success")
end)

RegisterNUICallback("decreaseradiochannel", function(data, cb)
  if not onRadio then return end
  local newChannel = RadioChannel - 1
  if newChannel >= 1 then
      exports["pma-voice"]:SetRadioChannel(newChannel)
      Framework.Functions.Notify("Ти влезна в станция: " .. newChannel, "success")
  end
end)

RegisterNUICallback('escape', function(data, cb)
  SetNuiFocus(false, false)
  radioMenu = false
  PhonePlayOut()
  cb('ok')
end)

RegisterNetEvent('nocore-radio:use')
AddEventHandler('nocore-radio:use', function()
  enableRadio(true)
end)

RegisterNetEvent('nocore-radio:onRadioDrop')
AddEventHandler('nocore-radio:onRadioDrop', function()
  local playerName = GetPlayerName(PlayerId())
  --local getPlayerRadioChannel = exports["pma-voice"]:GetPlayersInRadioChannel(playerName, "radio:channel")

  --if getPlayerRadioChannel ~= "nil" then
    exports["pma-voice"]:removePlayerFromRadio()
    exports["pma-voice"]:SetRadioChannel(0)
    exports["pma-voice"]:SetMumbleProperty("radioEnabled", false)
    Framework.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>', 'error')
  --end
end)

function SplitStr(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end