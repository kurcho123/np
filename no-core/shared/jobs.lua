Shared = Shared or {}
Shared.Jobs = {
	["unemployed"] = {
		label = "Безработен",
        defaultDuty = true,
		grades = {
            [0] = { name = "на социални", offDutyPay = 100, payment = 100 },
		}
	},
    -- // Goverment Jobs \\ --
	["police"] = {
        label = "Полиция",
        defaultDuty = true,
        grades = {
            [0] = { name = "Кадет", offDutyPay = 100, payment = 300 },
            [1] = { name = "Младши Полицай", offDutyPay = 100, payment = 450 },
            [2] = { name = "Главен Полицай", offDutyPay = 100, payment = 600 },
            [3] = { name = "Инспектор", offDutyPay = 100, payment = 670 },
            [4] = { name = "Сержант", offDutyPay = 100, payment = 700 },
            [5] = { name = "Лейтенант", offDutyPay = 100, payment = 730 },
            [6] = { name = "Комисар", isboss = true, offDutyPay = 100, payment = 780 },
			[7] = { name = "Гл.Секретар", isboss = true, offDutyPay = 100, payment = 850 },
        }
	},
	["ambulance"] = {
		label = "Бърза Помощ",
        defaultDuty = true,
		grades = {
            [0] = { name = "Парамедик", offDutyPay = 100, payment = 250 },
			[1] = { name = "Доктор", offDutyPay = 100, payment = 350 },
			[2] = { name = "Гл.Лекар", offDutyPay = 100, payment = 400 },
			[3] = { name = "Зам.Шеф", offDutyPay = 100, payment = 450 },
			[4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 455 },
        }
	},
	["taxi"] = {
		label = "Taxi",
        defaultDuty = true,
		grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 100 },
			[1] = { name = "Чирак", offDutyPay = 100, payment = 100 },
			[2] = { name = "Работник", offDutyPay = 100, payment = 100 },
			[3] = { name = "Зам.Шеф", offDutyPay = 100, payment = 100 },
			[4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 100 },
		}
	},
	["realestate"] = {
		label = "Брокер",
        defaultDuty = true,
		grades = {
            [0] = { name = "Стажaнт", offDutyPay = 100, payment = 100 },
            [1] = { name = "Секретар/ка", offDutyPay = 100, payment = 100 },
            [2] = { name = "Старши брокер", offDutyPay = 100, payment = 100 },
			[3] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 100 },
        }
	},
    ["judge"] = {
        label = "Съдебна Власт",
        defaultDuty = true,
        grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 300 },
            [1] = { name = "Нотариус", offDutyPay = 100, payment = 550 },
            [2] = { name = "Адвокат", offDutyPay = 100, payment = 500 },
            [3] = { name = "Прокурор", offDutyPay = 100, payment = 550 },
            [4] = { name = "Психолог", offDutyPay = 100, payment = 550 },
            [5] = { name = "Съдия", isboss = true, offDutyPay = 100, payment = 650 },
        }
    },
    -- // Сервизи \\ --
    ["mechanic"] = {
        label = "Механик",
        defaultDuty = true,
        type = "mechanic",
        grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 150 },
            [1] = { name = "Работник", offDutyPay = 100, payment = 175 },
            [2] = { name = "Старши Механик", offDutyPay = 100, payment = 200 },
            [3] = { name = "Зам.Шеф", offDutyPay = 100, payment = 250 },
            [4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 300 },
        }
    },
    ["fixit"] = {
        label = "Механик",
        defaultDuty = false,
        type = "mechanic",
        grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 100 },
            [1] = { name = "Работник", offDutyPay = 100, payment = 100 },
            [2] = { name = "Старши Механик", offDutyPay = 100, payment = 100 },
            [3] = { name = "Зам.Шеф", offDutyPay = 100, payment = 100 },
            [4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 100 },
        }
    },
    ["oldtown"] = {
        label = "Механик",
        defaultDuty = true,
        type = "mechanic",
        grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 100 },
            [1] = { name = "Работник", offDutyPay = 100, payment = 100 },
            [2] = { name = "Старши Механик", offDutyPay = 100, payment = 100 },
            [3] = { name = "Зам.Шеф", offDutyPay = 100, payment = 100 },
            [4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 100 },
        }
    },
    ["misfits"] = {
        label = "Механик",
        defaultDuty = true,
        type = "mechanic",
        grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 100 },
            [1] = { name = "Работник", offDutyPay = 100, payment = 100 },
            [2] = { name = "Старши Механик", offDutyPay = 100, payment = 100 },
            [3] = { name = "Зам.Шеф", isboss = true, offDutyPay = 100, payment = 100 },
            [4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 100 },
        }
    },
    -- // Бизнеси \\ --
    ['pizzathis'] = {
        label = 'Pizza This',
		defaultDuty = true,
        type = 'restaurant',
		grades = {
            [0] = { name = 'Чирак', payment = 100 },
			[1] = { name = 'Пицар', payment = 100 },
			[2] = { name = 'Стар пицар', payment = 100 },
			[3] = { name = 'Управител', payment = 100 },
			[4] = { name = 'Собственик', isboss = true, payment = 100 },
        }
	},
    ["blazeit"] = {
        label = "Blazeit",
        defaultDuty = true,
        type = 'restaurant',
        grades = {
            [0] = { name = 'Сервитьор', offDutyPay = 100, payment = 100, },
            [1] = { name = 'Барман', offDutyPay = 100, payment = 100, },
            [2] = { name = 'DJ', offDutyPay = 100, payment = 100, },
            [3] = { name = 'Зам.Шеф', offDutyPay = 100, payment = 100, isboss = true, },
            [4] = { name = "Шеф", offDutyPay = 100, payment = 100, isboss = true, }
        }
    },
    ["catcoffee"] = {
        label = "UwU Coffee",
        defaultDuty = true,
        type = 'restaurant',
        grades = {
            [0] = { name = 'Сервитьор', offDutyPay = 100, payment = 100 },
            [1] = { name = 'Барман', offDutyPay = 100, payment = 100 },
            [2] = { name = 'DJ', offDutyPay = 100, payment = 100 },
            [3] = { name = 'Зам.Шеф', offDutyPay = 100, payment = 100 },
            [4] = { name = "Шеф", offDutyPay = 100, payment = 100, isboss = true }
        }
    },
    ['beanlegion'] = {
        label = 'Bean Machine',
		defaultDuty = true,
        type = 'restaurant',
		grades = {
            [0] = { name = 'Сервитьор', payment = 100 },
			[1] = { name = 'Барман', payment = 100 },
			[2] = { name = 'DJ', payment = 100 },
			[3] = { name = 'Зам.Шеф', payment = 100 },
			[4] = { name = 'Шеф', isboss = true, payment = 100 },
        }
	},
    ["cranberry"] = {
        label = "Cranberry",
        defaultDuty = true,
        type = 'restaurant',
        grades = {
            [0] = { name = 'Сервитьор', offDutyPay = 100, payment = 100 },
            [1] = { name = 'Барман', offDutyPay = 100, payment = 100 },
            [2] = { name = 'DJ', offDutyPay = 100, payment = 100 },
            [3] = { name = "Шеф", offDutyPay = 100, payment = 100, isboss = true }
        }
    },
    ["burger"] = {
        label = "Burgershot",
        defaultDuty = true,
        type = 'restaurant',
        grades = {
            [0] = { name = "Общак", offDutyPay = 100, payment = 100 },
			[1] = { name = "Касиер", offDutyPay = 100, payment = 100 },
			[2] = { name = "Готвач", offDutyPay = 100, payment = 100 },
			[3] = { name = "Управител", offDutyPay = 100, payment = 100 },
			[4] = { name = "Шеф", isboss = true, offDutyPay = 100, payment = 100 },
        }
    },
    ["coffee"] = {
        label = "Bean Кафене",
        defaultDuty = true,
        type = 'restaurant',
        grades = {
            [0] = { name = 'Сервитьор', offDutyPay = 100, payment = 100 },
            [1] = { name = 'Барман', offDutyPay = 100, payment = 100 },
            [2] = { name = 'Мениджър', offDutyPay = 100, payment = 100 },
            [3] = { name = "Шеф", offDutyPay = 100, payment = 100, isboss = true }
        }
    },
    ["redcircle"] = {
        label = "Red Circle",
        defaultDuty = true,
        type = 'restaurant',
        grades = {
            [0] = { name = 'Сервитьор', offDutyPay = 100, payment = 100 },
            [1] = { name = 'Барман', offDutyPay = 100, payment = 100 },
            [2] = { name = 'Мениджър', offDutyPay = 100, payment = 100 },
            [3] = { name = "Шеф", offDutyPay = 100, payment = 100, isboss = true }
        }
    },
    ["crastenburg"] = {
        label = "Crastenburg Hotel",
        defaultDuty = true,
        grades = {
            [0] = { name = 'Санитар', offDutyPay = 100, payment = 100 },
            [1] = { name = 'Рецепционист', offDutyPay = 100, payment = 100 },
            [2] = { name = 'Управител', offDutyPay = 100, payment = 100 },
            [3] = { name = "Шеф", offDutyPay = 100, payment = 100, isboss = true }
        }
    },
    ["tehnicheski"] = {
        label = 'Auto Expert',
        defaultDuty = true,
        grades = {
            [0] = { name = "Стажант", offDutyPay = 100, payment = 100 },
            [1] = { name = "Работник", offDutyPay = 100, payment = 100 },
            [2] = { name = "Управител", offDutyPay = 100, payment = 100, isboss = true },
            [3] = { name = "Собственик", offDutyPay = 100, payment = 100, isboss = true },
        }
    },
    ["fraudauto"] = {
        label = "Автокъща",
        defaultDuty = true,
        type = "mechanic",
        grades = {
            [0] = { name = "Чирак", offDutyPay = 100, payment = 100 },
            [1] = { name = "Охрана", offDutyPay = 100, payment = 100 },
            [2] = { name = "Продавач-консултант", offDutyPay = 100, payment = 100 },
            [3] = { name = "Управител", offDutyPay = 100, payment = 100 },
            [4] = { name = "Собственик", offDutyPay = 100, payment = 100, isboss = true }
        }
    },
    ["jamals"] = {
        label = "Джамбазите на Черния",
        defaultDuty = true,
        type = "mechanic",
        grades = {
            [0] = { name = "Top G", offDutyPay = 100, payment = 100},
            [1] = { name = "Top G 1", offDutyPay = 100, payment = 100},
            [2] = { name = "Top G 2", offDutyPay = 100, payment = 100},
        }
    },
    ['news'] = {
		label = 'Weazel News',
		defaultDuty = true,
		grades = {
            [0] = { name = 'Личен асистент', payment = 100 },
			[1] = { name = 'Видео асистент', payment = 100 },
            [2] = { name = 'Репортер', payment = 100 },
            [3] = { name = 'Графичен Дизайнер', payment = 100 },
            [4] = { name = 'Главен продуцент', payment = 100 },
            [5] = { name = 'Главен редактор', isboss = true, payment = 100 },
        }
	},
    ["emergency"] = {
        label = "Частен кабинет",
        defaultDuty = true,
        grades = {
            [0] = { name = "Лекар", offDutyPay = 100, payment = 100 },
        }
    },
    -- // Non-Whitelisted \\ --
    ["trucker"] = {
		label = "Шофьор",
		defaultDuty = true,
		grades = {
            [0] = { name = "Работник", offDutyPay = 100, payment = 100 },
		}
	},
    ["garbage"] = {
        label = "ЕкоГлупак",
        defaultDuty = true,
        grades = {
            [0] = { name = "Роб", offDutyPay = 100, payment = 100 },
        }
    },
    ["miner"] = {
        label = "Миньор",
        defaultDuty = true,
        grades = {
            [0] = { name = "Работник", offDutyPay = 100, payment = 100 },
        }
    },
    ["busdriver"] = {
        label = "BusDrive ООД",
        defaultDuty = true,
        grades = {
            [0] = { name = "Работник", offDutyPay = 100, payment = 100 },
        }
    },
    ["courier"] = {
        label = "Speedy",
        defaultDuty = true,
        grades = {
            [0] = { name = "Куриер", offDutyPay = 100, payment = 100 },
        }
    },
    ["gardener"] = {
        label = "Градинар",
        defaultDuty = true,
        grades = {
            [0] = { name = "Роб", offDutyPay = 100, payment = 100 },
        }
    },
    ["wood"] = {
        label = "Дървар",
        defaultDuty = true,
        grades = {
            [0] = { name = "Роб", offDutyPay = 100, payment = 100 },
        }
    },
}