fx_version 'bodacious'
game 'gta5'

name "Store Robberies"
description "A store robbery system for FiveM."
author "SpecialStos"
version "1.0.8"

client_scripts {
    'configs/config.lua',
    'configs/languages.lua',
    'configs/client_customise_me.lua',
    'client/storeRobberies.lua',
    --'client/safeCracking.lua',
    'configs/functions.lua',
    'garbageCollector.lua',
}

server_scripts {
    'configs/config.lua',
    'configs/server_customise_me.lua',
    'server/storeRobberies.lua',
    'configs/functions.lua',
}

ui_page "client/html/index.html"

files {
    "client/html/index.html",
    "client/html/vue.min.js",
	"client/html/js/script.js",
    "client/html/css/reset.css",
    "client/html/css/style.css",
    "client/html/css/img/*.png",
}

