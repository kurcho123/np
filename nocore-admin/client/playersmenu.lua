local soundname = 'Unknown'
local soundrange = 0
local soundvolume = 0
local itemname = 'Unknown'
local itemamount = 0
local banreason = 'Unknown'
local banlength = nil
local kickreason = 'Unknown'
local selectedgroup = nil

GiveItemMenu:AddSlider({
    icon = '',
    label = Lang:t("info.item"),
    values = {{
        label = Lang:t("menu.item_list"),
        value = '',
        description = Lang:t("desc.item_list")
    }, {
        label = Lang:t("menu.item_self"),
        value = 'Self',
        description = Lang:t("desc.item_self")
    }},
    select = function(_, newValue)
        if newValue == 'Self' then
            local dialog = exports['qb-input']:ShowInput({
                header = Lang:t("desc.item_self"),
                submitText = "Confirm",
                inputs = {
                    {
                        text = "Lockpick",
                        name = "item",
                        type = "text",
                        isRequired = true
                    }
                }
            })
            if dialog then
                itemname = dialog.item
            end
        else
            local ItemMenu = {
                {
                    header = Lang:t('info.item'),
                    isMenuHeader = true
                }
            }

            for _, v in pairs(Framework.Shared.Items) do
                ItemMenu[#ItemMenu + 1] = {
                    header = v['label'],
                    txt = "",
                    params = {
                        event = "nocore-admin:client:openItemMenu",
                        args = {
                            name = v['name']
                        }
                    }
                }
            end

            exports['nocore-context']:openMenu(ItemMenu)
        end
    end
})
GiveItemMenu:AddButton({
    icon = '',
    label = Lang:t("info.amount"),
    value = "reason",
    description = Lang:t("desc.amount"),
    select = function()
        local dialog = exports['qb-input']:ShowInput({
            header = Lang:t("desc.amount"),
            submitText = "Confirm",
            inputs = {
                {
                    text = "Lockpick",
                    name = "amount",
                    type = "number",
                    isRequired = true
                }
            }
        })
        if dialog then
            itemamount = dialog.amount
        end
    end
})
GiveItemMenu:AddButton({
    icon = '',
    label = Lang:t("info.confirm"),
    value = "kick",
    description = Lang:t("desc.confirm_kick"),
    select = function()
        if itemname ~= 'Unknown' and itemamount ~= 0 then
            TriggerServerEvent('Framework:CallCommand', "giveitem", {SelectedPlayer.id, itemname, itemamount})
            itemname = 'Unknown'
            itemamount = 0
        else
            Framework.Functions.Notify(Lang:t("error.give_item"), 'error')
        end
    end
})

