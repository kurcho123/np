Framework = exports['no-core']:GetCoreObject()
megaTalk = {}
megaPressed = false

function LoadMegaphone()
	RegisterContextSubmix('megaphone')
	SetFilterParameters('megaphone', Cfg.Submixes['megaphone'])
end

RegisterNetEvent('pma-voice:megaphone')
AddEventHandler('pma-voice:megaphone', function()
    print('adding megaphone', megaphone)
	if not megaphone then
	MumbleSetAudioInputDistance(50.0 + 0.0)
	plyState:set('proximity', {
		index = 1,
		distance =  300.0,
		mode = "",
	}, GetConvarInt('voice_syncData', 0) == 1)
	megaphone = true
	--print('megaphone enabled')
	--toggleVoice(playerServerId, false, 'megaphone')
    --SetPlayerFilter(playerServerId, 'megaphone')
	RequestAnimDict('amb@world_human_paparazzi@male@base')
	while not HasAnimDictLoaded('amb@world_human_paparazzi@male@base') do
		Citizen.Wait(10)
	end

	ExecuteCommand("e megaphone")
    elseif megaphone then
        SetPlayerFilter(playerServerId, 'default')
		playMicClicks(false)
		megaphone = false
		MumbleSetAudioInputDistance(50.0 + 0.0)
		plyState:set('proximity', {
			index = 1,
			distance =  15.0,
			mode = "",
		}, GetConvarInt('voice_syncData', 0) == 1)
		ExecuteCommand("e c")
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if megaphone then
			if IsControlJustPressed(0 , 73) then
				megaphone = false
			end
		end
	end
end)

-- function setTalkingOnMegaphone(enabled)
--     local plySource = GetPlayerServerId(PlayerId())
-- 	print(plySource, enabled, 'megaphone')
-- 	toggleVoice(plySource, enabled, 'megaphone')
-- 	megaTalk[plySource] = enabled
-- 	--playMicClicks(enabled)
-- end
-- RegisterNetEvent('pma-voice:setTalkingOnMegaphone', setTalkingOnMegaphone)