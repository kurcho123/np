local DutyVehicles = {}
HasHandCuffs = false

Config = Config or {}

Config.Keys = {["F1"] = 243}
Config.Debug = true
Config.Locale = "en"
Config.Menu = {
    [1] = {
        id = "citizen",
        displayName = "Граждани",
        icon = "#citizen-action",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                return true
            end
        end,
        subMenus = {"citizen:escort", 'citizen:corner:selling', 'citizen:documents', 'citizen:bill:menu', 'scenes'}
    },
    [2] = {
        id = "animations",
        displayName = "Походка",
        icon = "#walking",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                return true
            end
        end,
        subMenus = {"animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured", "animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien"}
    },
    [3] = {
        id = "expressions",
        displayName = "Изражение",
        icon = "#expressions",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                return true
            end
        end,
        subMenus = {"expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    [4] = {
        id = "police",
        displayName = "Полиция",
        icon = "#police-action",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"police:panic", "police:search", "dispatch:open:mdw", "police:impound", "police:impoundhard", "police:resetdoor", "police:enkelband", "police:hotwire", "police:unlock", "police:mask", "police:checkstatus", "police:badge", "police:komunikacii", "police:hardcuff"}
    },
    [5] = {
        id = "police",
        displayName = "Полицейски Предмети",
        icon = "#police-action",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"police:object:cone", "police:object:barrier", "police:object:tent", "police:object:light", "police:object:schot", "police:object:delete"}
    },
    [6] = {
        id = "police-down",
        displayName = "Пострадал Полицай",
        icon = "#police-down",
        close = true,
        functiontype = "client",
        functionParameters = 2,
        functionName = "nocore-dispatch:police:down",
        enableMenu = function()
            if exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
    },
    [7] = {
        id = "police-down",
        displayName = "Неутрализиран полицай",
        icon = "#police-down",
        close = true,
        functiontype = "client",
        functionParameters = 3,
        functionName = "nocore-dispatch:police:down",
        enableMenu = function()
            if exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
    },
    [8] = {
        id = "ambulance",
        displayName = "Болница",
        icon = "#ambulance-action",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'ambulance' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"ambulance:heal", "ambulance:revive", "dispatch:open:mdw", "ambulance:blood", 'ambulance:bagprop', 'ambulance:lifepack', 'ambulance:chair', 'ambulance:chair:del', 'ambulance:bed', 'ambulance:bed:del', "ambulance:panic", "police:komunikacii"}
    },
    [9] = {
        id = "vehicle",
        displayName = "МПС",
        icon = "#citizen-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "nocore-carmenu:veh:options",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and IsPedInAnyVehicle(PlayerPedId()) then
                return true
            end
        end,
        subMenus = {"vehicle:save", "vehicle:key", "vehicle:menu", "vehicle:drivingdistance"}
    },
    [10] = {
        id = "garage",
        displayName = "Гараж",
        icon = "#citizen-action-garage",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                if exports['nocore-garages']:IsNearGarage() then
                    return true
                end
            end
        end,
        subMenus = {"garage:putin", "garage:getout"}
    },
    [11] = {
        id = "help",
        displayName = "Повикайте помощ",
        icon = "#police-down",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:call:last",
        enableMenu = function()
            if exports['nocore-hospital']:IsAbleToRespawn() then
                return true
            end
        end,
    },
    [12] = {
        id = "depot",
        displayName = "Депо",
        icon = "#global-depot",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-garages:client:open:depot",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                if exports['nocore-garages']:IsNearDepot() then
                    return true
                end
            end
        end,
    },
    [13] = {
        id = "housing",
        displayName = "Влез",
        icon = "#global-appartment",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-housing:client:enter:house",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                if exports['nocore-housing']:EnterNearHouse() then
                    return true
                end
            end
        end,
    },
    [14] = {
        id = "housing-options",
        displayName = "Къща",
        icon = "#citizen-action-garage",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                if exports['nocore-housing']:HasEnterdHouse() then
                    return true
                end
            end
        end,
        subMenus = {"house:setstash", "house:setlogout", "house:setclothes", "house:givekey", "house:decorate"}
    },
    [15] = {
        id = "judge-actions",
        displayName = "Съдя",
        icon = "#judge-actions",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'judge' then
                return true
            end
        end,
        subMenus = {"judge:tablet", "police:tablet", "police:checkbank"}
    },
    [16] = {
        id = "fixit-tow-menu",
        displayName = "Механик",
        icon = "#citizen-action-garage",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and (Framework.Functions.GetPlayerData().job.name == 'fixit' or Framework.Functions.GetPlayerData().job.name == 'racemonkey' or Framework.Functions.GetPlayerData().job.name == 'misfits') then
                return true
            end
        end,
        subMenus = {"tow:hook", 'mechanic:tools', 'mechanic:remove'}
    },
    [17] = {
        id = "scrapyard",
        displayName = "Прати за Скрап",
        icon = "#police-action-vehicle-spawn",
        close = true,
        functiontype = "client",
        functionName = "nocore-materials:client:scrap:vehicle",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                if exports['nocore-jobs']:IsNearScrapYard() then
                    return true
                end
            end
        end,
    },
    [18] = {
        id = "tow-menu",
        displayName = "Механик",
        icon = "#citizen-action-garage",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'mechanic' then
                return true
            end
        end,
        subMenus = {"tow:hook", "tow:npc", "mechanic:profilactika", 'mechanic:tools', 'mechanic:barrier', 'mechanic:conus', 'mechanic:remove'}
    },
    [19] = {
        id = "taxi",
        displayName = "Такси",
        icon = "#taxi-action",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'taxi' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"taxi:togglemeter", "taxi:start", "taxi:reset", "taxi:npcmission", "taxi:menu"}
    },
    [20] = {
        id = "ring",
        displayName = "Позвъни на звънеца",
        icon = "#global-appartment",
        close = true,
        functiontype = "client",
        --functionParameters = false,
        functionName = "nocore-housing:client:ring:door",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                if exports['nocore-housing']:IsNearAnyHouse() then
                    return true
                end
            end
        end,
    },
    [21] = {
        id = "poilice-radio",
        displayName = "Radio",
        icon = "#broadcast-tower",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'police' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"radio:1", "radio:2", "radio:3", "radio:4", "radio:5"}
    },
    [22] = {
        id = "ambulance-two",
        displayName = "Болница",
        icon = "#ambulance-action",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'emergency' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"ambulance:heal", "ambulance:revive"}
    },
    [23] = {
        id = "weazelnews",
        displayName = "Предмети",
        icon = "#video",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'news' and Framework.Functions.GetPlayerData().job.onduty then
                return true
            end
        end,
        subMenus = {"police:object:light", "police:object:delete"}
    },
    [24] = {
        id = "weazelnewsshef",
        displayName = "Репортер",
        icon = "#video",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'news' and Framework.Functions.GetPlayerData().job.grade.level >= 5 then
                return true
            end
        end,
        subMenus = {"news:job"}
    },
    [25] = {
        id = "busdriverinspect",
        displayName = "Инспектирай",
        icon = "#busdriver-inspection",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-busdriver:gotoinspection",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'busdriver' and exports['nocore-jobs']:inInspectZone() then
                return true
            end
        end,
    },
    [26] = {
        id = "busdrivermarshrut",
        displayName = "Вземи маршрут",
        icon = "#busdriver-route",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-busdriver:route",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'busdriver' and exports['nocore-jobs']:inMarshrutZone() then
                return true
            end
        end,
    },
    [27] = {
        id = "gardenerReturn",
        displayName = "Върни МПС",
        icon = "#busdriver-stop",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-gardenjob:priberikola",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'gardener' and exports['nocore-jobs']:inGardenerReturnZone() then
                return true
            end
        end,
    },
    [28] = {
        id = "vehicle",
        displayName = "Дай ключ",
        icon = "#citizen-action-vehicle-key",
        close = true,
        functiontype = "client",
        functionName = "nocore-vehiclekeys:client:give:key",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() then
                local Vehicle, Distance = Framework.Functions.GetClosestVehicle()
                if Vehicle ~= 0 and Distance < 3.5 and not IsPedInAnyVehicle(PlayerPedId()) then
                    return true
                end
            end
        end,
    },
    [29] = {
        id = "cranTables",
        displayName = "Маси",
        icon = "#police-action-tablet",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-cranberry:opentables",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'cranberry' and (#(GetEntityCoords(PlayerPedId()) - vector3(-1075.09, -314.6364, 37.807849)) < 15) then
                return true
            end
        end,
    },
    [30] = {
        id = "judgejob",
        displayName = "Наеми адвокат",
        icon = "#judge-actions",
        close = true,
        functiontype = "client",
        functionParameters = false,
        functionName = "nocore-judge:client:lawyer:add:closest",
        enableMenu = function()
            if not exports['nocore-hospital']:GetDeathStatus() and Framework.Functions.GetPlayerData().job.name == 'judge' and Framework.Functions.GetPlayerData().job.grade.level >= 5 then
                return true
            end
        end,
    },
}

