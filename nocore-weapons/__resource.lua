resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

client_scripts{
    "locale.lua",
    "locales/*.lua",
    'config.lua',
    'client/client.lua',
    'client/recoil.lua',
}

server_scripts{
    "locale.lua",
    "locales/*.lua",
    'config.lua',
    'server/server.lua',
}

files{
    'html/index.html',
    'html/js/script.js',
    'html/css/style.css',
}

exports{
    'GetAmmoType',
}

server_exports{
    'GetWeaponList',
}
