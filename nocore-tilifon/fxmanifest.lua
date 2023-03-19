fx_version 'cerulean'
game 'gta5'

name "nocore-tilifon"
description "nc-tilifon"
author "Yeagorn"
version "1.0"

client_scripts {
	'config.lua',
	'client/*.lua'
}

server_scripts {
	'config.lua',
	'server/*.lua'
}

ui_page 'html/index.html'

shared_script '@no-core/import.lua'

files {
	'html/*'
}