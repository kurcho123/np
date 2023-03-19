fx_version 'bodacious'
game 'gta5'

description 'Axel atm robery'
version '1.0.0'

shared_scripts { 
	'@no-core/import.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua'
} 

server_scripts {
	'server/main.lua'
}

exports {
	'CanRobAtm',
	'NearExplodedATM',
	'IsAbleToStartATM'
}