local Framework = exports['no-core']:GetCoreObject()
local dumpsterTypes = {
    [`prop_cs_dumpster_01a`] = true,
    [`prop_dumpster_02a`] = true,
    [`prop_dumpster_01a`] = true,
    [`prop_dumpster_02b`] = true,
    [`prop_dumpster_4b`] = true,
    [`prop_dumpster_3a`] = true,
    [`prop_bin_05a`] = true,
}

local cachedBins = {}

local function CameraForwardVec()
    local rot = (math.pi / 180.0) * GetGameplayCamRot(2)
    return vector3(-math.sin(rot.z) * math.abs(math.cos(rot.x)), math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function Raycast(dist)
    local start = GetGameplayCamCoord()
    local target = start + (CameraForwardVec() * dist)
 
    local ray = StartShapeTestRay(start, target, -1, PlayerPedId(), 1)
    local a, b, c, d, ent = GetShapeTestResult(ray)
    return {
        a = a,
        b = b,
        HitPosition = c,
        HitCoords = d,
        HitEntity = ent
    }
end
local loopActive = false

local function Interaction(bin)
    loopActive = true
    cachedBins[bin] = true
    if loopActive then
        Framework.Functions.Progressbar("search-trash", 'Ровене..', math.random(10000, 12500), false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            Framework.Functions.TriggerCallback('nocore-materials:server:get:reward', function() end)
            StopAnimTask(PlayerPedId(), 'mini@repair', "fixing_a_ped", 1.0)
            loopActive = false
        end, function()
            StopAnimTask(PlayerPedId(), 'mini@repair', "fixing_a_ped", 1.0)
            Framework.Functions.Notify("Не успя", "error")
            loopActive = false
            cachedBins[bin] = false
        end, 'fa-solid fa-trash-can')
    end
end

AddEventHandler('nocore-materials:client:search:trash', function()
    local inFront = Raycast(25.0)
    if inFront.HitEntity ~= 0 and IsEntityAnObject(inFront.HitEntity) then
        if not cachedBins[inFront.HitEntity] then
            local model = GetEntityModel(inFront.HitEntity)
            if dumpsterTypes[model] then
                Interaction(inFront.HitEntity)
            end
        else
            Framework.Functions.Notify("Тази кофа е преровена..", "error")
        end
    end
end)