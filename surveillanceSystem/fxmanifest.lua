fx_version 'bodacious'
game 'gta5'

name "Surveillance System"
description "A surveilannce system for FiveM."
author "SpecialStos"
version "1.0.5"

client_scripts {
    'configs/config.lua',
    'configs/client_customise_me.lua',
    'client/surveillanceSystem.lua',
    'configs/functions.lua',
    'garbageCollector.lua',
}

server_scripts {
    'configs/config.lua',
    'configs/server_customise_me.lua',
    'server/surveillanceSystem.lua',
    'configs/functions.lua',
    'server/authorisator.lua',
}

ui_page "client/html/index.html"

files {
    "client/html/index.html",
    "client/html/vue.min.js",
	"client/html/script.js",
}

exports {
    'SurveillanceSystemGetCams'
}


