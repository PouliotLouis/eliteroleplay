fx_version 'cerulean'
game 'gta5'

description 'qbx_drugs'
repository 'https://github.com/Qbox-project/qbx_drugs'
version '1.0.0'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/cornerselling.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/cornerselling.lua',
}

files {
    'config/client.lua',
    'config/server.lua',
    'locales/*.json'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'