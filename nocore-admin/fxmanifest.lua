fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'locale.lua',
    'locales/en.lua',
}

client_scripts {
    '@menuv/menuv.lua',
    'client/noclip.lua',
    'client/blipsnames.lua',
    'client/main.lua',
    'client/selfmenu.lua',
    'client/playersmenu.lua',
    'client/servermenu.lua',
    'client/vehiclemenu.lua',
    'client/devmenu.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/config.lua',
    'server/main.lua',
    'server/commands.lua',
    'server/playersmenu.lua',
}

ui_page 'html/index.html'

files { -- Credits to https://github.com/LVRP-BEN/bl_coords for clipboard copy method
    'html/index.html',
    'html/index.js'
}

dependency 'menuv'

lua54 'yes'
