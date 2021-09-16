fx_version 'cerulean'
game 'gta5'
author 'NikX#1717'

client_scripts {
    "@RageUI/RMenu.lua",
    "@RageUI/menu/RageUI.lua",
    "@RageUI/menu/Menu.lua",
    "@RageUI/menu/MenuController.lua",
    
    "@RageUI/components/Audio.lua",
    "@RageUI/components/Enum.lua",
    "@RageUI/components/Keys.lua",
    "@RageUI/components/Rectangle.lua",
    "@RageUI/components/Sprite.lua",
    "@RageUI/components/Text.lua",
    "@RageUI/components/Visual.lua",

    "@RageUI/menu/elements/ItemsBadge.lua",
    "@RageUI/menu/elements/ItemsColour.lua",
    "@RageUI/menu/elements/PanelColour.lua",

    "@RageUI/menu/items/UIButton.lua",
    "@RageUI/menu/items/UICheckBox.lua",
    "@RageUI/menu/items/UIList.lua",
    "@RageUI/menu/items/UISeparator.lua",
    "@RageUI/menu/items/UISlider.lua",
    "@RageUI/menu/items/UISliderHeritage.lua",
    "@RageUI/menu/items/UISliderProgress.lua",
    
    "@RageUI/menu/panels/UIColourPanel.lua",
    "@RageUI/menu/panels/UIGridPanel.lua",
    "@RageUI/menu/panels/UISliderPanel.lua",
    "@RageUI/menu/panels/UIPercentagePanel.lua",
    "@RageUI/menu/panels/UIStatisticsPanel.lua",
    
    "@RageUI/menu/windows/UIHeritage.lua",
    "@RageUI/menu/windows/UIImage.lua",
}

client_scripts {
    'data/admin/data_loadout.lua',
    'data/admin/data_peds.lua',
    'data/admin/data_vehicle.lua',
    'data/data_garage.lua',
    'data/data_vestiaire.lua',
    'data/data_armurerie.lua',

    'Config.lua',
    'client/utils/_function.lua',
    'client/utils/visual.lua',
    'client/utils/anim.lua',
    'client/utils/keys.lua',
    'client/utils/other.lua',

    
    'client/lifesystem/garage/_function.lua',
    'client/lifesystem/garage/menu.lua',
    'client/lifesystem/vestiaire/menu.lua',
    'client/lifesystem/armurerie/menu.lua',
    'client/lifesystem/spawnManager/_function.lua',
    'client/lifesystem/spawnManager/menu.lua',
    'client/lifesystem/interaction/_function.lua',
    'client/lifesystem/interaction/menu.lua',
    'client/lifesystem/me/main.lua',
    'client/lifesystem/hud/main.lua',
    'client/lifesystem/_function.lua',
    'client/lifesystem/main.lua',
    'client/lifesystem/zone_manager.lua',
}

server_scripts {
    'data/admin/data_loadout.lua',
    'data/admin/data_peds.lua',
    'data/admin/data_vehicle.lua',
    'data/data_garage.lua',
    'data/data_vestiaire.lua',
    'data/data_armurerie.lua',

    'Config.lua',
    'server/utils/_function.lua',

    'server/lifesystem/me.lua',
    'server/lifesystem/interaction.lua',
    'server/lifesystem/playerJoined.lua'   
}