Config = Config or {}



Config.ATMDistance = 1.5 -- How close you need to be in order to access the ATM
Config.CorePrefix = 'no-core' -- Core Prefix
Config.CoreName = 'Framework' -- Core Name
Config.MinCops = 25 -- Minimum Cops to start
Config.StartOnEvent = false -- If set to true you need to use TriggerServerEvent("zx-atmrob:server:start")
Config.LocalCoolDown = 5 -- Local Cool Down only use if StartOnEvent is true (in minutes) When this time ends the player will not be able to rob atm.
Config.GlobalCoolDown = 15 -- Global Cool Down (in minutes) Disables the "zx-atmrob:server:start" event and not able to start ATM Robbery
Config.BombTimer = math.random(2500, 5000) -- progressbar time
Config.MinBombLevel = 1 -- Min bomb level if set to 2: 2, 3 and 4 will work.
Config.MemoryGame = {
    [1] = 6,    -- correctBlocks = Number of correct blocks the player needs to click
    [2] = 4,    -- incorrectBlocks = number of incorrect blocks after which the game will fail
    [3] = 3,    -- timetoShow = time in secs for which the right blocks will be shown
    [4] = 10,   -- timetoLose = maximum time after timetoshow expires for player to select the right blocks
}
Config.ATM = { -- ATM models, and offsets
	[-870868698] = {-0.8, -0.15},
	[-1126237515] = {-0.5, -0.07},
	[-1364697528] = {-0.5, -0.07},
	[506770882] = {-0.5, -0.07}
}
Config.CashProps = {
    GetHashKey("xs_prop_arena_cash_pile_s"),
    GetHashKey("xs_prop_arena_cash_pile_m"),
    GetHashKey("xs_prop_arena_cash_pile_l"),
}
Config.MinReward = 600
Config.MaxReward = 800

Config.Lang = {
    ["startatm"] = "You have little timе to do the job",
    ["timeend"] = "Your time is up, :/",
    ["cancelled_progressbar"] = "Отказано..",
    ["bombtimer_progressbar"] = "Бомба..",
    ["colecting_money"] = "Взимане..",
}

Config.RegisterExplosives = true
Config.Explosives = {
    [1] = {
        item = "explosive_lv1"
    },
    [2] = {
        item = "explosive_lv2"
    },
    [3] = {
        item = "explosive_lv3"
    },
    [4] = {
        item = "explosive_lv4"
    },
}


