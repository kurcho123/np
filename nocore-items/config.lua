Config = Config or {}

Config.Debug = true

Config.Consumables = {
  --[[ ["itmename"] = {
    Drink = true, -- if true gets default drink anim and thirst
    Food = true,-- if true gets default food anim and hunger
    Prop = "cup2", -- Prop for the animation
    Animation = "cup2", -- Animation (dpemotes)
    AnimationDictionary = "cup2", -- Animation dictionary if set to something it will play that emote and not play emot from dpemotes
    ProgressbarIcon = "cup2", -- Icon for the progressbar (default gets the item name)
    ProgressbarDuration = 5000, -- Progressbar duration, default 5000ms (in ms, 5s)
    ProgressbarLabel = "Използваш", -- Progressbar label, default for Drink "Пиеш..", and default for Food = "Ядеш.."
    Metas = {
      ["thirst"] = math.random(25, 30),
      ["hunger"] = math.random(25, 30),
      ["drunk"] = math.random(25, 30),
    },
    Function = function()
      exports['nocore-buffs']:StaminaBuffEffect(15000, 1.4)
    end, -- additional function on use, like buffs
    }, ]]
  ["slushy"] = {
      Drink = true, -- if true gets default drink prop and anim
      Prop = "Cup", -- Prop for the animation
      Animation = "idle_c", -- Animation (dpemotes)
      AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a", -- Animation dictionary if set to something it will play that emote and not play emot from dpemotes
      Metas = {
        ["thirst"] = math.random(25, 30),
      },
  },
  ["redbull"] = {
      Drink = true, -- if true gets default drink prop and anim
      Prop = "orangotang", -- Prop for the animation
      Animation = "idle_c", -- Animation (dpemotes)
      AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a", -- Animation dictionary if set to something it will play that emote and not play emot from dpemotes
      Metas = {
        ["thirst"] = math.random(25, 30),
      },
      Function = function()
        redbullshit = redbullshit + 1
        exports['nocore-buffs']:StaminaBuffEffect(60000, 1.0)
        if redbullshit == 3 then
          SetTimeout(5 * 60000,function()
            redbullshit = 0
          end)
        elseif redbullshit >= 4 then
          Wait(math.random(2500, 5000))
          Framework.Functions.Notify('Ти предозира', 'error', 5000)
          SetEntityHealth(PlayerPedId(), 0)
        end
        print(redbullshit)
      end
  },
  ["nosenergy"] = {
      Drink = true, -- if true gets default drink prop and anim
      Prop = "orangotang", -- Prop for the animation
      Animation = "idle_c", -- Animation (dpemotes)
      AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a", -- Animation dictionary if set to something it will play that emote and not play emot from dpemotes
      Metas = {
        ["thirst"] = math.random(25, 30),
      },
      Function = function()
        redbullshit = redbullshit + 1
        exports['nocore-buffs']:StaminaBuffEffect(60000, 1.0)
        if redbullshit == 3 then
          SetTimeout(5 * 60000,function()
            redbullshit = 0
          end)
        elseif redbullshit >= 4 then
          Wait(math.random(2500, 5000))
          Framework.Functions.Notify('Ти предозира', 'error', 5000)
          SetEntityHealth(PlayerPedId(), 0)
        end
        print(redbullshit)
      end
  },
  ["wildberriesjuice"] = {
    Drink = true,
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    Metas = {
      ["thirst"] = math.random(25, 30),
    },
  },
  ["lemonfresh"] = {
    Drink = true,
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    Metas = {
      ["thirst"] = math.random(25, 30),
    },
  },
  ["watermelonfresh"] = {
    Drink = true,
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    Metas = {
      ["thirst"] = math.random(25, 30),
    },
  },
  ["bananashake"] = {
    Drink = true,
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    Metas = {
      ["thirst"] = math.random(25, 30),
    },
  },
  ["grapefruitfresh"] = {
    Drink = true,
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    Metas = {
      ["thirst"] = math.random(25, 30),
    },
  },
  ["airqn"] = {
    Drink = true,
    Prop = "cup2",
    Metas = {
      ["thirst"] = math.random(25, 30),
      ["drunk"] = math.random(-20, -10),
    },
  },
  ["water"] = {
    Drink = true,
    Prop = "water",
    Metas = {
      ["thirst"] = math.random(10, 15),
    },
  },
  ["blaze_water"] = {
    Drink = true,
    Prop = "water",
    Metas = {
      ["thirst"] = math.random(15, 20),
    },
  },
  ["ecola"] = {
    Drink = true,
    Prop = "cola",
  },
  ["orangotang"] = {
    Drink = true,
    Prop = "orangotang",
  },
  ["applejuice"] = {
    Drink = true,
    Prop = "orangotang",
  },
  ["orangejuice"] = {
    Drink = true,
    Prop = "orangotang",
  },
  ["milkshake"] = {
    Drink = true,
    Prop = "water",
  },
  ["sprunk"] = {
    Drink = true,
    Prop = "sprunk",
  },
  ["coffee"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["bigfruit"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["highnoon"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["speedball"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["gunkaccino"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["bratte"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["flusher"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["ecocoffee"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["caffeagra"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["bcoffee"] = {
    Drink = true,
    Prop = "bcoffee",
  },
  ["bcoffee2"] = {
    Drink = true,
    Prop = "bcoffee2",
  },
  ["burger-coffee"] = {
    Drink = true,
    Prop = "coffee",
  },
  ["burger-softdrink"] = {
    Drink = true,
    Prop = "burger-drink",
  },
  ["burger-ecola-l"] = {
    Drink = true,
    Prop = "burger-drink",
  },
  ["burger-ecola-m"] = {
    Drink = true,
    Prop = "burger-drink",
  },
  ["burger-softdrink-b"] = {
    Drink = true,
    Prop = "burger-soft",
  },
  ["bobatea"] = {
    Drink = true,
    Animation = "uwu6",
  },
  ["bbobatea"] = {
    Drink = true,
    Animation = "uwu6",
  },
  ["gbobatea"] = {
    Drink = true,
    Animation = "uwu6",
  },
  ["pbobatea"] = {
    Drink = true,
    Animation = "uwu6",
  },
  ["obobatea"] = {
    Drink = true,
    Animation = "uwu6",
  },
  ["nekolatte"] = {
    Drink = true,
    Animation = "uwu11",
  },
  ["mocha"] = {
    Drink = true,
    Animation = "uwu10",
  },
  ["blaze_fresh"] = {
    Drink = true,
    Prop = "",
    Animation = "coffee2",
  },
  ["blaze_cappuccino"] = {
    Drink = true,
    Prop = "coffee",
    Animation = "coffee2",
  },
  ["ovcharskasalata"] = {
    Food = true,
    Prop = "ovcharskasalata",
  },
  ["sandwich"] = {
    Food = true,
    Prop = "sandwich",
    Metas = {
      ["hunger"] = math.random(10, 15),
    },
  },
  ["banitsa"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["cupcake"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["cupcake2"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["pie"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["clubsandwich"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["caramel"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["sushi-rolls"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["eggs_bacon"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["blaze_tost"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["eggplant"] = {
    Food = true,
    Prop = "eggplant",
  },
  ["cucumber"] = {
    Food = false,
    Prop = "cucumber",
  },
  ["chocolade"] = {
    Food = true,
    Prop = "chocolade",
  },
  ["donut"] = {
    Food = true,
    Prop = "donut",
  },
  ["cheesecake"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["watermelon"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["tiramisu"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["gelato"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["medfruits"] = {
    Food = true,
    Animation = "pineapple",
  },
  ["capricciosa"] = {
    Food = true,
    Prop = "pizza",
  },
  ["diavola"] = {
    Food = true,
    Prop = "pizza",
  },
  ["marinara"] = {
    Food = true,
    Prop = "pizza",
  },
  ["margherita"] = {
    Food = true,
    Prop = "pizza",
  },
  ["prosciuttio"] = {
    Food = true,
    Prop = "pizza",
  },
  ["vegetariana"] = {
    Food = true,
    Prop = "pizza",
  },
  ["bolognese"] = {
    Food = true,
    Animation = "foodbowl",
  },
  ["calamari"] = {
    Food = true,
    Animation = "foodbowl",
  },
  ["meatball"] = {
    Food = true,
    Animation = "foodbowl",
  },
  ["alla"] = {
    Food = true,
    Animation = "foodbowl",
  },
  ["pescatore"] = {
    Food = true,
    Animation = "foodbowl",
  },
  ["burger-bleeder"] = {
    Food = true,
    Prop = "hamburger",
  },
  ["burger-moneyshot"] = {
    Food = true,
    Prop = "hamburger",
  },
  ["burger-torpedo"] = {
    Food = true,
    Prop = "hamburger",
  },
  ["burger-heartstopper"] = {
    Food = true,
    Prop = "hamburger",
  },
  ["burger-fries"] = {
    Food = true,
    Prop = "burger-fries",
  },
  ["bento"] = {
    Food = true,
    Prop = "uwu-sushi",
  },
  ["cake"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["nekocookie"] = {
    Food = true,
    Prop = "uwu-cookie",
  },
  ["nekodonut"] = {
    Food = true,
    Prop = "uwu-donut",
  },
  ["riceball"] = {
    Food = true,
    Prop = "sandwich",
  },
  ["miso"] = {
    Food = true,
    Prop = "uwu-miso",
    FoodThirstAdd = 20,
  },
  ["bmochi"] = {
    Food = true,
  },
  ["pmochi"] = {
    Food = true,
  },
  ["gmochi"] = {
    Food = true,
  },
  ["omochi"] = {
    Food = true,
  },
  ["rice"] = {
    Food = false,
  },
  ["cakepop"] = {
    Food = true,
    Prop = "cakepop",
  },
  ["pizza"] = {
    Food = true,
    Animation = "pizza",
  },
  ["pancake"] = {
    Food = true,
  },
  ["purrito"] = {
    Food = true,
    Animation = "uwu4",
  },
  ["noodlebowl"] = {
    Food = true,
    Animation = "uwu9",
  },
  ["ramen"] = {
    Food = true,
    Prop = "uwu9",
    Animation = "uwu9",
  },
  ["blaze_cake"] = {
    Food = true,
    Animation = "donut",
  },
  ["blaze_biscuits"] = {
    Food = true,
    Prop = "uwu-cookie",
  },
  ["vodka"] = {
    Prop = "vodka",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["whisky"] = {
    Prop = "whisky",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["avtur"] = {
    Prop = "vodka",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["tekila"] = {
    Prop = "vodka",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["seksnaplaja"] = {
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["shotavtur"] = {
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["beer"] = {
    Prop = "beer",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["slivova"] = {
    Prop = "slivova",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["cocktail2"] = {
    Prop = "cocktail2",
    Animation = "idle_c",
    AnimationDictionary = "amb@world_human_drinking@coffee@male@idle_a",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["daikiri"] = {
    Prop = "cocktail",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["theredhell"] = {
    Prop = "cocktail3",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["shottekila"] = {
    Prop = "cocktail",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["whtwine"] = {
    Prop = "whtwine",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["redwine"] = {
    Prop = "redwine",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["champ"] = {
    Prop = "champ",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["cocktail"] = {
    Prop = "cocktail",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
  ["cocktail3"] = {
    Prop = "cocktail3",
    Animation = "ped_a_enter_loop",
    AnimationDictionary = "anim@heists@humane_labs@finale@keycards",
    ProgressbarLabel = "Пиянстваш..",
    Metas = {
      ["drunk"] = math.random(5, 12),
    },
  },
}


Config.BackEngineVehicles = {'ninef', 'adder', 'vagner', 't20', 'infernus', 'zentorno', 'reaper', 'comet2', 'comet3',
    'jester', 'jester2', 'cheetah', 'cheetah2', 'prototipo', 'turismor', 'pfister811',
    'ardent', 'nero', 'nero2', 'tempesta', 'vacca', 'bullet', 'osiris', 'entityxf', 'turismo2',
    'fmj', 're7b', 'tyrus', 'italigtb', 'penetrator', 'monroe', 'ninef2', 'stingergt',
    'surfer', 'surfer2', 'comet3'}


Config.FixGarages = {
  [1] = {poly = false, coords = vector3(731.35925292969, -1088.578125, 22.169012069702), checkDistance = 10.0},
  [2] = {poly = false, coords = vector3(-221.749908, -1159.249756, 23.040998), checkDistance = 10.0},
  [3] = {poly = false, coords = vector3(-196.349442, -1303.103271, 30), checkDistance = 10.0},
  [4] = {poly = false, coords = vector3(116.223175, 6606.201660, 31.462461), checkDistance = 10.0},
  [5] = {poly = false, coords = vector3(1176.822632, 2657.973145, 37.370682), checkDistance = 10.0},
  [6] = {poly = false, coords = vector3(1173.452271, 2661.584717, 37.289780), checkDistance = 10.0},
  [7] = {poly = false, coords = vector3(-370.533752, -130.402649, 38.197617), checkDistance = 10.0},
  [8] = {poly = false, coords = vector3(-701.829956, -921.928772, 18.589094), checkDistance = 10.0},
  [9] = {poly = false, coords = vector3(-709.295471, -1081.996216, 21.975765), checkDistance = 10.0},
  [10] = {poly = false, coords = vector3(57.513451, -1389.658691, 28.968079), checkDistance = 10.0},
  [11] = {poly = false, coords = vector3(-1135.707275, -1987.154175, 12.976217), checkDistance = 10.0},
  [12] = {poly = false, coords = vector3(1205.028442, -3089.802490, 5.374923), checkDistance = 10.0},
  [13] = {poly = false, coords = vector3(938.05993652344, -970.76538085938, 39.543067932129), checkDistance = 10.0},
  [14] = {poly = false, coords = vector3(1174.8131, 2640.0781, 37.753829), checkDistance = 10.0},
  [15] = {poly = false, coords = vector3(986.94781, -142.4806, 74.081741), checkDistance = 10.0},
  [16] = {poly = false, coords = vector3(1005.4793, -131.1305, 73.389732), checkDistance = 10.0},
  [17] = {poly = false, coords = vector3(-212.0075, -1325.058, 30.616725), checkDistance = 10.0},
  [18] = {poly = false, coords = vector3(-694.87, -805.78, 32.35), checkDistance = 10.0},
  [19] = {poly = false, coords = vector3(-698.48, -790.34, 32.36), checkDistance = 10.0},
  [20] = {poly = false, coords = vector3(-720.93, -785.43, 32.37), checkDistance = 10.0},
  [21] = {poly = true, coords = {vector2(534.72857666016, -171.36715698242), vector2(534.36932373046, -165.861038208), vector2(551.69348144532, -165.63858032226), vector2(551.3353881836, -201.23397827148), vector2(545.88507080078, -201.74449157714), vector2(545.84948730468, -194.97160339356), vector2(541.54577636718, -191.81951904296), vector2(541.48565673828, -170.89350891114)}},
  [22] = {poly = true, coords = {vector2(794.29028320312, -833.13757324218), vector2(794.27960205078, -803.3588256836), vector2(837.90441894532, -801.81469726562), vector2(837.82470703125, -830.6900024414), vector2(840.89453125, -830.4437866211)}},
  [23] = {poly = true, coords = {vector2(-682.69104003906, -817.3515625), vector2(-682.82196044922, -782.47302246094), vector2(-707.47241210938, -783.02154541016), vector2(-706.09173583984, -817.74688720703), vector2(-699.55914306641, -809.59338378906)}},
  [24] = {poly = false, coords = vector3(140.71, -3032.75, 7.04), checkDistance = 20.0},
  [25] = {poly = false, coords = vector3(943.79, -1561.27, 30.74), checkDistance = 30.0},
}
