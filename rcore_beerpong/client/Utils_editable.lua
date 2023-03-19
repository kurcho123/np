--------------------------------------------------------
-- Variables
--------------------------------------------------------
local cupList = { "prop_cs_paper_cup", "prop_plastic_cup_02" }

--------------------------------------------------------
-- Functions
--------------------------------------------------------
-- Will slowly change value to the defined one
--- @param a object
--- @param b object
--- @param t object
function lerp(a, b, t)
    return a + (b - a) * 0.5 * t
end

-- Returns random value from array "cupList" result will be model name for cup
function GetRandomCupModelName()
    return cupList[math.random(#cupList)]
end

-- Will register a key bind for action defined in "fc" argument name
--- @param fc delegate
--- @param uniqid string
--- @param description string
--- @param key string
--- @param device string
function RegisterKey(fc, uniqid, description, key, device)
    RegisterCommand(uniqid, fc, false)
    RegisterKeyMapping(uniqid, description, device or 'keyboard', key)
end

-- Will return position of rotation
--- @param rotation vector3
function RotationToDirection(rotation)
    local adjustedRotation = {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction = {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

-- will cast raycast to where player is looking
function CastRayCast(entity, flags)
    local ped = PlayerPedId()

    local pos = GetEntityCoords(ped)
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(GetGameplayCamRot())
    local distance = 15.0
    local destination = {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }

    local ray = StartShapeTestRay(pos.x, pos.y, pos.z, destination.x, destination.y, destination.z, flags or (1 + 16), entity or PlayerPedId(), 1)
    local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(ray)

    return retval, hit, endCoords, surfaceNormal, entityHit
end

-- Will draw 3D text
--- @param position vector3
--- @param scale float
--- @param size float
--- @param color table
--- @param text string
function Render3DText(position, scale, size, color, text)
    SetDrawOrigin(position.x, position.y, position.z, 0)
    SetTextScale(scale, size)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Will return calculated forward vector with powerThrow
function GetFinalForwardResult(ignore, otherCam, flag)
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(GetGameplayCamRot())

    if otherCam then
        pos = otherCam.GetCoords()
        cameraCoord = otherCam.GetCoords()
        direction = RotationToDirection(otherCam.GetRotation())
    end

    local distance = 15.0
    local destination = {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }

    local ray = StartShapeTestRay(pos.x, pos.y, pos.z, destination.x, destination.y, destination.z, flag or (4294967295), ignore or PlayerPedId(), 1)
    local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(ray)

    local canShoot = hit ~= 0
    return (endCoords - pos) + vector3(0, 0, 7), canShoot, endCoords
    --return GetEntityForwardVector(playerPed) * PowerThrow + vector3(0, 0, 5)
end

-- Will set heading to player to the vector3 position in parameter
--- @param desiredPosition vector3
function RotatePlayerTowardsCoords(desiredPosition)
    local positionToFace = desiredPosition
    local ped = PlayerPedId()

    local pedPos = GetEntityCoords(ped)

    local x = positionToFace.x - pedPos.x
    local y = positionToFace.y - pedPos.y

    local heading = GetHeadingFromVector_2d(x, y)

    SetEntityHeading(ped, heading)
end

-- Will return true/false if hash is listed cup
--- @param hash int
function IsModelACup(hash)
    for k, v in pairs(cupList) do
        if GetHashKey(v) == hash then
            return true
        end
    end
    return false
end

-- Will get hand position
function GetHandPosition()
    local playerPed = PlayerPedId()
    local oldPos = GetOffsetFromEntityInWorldCoords(playerPed, DirectionSide, 0.1, 0.0)
    local forward = GetEntityForwardVector(playerPed)
    return oldPos + forward * 0.2
end

-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateLocalObject(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    return CreateObject(model, pos.x, pos.y, pos.z, false, false, false)
end

-- Will create a networked object
--- @param hash string/integer
--- @param pos vector3
function CreateNetworkObject(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    return CreateObject(model, pos.x, pos.y, pos.z, true, false, false)
end

--------------------------------------------------------