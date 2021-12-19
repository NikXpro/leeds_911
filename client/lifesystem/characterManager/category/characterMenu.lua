function createCharacterMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'character'), function()
        RageUI.Button("Prendre", nil, {RightLabel = LEEDS.Emoticon.Check}, true, {
            onSelected = function()
                TriggerServerEvent('leeds:editCharacter', "select", LEEDS.PlayerData.charSelected)
                RMenu:Get('characterManager', 'home').Closable = true
                RageUI.CloseAll(true)
            end
        })
        RageUI.Button("Supprimer ", nil, {RightLabel = LEEDS.Emoticon.Poubelle}, true, {
            onSelected = function()
                TriggerServerEvent('leeds:editCharacter', "delete", LEEDS.PlayerData.charSelected)
                RageUI.GoBack()
            end
        })
    end)
end