fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'Axel#2222'
description 'Weapon spray kit by NOLAG'
version '1.0.0'

client_script {
    'config.lua',
    'client/main.lua',   
}

server_scripts {
    'config.lua',
    'server/main.lua'
}

ui_page "html/index.html"

files {
    "stock.json",
    "html/*",
    "html/skins/*.jpg"
}

escrow_ignore {
    'config.lua',
}