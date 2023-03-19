fx_version 'cerulean'
game 'gta5'

lua54 'yes'

shared_scripts {
    'config.lua',
    "locale.lua",
    "locales/*.lua",
    '@ox_lib/init.lua'
}

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
}

exports {
    'SetVehicleKey',
    'ToggleLocks',
}