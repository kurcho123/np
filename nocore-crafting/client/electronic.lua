local IsDisassembeling = false
local NearElectronicTable = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LocalPlayer.state.isLoggedIn and not IsDisassembeling then
            NearElectronicTable = false
            for k, v in pairs(Config.ElectronicTable) do
                local PlayerCoords = GetEntityCoords(PlayerPedId())
                local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['X'], v['Y'], v['Z'], true)
                if Distance < 2.0 then
                    NearElectronicTable = true
                    Framework.Functions.DrawText3D(v['X'], v['Y'], v['Z'] + 0.1, '~g~E~s~ - Action')
                    DrawMarker(2, v['X'], v['Y'], v['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                    if IsControlJustReleased(0, 38) then
                        Framework.Functions.TriggerCallback('nocore-crafting:server:disassemblе:electrnoics', function(Item)
                            if Item then
                                SetEntityHeading(PlayerPedId(), v['H'])
                                IsDisassembeling = true
                                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
                                Framework.Functions.Progressbar('disasseble', 'Разглобявате електроника', math.random(20000,25000), false, false, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                                disableInventory = true,
                                }, {}, {}, {}, function() -- Done
                                    IsDisassembeling = false
                                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                    Framework.Functions.TriggerCallback('nocore-crafting:server:get:electrnoics', function(retval)
                                        if retval then
                                            print(1)
                                        else
                                            print(2)
                                        end
                                    end, Item)
                                end, function() -- Cancel
                                    IsDisassembeling = false
                                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                end)
                            else
                                Framework.Functions.Notify('Нещо ти липсва..', 'error')
                            end
                        end)
                    end
                end
                if not NearElectronicTable then
                    Citizen.Wait(1500)
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)