Config.SubMenus = {
    ["radio:1"] = {
        title = "Станция 1",
        icon = "#broadcast-tower",
        close = true,
        functiontype = "client",
        functionParameters = {"1"},
        functionName = "nocore-radio:client:joinRadio",
    },
    ["radio:2"] = {
        title = "Станция 2",
        icon = "#broadcast-tower",
        close = true,
        functiontype = "client",
        functionParameters = {"2"},
        functionName = "nocore-radio:client:joinRadio",
    },
    ["radio:3"] = {
        title = "Станция 3",
        icon = "#broadcast-tower",
        close = true,
        functiontype = "client",
        functionParameters = {"3"},
        functionName = "nocore-radio:client:joinRadio",
    },
    ["radio:4"] = {
        title = "Станция 4",
        icon = "#broadcast-tower",
        close = true,
        functiontype = "client",
        functionParameters = {"4"},
        functionName = "nocore-radio:client:joinRadio",
    },
    ["radio:5"] = {
        title = "Станция 5",
        icon = "#broadcast-tower",
        close = true,
        functiontype = "client",
        functionParameters = {"5"},
        functionName = "nocore-radio:client:joinRadio",
    },
    ["taxi:togglemeter"] = {
        title = "Покажи/Скрий брояч",
        icon = "#taxi-meter",
        close = true,
        functiontype = "client",
        functionName = "taxi:toggleDisplay",
    },
    ["taxi:start"] = {
        title = "Пусни/Спри брояч",
        icon = "#taxi-start",
        close = true,
        functiontype = "client",
        functionName = "taxi:toggleHire",
    },
    ["taxi:reset"] = {
        title = "Рестартирай брояч",
        icon = "#taxi-start",
        close = true,
        functiontype = "client",
        functionName = "taxi:resetMeter",
    },
    ["taxi:npcmission"] = {
        title = "Поеми сигнал",
        icon = "#taxi-npc",
        close = true,
        functiontype = "client",
        functionName = "nocore-taxi:client:DoTaxiNpc",
    },
    ["taxi:menu"] = {
        title = "Настройки",
        icon = "#taxi-npc",
        close = true,
        functiontype = "client",
        functionName = "nocore-taximeter:settings:menu",
    },
    ['police:panic'] = {
        title = "Паник бутон",
        icon = "#police-action-panic",
        close = true,
        functiontype = "client",
        functionName = "nocore-dispatch:police:panicbutton"
    },
    ['ambulance:panic'] = {
        title = "Паник бутон",
        icon = "#police-action-panic",
        close = true,
        functiontype = "client",
        functionName = "nocore-dispatch:ambulance:panicbutton"
    },
    ['police:impound'] = {
        title = "Премахни МПС",
        icon = "#police-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:impound:closest"
    },
    ['police:impoundhard'] = {
        title = "Конфискувай",
        icon = "#police-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:impound:hard:closest"
    },
    ['police:search'] = {
        title = "Претърси",
        icon = "#police-action-search",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:search:closest"
    },
    ['police:komunikacii'] = {
        title = "Отнети комуникации",
        icon = "#police-action-search",
        close = true,
        functiontype = "server",
        functionName = "Framework:ToggleDuty"
    },
    ['police:resetdoor'] = {
        title = "Възстанови врата",
        icon = "#global-appartment",
        close = true,
        functiontype = "client",
        functionName = "nocore-housing:client:reset:house:door"
    },
    ['police:enkelband'] = {
        title = "Локация",
        icon = "#police-action-enkelband",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:enkelband:closest"
    },
    ['police:hotwire'] = {
        title = "Разбии",
        icon = "#citizen-action-vehicle-key",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:HotwireVehicle"
    },
    ['police:unlock'] = {
        title = "Отключи кола",
        icon = "#citizen-action-vehicle-key",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:unlock"
    },
    ['police:hardcuff'] = {
        title = "Здрави белезници",
        icon = "#citizen-action",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:hardcuff:closest"
    },
    ['police:checkbank'] = {
        title = "Проверка на сметка",
        icon = "#animation-money",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:CheckBank"
    },
    ['police:mask'] = {
        title = "Свали маска/шапка",
        icon = "#police-mask",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:RemoveMask"
    },
    ['police:checkstatus'] = {
        title = "Провери състояние",
        icon = "#citizen-action",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:getstatus:closest"
    },
    ['police:badge'] = {
        title = "Полицейски бадж",
        icon = "#police-badge",
        close = true,
        functiontype = "client",
        functionName = "badge:openPD"
    },
    -- ['police:vehicle:touran'] = {
    -- title = "Police Touran",
    -- icon = "#police-action-vehicle-spawn",
    -- close = true,
    -- functionParameters = 'PolitieTouran',
    -- functiontype = "client",
    -- functionName = "nocore-police:client:spawn:vehicle"
    --  },
    -- ['police:vehicle:klasse'] = {
    -- title = "Police B-Klasse",
    --icon = "#police-action-vehicle-spawn",
    -- close = true,
    --  functionParameters = 'PolitieKlasse',
    --   functiontype = "client",
    --  functionName = "nocore-police:client:spawn:vehicle"
    --  },
    --   ['police:vehicle:vito'] = {
    --    title = "Police Vito",
    --    icon = "#police-action-vehicle-spawn-bus",
    --     close = true,
    --    functionParameters = 'PolitieVito',
    --    functiontype = "client",
    --    functionName = "nocore-police:client:spawn:vehicle"
    --  },
    --   ['police:vehicle:audi'] = {
    --    title = "Police Audi",
    --    icon = "#police-action-vehicle-spawn",
    --   close = true,
    --   functionParameters = 'PolitieRS6',
    --   functiontype = "client",
    --   functionName = "nocore-police:client:spawn:vehicle"
    --   },
    --  ['police:vehicle:velar'] = {
    --   title = "Police Unmarked Velar",
    --   icon = "#police-action-vehicle-spawn",
    --   close = true,
    --   functionParameters = 'PolitieVelar',
    --   functiontype = "client",
    --   functionName = "nocore-police:client:spawn:vehicle"
    --  },
    -- ['police:vehicle:range'] = {
    --     title = "Police Range Rover",
    --     icon = "#police-action-vehicle-spawn",
    --     close = true,
    --     functionParameters = 'PolitieRange',
    --     functiontype = "client",
    --     functionName = "nocore-police:client:spawn:vehicle"
    --    },
    --  ['police:vehicle:bmw'] = {
    --  title = "Police Unmarked M5",
    --   icon = "#police-action-vehicle-spawn",
    --   close = true,
    --   functionParameters = 'PolitieBmw',
    --   functiontype = "client",
    --   functionName = "nocore-police:client:spawn:vehicle"
    --   },
    --   ['police:vehicle:unmaked:audi'] = {
    --    title = "Police Unmarked A6",
    --    icon = "#police-action-vehicle-spawn",
    --    close = true,
    --   functionParameters = 'PolitieAudiUnmarked',
    --    functiontype = "client",
    --   functionName = "nocore-police:client:spawn:vehicle"
    --  },
    --  ['police:vehicle:heli'] = {
    --   title = "Police Zulu",
    --   icon = "#police-action-vehicle-spawn-heli",
    --   close = true,
    --    functionParameters = 'PolitieZulu',
    --    functiontype = "client",
    --    functionName = "nocore-police:client:spawn:vehicle"
    --   },
    --   ['police:vehicle:motor'] = {
    --  title = "Police Motor",
    --   icon = "#police-action-vehicle-spawn-motor",
    --    close = true,
    --    functionParameters = 'PolitieMotor',
    --    functiontype = "client",
    --    functionName = "nocore-police:client:spawn:vehicle"
    --},
    ['police:object:cone'] = {
        title = "Конус",
        icon = "#global-box",
        close = true,
        functionParameters = 'cone',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['police:object:barrier'] = {
        title = "Бариера",
        icon = "#global-box",
        close = true,
        functionParameters = 'barrier',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['police:object:schot'] = {
        title = "Ограда",
        icon = "#global-box",
        close = true,
        functionParameters = 'schot',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['police:object:tent'] = {
        title = "Тента",
        icon = "#global-box",
        close = true,
        functionParameters = 'tent',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['police:object:light'] = {
        title = "Лампа",
        icon = "#global-box",
        close = true,
        functionParameters = 'light',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['police:object:delete'] = {
        title = "Прибери предмет",
        icon = "#global-delete",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:delete:object"
    },
    ['ambulance:heal'] = {
        title = "Излекувай",
        icon = "#ambulance-action-heal",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:heal:closest"
    },
    ['ambulance:revive'] = {
        title = "Първа помощ",
        icon = "#ambulance-action-heal",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:revive:closest"
    },
    ['ambulance:chair'] = {
        title = "Извади количка",
        icon = "#global-box",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:chair"
    },
    ['ambulance:chair:del'] = {
        title = "Прибери количка",
        icon = "#global-box",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:chair:del"
    },
    ['ambulance:bed'] = {
        title = "Извади легло",
        icon = "#global-box",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:bed"
    },
    ['ambulance:bed:del'] = {
        title = "Прибери легло",
        icon = "#global-box",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:bed:del"
    },
    ['dispatch:open:mdw'] = {
        title = "Таблет",
        icon = "#police-action-tablet",
        close = true,
        functiontype = "server",
        functionName = "np-mdt:show"
    },
    ['citizen:bill:menu'] = {
        title = "Фактури",
        icon = "#filealt",
        close = true,
        functiontype = "client",
        functionName = "nocore-bills:open"
    },
    ['scenes'] = {
        title = "Scenes",
        icon = "#pencil",
        close = true,
        functiontype = "client",
        functionName = "nocore-scenes:openMenu"
    },
    ['ambulance:blood'] = {
        title = "Кръвна проба",
        icon = "#ambulance-action-blood",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:take:blood:closest"
    },
    ['ambulance:bagprop'] = {
        title = "Медицинска Чанта",
        icon = "#global-box",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:bagprop"
    },
    ['ambulance:lifepack'] = {
        title = "Дефибрилар",
        icon = "#police-action-tablet",
        close = true,
        functiontype = "client",
        functionName = "nocore-hospital:client:lifepack"
    },
    ['ambulance:bagground'] = {
        title = "Чанта (земя)",
        icon = "#global-box",
        close = true,
        functionParameters = 'medbag',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['ambulance:deffground'] = {
        title = "Дефебрилатор (земя)",
        icon = "#global-box",
        close = true,
        functionParameters = 'deff',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['ambulance:remove'] = {
        title = "Прибери предмет",
        icon = "#global-delete",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:delete:object"
    },
    
    ['ambulance:garage:heli'] = {
        title = "Хеликоптер",
        icon = "#police-action-vehicle-spawn",
        close = true,
        functionParameters = 'AmbulanceHeli',
        functiontype = "client",
        functionName = "nocore-hospital:client:spawn:vehicle"
    },
    ['ambulance:garage:touran'] = {
        title = "Ambulance",
        icon = "#police-action-vehicle-spawn",
        close = true,
        functionParameters = 'emsnspeedo',
        functiontype = "client",
        functionName = "nocore-hospital:client:spawn:vehicle"
    },
    ['ambulance:garage:sprinter'] = {
        title = "Ambulance",
        icon = "#police-action-vehicle-spawn",
        close = true,
        functionParameters = 'emsnspeedo',
        functiontype = "client",
        functionName = "nocore-hospital:client:spawn:vehicle"
    },
    ['judge:tablet'] = {
        title = "Съдийски таблет",
        icon = "#police-action-tablet",
        close = true,
        functiontype = "client",
        functionName = "nocore-judge:client:toggle"
    },
    ['news:job'] = {
        title = "Наеми репортер",
        icon = "#citizen-action",
        close = true,
        functiontype = "client",
        functionName = "nocore-weazelnews:client:reporter:add:closest"
    },
    ['citizen:contact'] = {
        title = "Визитна картичка",
        icon = "#citizen-contact",
        close = true,
        functiontype = "client",
        functionName = "nocore-phone:client:GiveContactDetails"
    },
    ['citizen:escort'] = {
        title = "Ескортирай",
        icon = "#citizen-action-escort",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:escort:closest"
    },
    ['citizen:steal'] = {
        title = "Обери",
        icon = "#citizen-action-steal",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:steal:closest"
    },
    ['citizen:vehicle:getout'] = {
        title = "Изкарай от МПС",
        icon = "#citizen-put-out-veh",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:SetPlayerOutVehicle"
    },
    ['citizen:vehicle:getin'] = {
        title = "Вкарай в МПС",
        icon = "#citizen-put-in-veh",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:PutPlayerInVehicle"
    },
    ['vehicle:save'] = {
        title = "Запази МПС",
        icon = "#citizen-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:savecar"
    },
    ['vehicle:key'] = {
        title = "Дай ключ",
        icon = "#citizen-action-vehicle-key",
        close = true,
        functiontype = "client",
        functionName = "nocore-vehiclekeys:client:give:key"
    },
    ['vehicle:drivingdistance'] = {
        title = "Пробег",
        icon = "#more",
        close = true,
        functiontype = "command",
        functionName = "drivingdistance"
    },
    
    ['vehicle:door:left:front'] = {
        title = "Лява предна",
        icon = "#global-arrow-left",
        close = true,
        functionParameters = 0,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:open:door"
    },
    ['vehicle:door:motor'] = {
        title = "Капак",
        icon = "#global-arrow-up",
        close = true,
        functionParameters = 4,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:open:door"
    },
    ['vehicle:door:right:front'] = {
        title = "Дясна предна",
        icon = "#global-arrow-right",
        close = true,
        functionParameters = 1,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:open:door"
    },
    ['vehicle:door:right:back'] = {
        title = "Дясна задна",
        icon = "#global-arrow-right",
        close = true,
        functionParameters = 3,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:open:door"
    },
    ['vehicle:door:trunk'] = {
        title = "Багажник",
        icon = "#global-arrow-down",
        close = true,
        functionParameters = 5,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:open:door"
    },
    ['vehicle:door:left:back'] = {
        title = "Лява задна",
        icon = "#global-arrow-left",
        close = true,
        functionParameters = 2,
        functiontype = "client",
        functionName = "nocore-radialmenu:client:open:door"
    },
    
    
    ['tow:hook'] = {
        title = "Закачи/разкачи кола",
        icon = "#citizen-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "nocore-tow:client:hook:car"
    },
    ['tow:npc'] = {
        title = "Поеми сигнал",
        icon = "#citizen-action",
        close = true,
        functiontype = "client",
        functionName = "nocore-tow:client:toggle:npc"
    },
    -- ['mechanic:profilactika'] = {
    --     title = "Профилактика",
    --     icon = "#citizen-action",
    --     close = true,
    --     functiontype = "client",
    --     functionParameters = "mechanic_tools",
    --     functionName = "core_vehicle:toolUsed"
    -- },
    ['mechanic:tools'] = {
        title = "Инструменти (земя)",
        icon = "#global-box",
        close = true,
        functionParameters = 'toolbox',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['mechanic:barrier'] = {
        title = "Бариера (земя)",
        icon = "#global-box",
        close = true,
        functionParameters = 'barrier',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['mechanic:remove'] = {
        title = "Прибери предмет",
        icon = "#global-delete",
        close = true,
        functiontype = "client",
        functionName = "nocore-police:client:delete:object"
    },
    ['mechanic:conus'] = {
        title = "Конус (земя)",
        icon = "#global-box",
        close = true,
        functionParameters = 'cone',
        functiontype = "client",
        functionName = "nocore-police:client:spawn:object"
    },
    ['citizen:corner:selling'] = {
        title = "Пласирай",
        icon = "#citizen-action-cornerselling",
        close = true,
        functiontype = "client",
        functionName = "nocore-illegal:client:toggle:corner:selling"
    },
    ['citizen:documents'] = {
        title = "Документи",
        icon = "#global-folder-open",
        close = true,
        functiontype = "client",
        functionName = "nocore-documents:client:OpenDocuments"
    },
    ['garage:putin'] = {
        title = "Прибери в гараж",
        icon = "#citizen-put-in-veh",
        close = true,
        functiontype = "client",
        functionName = "nocore-garages:client:check:owner"
    },
    ['garage:getout'] = {
        title = "Изкарай от гараж",
        icon = "#citizen-put-out-veh",
        close = true,
        functiontype = "client",
        functionName = "nocore-garages:client:set:vehicle:out:garage"
    },
    ['house:setstash'] = {
        title = "Сложи склад",
        icon = "#citizen-put-out-veh",
        close = true,
        functionParameters = 'stash',
        functiontype = "client",
        functionName = "nocore-housing:client:set:location"
    },
    --[[     ['house:setlogout'] = {
    title = "Сложи легло",
    icon = "#citizen-put-out-veh",
    close = true,
    functionParameters = 'logout',
    functiontype = "client",
    functionName = "nocore-housing:client:set:location"
    }, ]]
    ['house:setclothes'] = {
        title = "Сложи гардероб",
        icon = "#citizen-put-out-veh",
        close = true,
        functionParameters = 'clothes',
        functiontype = "client",
        functionName = "nocore-housing:client:set:location"
    },
    ['house:givekey'] = {
        title = "Дай ключ",
        icon = "#citizen-action-vehicle-key",
        close = true,
        functiontype = "client",
        functionName = "nocore-housing:client:give:keys"
    },
    ['house:decorate'] = {
        title = "Декорирай",
        icon = "#global-box",
        close = true,
        functiontype = "client",
        functionName = "nocore-housing:client:decorate"
    },
    -- // Anims and Expression \\ --
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        close = true,
        functionName = "AnimSet:Brave",
        functiontype = "client",
    },
    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-hurry",
        close = true,
        functionName = "AnimSet:Hurry",
        functiontype = "client",
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        close = true,
        functionName = "AnimSet:Business",
        functiontype = "client",
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        close = true,
        functionName = "AnimSet:Tipsy",
        functiontype = "client",
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        close = true,
        functionName = "AnimSet:Injured",
        functiontype = "client",
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        close = true,
        functionName = "AnimSet:ToughGuy",
        functiontype = "client",
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        close = true,
        functionName = "AnimSet:Sassy",
        functiontype = "client",
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        close = true,
        functionName = "AnimSet:Sad",
        functiontype = "client",
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        close = true,
        functionName = "AnimSet:Posh",
        functiontype = "client",
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        close = true,
        functionName = "AnimSet:Alien",
        functiontype = "client",
    },
    ['animations:nonchalant'] =
    {
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        close = true,
        functionName = "AnimSet:NonChalant",
        functiontype = "client",
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        close = true,
        functionName = "AnimSet:Hobo",
        functiontype = "client",
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        close = true,
        functionName = "AnimSet:Money",
        functiontype = "client",
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        close = true,
        functionName = "AnimSet:Swagger",
        functiontype = "client",
    },
    ['animations:shady'] = {
        title = "Shady",
        icon = "#animation-shady",
        close = true,
        functionName = "AnimSet:Shady",
        functiontype = "client",
    },
    ['animations:maneater'] = {
        title = "Man Eater",
        icon = "#animation-maneater",
        close = true,
        functionName = "AnimSet:ManEater",
        functiontype = "client",
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        close = true,
        functionName = "AnimSet:ChiChi",
        functiontype = "client",
    },
    ['animations:default'] = {
        title = "Default",
        icon = "#animation-default",
        close = true,
        functionName = "AnimSet:default",
        functiontype = "client",
    },
    ["expressions:angry"] = {
        title = "Angry",
        icon = "#expressions-angry",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_angry_1"},
        functiontype = "client",
    },
    ["expressions:drunk"] = {
        title = "Drunk",
        icon = "#expressions-drunk",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_drunk_1"},
        functiontype = "client",
    },
    ["expressions:dumb"] = {
        title = "Dumb",
        icon = "#expressions-dumb",
        close = true,
        functionName = "expressions",
        functionParameters = {"pose_injured_1"},
        functiontype = "client",
    },
    ["expressions:electrocuted"] = {
        title = "Electrocuted",
        icon = "#expressions-electrocuted",
        close = true,
        functionName = "expressions",
        functionParameters = {"electrocuted_1"},
        functiontype = "client",
    },
    ["expressions:grumpy"] = {
        title = "Grumpy",
        icon = "#expressions-grumpy",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_drivefast_1"},
        functiontype = "client",
    },
    ["expressions:happy"] = {
        title = "Happy",
        icon = "#expressions-happy",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_happy_1"},
        functiontype = "client",
    },
    ["expressions:injured"] = {
        title = "Injured",
        icon = "#expressions-injured",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_injured_1"},
        functiontype = "client",
    },
    ["expressions:joyful"] = {
        title = "Joyful",
        icon = "#expressions-joyful",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_dancing_low_1"},
        functiontype = "client",
    },
    ["expressions:mouthbreather"] = {
        title = "Mouthbreather",
        icon = "#expressions-mouthbreather",
        close = true,
        functionName = "expressions",
        functionParameters = {"smoking_hold_1"},
        functiontype = "client",
    },
    ["expressions:normal"] = {
        title = "Normal",
        icon = "#expressions-normal",
        close = true,
        functionName = "expressions:clear",
        functiontype = "client",
    },
    ["expressions:oneeye"] = {
        title = "One Eye",
        icon = "#expressions-oneeye",
        close = true,
        functionName = "expressions",
        functionParameters = {"pose_aiming_1"},
        functiontype = "client",
    },
    ["expressions:shocked"] = {
        title = "Shocked",
        icon = "#expressions-shocked",
        close = true,
        functionName = "expressions",
        functionParameters = {"shocked_1"},
        functiontype = "client",
    },
    ["expressions:sleeping"] = {
        title = "Sleeping",
        icon = "#expressions-sleeping",
        close = true,
        functionName = "expressions",
        functionParameters = {"dead_1"},
        functiontype = "client",
    },
    ["expressions:smug"] = {
        title = "Smug",
        icon = "#expressions-smug",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_smug_1"},
        functiontype = "client",
    },
    ["expressions:speculative"] = {
        title = "Speculative",
        icon = "#expressions-speculative",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_aiming_1"},
        functiontype = "client",
    },
    ["expressions:stressed"] = {
        title = "Stressed",
        icon = "#expressions-stressed",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_stressed_1"},
        functiontype = "client",
    },
    ["expressions:sulking"] = {
        title = "Sulking",
        icon = "#expressions-sulking",
        close = true,
        functionName = "expressions",
        functionParameters = {"mood_sulk_1"},
        functiontype = "client",
    },
    ["expressions:weird"] = {
        title = "Weird",
        icon = "#expressions-weird",
        close = true,
        functionName = "expressions",
        functionParameters = {"effort_2"},
        functiontype = "client",
    },
    ["expressions:weird2"] = {
        title = "Weird 2",
        icon = "#expressions-weird2",
        close = true,
        functionName = "expressions",
        functionParameters = {"effort_3"},
        functiontype = "client",
    },
    ['vehicle:menu'] = {
        title = "Меню",
        icon = "#citizen-action-vehicle",
        close = true,
        functiontype = "client",
        functionName = "nocore-carmenu:veh:options"
    },
}



RegisterNetEvent('nocore-inventory:OnItemAdd')
AddEventHandler('nocore-inventory:OnItemAdd', function(ItemName, Amount)
    if ItemName == 'handcuffs' then
        HasHandCuffs = true
    end
end)

RegisterNetEvent('nocore-inventory:OnItemRemove')
AddEventHandler('nocore-inventory:OnItemRemove', function(ItemName, Amount, HaveLeftSome)
    if ItemName == 'handcuffs' and not HaveLeftSome then
        HasHandCuffs = false
    end
end)
