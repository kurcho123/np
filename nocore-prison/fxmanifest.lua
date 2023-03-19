fx_version 'cerulean'
game 'gta5'

name "nocore-prison"
author "TOSHKO"

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua',
}

server_script {
	'server.lua',
}

shared_script 'config.lua'

exports {
 'GetInJailStatus',
}