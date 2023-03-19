fx_version "cerulean"
game "gta5"
lua54 'yes'

file 'stream/**.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/**.ytyp'

data_file 'TIMECYCLEMOD_FILE' 'markz_timecycle.xml'

files {
    'markz_timecycle.xml',
}

client_script {
    'markz_entityset_mods.lua',
}

files {
    'sp_manifest.ymt',
}

data_file 'SCENARIO_POINTS_OVERRIDE_PSO_FILE' 'sp_manifest.ymt'
dependency '/assetpacks'