if GetCurrentResourceName() == 'no-core' then 
    function GetSharedObject()
        return Framework
    end

    exports('GetSharedObject', GetSharedObject)
end

Framework = exports['no-core']:GetSharedObject()