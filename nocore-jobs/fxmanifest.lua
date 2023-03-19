fx_version "cerulean"
game "gta5"

name         'nocore-jobs'
author       'NoLag Dev Team'
description  'NoLag Jobs'
version      '1.0.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    'shared/*.lua',
}

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/assets/css/*.css',
    'html/assets/js/*.js',
    'html/assets/img/*.png',
    'html/assets/img/*.jpg',
}