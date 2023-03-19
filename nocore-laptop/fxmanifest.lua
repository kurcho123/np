fx_version 'adamant'
game 'gta5'

ui_page 'client/html/index.html'

client_scripts {
	'client/client.js',
	'cl_main.lua'
}

server_scripts {
	'sv_main.lua',
	'@oxmysql/lib/MySQL.lua'
}

shared_script "config.lua"

artifact_version '1.0.0.1222'

files {
	'client/html/index.html',
	'client/html/**/*.css',
	'client/html/**/*.js',
	'client/html/**/*.json',
	'client/html/**/*.html',
	'client/html/**/*.png',
	'client/html/**/*.jpg',
	'client/html/**/*.gif',
	'client/html/assets/css/*.css',
	'client/html/assets/js/*.js',
	'client/html/assets/js/*.json',
	'client/html/assets/sounds/*.ogg',
	'client/html/assets/images/*.png',
	'client/html/assets/images/*.jpg',
	'client/html/assets/images/*.gif',
	'client/html/assets/fonts/roboto/*.woff',
	'client/html/assets/fonts/roboto/*.woff2',
	'client/html/assets/fonts/justsignature/*.woff',
	'client/html/assets/fonts/handwritten/*.woff',	
}