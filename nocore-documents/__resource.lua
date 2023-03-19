ui_page 'html/form.html'

files {
	'html/form.html',
	'html/img/seal.png',
	'html/img/document.jpg',
	'html/img/signature.png',
	'html/img/cursor.png',
	'html/css.css',
	'html/language_en.js',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server.lua',
}

client_scripts {
	'config.lua',
	'client.lua',
}
