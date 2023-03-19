local moneycase = nil
local PlayerHasProp = false

RegisterNetEvent('nocore-items:client:use:money-case')
AddEventHandler('nocore-items:client:use:money-case', function(CaseId)
    TriggerEvent('nocore-inventory:client:close:inventory', true)
    Citizen.Wait(500)
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "moneycase", 'mcase_' .. CaseId, {
        label = 'Куфарче',
        maxweight = 10000, 
        slots = 40
    })
    TriggerEvent("nocore-inventory:client:SetCurrentStash", 'mcase_' .. CaseId)
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Citizen.SetTimeout(1000, function()
        TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
        Citizen.Wait(150)
        isLoggedIn = true
        PlayerData = Framework.Functions.GetPlayerData()
    end)
end)

RegisterNetEvent('nocore-inventory:OnItemAdd')
AddEventHandler('nocore-inventory:OnItemAdd', function(item)
    if item == 'money-case'  then
        CreateMoneyCase()
    end
end)

RegisterNetEvent('nocore-inventory:OnItemRemove')
AddEventHandler('nocore-inventory:OnItemRemove', function(item)
    if item == 'money-case' and PlayerHasProp then
        DestroyMoneyCase()
    end
end)

function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end

function CreateMoneyCase()
    local Player = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(Player))
    local PropName = "prop_security_case_01"
    local PropBone = 57005
    local PropPlacement = {0.15, 0.0, 0.0, 0.0, 270.0, 78.0}
    local PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(PropPlacement)
    
    if not HasModelLoaded(PropName) then
        LoadPropDict(PropName)
    end
    
    moneycase = CreateObject(GetHashKey(PropName), x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(moneycase, Player, GetPedBoneIndex(Player, PropBone), PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6, true, true, false, true, 1, true)
    PlayerHasProp = true
    SetModelAsNoLongerNeeded(PropName)
end

function DestroyMoneyCase()
    DeleteEntity(moneycase)
    PlayerHasProp = false
end