function OpenPlayerMenus()
    PlayerDetailMenu:ClearItems()
    MenuV:OpenMenu(PlayerDetailMenu)
    local PlayersButton1 = PlayerDetailMenu:AddButton({
        icon = '🛠️',
        label = Lang:t("menu.player_general"),
        value = PlayerGeneralMenu,
        description = Lang:t("desc.admin_options_desc")
    })
    PlayersButton1:On('select', function()
        PlayerGeneralMenu:ClearItems()
        local elements = {
            [1] = {
                icon = '💀',
                label = Lang:t("menu.kill"),
                value = "kill",
                description = Lang:t("menu.kill").. " " .. SelectedPlayer.name
            },
            [2] = {
                icon = '🏥',
                label = Lang:t("menu.revive"),
                value = "revive",
                description = Lang:t("menu.revive") .. " " .. SelectedPlayer.name
            },
            [3] = {
                icon = '👀',
                label = Lang:t("menu.spectate"),
                value = "spectate",
                description = Lang:t("menu.spectate") .. " " .. SelectedPlayer.name
            },
            [4] = {
                icon = '➡️',
                label = Lang:t("info.goto"),
                value = "goto",
                description = Lang:t("info.goto") .. " " .. SelectedPlayer.name .. Lang:t("info.position")
            },
            [5] = {
                icon = '⬅️',
                label = Lang:t("menu.bring"),
                value = "bring",
                description = Lang:t("menu.bring") .. " " .. SelectedPlayer.name .. " " .. Lang:t("info.your_position")
            },
            [6] = {
                icon = '🚗',
                label = Lang:t("menu.sit_in_vehicle"),
                value = "intovehicle",
                description = Lang:t("desc.sit_in_veh_desc") .. " " .. SelectedPlayer.name .. " " .. Lang:t("desc.sit_in_veh_desc2")
            }
        }
        for _, v in ipairs(elements) do
            PlayerGeneralMenu:AddButton({
                icon = v.icon,
                label = ' ' .. v.label,
                value = v.value,
                description = v.description,
                select = function(btn)
                    local values = btn.Value
                    TriggerServerEvent('nocore-admin:server:'..values, SelectedPlayer)
                end
            })
        end
        PlayerGeneralMenu:AddButton({
            icon = '🧿',
            label = Lang:t("menu.routingbucket"),
            value = "routingbucket",
            description = Lang:t("desc.routingbucket"),
            select = function()
                local dialog = exports["nocore-keyboard"]:KeyboardInput({
                    header = Lang:t("desc.routingbucket"),
                    rows = { { id = 0, label = "569", helper = "Bucket" } }
                })
                if dialog and dialog[1] then
                    TriggerServerEvent('nocore-admin:server:routingbucket', SelectedPlayer, dialog[1].input)
                end
            end
        })
    end)

    local PlayersButton3 = PlayerDetailMenu:AddButton({
        icon = '🕹️',
        label = Lang:t("menu.player_extra"),
        value = PlayerExtraMenu,
        description = Lang:t("desc.player_extra_desc")
    })
    PlayersButton3:On('select', function()
        PlayerExtraMenu:ClearItems()
        local elements = {
            [1] = {
                icon = '🎒',
                label = Lang:t("menu.open_inv"),
                value = "inventory",
                description = Lang:t("info.open") .. " " .. SelectedPlayer.name .. Lang:t("info.inventories")
            },
            [2] = {
                icon = '👕',
                label = Lang:t("menu.give_clothing_menu"),
                value = "cloth",
                description = Lang:t("desc.clothing_menu_desc") .. " " .. SelectedPlayer.name
            },
        }
        for _, v in ipairs(elements) do
            PlayerExtraMenu:AddButton({
                icon = v.icon,
                label = ' ' .. v.label,
                value = v.value,
                description = v.description,
                select = function(btn)
                    local values = btn.Value
                    if values == 'inventory' then
                        TriggerEvent('nocore-admin:client:inventory', SelectedPlayer.id)
                    elseif values == 'giveitem' then
                        MenuV:OpenMenu(GiveItemMenu)
                    else
                        TriggerServerEvent('nocore-admin:server:'..values, SelectedPlayer)
                    end
                end
            })
        end
    end)
    local elements = {
        [1] = {
            label = Lang:t("label.name").. ': ' ..SelectedPlayer.name,
            description = Lang:t("desc.player_info"),
            value = 'name'
        },
        [2] = {
            label = Lang:t("label.food").. ': ' ..SelectedPlayer.food.. '%',
            description = Lang:t("desc.player_info"),
            value = 'food'
        },
        [3] = {
            label = Lang:t("label.water").. ': ' ..SelectedPlayer.water.. '%',
            description = Lang:t("desc.player_info"),
            value = 'water'
        },
        [4] = {
            label = Lang:t("label.stress").. ': ' ..SelectedPlayer.stress.. '%',
            description = Lang:t("desc.player_info"),
            value = 'stress'
        },
        [5] = {
            label = Lang:t("label.armor").. ': ' ..SelectedPlayer.armor.. '%',
            description = Lang:t("desc.player_info"),
            value = 'armor'
        },
        [6] = {
            label = Lang:t("label.craftingrep").. ': ' ..SelectedPlayer.craftingrep,
            description = Lang:t("desc.player_info"),
            value = 'craftingrep'
        },
        [7] = {
            label = Lang:t("label.dealerrep").. ': ' ..SelectedPlayer.dealerrep,
            description = Lang:t("desc.player_info"),
            value = 'dealerrep'
        },
        [8] = {
            label = Lang:t("label.cash").. ': ' ..SelectedPlayer.cash.. '$',
            description = Lang:t("desc.player_info"),
            value = 'cash'
        },
        [9] = {
            label = Lang:t("label.bank").. ': ' ..SelectedPlayer.bank.. '$',
            description = Lang:t("desc.player_info"),
            value = 'bank'
        },
        [10] = {
            label = Lang:t("label.job").. ': ' ..SelectedPlayer.job,
            description = Lang:t("desc.player_info"),
            value = 'job'
        },
        [11] = {
            label = Lang:t("label.radio").. ': ' ..Player(SelectedPlayer.id).state['radioChannel'] or 0,
            description = Lang:t("desc.player_info"),
            value = 'radio'
        },
    }
    for _, v in ipairs(elements) do
        PlayerDetailMenu:AddButton({
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
        })
    end
end

RegisterNetEvent('nocore-admin:client:openSoundMenu', function(data)
    soundname = data.name
end)

RegisterNetEvent('nocore-admin:client:openItemMenu', function(data)
    itemname = data.name
end)
