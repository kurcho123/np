Config = {}

Config.Debug = false

-- 0 standalone
-- 1 ESX
-- 2 QBCore
Config.FrameWork = 2

-- esx object share
Config.ESX_Object = "esx:getSharedObject"

Config.GetQBCoreObject = function()
    -- Choose your objectType or made here your own.
    local objectType = 1

    if objectType == 1 then
        return exports['no-core']:GetCoreObject()
    end

    if objectType == 2 then
        return exports['qb-core']:GetSharedObject()
    end

    if objectType == 3 then
        local QBCore = nil
        local breakPoint = 0
        while not QBCore do
            Wait(100)
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)

            breakPoint = breakPoint + 1
            if breakPoint == 25 then
                print(string.format("^1[%s]^7 Could not load the sharedobject, are you sure it is called ^1˙QBCore:GetObject˙^7?", GetCurrentResourceName()))
                break
            end
        end

        return QBCore
    end
end

-- Key to open menu
Config.KeyToOpen = "E"

-- Locale for script
Config.Locale = "en"

-- ESX shared object (is no needed, its prebuilded only)
Config.ESX = 'esx:getSharedObject'

-- how much volume will adjust each +/- button
Config.VolumeAdjust = 0.01

-- Do we want cached music for dj mixes?
Config.AllowCachedMusic = true

