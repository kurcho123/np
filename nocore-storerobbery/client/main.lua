Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Framework = exports['no-core']:GetCoreObject()



--- CODE
local uiOpen = false
local currentRegister = 0
local currentSafe = 0
local PlayerJob = {}
local onDuty = false
local usingAdvanced = false

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    setupRegister()
    setupSafes()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = false
        for k, v in pairs(Config.Registers) do
            -- local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)
            local dist = #(pos - vector3(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z))
            
            if dist <= 1 and Config.Registers[k].robbed then
                inRange = true
                DrawText3Ds(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z, 'Касата е обрана...')
            end
        end
        if not inRange then
            Citizen.Wait(2000)
        end
        Citizen.Wait(3)
    end
end)

local CurrentCadets = 0
local CurrentCops = 0

RegisterNetEvent('nocore-police:SetCopCount')
AddEventHandler('nocore-police:SetCopCount', function(Cadets, Cops)
    CurrentCadets = Cadets
    CurrentCops = Cops
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local inRange = false
        if Framework ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            for safe, _ in pairs(Config.Safes) do
                local dist = #(pos - vector3(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z))
                -- local dist = GetDistanceBetweenCoords(pos, Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z)
                if dist < 3 then
                    inRange = true
                    if dist < 1.0 then
                        if not Config.Safes[safe].robbed then
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, '~g~E~w~ - Разбийте сейфа')
                            if IsControlJustPressed(0, Keys["E"]) then
                                if CurrentCops >= Config.MinimumStoreRobberyPolice then
                                    local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(1)
                                    if haveGlobalCooldown then
                                        return
                                    end
                                    currentSafe = safe
                                    if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                                        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                                    end
                                    local cameraId = Config.Safes[safe].camId
                                    TriggerEvent('nocore-dispatch:alerts:storerobbery', cameraId)
                                    if Config.Safes[safe].type == "keypad" then
                                        SendNUIMessage({
                                            action = "openKeypad",
                                        })
                                        SetNuiFocus(true, true)
                                    else
                                        Framework.Functions.TriggerCallback('nocore-storerobbery:server:getPadlockCombination', function(combination)
                                            TriggerEvent("SafeCracker:StartMinigame", combination)
                                        end, safe)
                                    end
                                else
                                    Framework.Functions.Notify("Няма достатъчно полицаи", "error")
                                end
                            end
                        else
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, 'Сейфа е разбит..')
                        end
                    end
                end
            end
        end
        
        if not inRange then
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    PlayerJob = Framework.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('Framework:Client:SetDuty')
AddEventHandler('Framework:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)


local blocked = nil

RegisterNetEvent('nocore-items:client:use:lockpick')
AddEventHandler('nocore-items:client:use:lockpick', function(isAdvanced)
    usingAdvanced = isAdvanced
    for k, v in pairs(Config.Registers) do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = #(pos - vector3(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z))
        if dist <= 1 and not Config.Registers[k].robbed then
            if CurrentCops >= Config.MinimumStoreRobberyPolice then
                local haveGlobalCooldown = exports['nocore-police']:checkGlobalCooldown(1)
                if haveGlobalCooldown then
                    return
                end
                if usingAdvanced then
                    lockpick(true)
                    currentRegister = k
                    if not IsWearingHandshoes() then
                        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                    end
                else
                    Framework.Functions.TriggerCallback('Framework:HasItem', function(result)
                        if result then
                            lockpick(true)
                            currentRegister = k
                            if not IsWearingHandshoes() then
                                TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                            end
                        else
                            Framework.Functions.Notify("Изглежда, че ви липсва отвертка..", "error")
                        end
                    end, "screwdriverset")
                end
            else
                Framework.Functions.Notify("Няма достатъчно полицаи", "error")
            
            end
        end
    end
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function setupRegister()
    Framework.Functions.TriggerCallback('nocore-storerobbery:server:getRegisterStatus', function(Registers)
        for k, v in pairs(Registers) do
            Config.Registers[k].robbed = Registers[k].robbed
        end
    end)
end

function setupSafes()
    Framework.Functions.TriggerCallback('nocore-storerobbery:server:getSafeStatus', function(Safes)
        for k, v in pairs(Safes) do
            Config.Safes[k].robbed = Safes[k].robbed
        end
    end)
end

DrawText3Ds = function(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function lockpick(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
    uiOpen = bool
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

function takeAnim(safe)
    if not Config.Safes[safe].robbed then
        local ped = PlayerPedId()
        while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
            RequestAnimDict("amb@prop_human_bum_bin@idle_b")
            Citizen.Wait(100)
        end
        TriggerServerEvent('nocore-police:ActivateCooldown', 1, "Обир на магазин")
        TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 50, 0, false, false, false)
        Framework.Functions.Progressbar("SafeCrack", "Отваряте сейфа..", math.random(3000, 4500) * 60, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done
            TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "exit", 8.0, 8.0, -1, 50, 0, false, false, false)
            Framework.Functions.TriggerCallback('nocore-storerobbery:SafeReward', function()
                end, safe)
        end, function()
            Framework.Functions.Notify("Отмененo..", "error")
            TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "exit", 8.0, 8.0, -1, 50, 0, false, false, false)
        end)
    else
        Framework.Functions.Notify('Сейфа вече е обран')
    end
--end)
end

