local hasFocus, locations, fading, current = false, false, {};

local Framework = nil

CreateThread(function()
    TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)
    while (Framework == nil) do
        Wait(100)
    end
end)


function BuildSelector(data)
    locations, playerData, hasFocus = BuildLocations(data), data, true;
    BuildCamera(1);
    SetNuiFocus(true, true);
    SendNUIMessage({
        event = "show",
    })
end


RegisterNetEvent('nv:selector:show')
AddEventHandler('nv:selector:show', function(data)
    DoScreenFadeIn(100)
    BuildSelector(data)
end)


PlayerJob = {}

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    PlayerJob = Framework.Functions.GetPlayerData().job
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

function BuildCamera(index)
    current = index and locations[index];
    if current then
        current.index, fading, ped = index, true, PlayerPedId()
        DoScreenFadeOut(0);
        RequestCollisionAtCoord(current.spawn.x, current.spawn.y, current.spawn.z);
        RequestCollisionAtCoord(current.coords.x, current.coords.y, current.coords.z);
        SetEntityVisible(ped, false)
        SetEntityCoords(ped, current.spawn.x, current.spawn.y, current.spawn.z);
        SetEntityHeading(ped, current.spawn.w);
        FreezeEntityPosition(ped, true);
        SetEntityCollision(ped, false, false);

        if current.camera then
            SetCamActive(current.camera, false)
        end

        current.camera = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", current.coords.x, current.coords.y, current.coords.z, current.rot.x, current.rot.y, current.rot.z, 60.00, false, 0);
        SetCamActive(current.camera, true);
        RenderScriptCams(true, false, 1, true, true);

        SendNUIMessage({
            event = "update",
            name = current.name,
            label = current.label
        })
        local timeout = 500;
        while not HasCollisionLoadedAroundEntity(ped) and timeout ~= 0 do
            timeout = timeout - 1
            Wait(10)
        end

        Wait(500)

        DoScreenFadeIn(1000);
        fading = false;
    end
end

function Spawn()
    SetGameplayCamRelativeRotation(0.0, 0.0, 0.0);
    local ped, coord = PlayerPedId(), GetGameplayCamCoord();
    SetCamActive(current.camera, false)

    if current.name == "prison" and playerData.jail then
        TriggerEvent("nocore-prison:client:spawn:prison", playerData.jail);
        RenderScriptCams(false, false, 0, true, true);
    else
        RenderScriptCams(false, true, 1000, true, true);
        Wait(200)
    end
    SetEntityVisible(ped, true);
    FreezeEntityPosition(ped, false);
    SetEntityCollision(ped, true, true);
    SendNUIMessage({ event = "hide" });
    SetNuiFocus(false, false);
    Wait(800);
    DestroyCam(current.camera, true);
    locations, playerData, hasFocus, current = nil;
    TriggerEvent('Framework:Client:OnPlayerLoaded')
    TriggerServerEvent("clothing:checkIfNew")
    TriggerEvent("backitems:start")
    TriggerServerEvent('bb-multichar:server:checkPlayer')
end

RegisterNUICallback("spawn", Spawn);

function BuildLocations(data)
    local results = {};

    if data then
        if data.position and not data.jail then
            local coords, rot = BuildCameraProperties(vector3(data.position.x, data.position.y, data.position.z));
            results[1] = { name = "last", label = "Last Location", coords = coords, rot = rot, spawn = vector4(data.position.x, data.position.y, data.position.z, 100) };
        end


        for i=1, #Settings.Locations do
            local location = Settings.Locations[i];
            if (location.name == "prison" and data.jail) or (not location.job or location.job == data.jobname) and not data.jail then
                results[#results+1] = location;
            end
        end
    end

    return results;
end

function BuildCameraProperties(vector)
    return vector-vector3(-26.334, -4.58, -17.80), vector3(-32.76, 4.26, 100.72)
end

RegisterNUICallback("forward", function(data)
    if not fading then
        BuildCamera(locations[current.index+1] ~= nil and current.index+1 or 1);
    end
end)

RegisterNUICallback("backward", function(data)
    if not fading then
        BuildCamera(current.index-1 > 0 and current.index-1 or #locations);
    end
end)

