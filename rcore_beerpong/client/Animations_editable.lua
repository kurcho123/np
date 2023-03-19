function PlayWinnerPedAnimation()
    ClearPedTasks(PlayerPedId())
    local randomAnim = {
        {
            anim = "clown",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "clown2",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "argue",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "argue",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "dance5",
            clearInTime = 5000, -- 2000 = 2 seconds
        },
        {
            anim = "golfswing",
            clearInTime = 4000, -- 2000 = 2 seconds
        },
        {
            anim = "curtsy",
        },
    }

    CreateThread(function()
        local finalAnim = randomAnim[math.random(#randomAnim)]
        Animation.Play(finalAnim.anim)
        if finalAnim.clearInTime then
            Wait(finalAnim.clearInTime)
            ClearPedTasks(PlayerPedId())
        end
    end)
end

function PlayScorePedAnimation()
    local randomAnim = {
        {
            anim = "twerk",
        },
        {
            anim = "bringiton",
        },
        {
            anim = "adjusttie",
        },
        {
            anim = "comeatmebro",
        },
        {
            anim = "damn",
        },
        {
            anim = "flip",
        },
        {
            anim = "flip2",
        },
        {
            anim = "slide3",
        },
    }
    CreateThread(function()
        local finalAnim = randomAnim[math.random(#randomAnim)]
        Animation.Play(finalAnim.anim)
    end)
end

function PlayPedMissAnimation()
    local randomAnim = {
        {
            anim = "chicken",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "bark",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "argue",
            clearInTime = 2000, -- 2000 = 2 seconds
        },
        {
            anim = "facepalm",
        },
        {
            anim = "facepalm2",
        },
        {
            anim = "facepalm3",
        },
    }

    CreateThread(function()
        local finalAnim = randomAnim[math.random(#randomAnim)]
        Animation.Play(finalAnim.anim)
        if finalAnim.clearInTime then
            Wait(finalAnim.clearInTime)
            ClearPedTasks(PlayerPedId())
        end
    end)
end