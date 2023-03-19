lua54 'yes'
fx_version "cerulean"
games { 'gta5' }

author 'G&N_s Studio'
description 'Medic_Center'
version '1.0.5'

dependencies {
    '/server:4960',
    '/gameBuild:2189',
    'cfx_gn_collection'
}

client_script {
    "main.lua"
}
this_is_a_map 'yes'

escrow_ignore {
    'stream/ytd/*.ytd',
    'stream/cls/*.ydr',
    'stream/cls/*.ymap',
    'stream/pillbox/*.ydr',
    'stream/pillbox/*.ymap'
}
dependency '/assetpacks'