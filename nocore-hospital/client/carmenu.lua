local ambulance_cars = {
    {
        ['Name'] = 'emsnspeedo',
        ['Label'] = 'Линейка',
        ['Description'] = 'ми просто линейка',
    },
}

RegisterNetEvent("nocore-hospital:Client:OpenBossCarMenu")
AddEventHandler("nocore-hospital:Client:OpenBossCarMenu" , function()
    if (Framework.Functions.GetPlayerData().job.name == "ambulance") and Framework.Functions.GetPlayerData().job.isboss then
        OpenBuyMenu()
    end
end)

RegisterNetEvent("nocore-hospital:Client:BuyCar")
AddEventHandler("nocore-hospital:Client:BuyCar" , function(data)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        args = {"[nocore-hospital]", "Вие закупихте: "..data.car}
    })
    TriggerServerEvent("nocore-hospital:Server:BuyPoliceCar", data.car)
end)

function OpenBuyMenu()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Линейки Меню",
        txt = "",
        isMenuHeader = true
    })
    for k, v in pairs(ambulance_cars) do
      table.insert(sendMenu,{
        id = #sendMenu+1,
        header = 'Закупи '..v['Label']..'?' ,
        txt = v['Description'],
        params = { 
            event = "nocore-hospital:Client:BuyCar",
            args = {
                car = v['Name']
            }
        }
    })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        params = { 
            event = "fakeevnettt",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end