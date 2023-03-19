fx_version 'adamant'

game 'gta5'

author 'Axel#2222'
description 'nocore-billing'

ui_page 'web/ui.html'

files {
	'web/*.*'
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
}

server_scripts {
	--'MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}