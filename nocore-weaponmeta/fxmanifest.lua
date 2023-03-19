fx_version 'cerulean'
game 'gta5'

name "nocore-weaponmeta"
description "Axel's weapon metas"
author "Axel"
version "1.0.0"

files{
	'metas/*.meta',
}

data_file 'WEAPONCOMPONENTSINFO_FILE' 'metas/weaponcomponents.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weapons.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weaponvintagepistol.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weapons_snspistol_mk2.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weapon_ceramicpistol.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weapons_pistol_mk2.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weaponheavypistol.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weaponrailgun.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/explosion.meta'

client_script "client.lua"