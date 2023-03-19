resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/index.html"

client_scripts {
 ----------------------------
 '@PolyZone/client.lua',
 '@PolyZone/BoxZone.lua',
 '@PolyZone/EntityZone.lua',
 '@PolyZone/CircleZone.lua',
 '@PolyZone/ComboZone.lua',
 ----------------------------
 'config.lua',
 'garbageCollector.lua',
 'client/alerts.lua',
 'client/evidence.lua',
 'client/gui.lua',
 'client/client.lua',
 'client/luxveh_c.lua',
 'client/carmenu.lua',
 'client/mechanic.lua',
}

server_scripts {
 '@oxmysql/lib/MySQL.lua',
 'config.lua',
 'server/server.lua',
 'server/luxveh_s.lua',
 'server/commands.lua',
 'server/globalcooldown.lua',
}

files {
 "html/index.html",
 "html/js/script.js",
 "html/js/vue.min.js",
 "html/img/tablet-frame.png",
 "html/img/fingerprint.png",
 "html/main.css",
}

exports {
 "IsWeaponSilent",
 "GetWeaponCategory",
 "AddAlertBlip",
 "GetImpoundStatus",
 "GetEscortStatus",
 "IsHandcuffed",
}

server_exports {
 'GetCurrentCops',
}