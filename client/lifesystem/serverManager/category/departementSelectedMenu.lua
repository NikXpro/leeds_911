function createDepartementSelectedMenu()
    RageUI.IsVisible(RMenu:Get('serverManager', 'departementSelected'), function()
        RageUI.Button("Téléporter", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end})
        RageUI.Button("Modifier", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end}, RMenu:Get('serverManager', 'departementEdit'))
        RageUI.Button("Supprimer", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {
            onSelected = function()
                TriggerServerEvent("leeds:manageDepartement", "delete", LEEDS.PlayerData.depSelected)
            end
        })
    end, function()
    end)
end