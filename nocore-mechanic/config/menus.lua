Config = Config or {}

Config.Menus = {
    ['empty'] = {
        title = '',
        options = {},
    },
    ['main'] = {
        title = '',
        options = {
            --{label = 'Поправи', img = 'img/icons/repair.png', price = 450, onSelect = function() repairtVehicle(customVehicle, 'main') end},
            {label = 'Визуален', img = 'img/icons/visual.png', openSubMenu = 'visual'},
            {label = 'Вътрешен', img = 'img/icons/upgrade.png', openSubMenu = 'upgrade'}
        },
        onBack = function() closeUI(1) end,
        defaultOption = 1
    },
    ['cosmetic'] = {
        title = '',
        options = {
            --{label = 'Поправи', img = 'img/icons/repair.png', price = 450, onSelect = function() repairtVehicle2(customVehicle, 'cosmetic') end},
            {label = 'Визуален', img = 'img/icons/visual.png', openSubMenu = 'visual'}
            --{label = 'Вътрешен', img = 'img/icons/upgrade.png', openSubMenu = 'upgrade'}
        },
        onBack = function() closeUI(1) end,
        defaultOption = 1
    },
        ['upgrade'] = {
            title = 'ЪПГРЕЙДИ',
            options = {
                {label = 'Двигател', img = 'img/icons/engine.png', modType = 11, priceMult = {12.0, 22.0, 33.0, 44.0, 55.0, 69.0}},
                {label = 'Спирачки', img = 'img/icons/brakes.png', modType = 12, priceMult = {2.0, 5.2, 6.3, 8.2, 11.0}},
                {label = 'Транзмисия', img = 'img/icons/transmission.png', modType = 13, priceMult = {4.0, 5.0, 6.3, 7.7, 9.3}},
                {label = 'Окачване', img = 'img/icons/suspension.png', modType = 15, priceMult = {2.3, 4.8, 5.9, 6.2, 8.0, 8.7, 9.0}},
                --{label = 'Брониране', img = 'img/icons/armor.png', modType = 16, priceMult = {5.0, 15.0, 25.0, 35.0, 50.0, 60.0, 80.0, 90.0}},
                {label = 'Турбо', img = 'img/icons/engine.png', modType = 18, priceMult = {0.0, 8.0}},
            },
            onBack = function() updateMenu('main') end
        },
        ['visual'] = {
            title = 'ВИЗУАЛНИ',
            options = {
                {label = 'Екстериор', img = 'img/icons/body.png', openSubMenu = 'body_parts'},
                {label = 'Интериор', img = 'img/icons/body.png', openSubMenu = 'inside_parts'},
                {label = 'Боя', img = 'img/icons/respray.png', openSubMenu = 'respray'},
                {label = 'Гуми', img = 'img/icons/wheel.png', openSubMenu = 'wheels', onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf', {x = -1.8, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -20.0})
                end},
                {label = 'Табелка', img = 'img/icons/plate.png', openSubMenu = 'plate'},
                {label = 'Светлини', img = 'img/icons/headlights.png', openSubMenu = 'lights'},
                {label = 'Стикери', img = 'img/icons/respray.png', openSubMenu = 'stickers'},
                {label = 'Екстри', img = 'img/icons/plus.png', modType = 'extras', priceMult = 2.0},
                {label = 'Фолио', img = 'img/icons/door.png', modType = 'windowTint', priceMult = 1.12, onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'window_lf', {x = -2.0, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -10.0})
                end, onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end},
                {label = 'Клаксон', img = 'img/icons/horn.png', modType = 14, priceMult = 1.12},
                {label = 'Интериор', img = 'img/icons/body.png', modType = 27, priceMult = 6.98},
                {label = 'Плакети', img = 'img/icons/check.png', modType = 35, priceMult = 4.19},
                {label = 'Говорители', img = 'img/icons/speaker.png', modType = 36, priceMult = 6.98},
                {label = 'Багажник', img = 'img/icons/trunk.png', modType = 37, priceMult = 5.58, onSelect = function() openDoors(customVehicle, {0,0,0,0,0,1,1}) end},
                {label = 'Хидравлика', img = 'img/icons/hydrulics.png', modType = 38, priceMult = 5.12},
                {label = 'Блок на двигателя', img = 'img/icons/engine_block.png', modType = 39, priceMult = 5.12, onSelect = function() openDoors(customVehicle, {0,0,0,0,1,0,0}) end},
                {label = 'Въздушен филтър', img = 'img/icons/air_filter.png', modType = 40, priceMult = 3.72},
                {label = 'Подпорки', img = 'img/icons/suspension.png', modType = 41, priceMult = 6.51},
                {label = 'Резервоар', img = 'img/icons/gas_tank.png', modType = 45, priceMult = 4.19},
            },
            onBack = function() updateMenu('main') end
        },
            ['body_parts'] = {
                title = 'ТУНИНГ',
                options = {
                    {label = 'Спойлер', img = 'img/icons/spoiler.png', modType = 0, priceMult = 2.65},
                    {label = 'Предна броня', img = 'img/icons/bumper.png', modType = 1, priceMult = 2.12},
                    {label = 'Задна броня', img = 'img/icons/bumper.png', modType = 2, priceMult = 2.12, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = 0.0, y = -4.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Прагове', img = 'img/icons/bumper.png', modType = 3, priceMult = 2.65, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf', {x = -2.5, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -20.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Ауспух', img = 'img/icons/exhaust.png', modType = 4, priceMult = 2.12, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = 0.0, y = -4.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Клетка', img = 'img/icons/body.png', modType = 5, priceMult = 2.12, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = 1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Решетка', img = 'img/icons/check.png', modType = 6, priceMult = 2.72},
                    {label = 'Капак', img = 'img/icons/hood.png', modType = 7, priceMult = 2.88},
                    {label = 'Раздувки', img = 'img/icons/bumper.png', modType = 8, priceMult = 2.12},
                    {label = 'Калници', img = 'img/icons/bumper.png', modType = 9, priceMult = 2.12},
                    {label = 'Покрив', img = 'img/icons/check.png', modType = 10, priceMult = 2.58},
                    {label = 'Арх корица', img = 'img/icons/bumper.png', modType = 42, priceMult = 4.19},
                    {label = 'Антени', img = 'img/icons/check.png', modType = 43, priceMult = 1.12},
                    {label = 'Крила', img = 'img/icons/bumper.png', modType = 44, priceMult = 6.05},
                    {label = 'Прозорци', img = 'img/icons/door.png', modType = 46, priceMult = 1.0},
                },
                onBack = function() updateMenu('visual') end
            },
            ['inside_parts'] = {
                title = 'ИНТЕРИОР',
                options = {
                    {label = 'Табло', img = 'img/icons/dashboard.png', modType = 29, priceMult = 4.65},
                    {label = 'Табло вид', img = 'img/icons/dashboard.png', modType = 30, priceMult = 4.19},
                    {label = 'Говорител на вратите', img = 'img/icons/speaker.png', modType = 31, priceMult = 5.58, onSelect = function() openDoors(customVehicle, {1,1,1,1,0,0,0}) end},
                    {label = 'Седалки', img = 'img/icons/seat.png', modType = 32, priceMult = 4.65},
                    {label = 'Волан', img = 'img/icons/steering_wheel.png', modType = 33, priceMult = 4.19},
                    {label = 'Скоростен лост', img = 'img/icons/shifter_leaver.png', modType = 34, priceMult = 3.26},
                    {label = 'Орнаменти', img = 'img/icons/check.png', modType = 28, priceMult = 0.9},
                },
                onBack = function() updateMenu('visual') end
            },
            ['respray'] = {
                title = 'ПРЕБОЯДИСВАНЕ',
                options = {
                    {label = 'Основен', img = 'img/icons/respray.png', modType = 'color1', customType = 'customColor', priceMult = 1.12, onSelect = function() openColorPicker('Primary Color', 'color1', true, 0.1) end},
                    {label = 'Вторичен', img = 'img/icons/respray.png', modType = 'color2', customType = 'customColor', priceMult = 0.66, onSelect = function() openColorPicker('Secondary Color', 'color2', true, 0.5) end},
                    {label = 'Основен Вид боя', img = 'img/icons/respray.png', modType = 'paintType1', priceMult = 0.5},
                    {label = 'Вторичен Вид боя', img = 'img/icons/respray.png', modType = 'paintType2', priceMult = 0.5},
                    {label = 'Боя на интериора', img = 'img/icons/respray.png', modType = 'interiorcolor', priceMult = 0.5, onSelect = function() openColorPicker('Pearlescent Color', 'pearlescentColor', false, 0.5) end},
                    {label = 'Боя на таблото', img = 'img/icons/respray.png', modType = 'dashboardcolor', priceMult = 0.5, onSelect = function() openColorPicker('Pearlescent Color', 'pearlescentColor', false, 0.5) end},
                    {label = 'Перла', img = 'img/icons/respray.png', modType = 'pearlescentColor', customType = 'color', priceMult = 0.88, onSelect = function() openColorPicker('Pearlescent Color', 'pearlescentColor', false, 0.5) end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['wheels'] = {
                title = 'ГУМИ',
                options = {
                    {label = 'Вид гуми', img = 'img/icons/wheel.png', onSelect = function() updateMenu('wheels_type') end},
                    {label = 'Цвят гуми', img = 'img/icons/respray.png', modType = 'wheelColor', customType = 'color', priceMult = 0.66, onSelect = function() openColorPicker('Wheels Color', 'wheelColor', false, 0.5) end},
                    {label = 'Дим', img = 'img/icons/respray.png', modType = 'tyreSmokeColor', customType = 'customColor', priceMult = 1.12, onSelect = function() openColorPicker('Tyre Smoke Color', 'tyreSmokeColor', true, 0.5) end},
                },
                onBack = function() updateMenu('visual') SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true) end
            },
                ['wheels_type'] = {
                    title = 'ДЖАНТИ',
                    options = {
                        {label = 'Sport', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 0) end},
                        {label = 'Muscle ', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 1) end},
                        {label = 'Lowrider', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 2) end},
                        {label = 'SUV', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 3) end},
                        {label = 'Offroad', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 4) end},
                        {label = 'Tuner', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 5) end},
                        {label = 'Bike Wheels', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 6) end},
                        {label = 'High End', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 7) end},
                        {label = 'Addon1', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 8) end},
                        {label = 'Addon2', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 9) end},
                        {label = 'Addon3', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 10) end},
                        {label = 'Addon4', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 11) end},
                        {label = 'Addon5', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 12) end},
                        --{label = 'Addon6', img = 'img/icons/wheel.png', modType = 23, priceMult = 1.65, onSelect = function() SetVehicleModData(customVehicle, 'wheels', 13) end},
                    },
                    onBack = function() updateMenu('wheels') end
                },
            ['plate'] = {
                title = 'РЕГ. ТАБЕЛА',
                options = {
                    {label = 'Модел', img = 'img/icons/plate.png', modType = 25, priceMult = 1.1},
                    {label = 'Цвят', img = 'img/icons/respray.png', modType = 'plateIndex', priceMult = 1.1, onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = -2.0, y = -2.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Рамка', img = 'img/icons/bumper.png', modType = 26, priceMult = 3.49},
                },
                onBack = function() updateMenu('visual') end
            },
            ['lights'] = {
                title = 'СВЕТЛИНИ',
                options = {
                    {label = 'Xenon', img = 'img/icons/headlights.png', modType = 'modXenon', priceMult = 0.1, onSelect = function() SetVehicleEngineOn(customVehicle, true, false, false) end},
                    {label = 'Neon', img = 'img/icons/headlights.png', modType = 'neonColor', customType = 'customColor', priceMult = 1.12, onSelect = function() SetVehicleEngineOn(customVehicle, true, false, false) openColorPicker('Neon Color', 'neonColor', true, 0.5) end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['stickers'] = {
                title = 'СТИКЕРИ',
                options = {
                    {label = 'Стикери', img = 'img/icons/respray.png', modType = 48, priceMult = 6.0},
                    {label = 'Livery', img = 'img/icons/respray.png', modType = 'livery', priceMult = 6.0},
                },
                onBack = function() updateMenu('visual') end
            },
}