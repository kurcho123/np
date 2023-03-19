local Framework = exports['no-core']:GetCoreObject()
local equip = false
local CurrentProp = 0

RegisterNetEvent('zen:katana:equip')
AddEventHandler('zen:katana:equip', function()
    if not equip then
        equip = true
        local katana = {
            ['name'] = 'weapon_katanas',
            ['prop'] = 'katana_sheath',
            ['hash'] = GetHashKey('katana_sheath'),
            ['bone-index'] = {
                ['bone'] = 24817,
                ['X'] = 0.07,
                ['Y'] = -0.15,
                ['Z'] = 0.02,
                ['XR'] = -225.0,
                ['YR'] = 8.0,
                ['ZR'] = 90.0,
            },
        }
        RequestModelHash(katana['prop'])
        CurrentProp = CreateObject(katana['hash'], 0, 0, 0, true, true, true)
        AttachEntityToEntity(CurrentProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), katana['bone-index']['bone']), katana['bone-index']['X'], katana['bone-index']['Y'], katana['bone-index']['Z'], katana['bone-index']['XR'], katana['bone-index']['YR'], katana['bone-index']['ZR'], true, true, false, true, 1, true)
    elseif equip then
        equip = false
        SetModelAsNoLongerNeeded(CurrentProp)
        NetworkRequestControlOfEntity(CurrentProp)
        SetEntityAsMissionEntity(CurrentProp, true, true)
        DetachEntity(CurrentProp, 1, 1)
        DeleteEntity(CurrentProp)
        DeleteObject(CurrentProp)
        CurrentProp = 0
    end
end)