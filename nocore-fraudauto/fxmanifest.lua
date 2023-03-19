fx_version 'cerulean'
game 'gta5'

name "Nocore-FraudAuto"
author "Не и Yeagorn"
version "1.0"

lua54 'yes'

shared_scripts {
	'shared.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}