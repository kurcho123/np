local Framework = exports['no-core']:GetCoreObject()

RegisterNetEvent('nocore-judge:client:lawyer:add:closest', function()
local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 1.5 then
        local ServerId = GetPlayerServerId(Player)
        TriggerServerEvent('nocore-judge:lawyer:add', ServerId)
    end
end)

RegisterNetEvent("nocore-judge:client:show:pass", function(data)
    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Адв.Номер:</strong> {1} <br><strong>Име:</strong> {2} <br><strong>Фамилия:</strong> {3} <br><strong>ЕГН:</strong> {4} </div></div>',
        args = {'Адвокатска карта', data.id, data.firstname, data.lastname, data.citizenid}
    })
end)