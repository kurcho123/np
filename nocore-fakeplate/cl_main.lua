
local playerPed, playerCoords = PlayerPedId(), vec3(0, 0, 0)
local currentVehicle, inVehicle = nil, false
Framework = exports[Config.CorePrefix]:GetCoreObject()
PlayerData = {}
isLoggedIn = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Citizen.Wait(150)
        isLoggedIn = true
        PlayerData = Framework.Functions.GetPlayerData()
    end
end)

RegisterNetEvent(Config.CoreName..":Client:OnPlayerLoaded")
AddEventHandler(Config.CoreName..":Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1000, function()
        Citizen.Wait(150)
        isLoggedIn = true
        PlayerData = Framework.Functions.GetPlayerData()
    end)
end)

RegisterNetEvent(Config.CoreName..':Client:OnJobUpdate')
AddEventHandler(Config.CoreName..':Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent(Config.CoreName..':Client:SetDuty')
AddEventHandler(Config.CoreName..':Client:SetDuty', function(Onduty)
    PlayerData.job.onduty = Onduty
end)

--[[ Garbage Coletor ]]

CreateThread(function()
    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        currentVehicle = GetVehiclePedIsIn(playerPed, false)
        if currentVehicle ~= 0 then inVehicle = true elseif inVehicle then inVehicle = false end
        Wait(1000)
    end
end)

RegisterNetEvent('nocore-fakeplate:client:use:toolkit')
AddEventHandler('nocore-fakeplate:client:use:toolkit', function()
    local vehicle = Framework.Functions.GetClosestVehicle()
    if vehicle ~= nil and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(vehicle)) < 3.5 and not inVehicle then 
        if Config.QbMenu then
            exports['qb-menu']:openMenu({
                { header = Config.ContextMenu.Header, isMenuHeader = true },
                { header = Config.ContextMenu.Change.Header, txt = Config.ContextMenu.Change.Info, params = { event = "nocore-fakeplate:client:use:toolkit:set", args = { veh = vehicle } } },
                { header = Config.ContextMenu.Remove.Header, txt = Config.ContextMenu.Remove.Info, params = { event = "nocore-fakeplate:client:use:toolkit:remove", args = { veh = vehicle } } },
            })
        else
            local sendMenu = {}
            table.insert(sendMenu,{
                id = 1,
                header = Config.ContextMenu.Header,
                txt = "",
                isMenuHeader = true
            })
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = Config.ContextMenu.Change.Header,
                txt = Config.ContextMenu.Change.Info,
                params = { 
                    event = "nocore-fakeplate:client:use:toolkit:set",
                    args = {
                        veh = vehicle
                    }
                }
            })
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = Config.ContextMenu.Remove.Header,
                txt = Config.ContextMenu.Remove.Info,
                params = { 
                    event = "nocore-fakeplate:client:use:toolkit:remove",
                    args = {
                        veh = vehicle
                    }
                }
            })
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = Config.ContextMenu.Close,
                txt = "",
                params = { 
                    event = "fakeevnettt",
                    args = {}
                }
            })
            exports['nocore-context']:openMenu(sendMenu)
        end
    end
end)

RegisterNetEvent('nocore-fakeplate:client:use:toolkit:set')
AddEventHandler('nocore-fakeplate:client:use:toolkit:set', function(data)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local vehicle = data.veh
    for k, v in pairs(Config.FakePlateAccess) do
        if #(v.coords - pedCoords) <= v.distance and PlayerData.job.name == v.job and PlayerData.job.grade.level >= v.jobGrade and vehicle ~= nil then
            local vehprops = Framework.Functions.GetVehicleProperties(vehicle)
            local RealPlate = vehprops.plate
            if GetRealPlate(RealPlate) ~= RealPlate then return end
            Framework.Functions.TriggerCallback("nocore-fakeplate:server:is:owned", function(IsOwned)
                print(IsOwned)
                if IsOwned then
                    print('GeneratedPlate')
                    Framework.Functions.TriggerCallback('nocore-fakeplate:server:generate:fakeplate', function(GeneratedPlate)
                        print(GeneratedPlate)
                        if GeneratedPlate ~= nil then
                            if Config.UseDpEmotes then
                                TriggerEvent('dp:EmoteStart', {"mechanic3"})
                            else
                                LoadAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
                                TaskPlayAnim(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 2.0, 2.0, -1, 0, 0, false, false, false)
                                RemoveAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
                            end
                            Framework.Functions.Progressbar('Switchplate', Config.Progressbar.Label, Config.Progressbar.Duration, false, false, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                            disableInventory = true,
                            }, {}, {}, {}, function() -- Done
                                local FakePlate = GeneratedPlate
                                vehprops.plate = FakePlate
                                NetworkRequestControlOfEntity(vehicle)
                                while not NetworkHasControlOfEntity(vehicle) do Citizen.Wait(0) end
                                Framework.Functions.SetVehicleProperties(vehicle, vehprops)
                                if Config.Nolag ~= nil and Config.Nolag then
                                    exports['nocore-vehiclekeys']:SetVehicleKey(FakePlate, true)
                                else
                                    TriggerEvent('vehiclekeys:client:SetOwner', FakePlate)
                                end
                                TriggerServerEvent("nocore-fakeplate:server:set:fakeplate", RealPlate, FakePlate)
                                if Config.UseDpEmotes then
                                    TriggerEvent('dp:EmoteCancel')
                                else
                                    ClearPedTasks(PlayerPedId())
                                end
                            end, function() -- Cancel
                                if Config.UseDpEmotes then
                                    TriggerEvent('dp:EmoteCancel')
                                else
                                    ClearPedTasks(PlayerPedId())
                                end
                                Framework.Functions.Notify('Failed.', 'error', 6000, 'License Plates')
                            end)
                        else
                            print('No licenseplate')
                        end
                    end)
                end
            end, RealPlate)
        end
    end
