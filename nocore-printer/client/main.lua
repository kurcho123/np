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
InAnim = false


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Framework.Functions.GetPlayerData(function(PlayerData)
            pData = PlayerData
        end)
    end
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    Framework.Functions.GetPlayerData(function(PlayerData)
        pData = PlayerData
    end)
end)



-- Code

RegisterNetEvent('nocore-printer:client:OpenPrinter')
AddEventHandler('nocore-printer:client:OpenPrinter', function(ItemData)
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('nocore-printer:client:PreviewMenu', function(img)
    SendNUIMessage({
        action = "open",
        url = img
    })
    SetNuiFocus(true, false)
    TriggerEvent('animations:client:EmoteCommandStart', {"clipboard16"})
    InAnim = true
end)

RegisterNetEvent('nocore-printer:client:UseDocument')
AddEventHandler('nocore-printer:client:UseDocument', function(ItemData)
    local Players = GetNeareastPlayers()
    local DocumentUrl = ItemData.info.url ~= nil and ItemData.info.url or false
    if #Players >= 1 then
        local sendMenu = {}
        table.insert(sendMenu,{
            id = 1,
            header = "Принтиран документ",
            txt = "",
            isMenuHeader = true
        })
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Виж",
            txt = "виж документа/снимката",
            params = { 
                event = "nocore-printer:client:SeeDocument",
                args = {
                    url = DocumentUrl
                }
            }
        })
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Покажи",
            txt = "покажи документа/снимката",
            params = { 
                event = "nocore-printer:client:ShowDocument",
                args = {
                    url = DocumentUrl
                }
            }
        })
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Затвори",
            txt = "",
            params = { 
                event = "fakeevnettt",
                args = {}
            }
        })
        exports['nocore-context']:openMenu(sendMenu)
    else
        SendNUIMessage({
            action = "open",
            url = DocumentUrl
        })
        SetNuiFocus(true, false)
        TriggerEvent('animations:client:EmoteCommandStart', {"clipboard16"})
        InAnim = true
    end
end)

RegisterNetEvent('nocore-printer:client:ShowDocument')
AddEventHandler('nocore-printer:client:ShowDocument', function(Data)
    local DocumentUrl = Data.url
    local Players = GetNeareastPlayers()
    if #Players == 1 then
        local Data = {
            target = Players[1].playerId,
            url = DocumentUrl
        }
        TriggerServerEvent("nocore-printer:server:ShowDocumentToOtherPlayer", Data)
    elseif #Players > 1 then
        local sendMenu = {}
        table.insert(sendMenu,{
            id = 1,
            header = "Близки играчи",
            txt = "",
            isMenuHeader = true
        })
        for i=1, #Players, 1 do
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = Players[i].playerName .. "[" .. tostring(Players[i].playerId) .. "]",
                txt = "",
                params = { 
                    event = "nocore-printer:client:ShowDocumentToOtherPlayer",
                    args = {
                        target = Players[i].playerId,
                        url = DocumentUrl
                    }
                }
            })
        end
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Затвори",
            txt = "",
            params = { 
                event = "nocore-vehiclekeys:client:fakeevent",
                args = {}
            }
        })
        exports['nocore-context']:openMenu(sendMenu)
    else
        Framework.Functions.Notify('Няма никой наоколо', 'error', 5000, 'Документи')
    end
end)

RegisterNetEvent('nocore-printer:client:SeeDocument')
AddEventHandler('nocore-printer:client:SeeDocument', function(Data)
    local DocumentUrl = Data.url ~= nil and Data.url or false
    SendNUIMessage({
        action = "open",
        url = DocumentUrl
    })
    SetNuiFocus(true, false)
    TriggerEvent('animations:client:EmoteCommandStart', {"clipboard16"})
    InAnim = true
end)

RegisterNetEvent('nocore-printer:client:ShowDocumentToOtherPlayer')
AddEventHandler('nocore-printer:client:ShowDocumentToOtherPlayer', function(data)
	if data ~= nil then
		TriggerServerEvent("nocore-printer:server:ShowDocumentToOtherPlayer", data)
	end
end)

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players = Framework.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 3.0)

    local players_clean = {}
    local found_players = false

    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            table.insert(players_clean, {playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i])} )
        end
    end
    return players_clean
end


RegisterNetEvent('nocore-printer:client:SpawnPrinter')
AddEventHandler('nocore-printer:client:SpawnPrinter', function(ItemData)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = GetHashKey('prop_printer_01')
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetModelAsNoLongerNeeded(model)
    SetEntityAsMissionEntity(obj)
end)

RegisterNUICallback('SaveDocument', function(data)
    print("a guardar documento")
    if data.url ~= nil then
        TriggerServerEvent('nocore-printer:server:SaveDocument', data.url)
    end
end)

RegisterNUICallback('CloseDocument', function()
    SetNuiFocus(false, false)
    if InAnim then
        InAnim = false
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