local openingDoor = false
RegisterNUICallback('success', function()
    if currentRegister ~= 0 then
        lockpick(false)
        TriggerServerEvent('nocore-storerobbery:server:setRegisterStatus', currentRegister)
        local lockpickTime = 30000
        LockpickDoorAnim(lockpickTime)
        Framework.Functions.Progressbar("search_register", "Изпразвате касата..", lockpickTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {
            animDict = "veh@break_in@0h@p_m_one@",
            anim = "low_force_entry_ds",
            flags = 16,
        }, {}, {}, function()-- Done
            openingDoor = false
            ClearPedTasks(PlayerPedId())
            Framework.Functions.TriggerCallback('nocore-storerobbery:takeMoney', function()
                end, currentRegister, true)
            currentRegister = 0
        end, function()-- Cancel
            openingDoor = false
            ClearPedTasks(PlayerPedId())
            Framework.Functions.Notify("Отказахте процеса..", "error")
            currentRegister = 0
        end)
        Citizen.CreateThread(function()
            while openingDoor do
                TriggerServerEvent('nocore-hud:Server:GainStress', math.random(1, 2))
                Citizen.Wait(10000)
            end
        end)
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            Framework.Functions.TriggerCallback('nocore-storerobbery:takeMoney', function()
                end, currentRegister, false)
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

RegisterNetEvent('nocore-storerobbery:client:executeEvents')
AddEventHandler('nocore-storerobbery:client:executeEvents', function()
    TriggerServerEvent('nocore-storerobbery:server:takeMoney', currentRegister, true)
    TriggerServerEvent("nocore-storerobbery:server:SafeReward")
end)

RegisterNUICallback('callcops', function()
    TriggerEvent("police:SetCopAlert")
end)

RegisterNetEvent('SafeCracker:EndMinigame')
AddEventHandler('SafeCracker:EndMinigame', function(won)
    if currentSafe ~= 0 then
        if won then
            if currentSafe ~= 0 then
                if not Config.Safes[currentSafe].robbed then
                    SetNuiFocus(false, false)
                    --[[ Framework.Functions.TriggerCallback('nocore-storerobbery:SafeReward', function()
                    end, currentSafe) ]]
                    TriggerServerEvent("nocore-storerobbery:server:setSafeStatus", currentSafe)
                    takeAnim(currentSafe)
                    currentSafe = 0
                
                end
            else
                SendNUIMessage({
                    action = "kekw",
                })
            end
        end
    end
end)

RegisterNUICallback('PadLockSuccess', function()
    if currentSafe ~= 0 then
        if not Config.Safes[currentSafe].robbed then
            SendNUIMessage({
                action = "kekw",
            })
        end
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

RegisterNUICallback('PadLockClose', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("CombinationFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('fail', function()
    if usingAdvanced then
        if math.random(1, 100) < 20 then
            TriggerServerEvent("Framework:Server:RemoveItem", "advancedlockpick", 1)
            TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items["advancedlockpick"], "remove")
            Framework.Functions.Notify("Локпика ви се прецака..")
        end
    else
        if math.random(1, 100) < 40 then
            TriggerServerEvent("Framework:Server:RemoveItem", "lockpick", 1)
            TriggerEvent('nocore-inventory:client:ItemBox', Framework.Shared.Items["lockpick"], "remove")
            Framework.Functions.Notify("Локпика ви се прецака..")
        end
    end
    if (IsWearingHandshoes() and math.random(1, 100) <= 25) then
        local pos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    lockpick(false)
end)

RegisterNUICallback('exit', function()
    lockpick(false)
end)

RegisterNUICallback('TryCombination', function(data, cb)
    Framework.Functions.TriggerCallback('nocore-storerobbery:server:isCombinationRight', function(combination)
        if tonumber(data.combination) ~= nil then
            if tonumber(data.combination) == combination then
                TriggerServerEvent("nocore-storerobbery:server:setSafeStatus", currentSafe)
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = "closeKeypad",
                    error = false,
                })
                takeAnim(currentSafe)
                currentSafe = 0
            else
                SetNuiFocus(false, false)
                SendNUIMessage({
                    action = "closeKeypad",
                    error = true,
                })
                currentSafe = 0
            end
        end
    end, currentSafe)
end)

RegisterNetEvent('nocore-storerobbery:client:setRegisterStatus')
AddEventHandler('nocore-storerobbery:client:setRegisterStatus', function(register, bool)
    Config.Registers[register].robbed = bool
end)

RegisterNetEvent('nocore-storerobbery:client:setSafeStatus')
AddEventHandler('nocore-storerobbery:client:setSafeStatus', function(safe, bool)
    Config.Safes[safe].robbed = bool
end)

RegisterNetEvent('nocore-storerobbery:client:robberyCall')
AddEventHandler('nocore-storerobbery:client:robberyCall', function(type, key, streetLabel, coords)
    local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[key].camId
    else
        cameraId = Config.Registers[key].camId
    end
    TriggerEvent('nocore-dispatch:alerts:storerobbery', cameraId)
end)


function NearSafe()
    local PlayerPos = GetEntityCoords(PlayerPedId())
    local inRange = false
    for safe, _ in pairs(Config.Safes) do
        local dist = #(PlayerPos - vector3(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z))
        if dist < 50 then
            inRange = true
        end
    end
    return inRange
end