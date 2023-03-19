function OpenStorage(StorageId)
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "storage_"..StorageId, {
        maxweight = 1000000,
        slots = 30,
    })
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "storage_"..StorageId)
end