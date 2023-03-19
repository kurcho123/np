local Framework = exports['no-core']:GetCoreObject()
local InSellMission = false
local SellItem = nil
local SellItemData = nil
local SellLocation = nil
local SellInfoBlip = nil
local InBuyMission = false
local BuyItem = nil
local BuyItemData = nil
local BuyLocation = nil
local BuyInfoBlip = nil
local BuyInfoProp = nil

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        PlayerData = Framework.Functions.GetPlayerData()
        BackLoop()
    end
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    SetTimeout(1000, function()
        -- TriggerEvent("Framework:GetObject", function(obj)Framework = obj end)
        PlayerData = Framework.Functions.GetPlayerData()
    end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(Onduty)
    PlayerData.job.onduty = Onduty
end)


--   LOCATIONS --
RegisterNetEvent('testevent:client')
AddEventHandler('testevent:client', function(value)
    TriggerEvent('Framework:Notify', value, nil, 6700)
end)


-- SELL PAGE --

RegisterNUICallback('sell', function(data)
    local HasItem = Framework.Functions.HasItem(data.item)
    if HasItem then
        if not InSellMission then
            SellItem = data.item
            SellItemData = Config.SellItems[SellItem]
            Framework.Functions.Notify('Заявката ти е получена изчакай за да получиш локация !', nil, 6700, "Доставка")
            InSellMission = true
            SetTimeout(math.random(20000,60000), function()
                StartSellMission()
            end)
            TriggerEvent("nocore-items:client:damage:gaming-laptop", 2)
        else
            Framework.Functions.Notify('Довърши започнатото..', 'error', 5000, 'Баща ти')
        end
    else
        Framework.Functions.Notify('Какво по-точно ще продаваш?', 'error', 5000, 'Баща ти')
    end
end)

function GetRandomSellLocation()
    return Config.SellLocations[math.random(1, #Config.SellLocations)]
end

function StartSellMission()
    SellLocation = GetRandomSellLocation()
    SellPickUpLocation = SellLocation.pickups[math.random(1, #SellLocation.pickups)]
    Framework.Functions.Notify('Зададена ти е локация за доставката!', nil, 6700, "Доставка")
    SetNewWaypoint(SellLocation.blip.x, SellLocation.blip.y)
    SellInfoBlip = AddBlipForRadius(SellLocation.blip.x, SellLocation.blip.y, SellLocation.blip.z, 75.0)
    SetBlipColour(SellInfoBlip, 27)
    SetBlipAlpha(SellInfoBlip, 128)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if SellLocation ~= nil then
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            if #(PlayerCoords - vector3(SellPickUpLocation.x, SellPickUpLocation.y, SellPickUpLocation.z)) < 2.0 then
                Draw3DText(SellPickUpLocation.x, SellPickUpLocation.y, SellPickUpLocation.z, "[E] За да оставиш поръчката.")
                DrawHelpSell()
            end
        else
            Citizen.Wait(5000)
        end
    end
end)

function DrawHelpSell()
    DisableControlAction(0, 38, true)
    DisableControlAction(0, 68, true)
    DisableControlAction(0, 86, true)
    
    if (IsDisabledControlJustPressed(0, 38)) then
        local HasItem = Framework.Functions.HasItem(SellItem)
        if HasItem then
            Citizen.SetTimeout(750, function()
                exports['nocore-assets']:RequestAnimationDict("mini@repair")
                TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 3.0, 3.0, -1, 8, 0, false, false, false)
                Framework.Functions.Progressbar("open-brick", "Оставяш поръчката..", 7500, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                    disableInventory = true,
                }, {}, {}, {}, function()-- Done
                    Framework.Functions.TriggerCallback('laptop-backend:server:getreward', function(cb)
                        if cb then
                            TriggerServerEvent('Framework:Server:RemoveItem', SellItem, 1)
                            TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items[SellItem], "remove")
                            StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
                            RemoveBlip(SellInfoBlip)
                            SellItem = nil
                            SellItemData = nil
                            SellLocation = nil
                            SellPickUpLocation = nil
                            InSellMission = false
                        end
                    end, SellItemData, SellItem)
                end, function()
                    Framework.Functions.Notify("Отмененo..", "error")
                    StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
                end)
            end)
        end
    end
end

RegisterNetEvent('linkreward:client')
AddEventHandler('linkreward:client', function(item)
    if not InBuyMission then
        BuyItem = item
        InBuyMission = true
        SetTimeout(math.random(20000,60000), function()
            StartBuyMission()
        end)
    end
end)

