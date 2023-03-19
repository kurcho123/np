local Framework = exports['no-core']:GetCoreObject()
local PlayerGang = Framework.Functions.GetPlayerData().gang
local shownGangMenu = false
local DynamicMenuItems = {}

-- UTIL
local function CloseMenuFullGang()
    exports['nocore-context']:closeMenu()
    shownGangMenu = false
end

local function comma_valueGang(amount)
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

--//Events
AddEventHandler('onResourceStart', function(resource)--if you restart the resource
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerGang = Framework.Functions.GetPlayerData().gang
    end
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded', function()
    PlayerGang = Framework.Functions.GetPlayerData().gang
end)

RegisterNetEvent('Framework:Client:OnGangUpdate', function(InfoGang)
    PlayerGang = InfoGang
end)

RegisterNetEvent('nocore-gangmenu:client:Stash', function()
    TriggerServerEvent("nocore-inventory:server:OpenInventory", "stash", "boss_" .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 100,
    })
    TriggerEvent("nocore-inventory:client:SetCurrentStash", "boss_" .. PlayerGang.name)
end)

local function AddGangMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports("AddGangMenuItem", AddGangMenuItem)

local function RemoveGangMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports("RemoveGangMenuItem", RemoveGangMenuItem)

RegisterNetEvent('nocore-gangmenu:client:OpenMenu', function()
    shownGangMenu = true
    local gangMenu = {
        {
            header = "Gang Management  - " .. string.upper(PlayerGang.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
        {
            header = "Manage Gang Members",
            icon = "fa-solid fa-list",
            txt = "Recruit or Fire Gang Members",
            params = {
                event = "nocore-gangmenu:client:ManageGang",
            }
        },
        {
            header = "Recruit Members",
            icon = "fa-solid fa-hand-holding",
            txt = "Hire Gang Members",
            params = {
                event = "nocore-gangmenu:client:HireMembers",
            }
        },
        {
            header = "Storage Access",
            icon = "fa-solid fa-box-open",
            txt = "Open Gang Stash",
            params = {
                event = "nocore-gangmenu:client:Stash",
            }
        },
    }

    for _, v in pairs(DynamicMenuItems) do
        gangMenu[#gangMenu + 1] = v
    end

    gangMenu[#gangMenu + 1] = {
        header = "Exit",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "nocore-context:closeMenu",
        }
    }

    exports['nocore-context']:openMenu(gangMenu)
end)

RegisterNetEvent('nocore-gangmenu:client:ManageGang', function()
    local GangMembersMenu = {
        {
            header = "Manage Gang Members - " .. string.upper(PlayerGang.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
    }
    Framework.Functions.TriggerCallback('nocore-gangmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            GangMembersMenu[#GangMembersMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = "fa-solid fa-circle-user",
                params = {
                    event = "nocore-gangmenu:lient:ManageMember",
                    args = {
                        player = v,
                        work = PlayerGang
                    }
                }
            }
        end
        GangMembersMenu[#GangMembersMenu + 1] = {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nocore-gangmenu:client:OpenMenu",
            }
        }
        exports['nocore-context']:openMenu(GangMembersMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('nocore-gangmenu:lient:ManageMember', function(data)
    local MemberMenu = {
        {
            header = "Manage " .. data.player.name .. " - " .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    for k, v in pairs(Framework.Shared.Gangs[data.work.name].grades) do
        MemberMenu[#MemberMenu + 1] = {
            header = v.name,
            txt = "Grade: " .. k,
            params = {
                isServer = true,
                event = "nocore-gangmenu:server:GradeUpdate",
                icon = "fa-solid fa-file-pen",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    MemberMenu[#MemberMenu + 1] = {
        header = "Fire",
        icon = "fa-solid fa-user-large-slash",
        params = {
            isServer = true,
            event = "nocore-gangmenu:server:FireMember",
            args = data.player.empSource
        }
    }
    MemberMenu[#MemberMenu + 1] = {
        header = "Return",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "nocore-gangmenu:client:ManageGang",
        }
    }
    exports['nocore-context']:openMenu(MemberMenu)
end)

RegisterNetEvent('nocore-gangmenu:client:HireMembers', function()
    local HireMembersMenu = {
        {
            header = "Hire Gang Members - " .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    Framework.Functions.TriggerCallback('nocore-gangmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMembersMenu[#HireMembersMenu + 1] = {
                    header = v.name,
                    txt = "Citizen ID: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                    icon = "fa-solid fa-user-check",
                    params = {
                        isServer = true,
                        event = "nocore-gangmenu:server:HireMember",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMembersMenu[#HireMembersMenu + 1] = {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nocore-gangmenu:client:OpenMenu",
            }
        }
        exports['nocore-context']:openMenu(HireMembersMenu)
    end)
end)

CreateThread(function()
    for gang, zones in pairs(Config.GangMenuZones) do
        for index, data in ipairs(zones) do
            exports['nocore-eye']:AddBoxZone(gang.."-GangMenu"..index, data.coords, data.length, data.width, {
                name = gang.."-GangMenu"..index,
                heading = data.heading,
                -- debugPoly = true,
                minZ = data.minZ,
                maxZ = data.maxZ,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nocore-gangmenu:client:OpenMenu",
                        icon = "fas fa-sign-in-alt",
                        label = "Gang Menu",
                        canInteract = function() return gang == PlayerGang.name and PlayerGang.isboss end,
                    },
                },
                distance = 2.5
            })
        end
    end
end)