-- DJ mixer list
Config.MixerList = {
    crastenburg = {
        mixer = {
            {
                pos = vector3(-1198.85, -198.4683, 39.324649),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(-1208.842, -184.0129, 39.324798),
                distance = 30,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    DoctoraHouse = {
        mixer = {
            {
                pos = vector3(-1988.136, -508.8752, 25.743602),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(-1988.136, -508.8752, 25.743602),
                distance = 30,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    blazeit = {
        mixer = {
            {
                pos = vector3(360.78433, -1257.906, 36.309379),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos =vector3(360.78433, -1257.906, 36.309379),
                distance = 25,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    herman = {
        mixer = {
            {
                pos = vector3(3435.2321, 5175.4365, 7.382132),
                distance = 5,
            },
            --jobs = {""} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(3435.2321, 5175.4365, 7.382132),
                distance = 25,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    BurgerShot = {
        mixer = {
            {
                pos = vector3(454.0278, -1480.6163, 29.2957),
                distance = 5,
            },
            --jobs = {""} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(447.8623, -1469.3873, 29.2957),
                distance = 20,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    Bahama = {
        mixer = {
            {
                pos = vector3(498.64315, -75.11119, 58.160202),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(498.64315, -75.11119, 58.160202),
                distance = 35,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    YellowJack = {
        mixer = {
            {
                pos = vector3(1987.5697, 3051.0451, 47.21516),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(1989.9964, 3048.3413, 47.215087),
                distance = 10,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    Tequila = {
        mixer = {
            {
                pos = vector3(-560.6964, 281.9689, 85.676544),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(-560.2447, 286.84542, 82.176361),
                distance = 20,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    Auction = {
        mixer = {
            {
                pos = vector3(-1102.285, -1277.553, 5.8471293),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(-1091.802, -1270.833, 5.8471479),
                distance = 20,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    BeanMachine = {
        mixer = {
            {
                pos = vector3(-632.0241, 232.89375, 81.881484),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(-632.0241, 232.89375, 81.881484),
                distance = 21,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    Court = {
        mixer = {
            {
                pos = vector3(326.11859, -1626.755, 60.533721),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(326.11859, -1626.755, 60.533721),
                distance = 21,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    Serviz33 = {
        mixer = {
            {
                pos = vector3(1186.8748779297,2637.3034667969,38.401866912842),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(1178.6854248047,2641.5791015625,37.753814697266),
                distance = 12,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 0.5,
    },
    SubMansion = {
        mixer = {
            {
                pos = vector3(-1817.3, 447.27191, 128.40744),
                distance = 5,
            },
            -- jobs = {"job","other job"} -- if left nil everyone will be able to open it
        },
        speaker = {
            {
                pos = vector3(-1791.043, 442.06112, 128.40538),
                distance = 50,
            },
        },
		-- max value is 1.0
		-- 1.0 = 100% volume
        defaultVolume = 1.0,
    },
    Cranberry = {
        mixer = {
            {
                pos = vector3(-1074.461, -314.1144, 37.807865),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-1074.461, -314.1144, 37.807865),
                distance = 15,
            },
        },
        defaultVolume = 0.1,
    },
    Mechanic2 = {
        mixer = {
            {
                pos = vector3(547.16302, -181.9601, 54.493167),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(547.16302, -181.9601, 54.493167),
                distance = 25,
            },
        },
        defaultVolume = 0.2,
    },
    MechanicMain = {
        mixer = {
            {
                pos = vector3(955.13098, -965.0042, 39.506786),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(931.97009, -968.0231, 39.499851),
                distance = 45,
            },
            
        },
        defaultVolume = 0.2,
    },
    MechanicMain = {
        mixer = {
            {
                pos = vector3(1001.3438, -137.2716, 77.405433),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(970.66223, -121.9541, 74.35308),
                distance = 60,
            },
            
        },
        defaultVolume = 0.2,
    },
    RS = {
        mixer = {
            {
                pos = vector3(-300.3701, 196.95764, 100.85532),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-301.8566, 204.05297, 102.35511),
                distance = 25,
            },
            
        },
        defaultVolume = 0.2,
    },
    FraudAuto = {
        mixer = {
            {
                pos = vector3(804.65, -830.34, 26.34),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(804.65, -830.34, 26.34),
                distance = 50,
            },
            
        },
        defaultVolume = 0.2,
    },
    
    Svatba = {
        mixer = {
            {
                pos = vector3(-1492.82, 805.32135, 182.083),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-1492.82, 805.32135, 182.083),
                distance = 30,
            },
            
        },
        defaultVolume = 0.2,
    },

    FraudAutoMansion = {
        mixer = {
            {
                pos = vector3(-3221.167, 780.79089, 8.2626504),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-3221.167, 780.79089, 8.2626504),
                distance = 60,
            },
            
        },
        defaultVolume = 0.2,
    },
    
    BigBrother = {
        mixer = {
            {
                pos = vector3(-1173.902, 356.26367, 71.685577),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-1173.902, 356.26367, 71.685577),
                distance = 30,
            },
            
        },
        defaultVolume = 0.2,
    },

    CatCaffe = {
        mixer = {
            {
                pos = vector3(-592.3943, -1049.67, 22.344198),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-579.4549, -1063.787, 24.365159),
                distance = 20,
            },
            
        },
        defaultVolume = 0.2,
    },

    CayoPerico = {
        mixer = {
            {
                pos = vector3(4891.2465, -4923.353, 3.3674905),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(4891.2465, -4923.353, 3.3674905),
                distance = 70,
            },
            
        },
        defaultVolume = 0.2,
    },

    BeanLegion = {
        mixer = {
            {
                pos = vector3(122.81907653809,-1043.6800537109,29.277927398682),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(122.81907653809,-1043.6800537109,29.277927398682),
                distance = 19,
            },
            
        },
        defaultVolume = 0.2,
    },

    policekushta = {
        mixer = {
            {
                pos = vector3(-733.79852294922,493.03448486328,109.56735229492),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(-733.79852294922,493.03448486328,109.56735229492),
                distance = 25,
            },
            
        },
        defaultVolume = 0.2,
    },

    surgery = {
        mixer = {
            {
                pos = vector3(383.51, -1405.5, 32.5),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(383.51, -1405.5, 32.5),
                distance = 5,
            },
            
        },
        defaultVolume = 0.2,
    },

    surgery2 = {
        mixer = {
            {
                pos = vector3(372.61, -1393.63, 32.5),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(372.61, -1393.63, 32.5),
                distance = 5,
            },
            
        },
        defaultVolume = 0.2,
    },

    mri = {
        mixer = {
            {
                pos = vector3(387.11, -1413.79, 32.5),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(387.11, -1413.79, 32.5),
                distance = 5,
            },
            
        },
        defaultVolume = 0.2,
    },

    xray = {
        mixer = {
            {
                pos = vector3(382.7, -1418.72, 32.5),
                distance = 1,
            },
        },
        speaker = {
            {
                pos = vector3(382.7, -1418.72, 32.5),
                distance = 5,
            },
            
        },
        defaultVolume = 0.2,
    },

    diskoteka = {
        mixer = {
            {
                pos = vector3(375.92, 275.69, 92.4),
                distance = 2,
            },
        },
        speaker = {
            {
                pos = vector3(367.23, 279.56, 93.63),
                distance = 25,
            },
            
        },
        defaultVolume = 0.5,
    },

    diskotekaVip = {
        mixer = {
            {
                pos = vector3(399.13, 269.32, 92.05),
                distance = 2,
            },
        },
        speaker = {
            {
                pos = vector3(403.18, 260.09, 95.0),
                distance = 15,
            },
            
        },
        defaultVolume = 0.3,
    },

    diskotekaVip2 = {
        mixer = {
            {
                pos = vector3(384.25, 279.8, 94.99),
                distance = 2,
            },
        },
        speaker = {
            {
                pos = vector3(385.26, 274.8, 96.99),
                distance = 10,
            },
            
        },
        defaultVolume = 0.3,
    },

    blackGarage = {
        mixer = {
            {
                pos = vector3(944.85, -1566.04, 30.74),
                distance = 2,
            },
        },
        speaker = {
            {
                pos = vector3(921.04, -1561.04, 34.42),
                distance = 65,
            },
            
        },
        defaultVolume = 0.5,
    },

    bahama = {
        mixer = {
            {
                pos = vector3(-1376.41, -607.36, 31.32),
                distance = 2,
            },
        },
        speaker = {
            {
                pos = vector3(-1387.26, -614.33, 31.97),
                distance = 45,
            },
            
        },
        defaultVolume = 0.5,
    },
}

-- How much ofter the player position is updated ?
Config.RefreshTime = 100

-- how much close player has to be to the sound before starting updating position ?
Config.distanceBeforeUpdatingPos = 40

-- Message list
Config.Messages = {
    ["streamer_on"]  = "Streamer mode is on. From now you will not hear any music/sound.",
    ["streamer_off"] = "Streamer mode is off. From now you will be able to listen to music that players might play.",
}

-- external xsound?
Config.UseExternalxSound = false

-- if you want to use high_3dsounds
Config.UseHighSound = false

-- name of the lib
Config.xSoundName = "xsound"

if Config.UseHighSound then
    Config.xSoundName = "high_3dsounds"
    Config.UseExternalxSound = true
end