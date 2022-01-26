fx_version 'cerulean'
games { 'gta5' };

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    'client/main.lua',
    "src/menu/windows/*.lua",

    "client/drugs.lua",
    "config.lua"
}

server_scripts {
    "config.lua",
    "server.lua"
}