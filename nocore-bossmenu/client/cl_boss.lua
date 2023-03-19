local Framework = exports['no-core']:GetCoreObject()
local PlayerJob = Framework.Functions.GetPlayerData().job
local shownBossMenu = false
local DynamicMenuItems = {}

-- UTIL
local function CloseMenuFull()
    exports['nocore-context']:closeMenu()
    shownBossMenu = false
end

local function comma_value(amount)
    local formatted = amount
    while true do
        local k
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

local function AddBossMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports("AddBossMenuItem", AddBossMenuItem)

local function RemoveBossMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports("RemoveBossMenuItem", RemoveBossMenuItem)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = Framework.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    PlayerJob = Framework.Functions.GetPlayerData().job
end)

RegisterNetEvent('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('nocore-bossmenu:client:OpenMenu', function()
    if not PlayerJob.name or not PlayerJob.isboss then return end

    local bossMenu = {
        {
            header = "Шефско меню - " .. string.upper(PlayerJob.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
        {
            header = "Управление на служителите",
            txt = "Списък с всички служители",
            icon = "fa-solid fa-list",
            params = {
                event = "nocore-bossmenu:client:employeelist",
            }
        },
        {
            header = "Назначи човек",
            txt = "Назначи човек околу теб",
            icon = "fa-solid fa-hand-holding",
            params = {
                event = "nocore-bossmenu:client:HireMenu",
            }
        },
        {
            header = "Сташ",
            txt = "Отвори сташ",
            icon = "fa-solid fa-box-open",
            params = {
                event = "nocore-bossmenu:client:Stash",
            }
        },
    }

    for _, v in pairs(DynamicMenuItems) do
        bossMenu[#bossMenu + 1] = v
    end

    bossMenu[#bossMenu + 1] = {
        header = "Затвори",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "nocore-context:closeMenu",
        }
    }

    exports['nocore-context']:openMenu(bossMenu)
end)

RegisterNetEvent('nocore-bossmenu:client:employeelist', function()
    local EmployeesMenu = {
        {
            header = "Управление на служителите - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    Framework.Functions.TriggerCallback('nocore-bossmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            EmployeesMenu[#EmployeesMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = "fa-solid fa-circle-user",
                params = {
                    event = "nocore-bossmenu:client:ManageEmployee",
                    args = {
                        player = v,
                        work = PlayerJob
                    }
                }
            }
        end
        EmployeesMenu[#EmployeesMenu + 1] = {
            header = "Назад",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nocore-bossmenu:client:OpenMenu",
            }
        }
        exports['nocore-context']:openMenu(EmployeesMenu)
    end, PlayerJob.name)
end)

RegisterNetEvent('nocore-bossmenu:client:ManageEmployee', function(data)
    local EmployeeMenu = {
        {
            header = "Управление " .. data.player.name .. " - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info"
        },
    }
    for k, v in pairs(Framework.Shared.Jobs[data.work.name].grades) do
        EmployeeMenu[#EmployeeMenu + 1] = {
            header = v.name,
            txt = "Чин: " .. k,
            params = {
                isServer = true,
                event = "nocore-bossmenu:server:GradeUpdate",
                icon = "fa-solid fa-file-pen",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "Уволни",
        icon = "fa-solid fa-user-large-slash",
        params = {
            isServer = true,
            event = "nocore-bossmenu:server:FireEmployee",
            args = data.player.empSource
        }
    }
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "Назад",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "nocore-bossmenu:client:OpenMenu",
        }
    }
    exports['nocore-context']:openMenu(EmployeeMenu)
end)

RegisterNetEvent('nocore-bossmenu:client:Stash', function()
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "boss_" .. PlayerJob.name, {
        maxweight = 4000000,
        slots = 500,
    })
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "boss_" .. PlayerJob.name)
end)

RegisterNetEvent('nocore-bossmenu:client:Wardrobe', function()
    TriggerEvent('nocore-clothing:client:openOutfitMenu')
end)

RegisterNetEvent('nocore-bossmenu:client:HireMenu', function()
    local HireMenu = {
        {
            header = "Назначи човек - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    Framework.Functions.TriggerCallback('nocore-bossmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMenu[#HireMenu + 1] = {
                    header = v.name,
                    txt = "ЕГН: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                    icon = "fa-solid fa-user-check",
                    params = {
                        isServer = true,
                        event = "nocore-bossmenu:server:HireEmployee",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMenu[#HireMenu + 1] = {
            header = "Назад",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nocore-bossmenu:client:OpenMenu",
            }
        }
        exports['nocore-context']:openMenu(HireMenu)
    end)
end)

-- MAIN THREAD
CreateThread(function()
    for job, zones in pairs(Config.BossMenuZones) do
        for index, data in ipairs(zones) do
            exports['nocore-eye']:AddBoxZone(job.."-BossMenu-"..index, data.coords, data.length, data.width, {
                name = job.."-BossMenu-"..index,
                heading = data.heading,
                -- debugPoly = true,
                minZ = data.minZ,
                maxZ = data.maxZ,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nocore-bossmenu:client:OpenMenu",
                        icon = "fas fa-sign-in-alt",
                        label = "Шефско меню",
                        canInteract = function() return job == PlayerJob.name and PlayerJob.isboss end,
                    },
                },
                distance = 2.5
            })
        end
    end
end)
