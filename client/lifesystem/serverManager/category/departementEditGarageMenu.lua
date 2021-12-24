function createDepartementEditGarageMenu()
    RageUI.IsVisible(RMenu:Get('serverManager', 'departementEditGarage'), function()
        RageUI.Button("Créer un garage", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end}, RMenu:Get('serverManager', 'departementCreatorGarage'))
        RageUI.Separator("List des garages")
        for _, gar in pairs(LEEDS.Data.Departement) do
            RageUI.Button(gar.name, nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {
                onSelected = function()
                    LEEDS.PlayerData.garSelected = gar.id
                    RMenu:Get('serverManager', 'departementSelected'):SetPageCounter("~b~"..gar.name)
                    RMenu:Get('serverManager', 'departementEdit'):SetPageCounter("~b~"..gar.name)
                    RMenu:Get('serverManager', 'departementEditGarage'):SetPageCounter("~b~"..gar.name)
                end
            }, RMenu:Get('serverManager', 'departementSelected'))
        end
    end, function()
    end)
end