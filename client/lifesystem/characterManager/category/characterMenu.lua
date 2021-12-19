function createCharacterMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'character'), function()
        RageUI.Button("Sélectionner", nil, {RightLabel = LEEDS.Emoticon.Check}, true, {
            onSelected = function()
            end
        }, RMenu:Get('characterManager', 'departement'))
        RageUI.Button("Supprimer ", nil, {RightLabel = LEEDS.Emoticon.Poubelle}, true, {
            onSelected = function()
                TriggerServerEvent('leeds:editCharacter', "delete", LEEDS.PlayerData.charSelected)
                RageUI.GoBack()
            end
        })
    end)
end