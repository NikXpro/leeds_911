local categorie = {}

Citizen.CreateThread(function()
    for _, cat in pairs(Config.outfitList) do
        RMenu.Add('characterManager', cat.Label, RageUI.CreateSubMenu(RMenu:Get('characterManager', 'cloth'), "", cat.Label))
        table.insert(categorie, cat)
    end
end)
  

function createVetementMenu()
    if RageUI.Visible(RMenu:Get('characterManager', 'cloth')) then
        RageUI.IsVisible(RMenu:Get('characterManager', 'cloth'), function()
            for _, cat in pairs(categorie) do
                RageUI.Button(cat.Label, nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {onSelected = function() end}, RMenu:Get('characterManager', cat.Label));     
            end
        end)
    end

    for _, cat in pairs(categorie) do
        if RageUI.Visible(RMenu:Get('characterManager', cat.Label)) then
            RageUI.IsVisible(RMenu:Get('characterManager', cat.Label), function()
                for _, outfit in pairs(cat.ClothList) do
                    RageUI.Button(outfit.Label, nil, {RightLabel = ""}, true, {
                        onSelected = function()
                        end
                    });
                    
                end
            end)
        end
    end

end