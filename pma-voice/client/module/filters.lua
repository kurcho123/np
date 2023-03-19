SubmixList = {}
SubmixCount = 0

function RegisterContextSubmix(pContext)
    local data = {}

    SubmixCount = SubmixCount + 1

    data.slot = 1
    data.submix = CreateAudioSubmix(pContext)
    
    SubmixList[pContext] = data

    logger.log("[Filter] Registered Submix | %s", pContext)
end

function SetFilterParameters(pContext, pSettings)
    local data = SubmixList[pContext]

    if not data or not pSettings then return end

    if pSettings.radio then 
        SetAudioSubmixEffectRadioFx(data.submix, data.slot)
    end
    SetAudioSubmixEffectParamInt(data.submix, data.slot, `default`, 1)

    if pSettings.filters then
        for _, setting in ipairs(pSettings.filters) do
            SetAudioSubmixEffectParamFloat(data.submix, data.slot, GetHashKey(setting.name), setting.value)
        end
    end

    AddAudioSubmixOutput(data.submix, data.slot)

    logger.log('[Filter] Updated Submix parameters | %s', pContext)
end

function SetPlayerFilter(pServerId, pContext)
    if pContext == "default" then
        MumbleSetSubmixForServerId(pServerId, -1)
    else
        local data = SubmixList[pContext]

        if not data then return end
        MumbleSetSubmixForServerId(pServerId, data.submix)
    end

    logger.log('[Filter] Changed Player Submix | Server ID: %s | Submix: %s', pServerId, pContext)
end