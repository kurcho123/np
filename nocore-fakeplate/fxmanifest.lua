fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Axel#2222'
description 'This is the Axel Fake Plates'
version '1.0.1'

ui_page 'html/index.html'

files {
	'html/assets/sounds/screw.mp3',
	'html/assets/images/plate.png',
	'html/assets/images/nut-head.png',
	'html/index.html',
	'html/assets/fonts/roboto/Roboto-Bold.woff',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
}

server_scripts{
	--'@mysql-async/lib/MySQL.lua',
	'sv_main.lua'
} 
client_script 'cl_main.lua'
shared_script 'config.lua'

escrow_ignore {
    'config.lua',
}