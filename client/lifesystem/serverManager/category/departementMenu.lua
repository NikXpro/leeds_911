LEEDS.PlayerData.depSelected = nil

function createDepartementManagerMenu()
    RageUI.IsVisible(RMenu:Get('serverManager', 'departement'), function()
        RageUI.Button("Créer un département", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end}, RMenu:Get('serverManager', 'departementCreator'))
        RageUI.Separator("List des département")
        for _, dep in pairs(LEEDS.Data.Departement) do
            RageUI.Button(dep.name, nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {
                onSelected = function()
                    LEEDS.PlayerData.depSelected = dep.id
                    RMenu:Get('serverManager', 'departementSelected'):SetPageCounter("~b~"..dep.name)
                    RMenu:Get('serverManager', 'departementEdit'):SetPageCounter("~b~"..dep.name)
                end
            }, RMenu:Get('serverManager', 'departementSelected'))
        end
    end, function()
    end)
end