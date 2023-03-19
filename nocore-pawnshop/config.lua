Config = Config or {}

Config.CurrentItems = {}

Config.SmeltTime = 300

Config.Locale = "en"
Config.CanTake = false

Config.Smelting = false

Config.Locations = {
    ['PawnShops'] = {
        [1] = {['X'] = 412.15435, ['Y'] = 315.22857, ['Z'] = 103.13185, ['Open-Time'] = 6, ['Close-Time'] = 12, ['Sell-Value'] = 1.0, ['Type'] = 'NormalPawnShop'},
        --[2] = {['X'] = 414.3948, ['Y'] = 343.55667, ['Z'] = 102.50444, ['Open-Time'] = 12, ['Close-Time'] = 16, ['Sell-Value'] = 1.0, ['Type'] = 'Bars'},
    }, 
    ['Smeltery'] = {
        [1] = { ['X'] = 1112.5885, ['Y'] = -2015.779, ['Z'] = 39.312599},
    },
}

Config.ItemPrices = {
  ['gold-rolex'] = 500,
  ['gold-necklace'] = 200,
  ['diamond-ring'] = 200,
  ['tablet'] = 350,
  ['laptop'] = 450,
  ['stolen-tv'] = 450,
  ['stolen-micro'] = 420,
  ['stolen-pc'] = 740,
  ['stolen-ps5'] = 399,
  ['diamond'] = 1000,
  ['emerald'] = 1000,
  ['diamond-red'] = 1500,
  ['diamond-blue'] = 1500,
}

Config.SmeltItems = {
  ['gold-rolex'] = 16,
  ['gold-necklace'] = 40,
}