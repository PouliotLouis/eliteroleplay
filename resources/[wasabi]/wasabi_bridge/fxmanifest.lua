-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'A library of functions used to ease the bridge between Wasabi Scripts'
author 'wasabirobby'
version '1.4.7'

ui_page 'ui/index.html'
files { 'ui/*', 'ui/**/*' }

shared_script 'config.lua'

client_scripts {
    'frameworks/**/client.lua',
    'targets/*.lua',
    'inventories/**/client.lua',
    'customize/client/*.lua',
    'utils/client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'frameworks/**/server.lua',
    'inventories/**/server.lua',
    'utils/server/*.lua'
}

files { 'import.lua' }

dependencies { 'oxmysql' }

escrow_ignore {
    'config.lua',
    'frameworks/**/*.lua',
    'targets/*.lua',
    'inventories/**/*.lua',
    'customize/client/*.lua'
}

dependency '/assetpacks'