end)

RegisterNetEvent('nocore-fakeplate:client:use:toolkit:remove')
AddEventHandler('nocore-fakeplate:client:use:toolkit:remove', function(data)
    local vehicle = data.veh
    if vehicle ~= nil then
        local vehprops = Framework.Functions.GetVehicleProperties(vehicle)
        local FakePlate = vehprops.plate
        if FakePlate ~= nil and FakePlate ~= "" and FakePlate ~= " " then
            Framework.Functions.TriggerCallback("nocore-fakeplate:server:is:abletoremove", function(AbleToRemove)
                if AbleToRemove then
                    if Config.UseDpEmotes then
                        TriggerEvent('dp:EmoteStart', {"mechanic3"})
                    else
                        LoadAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
                        TaskPlayAnim(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 2.0, 2.0, -1, 0, 0, false, false, false)
                        RemoveAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
                    end
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "open",
                        plate = FakePlate
                    })
                end
            end, FakePlate)
        end
    end
end)

RegisterNetEvent('nocore-fakeplate:client:set:fakeplate')
AddEventHandler('nocore-fakeplate:client:set:fakeplate', function()
    local vehicle = Framework.Functions.GetClosestVehicle()
    if vehicle ~= nil then
        local vehprops = Framework.Functions.GetVehicleProperties(vehicle)
        local RealPlate = vehprops.plate
        Framework.Functions.TriggerCallback('nocore-fakeplate:server:get:fakeplate', function(FakePlate)
            if FakePlate ~= nil then
                vehprops.plate = FakePlate
                NetworkRequestControlOfEntity(vehicle)
                while not NetworkHasControlOfEntity(vehicle) do Citizen.Wait(0) end
                Framework.Functions.SetVehicleProperties(vehicle, vehprops)
                TriggerServerEvent("nocore-fakeplate:server:set:fakeplate", RealPlate, FakePlate)
            else
                print('error')
            end
        end, RealPlate)
    end
end)

function GetRealPlate(FakePlate) -- To get Real Plate it needs to get The Fake Plate
    local cb = nil
    Framework.Functions.TriggerCallback('nocore-fakeplate:server:get:realplate', function(RealPlate)
        if RealPlate ~= nil then
            cb = RealPlate
        else
            cb = FakePlate
        end
    end, FakePlate)
    while cb == nil do Citizen.Wait(0) end
    return cb
end
exports('GetRealPlate', GetRealPlate)

function GetFakePlate(RealPlate) -- To get Fake Plate it needs to get The Real Plate
    local cb = nil
    Framework.Functions.TriggerCallback('nocore-fakeplate:server:get:fakeplate', function(FakePlate)
        if FakePlate ~= nil then
            cb = FakePlate
        else
            cb = RealPlate
        end
    end, RealPlate)
    while cb == nil do Citizen.Wait(0) end
    return cb
end
exports('GetFakePlate', GetFakePlate)

function AddPlate(Plate) -- To get Fake Plate it needs to get The Real Plate
    TriggerServerEvent("nocore-fakeplate:server:add:plate", Plate)
end
exports('AddPlate', AddPlate)

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

--[[ NUI Callbacks ]]

RegisterNUICallback('escape', function(data, cb)
    if Config.UseDpEmotes then
        TriggerEvent('dp:EmoteCancel')
    else
        ClearPedTasks(PlayerPedId())
    end
    SetNuiFocus(false, false)
end)

RegisterNUICallback('getlicenseplate', function(data, cb)
    SetNuiFocus(false, false)
    local FakePlate = data.plate
    local RealPlate = GetRealPlate(FakePlate)
    if Config.UseDpEmotes then
        TriggerEvent('dp:EmoteCancel')
    else
        ClearPedTasks(PlayerPedId())
    end
    if RealPlate ~= FakePlate then
        Framework.Functions.TriggerCallback('nocore-fakeplate:server:get:realplate', function(RealPlate)
            if RealPlate ~= nil then
                local vehicle = Framework.Functions.GetClosestVehicle()
                local vehprops = Framework.Functions.GetVehicleProperties(vehicle)
                vehprops.plate = RealPlate
                NetworkRequestControlOfEntity(vehicle)
                while not NetworkHasControlOfEntity(vehicle) do Citizen.Wait(0) end
                Framework.Functions.SetVehicleProperties(vehicle, vehprops)
                TriggerServerEvent("nocore-fakeplate:server:remove:fakeplate", FakePlate, RealPlate)
                if Config.GetPlateOnRemove then
                    TriggerServerEvent("nocore-fakeplate:server:get:plate", FakePlate, false)
                end
            else
                print('error')
            end
        end, FakePlate)
    elseif FakePlate ~= nil and FakePlate ~= "" and FakePlate ~= " " then -- ADD owned
        Framework.Functions.TriggerCallback("nocore-fakeplate:server:is:owned", function(IsOwned)
            if not IsOwned then
                TriggerServerEvent("nocore-fakeplate:server:get:plate", data.plate)
            end
        end, FakePlate)
    end
end)

RegisterNetEvent('nocore-fakeplate:client:remove:plate')
AddEventHandler('nocore-fakeplate:client:remove:plate', function()
    local vehicle = Framework.Functions.GetClosestVehicle()
    if vehicle ~= nil then
        local vehprops = Framework.Functions.GetVehicleProperties(vehicle)
        vehprops.plate = ""
        NetworkRequestControlOfEntity(vehicle)
        while not NetworkHasControlOfEntity(vehicle) do Citizen.Wait(0) end
        Framework.Functions.SetVehicleProperties(vehicle, vehprops)
    end
end)

