local Framework = exports['no-core']:GetCoreObject()
local emotes = {
    {name = 'orangejustice', label = 'Orange Justice'},
    {name = 'sheesh', label = 'Sheesh'},
    {name = 'loser', label = 'Loser'},
    {name = 'animerun', label = 'Naruto Run'},
    {name = 'peepo', label = 'Peepo'},
    {name = 'rock', label = 'Rock'},
    {name = 'paper', label = 'Paper'},
    {name = 'scissors', label = 'Scissors'},
    {name = 'leginjury', label = 'Leg Injury'},
    {name = 'cancel', label = 'Cancel Emote', icon = 'fas fa-xmark'},
}
local allowed = {
    'AZR80807',
    'NTZ57114',
    'USF03014',
    'XMH79112',
    'KYA93491',
    'IVO83687',
}

RegisterCommand('toshkoemote', function (source, args)
    local citizenid = Framework.Functions.GetPlayerData().citizenid
    for k, v in ipairs(allowed) do
        if citizenid == v then
            local sendMenu = {}
            sendMenu[#sendMenu+1] = {
                id = 1,
                header = "Toshko Emotes",
                icon = 'fab fa-gripfire',
                isMenuHeader = true
            }
            for i = 1, #emotes do
                sendMenu[#sendMenu+1] = {
                    id = #sendMenu+1,
                    header = emotes[i].label,
                    icon = emotes[i].icon or 'fas fa-angle-right',
                    params = {
                        event = 'toshkoemotes-playemote',
                        args = {
                            emote = emotes[i].name
                        }
                    }
                }
            end
            exports['nocore-context']:openMenu(sendMenu)
        end
    end
end)

AddEventHandler('toshkoemotes-playemote', function (data)
    local ped = PlayerPedId()
    if data.emote == 'orangejustice' then
        local animDict = "div@justice@new"
        local animation = "orangejustice"

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 1, 0, false, false, false)
        end
    elseif data.emote == 'sheesh' then
        local animDict = "clear@custom_anim"
        local animation = "sheesh_clip"

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 48, 0, false, false, false)
        end
    elseif data.emote == 'loser' then
        local animDict = "nikez@taunts@loser"
        local animation = "loser"

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 54, 0, false, false, false)
        end
    elseif data.emote == 'animerun' then
        local animDict = "nikez@anime"
        local animation = "run"

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 49, 0, false, false, false)
        end
    elseif data.emote == 'peepo' then
        local animDict = "nikez@peepo"
        local animation = "shy"

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 49, 0, false, false, false)
        end
    elseif data.emote == 'rock' then
        local animDict = "yoinks@rps@rock"
        local animation = "yoinks_rps_rock_clip"
        
        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end
        
        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 54, 0, false, false, false)
        end
    elseif data.emote == 'paper' then
        local animDict = "yoinks@rps@paper"
        local animation = "yoinks_rps_paper_clip"
        
        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end
        
        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 54, 0, false, false, false)
        end
    elseif data.emote == 'scissors' then
        local animDict = "yoinks@rps@scissors"
        local animation = "yoinks_rps_scissors_clip"
        
        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, -1, 54, 0, false, false, false)
        end
    elseif data.emote == 'leginjury' then
        local animDict = "yoinks@injury@leg"
        local animation = "yoinks_injury_leg_clip"
        
        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end
        
        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            exports['nocore-assets']:RequestAnimationDict(animDict)
            TaskPlayAnim(ped, animDict, animation, 2.0, 2.0, -1, 1, 0, false, false, false)
        end
    elseif data.emote == 'cancel' then
        ClearPedTasks(ped);
    end
end)