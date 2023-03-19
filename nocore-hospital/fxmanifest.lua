fx_version 'adamant'
game 'gta5'

client_scripts {
    "locale.lua",
	"locales/*.lua",
    'config.lua',
    'client/*.lua',
}

server_scripts {
    "locale.lua",
	"locales/*.lua",
    'config.lua',
    'server/server.lua'
}

exports {
    'NearGarage',
    'IsAbleToRespawn',
    'GetDeathStatus',
}