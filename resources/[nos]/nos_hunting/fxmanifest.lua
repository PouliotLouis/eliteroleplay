fx_version 'cerulean'
game 'gta5'

author 'NosFPS'
description 'nos_hunting - Hunting script by NosFPS'
version '1.0.0'

client_scripts {
    'client/*.lua',
    'config.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/modules/lib.lua',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'