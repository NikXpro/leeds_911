function createDepartementEditGarageMenu()
    RageUI.IsVisible(RMenu:Get('serverManager', 'departementEditGarage'), function()
        RageUI.Button("Créer un garage", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end}, RMenu:Get('serverManager', 'departementCreatorGarage'))
        RageUI.Separator("List des garages")
        --if LEEDS.Table.empty(LEEDS.Data.Departement[LEEDS.PlayerData.depSelected].garage) then
            for _, gar in pairs(LEEDS.Data.Departement[LEEDS.PlayerData.depSelected].garage) do
                RageUI.Button(gar.garageName, nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {
                    onSelected = function()
                        LEEDS.PlayerData.garSelected = gar.id
                        --RMenu:Get('serverManager', 'departementSelected'):SetPageCounter("~b~"..gar.garageName)
                        --RMenu:Get('serverManager', 'departementEdit'):SetPageCounter("~b~"..gar.garageName)
                        --RMenu:Get('serverManager', 'departementEditGarage'):SetPageCounter("~b~"..gar.garageName)
                    end
                }, RMenu:Get('serverManager', 'departementSelected'))
            end            
        --end

    end, function()
    end)
end