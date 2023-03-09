-- cfx information --
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

-- resource information --
name 'MI_Network'
author 'MIAgimir'
version '0.0.00'
repository 'https://github.com/MIAgimir/MI_Network'
description 'In-game network for jobs, employment, housing, and other essentials'

-- resource manifest --
ui_page 'web/index.html'
shared_script '@ox_lib/init.lua'
shared_script 'config.lua'

client_scripts {
    '@ox_core/imports/client.lua',
    'client/radial_main.lua',
    'client/client_main.lua',
    'client/client_main.js'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@ox_core/imports/server.lua',

    'server/server_main.lua',
    'server/server_main.js'
}

files {
    'web/index.html',
    'web/listenter.js',
    'web/reset.css',
    'web/style.css'
}