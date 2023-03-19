-- AFK Kick Time Limit (in seconds)
local group = 'user'
local secondsUntilKick = 1800
local Framework = exports['no-core']:GetCoreObject()
local prevPos, time = nil, nil

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    Framework.Functions.TriggerCallback('nocore-afkkick:server:GetPermissions', function(UserGroup)
        group = UserGroup
    end)
end)

RegisterNetEvent('Framework:Client:OnPermissionUpdate', function(UserGroup)
    group = UserGroup
end)

CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        if LocalPlayer.state.isLoggedIn then
            if group == 'user' then
                local currentPos = GetEntityCoords(playerPed, true)
                if prevPos ~= nil then
                    if currentPos == prevPos then
                        if time ~= nil then
                            if time > 0 then
                                if time == (900) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (600) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (300) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (150) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (60) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minute!', 'error', 10000)
                                elseif time == (30) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                                elseif time == (20) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                                elseif time == (10) then
                                    Framework.Functions.Notify('You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                                end
                                time = time - 1
                            else
                                TriggerServerEvent('KickForAFK')
                            end
                        else
                            time = secondsUntilKick
                        end
                    else
                        time = secondsUntilKick
                    end
                end
                prevPos = currentPos
            end
        end
    end
end)
