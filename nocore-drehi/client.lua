local Framework = exports['no-core']:GetCoreObject()

RegisterCommand('redeem', function ()
    local input = lib.inputDialog('Redeem', {'Code'})

    if not input then return end
    local success = lib.callback.await('nocore-code:checkValid', false, input[1])
    if success then
        Framework.Functions.Notify('Успешно получи своята закупена услуга', 'success')
    else
        Framework.Functions.Notify('Не беше намерен такъв активен код', 'error')
    end
end, false)