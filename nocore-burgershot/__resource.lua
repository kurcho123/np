resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

ui_page {'html/index.html'}

client_scripts {
 'config.lua',
 'client/client.lua',
}

server_scripts {
 'config.lua',
 'server/server.lua'
}

exports {
'GetActiveRegister',
}

files {
 'html/index.html',
 'html/*.png',
 'html/css/style.css',
 'html/js/script.js',
}
--client_script "@nocore-banticheat/acloader.lua"