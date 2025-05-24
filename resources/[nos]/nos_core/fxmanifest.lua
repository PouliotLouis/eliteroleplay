fx_version 'cerulean'
game 'gta5'

author 'NosFPS'
description 'nos_core - Core system for NosFiveM'
version '1.0.0'

client_scripts {
    'client/*.lua',
    -- 'config/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua'
}

lua54 'yes'