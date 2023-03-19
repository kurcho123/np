--- @param coords vector3
function PlayCupHitSound(coords, isThrower)
    if #(coords - GetEntityCoords(PlayerPedId())) < 5 or isThrower then
        local randomSounds = {
            "pong_hit_cup_0.mp3",
            "pong_hit_cup_1.mp3",
            "pong_hit_cup_2.mp3",
            "pong_hit_cup_3.mp3",
            "pong_hit_cup_4.mp3",
            "pong_hit_cup_5.mp3",
        }

        SendNUIMessage({
            type = "play_sound",
            file = randomSounds[math.random(#randomSounds)]
        })
    end
end

--- @param coords vector3
function PlayPongGround(coords, isThrower)
    if #(coords - GetEntityCoords(PlayerPedId())) < 5 or isThrower then
        local randomSounds = {
            "pong_hit_ground.mp3",
        }

        SendNUIMessage({
            type = "play_sound",
            file = randomSounds[math.random(#randomSounds)]
        })
    end
end

--- @param text string
function ShowNotification(text)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, 5000)
end

--- @param text string
function ShowHelpNotification(text, style)
    SendNUIMessage({
        type = "error_message",
        message = text,
        alert = style,
    })
end

--- @param coords vector3
function DisplayJoinMarker(coords, size)
    local retval, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, true)
    DrawMarker(Config.MarkerType, coords.x, coords.y, groundZ, 0.0, 0.0, 0.0, 0, 0.0, 0.0, size, size, 0.2, Config.MarkerColor.R, Config.MarkerColor.G, Config.MarkerColor.B, Config.MarkerColor.A, false, false, 2, false, false, false, false)
end

--- @param coords vector3
function DisplayEditorMarker(coords, size)
    local retval, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, true)
    DrawMarker(Config.MarkerType, coords.x, coords.y, groundZ, 0.0, 0.0, 0.0, 0, 0.0, 0.0, size, size, 0.2, Config.MarkerColor.R, Config.MarkerColor.G, Config.MarkerColor.B, Config.MarkerColor.A, false, false, 2, false, false, false, false)
end

--- @param amount integer
--- add comma to separate thousands
--- stolen from: http://lua-users.org/wiki/FormattingNumbers
function CommaValue(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end