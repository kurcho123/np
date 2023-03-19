fx_version 'cerulean'
game 'gta5'

description 'no-core'
version '1.0.0'
lua54 'yes'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	"server/main.lua",
	"server/functions.lua",
	"server/player.lua",
	"server/paycheck.lua",
	"server/events.lua",
	"server/commands.lua",
	"server/debug.lua",
}

client_scripts {
	"client/main.lua",
	"client/functions.lua",
	"client/loops.lua",
	"client/events.lua",
	"client/debug.lua",
}

shared_scripts { 
	'import.lua',
	'config.lua',
	'locale.lua',
	'shared/*.lua'
}

ui_page 'html/ui.html'
files {
	'html/*.*'
}
