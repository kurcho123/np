-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

CreateThread(function()
    while true do
        -- This is the Application ID (Replace this with you own)
	SetDiscordAppId(862105158632210432)

        -- Here you will have to put the image name for the "large" icon.
	    SetDiscordRichPresenceAsset('nolag')
        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('NoLag RP')
       
        Framework.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetRichPresence('Players: '..result..'/128 \nNoLag RP 3.0 Public')
        end)

        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Присъедини се!", "https://discord.gg/Eew6wzwh")
        --SetDiscordRichPresenceAction(1, "Second Button!", "fivem://connect/localhost:30120")

        -- It updates every minute just in case.
	Wait(60000)
    end
end)
