fx_version   'adamant'
game         'gta5'
lua54        'yes'

name         'nocore-heists'
author       'NoLag Dev Team'
description  'NoLag Heists'
version      '1.0.0'

dependencies {
	'/server:5181',
	'/onesync',
	'oxmysql',
	'no-core',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua'
}

client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

files {
    'html/ui.html',
    'html/css/*.css',
    'html/js/*.js',
}

ui_page {'html/ui.html'}