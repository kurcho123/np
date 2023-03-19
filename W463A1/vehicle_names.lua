function AddTextEntry (key, value)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"),  key,    value)
end
Citizen.CreateThread(function()
    AddTextEntry('0x590E96CB', 'Mercedes-Benz G800 Brabus')
end)