--   BUY PAGE --
RegisterNUICallback('buy', function(data)
    if not InBuyMission then
        BuyItem = data.item
        BuyItemData = Config.BuyItems[BuyItem]
        print(BuyItemData)
        Framework.Functions.TriggerCallback('laptop-backend:server:startbuy', function(cb)
            if cb then
                Framework.Functions.Notify('Заявката ти е получена изчакай за да получиш локация!', nil, 6700, "Доставка")
                InBuyMission = true
                SetTimeout(math.random(20000,60000), function()
                    StartBuyMission()
                end)
                TriggerEvent("nocore-items:client:damage:gaming-laptop", 2)
            else
                BuyItem = nil
                BuyItemData = nil
                Framework.Functions.Notify('Нямате достатъчно crypto наличност!', 'error', 6700, "Доставка")
            end
        end, BuyItemData)
    else
        Framework.Functions.Notify('Довърши започнатото..', 'error', 5000, 'Баща ти')
    end
end)

function GetRandomBuyLocation()
    return Config.BuyLocations[math.random(1, #Config.BuyLocations)]
end

local PickUpProps = {
    GetHashKey("prop_big_bag_01"),
    GetHashKey("prop_cs_heist_bag_02"),
    GetHashKey("bkr_prop_duffel_bag_01a"),
}

local loop = false
function StartBuyMission()
    BuyLocation = GetRandomBuyLocation()
    Framework.Functions.Notify('Зададена ти е локация за доставката!', nil, 6700, "Доставка")
    SetNewWaypoint(BuyLocation.x, BuyLocation.y)
    BuyInfoBlip = AddBlipForRadius(BuyLocation.x, BuyLocation.y, BuyLocation.z, 15.0)
    SetBlipColour(BuyInfoBlip, 27)
    SetBlipAlpha(BuyInfoBlip, 128)
    loop = true
    Citizen.CreateThread(function()
        while loop do
            Citizen.Wait(0)
            if #(BuyLocation - GetEntityCoords(PlayerPedId())) <= 250 then
                BuyInfoProp = CreateObject(PickUpProps[math.random(1, #PickUpProps)], BuyLocation.x, BuyLocation.y, BuyLocation.z, true, true, false)
                SetEntityHeading(BuyInfoProp, math.random(0, 360) * 1.0)
                PlaceObjectOnGroundProperly(BuyInfoProp)
                exports['nocore-eye']:AddTargetEntity(BuyInfoProp, {
                    options = {
                    {
                        event = "laptop-backend:client:getdelivery",
                        icon = "fas fa-handshake",
                        label = "Вземи"
                    }
                    },
                    distance = 1.5
                })
                loop = false
            else
                Citizen.Wait(1000)
            end
        end
    end)
end

RegisterNetEvent('laptop-backend:client:getdelivery')
AddEventHandler('laptop-backend:client:getdelivery', function(data)
    Framework.Functions.TriggerCallback('laptop-backend:server:getdelivery', function(cb)
        if cb then
            if InBuyMission then
                TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
                NetworkRequestControlOfEntity(data.entity)
                while not NetworkHasControlOfEntity(data.entity) do Citizen.Wait(0) end
                DeleteEntity(data.entity)
                DeleteEntity(BuyInfoProp)
                RemoveBlip(BuyInfoBlip)
                BuyItem = nil
                BuyInfoProp = nil
                InBuyMission = false
            end
        else
            Framework.Functions.Notify('Нещо се обърка', 'error', 5000, 'Доставка')
        end
    end, BuyItem)
end)



--[[ HELPERS ]]
function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end


RegisterNetEvent('laptop-backend:client:givelocation')
AddEventHandler('laptop-backend:client:givelocation', function()
    local randomsex = math.random(1, 2)
    if randomsex == 1 then
        TriggerServerEvent('laptop-backend:emailInfo')
        local item = "card-link2"
        TriggerServerEvent("linkreward:server", item)
    elseif randomsex == 2 then
        TriggerServerEvent('laptop-backend:emailInfo')
        local item = "card-link3"
        TriggerServerEvent("linkreward:server", item)
    end
end)

--[[ Haists ]]

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)



RegisterNUICallback('CheckBobcatHack', function(data, cb)
    local playercoords = GetEntityCoords(PlayerPedId())
    local callback = false
    if #(playercoords - vector3(292.18685, 300.37503, 131.09165)) < 150 then
        Framework.Functions.TriggerCallback('nocore-bobcat:server:getinjectionstate', function(Injected)
            if Injected then
                local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
                if not haveGlobalCooldown then
                    callback = true
                end
            end
        end)
    elseif #(playercoords - vector3(975.52, -2289.16, 34.72)) < 100 then
        Framework.Functions.TriggerCallback('nocore-heists:groveBobcat:server:getinjectionstate', function(Injected)
            if Injected then
                local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(2)
                if not haveGlobalCooldown then
                    callback = true
                end
            end
        end)
    end
    Wait(500)
    cb(callback)
end)

RegisterNUICallback('StartBobcatHack', function(data, cb)
    local playercoords = GetEntityCoords(PlayerPedId())
    if #(playercoords - vector3(292.18685, 300.37503, 131.09165)) < 150 then
        TriggerServerEvent('nocore-bobcat:server:hack')
        Framework.Functions.Notify('Успешно активирахте вируса!', 'success')
        TriggerEvent("nocore-items:client:damage:gaming-laptop", 2)
        TriggerEvent("nocore-dispatch:alerts:bobcat", GetEntityCoords(PlayerPedId()))
        TriggerServerEvent('nocore-police:ActivateCooldown', 2, "Обир на vinewood бобкат")
    elseif #(playercoords - vector3(975.52, -2289.16, 34.72)) < 100 then
        TriggerServerEvent('nocore-heists:groveBobcat:server:hack')
        Framework.Functions.Notify('Успешно активирахте вируса!', 'success')
        TriggerEvent("nocore-items:client:damage:gaming-laptop", 2)
        TriggerEvent("nocore-dispatch:alerts:bobcat", {x = 886.62, y = -2127.0, z = 30.23})
        TriggerServerEvent('nocore-police:ActivateCooldown', 2, "Обир на vinewood бобкат")
    else
        Framework.Functions.Notify('Нямате връзка със сървъра!', 'error')
        TriggerEvent("nocore-items:client:damage:gaming-laptop", 1)
    end
end)

RegisterNUICallback('CheckFleecaHack', function(data, cb)
    Framework.Functions.TriggerCallback('nocore-fleecaheist:server:hasItems2', function(HasItem)
        print(HasItem)
        if HasItem then
            Framework.Functions.TriggerCallback('nocore-fleecaheist:server:CoolDown', function(CoolDown)
                print(CoolDown)
                if CoolDown then
                    -- In CoolDown
                    Framework.Functions.Notify("Изглежда някой те е изпреварил..", "error")
                    cb(false)
                else
                    cb(true)
                end
            end)
        else
            --local StreetLabel = Framework.Functions.GetStreetLabel()
            --TriggerEvent('nocore-police:client:send:bank:alert', GetEntityCoords(PlayerPedId()), StreetLabel)
            cb(false)
        end
    end, 'npv')
end)

RegisterNUICallback('StartFleeca', function()
    TriggerEvent("nocore-items:client:damage:gaming-laptop", 2)
    TriggerEvent("nocore-fleecaheist:client:starthack")
end)

local Framework = exports['no-core']:GetCoreObject()

local CurrentBackItems = {}
local TempBackItems = {}
local checking = true
local currentWeapon = nil
local slots = 40
local s = {}
local BackItems = {
    ["weapon_assaultrifle_mk2"] = {
        model="w_ar_assaultrifle",
        back_bone = 24818,
        x = 0.0,
        y = -0.17,
        z = -0.05,
        x_rotation = 0.0,
        y_rotation = -180.0,
        z_rotation = 180.0,
    },
    ["weapon_carbinerifle_mk2"] = {
        model="w_ar_carbineriflemk2",
        back_bone = 24818,
        x = 0.0,
        y = -0.17,
        z = -0.05,
        x_rotation = 0.0,
        y_rotation = -180.0,
        z_rotation = 180.0,
    },
    ["weapon_sawnoffshotgun"] = {
        model="w_sg_sawnoff",
        back_bone = 24818,
        x = 0.0,
        y = -0.17,
        z = -0.05,
        x_rotation = 0.0,
        y_rotation = -180.0,
        z_rotation = 180.0,
    },
    ["weapon_microsmg"] = {
        model="w_sb_microsmg",
        back_bone = 24818,
        x = 0.0,
        y = -0.17,
        z = -0.05,
        x_rotation = 0.0,
        y_rotation = -180.0,
        z_rotation = 180.0,
    },
    -- pistols
    ["weapon_pistol"] = {
        model="w_pi_pistol",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_pistol_mk2"] = {
        model="w_pi_pistolmk2",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_combatpistol"] = {
        model="w_pi_combatpistol",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_g17"] = {
        model="w_pi_g17",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_pistol50"] = {
        model="w_pi_pistol50",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_snspistol_mk2"] = {
        model="w_pi_sns_pistolmk2",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_ceramicpistol"] = {
        model="w_pi_ceramicpistol",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_heavypistol"] = {
        model="w_pi_heavypistol",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_vintagepistol"] = {
        model="w_pi_vintage_pistol",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    ["weapon_revolver"] = {
        model="w_pi_revolver",
        back_bone = 51826,
        x = 0.05,
        y = 0.0,
        z = 0.12,
        x_rotation = -90.0,
        y_rotation = 0.0,
        z_rotation = 0.0,
    },
    -- meleelarge
    ["weapon_katanas"] = {
        model="w_me_katana_lr",
        back_bone = 24817,
        x = 0.365,
        y = -0.155,
        z = 0.26,
        x_rotation = 0.0,
        y_rotation = 234.0,
        z_rotation = 0.0,
    },
    ["weapon_bread"] = {
        model="w_me_bread",
        back_bone = 24817,
        x = 0.365,
        y = -0.155,
        z = 0.26,
        x_rotation = 0.0,
        y_rotation = 234.0,
        z_rotation = 0.0,
    },
    ["weapon_bat"] = {
        model="w_me_bat",
        back_bone = 24817,
        x = 0.365,
        y = -0.155,
        z = 0.26,
        x_rotation = 0.0,
        y_rotation = 234.0,
        z_rotation = 0.0,
    },
    ["weapon_crowbar"] = {
        model="w_me_crowbar",
        back_bone = 24817,
        x = 0.365,
        y = -0.155,
        z = 0.26,
        x_rotation = 0.0,
        y_rotation = 234.0,
        z_rotation = 0.0,
    },
    ["weapon_golfclub"] = {
        model="w_me_gclub",
        back_bone = 24817,
        x = 0.365,
        y = -0.155,
        z = 0.26,
        x_rotation = 0.0,
        y_rotation = 234.0,
        z_rotation = 0.0,
    },
}

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    resetItems()
end)

RegisterNetEvent("Framework:Client:OnPlayerUnload", function()
    resetItems()
end)

RegisterNetEvent("backitems:start", function()
    Wait(10000)
    BackLoop()
end)

RegisterNetEvent("backitems:displayItems", function(toggle)
    if toggle then 
        for k,v in pairs(TempBackItems) do 
            createBackItem(k)
        end
        BackLoop()
    else 
        TempBackItems = CurrentBackItems
        checking = false
        for k,v in pairs(CurrentBackItems) do
            removeBackItem(k)
        end
        CurrentBackItems = {}
    end
end)

function resetItems()
    removeAllBackItems()
    CurrentBackItems = {}
    TempBackItems = {}
    currentWeapon = nil
    s = {}
    checking = false
end

function BackLoop()
    print("[Backitems]: Starting Loop")
    checking = true
    CreateThread(function()
        while checking do
            local player = Framework.Functions.GetPlayerData()
            while player == nil do 
                player = Framework.Functions.GetPlayerData()
                Wait(500)
            end
            for i = 1, slots do
                s[i] = player.items[i]
            end
            check()
            Wait(1000)
        end
    end)
end

function check()
    for i = 1, slots do
        if s[i] ~= nil then
            local name = s[i].name
            if BackItems[name] then
                if name ~= currentWeapon then
                    createBackItem(name)
                end
            end
        end
    end

    for k,v in pairs(CurrentBackItems) do 
        local hasItem = false
        for j = 1, slots do
            if s[j] ~= nil then
                local name = s[j].name
                if name == k then 
                    hasItem = true
                end
            end
        end
        if not hasItem then 
            removeBackItem(k)
        end
    end
end

function createBackItem(item)
    if not CurrentBackItems[item] then
        if BackItems[item] then 
            local i = BackItems[item]
            local model = i["model"]
            local ped = PlayerPedId()
            local bone = GetPedBoneIndex(ped, i["back_bone"])
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
            end
            SetModelAsNoLongerNeeded(model)
            CurrentBackItems[item] = CreateObject(GetHashKey(model), 1.0, 1.0, 1.0, true, true, false)   
            local y = i["y"]  
            if Framework.Functions.GetPlayerData().charinfo.gender == 1 then y = y + 0.035 end
            AttachEntityToEntity(CurrentBackItems[item], ped, bone, i["x"], y, i["z"], i["x_rotation"], i["y_rotation"], i["z_rotation"], 0, 1, 0, 1, 0, 1)
            SetEntityCompletelyDisableCollision(CurrentBackItems[item], false, true)		
	    end
    end
end

function removeBackItem(item)
    if CurrentBackItems[item] then
        DeleteEntity(CurrentBackItems[item])
        CurrentBackItems[item] = nil
    end
end

function removeAllBackItems()
    for k,v in pairs(CurrentBackItems) do 
        removeBackItem(k)
    end
end

RegisterNetEvent('nocore-weapons:client:set:current:weapon', function(weap, shootbool)
    if weap == nil then
        createBackItem(currentWeapon)
        currentWeapon = nil
    else
        if currentWeapon ~= nil then  
            createBackItem(currentWeapon)
            currentWeapon = nil
        end
        currentWeapon = tostring(weap.name)
        removeBackItem(currentWeapon)
    end
end)

--[[
-- isLoggedIn = true

local slots = 40 -- Range for the inventory check, begins in 1 an finish on slots value, hotbar's slots are 1-5 
local s = {}
local sa = {}
local k = 0
local m = 0

local back_bone = 24818
local x = -0.07
local y = -0.15
local z = 0.0
local x_rotation = 0.0
local y_rotation = 45.0
local z_rotation = 0.0
local selectwep = nil
local valid = false
local weaps = {}
local current = nil 

local rifles = {
    ["weapon_microsmg"] = "w_sb_microsmg",
    ["weapon_smg"] = "w_sb_smg",
    ["weapon_assaultsmg"] = "w_sb_assaultsmg",
    ["weapon_combatpdw"] = "w_sb_pdw",
    ["weapon_gusenberg"] = "w_sb_gusenberg",

    ["weapon_assaultshotgun"] = "w_sg_assaultshotgun",
    ["weapon_bullpupshotgun"] = "w_sg_bullpupshotgun",
    ["weapon_heavyshotgun"] = "w_sg_heavyshotgun",
    ["weapon_pumpshotgun"] = "w_sg_pumpshotgun",
    ["weapon_sawnoffshotgun"] = "w_sg_sawnoff",
    ["weapon_musket"] = "w_ar_musket",

    ["weapon_advancedrifle"] = "w_ar_advancedrifle",
    ["weapon_assaultrifle"] = "w_ar_assaultrifle",
    ["weapon_assaultrifle_mk2"] = "w_ar_assaultriflemk2",
    ["weapon_bullpuprifle"] = "w_ar_bullpuprifle",
    ["weapon_carbinerifle"] = "w_ar_carbinerifle",
    ["weapon_specialcarbine"] = "w_ar_specialcarbine",
    ["weapon_carbinerifle_mk2"] = "w_ar_carbineriflemk2",
    ["weapon_m700"] = "w_sr_M700",
}

local pistols = {
    ["weapon_pistol"] = "w_pi_pistol",
    ["weapon_pistol_mk2"] = "w_pi_pistolmk2",
    ["weapon_combatpistol"] = "w_pi_combatpistol",
    ["weapon_appistol"] = "w_pi_appistol",
    ["weapon_g17"] = "w_pi_g17",
    ["weapon_pistol50"] = "w_pi_pistol50",
    ["weapon_snspistol_mk2"] = "w_pi_sns_pistolmk2",
    ["weapon_ceramicpistol"] = "w_pi_ceramicpistol",
    ["weapon_heavypistol"] = "w_pi_heavypistol",
    ["weapon_vintagepistol"] = "w_pi_vintage_pistol",
    ["weapon_revolver"] = "w_pi_revolver",
    ["weapon_doubleaction"] = "w_pi_doubleaction",
}

local melee = {
    -- ["weapon_knife"] ="prop_w_me_knife_01",
    -- ["weapon_nightstick"] = "w_me_nightstick",
    -- ["weapon_dagger"] = "w_me_dagger",
}

local meleelarge = {
    ["weapon_bat"] = "w_me_bat",
    ["weapon_golfclub"] = "w_me_gclub",
    ["weapon_crowbar"] = "w_me_crowbar",
    ["weapon_katanas"] = "w_me_katana_lr",
}

local polweap = {
    -- ["weapon_stungun"] = "w_pi_stungun",
}






Citizen.CreateThread(function()
    while true do
        if isLoggedIn then 
            local xPlayer = Framework.Functions.GetPlayerData()
            for i = 1, slots do
                sa[i] = s[i]
                s[i] = xPlayer.items[i]
            end
            check()
            Citizen.Wait(500)
        else
            Citizen.Wait(1000)
        end
    end
end)

function check()
    for i = 1, slots do
        k = 0
        if sa[i] ~= nil then
            for j = 1, slots do
                if s[j] ~= nil then
                    if sa[i].name == s[j].name then
                        k = 1
                        break
                    end
                end
            end
        else
            k = 1
        end
        if k == 0 then
            if sa[i] ~= nil then
                if sa[i].type == "weapon" then  
                    DeleteWeapon(sa[i].name)
                end
            end
        end
    end

    for i = 1, slots do
        m = 0
        if s[i] ~= nil then
            for j = 1, slots do
                if sa[j] ~= nil then
                    if s[i].name == sa[j].name then
                        m = 1
                        break
                    end
                end
            end
        else
            m = 1
        end
        if m == 0 then
            if s[i] ~= nil then
                if s[i].type == "weapon"  then
                    if IsPedArmed(PlayerPedId()) then
                        local wp = GetHashKey(s[i].name)
                        local aw = GetSelectedPedWeapon(PlayerPedId())
                        if wp ~= aw then
                            GiveWeap(s[i].name)
                        end
                    else
                        GiveWeap(s[i].name)
                    end
                end
            end
        end
    end
end

RegisterNetEvent('nocore-clothing:check')
AddEventHandler('nocore-clothing:check', function()
    check()
end)

function DeleteWeapon(wep)
    DeleteObject(weaps[wep])
end

function GiveWeap(wep)
    if rifles[wep] ~= nil then
        back_bone = 24818
        x = 0.0
        y = -0.15
        z = 0.10
        x_rotation = 175.0
        y_rotation = -175.0
        z_rotation = 180.0
        valid = true
        selectwep = rifles[wep]
    elseif pistols[wep] ~= nil then
        back_bone = 51826
        x = 0.05
        y = 0.0
        z = 0.12
        x_rotation = -90.0
        y_rotation = 0.0
        z_rotation = 0.0
        valid = true
        selectwep = pistols[wep]
    elseif melee[wep] ~= nil then
        back_bone = 11816
        x = -0.1
        y = -0.15
        z = 0.12
        x_rotation = 0.0
        y_rotation = 135.0
        z_rotation = 0.0
        valid = true
        selectwep = melee[wep]
    elseif meleelarge[wep] ~= nil then
        back_bone = 24817
        x = 0.365
        y = -0.155
        z = 0.26
        x_rotation = 0.0
        y_rotation = 234.0
        z_rotation = 0.0
        valid = true
        selectwep = meleelarge[wep]
    elseif polweap[wep] ~= nil then
        back_bone = 58271
        x = 0.0
        y = 0.05
        z = -0.1
        x_rotation = -65.0
        y_rotation = 0.0
        z_rotation = 0.0
        valid = true
        selectwep = polweap[wep]
    end

    if valid then
        valid = false
        local bone = GetPedBoneIndex(PlayerPedId(), back_bone)
        RequestModel(selectwep)
        while not HasModelLoaded(selectwep) do
            Citizen.Wait(10)
        end
        SetModelAsNoLongerNeeded(selectwep)
        weaps[wep] = CreateObject(GetHashKey(selectwep), 1.0, 1.0, 1.0, true, true, false)   
        AttachEntityToEntity(weaps[wep], PlayerPedId(), bone, x, y, z, x_rotation, y_rotation, z_rotation, 1, 1, 0, 0, 2, 1)
    end
end

RegisterNetEvent('nocore-weapons:client:set:current:weapon', function(weaps)
    if weaps == nil then
        GiveWeap(current)
        current = nil
    else
        if current then
            GiveWeap(current)
            current = nil
        end
        current = tostring(weaps.name)
        DeleteWeapon(current)
    end
end)
]]