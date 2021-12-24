function createDepartementEditMenu()
    RageUI.IsVisible(RMenu:Get('serverManager', 'departementEdit'), function()
        RageUI.Button("Garage", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end}, RMenu:Get('serverManager', 'departementEditGarage'))
        RageUI.Button("Blips", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end})
        RageUI.Button("Vestiaire", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end})
        RageUI.Button("Armurerie", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end})
    end, function()
    end)
end