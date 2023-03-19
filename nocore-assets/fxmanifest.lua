fx_version 'cerulean'
game 'gta5'

description 'nocore-SmallResources'
version '1.0.0'
this_is_a_map 'yes'

shared_script 'config.lua'
server_script 'server/*.lua'
client_script 'client/*.lua'

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat'
}

exports {
	'AddProp',
	'AddPropWithAnim',
	'RemoveProp',
	'GetPropStatus',
	'RequestAnimationDict',
	'RequestModelHash',
}

lua54 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/np_misc_load.ytyp'