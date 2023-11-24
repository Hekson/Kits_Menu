fx_version 'adamant'
game 'gta5'

client_script {
    'cl_main.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'sv_main.lua'
}

ui_page 'ui/index.html'

files {
	'ui/css/*.css',
	'ui/*.html',
    'ui/*.js',
    'ui/font/Jost-SemiBold.ttf'
    'ui/images/*.png',
}