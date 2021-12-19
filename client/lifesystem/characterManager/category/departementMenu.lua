local dictionary = ""
function SelectType(type)
    LEEDS.PlayerData.charType = type
    if not type == nil then
        dictionary = Config.departementList[LEEDS.PlayerData.charType].Texture
    end
end
function createDepartementMenu()
    if RageUI.Visible(RMenu:Get('characterManager', 'departement')) then
        RageUI.IsVisible(RMenu:Get('characterManager', 'departement'), function()
            RageUI.Button("Derniere position", nil, {RightLabel = LEEDS.Emoticon.Plus}, true, {
                onSelected = function()
                    TriggerServerEvent('leeds:editCharacter', "select", LEEDS.PlayerData.charSelected, nil, nil)
                    RageUI.CloseAll(true)
                end
            });
            RageUI.Button("Département", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {
                onSelected = function()
                end
            }, RMenu:Get('characterManager', "selectDepartement"));     
        end)
    end
    if RageUI.Visible(RMenu:Get('characterManager', "selectDepartement")) then
        RageUI.IsVisible(RMenu:Get('characterManager', "selectDepartement"), function()
            RageUI.Window.Images("banner", dictionary)
            RageUI.Separator("SÉLECTIONNER VOTRE DÉPARTEMENT")
            if LEEDS.PlayerData.charType ~= nil then
                for areaId, area in pairs(Config.departementList[LEEDS.PlayerData.charType]) do
                    if area.Activate then
                        if area.Type == LEEDS.PlayerData.charType then
                            RageUI.Button(area.Label, nil, {RightLabel = LEEDS.Emoticon.Plus}, true, {
                                onActive = function()
                                    dictionary = area.Texture
                                end,
                                onSelected = function()
                                    TriggerServerEvent('leeds:editCharacter', "select", LEEDS.PlayerData.charSelected, LEEDS.PlayerData.charType, areaId)
                                    RageUI.CloseAll(true)
                                end
                            });                        
                        end
                        
                    else
                        RageUI.Button(area.Label, nil, {}, false, {
                            onActive = function()
                                dictionary = area.Banner
                            end
                        });
                    end
                end
            else
                dictionary = ""
                RageUI.Separator("Aucun département n'a etait trouver !")              
                RageUI.Separator("contacter un administrateur")              
            end
        end)
    end
end