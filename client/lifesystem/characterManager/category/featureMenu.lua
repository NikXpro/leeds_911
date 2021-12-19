function createFeatureMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'feature'), function()
        for i = 1, #data_featureMenu do
            RageUI.List(GetLabelText(data_featureMenu[i].Title), data_featureMenu[i].DataList, data_featureMenu[i].Index, GetLabelText(data_featureMenu[i].SubTitle), {}, true, {
                onListChange = function(Index, Item)
                    data_featureMenu[i].Index = Index
                    data_featureMenu[i].listFunction(Index)
                    UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                end
            })            
        end
    end, function()
        for i = 1, #data_featureMenu do
            if data_featureMenu[i].type == 1 then
                RageUI.Grid(LEEDS.Index.features[data_featureMenu[i].coords[1][1]][data_featureMenu[i].coords[1][2]], LEEDS.Index.features[data_featureMenu[i].coords[2][1]][data_featureMenu[i].coords[2][2]], data_featureMenu[i].text[1], data_featureMenu[i].text[2],data_featureMenu[i].text[3], data_featureMenu[i].text[4], {
                    onPositionChange = function(IndexX, IndexY, X, Y)
                        
                        data_featureMenu[i].panelFunction(X, Y, IndexX, IndexY)
                        UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                        if IndexX -1 == 0.5 and IndexY-1 == 0.5 then
                            data_featureMenu[i].Index = 1
                        elseif IndexX-1 == 0.9 and IndexY-1 == 0.6 then
                            data_featureMenu[i].Index = 2
                        elseif IndexX-1 == 0.30 and IndexY-1 == 0.70 then
                            data_featureMenu[i].Index = 3
                        else
                            data_featureMenu[i].Index = 4
                        end
                    end
                }, i)
            elseif data_featureMenu[i].type == 2 then
                RageUI.GridHorizontal(LEEDS.Index.features[data_featureMenu[i].coords[1][1]][data_featureMenu[i].coords[1][2]], data_featureMenu[i].text[1], data_featureMenu[i].text[2], {
                    onPositionChange = function(IndexX, IndexY, X, Y)
                        data_featureMenu[i].panelFunction(X, IndexX)
                        UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                        if IndexX == 0.5 then
                            data_featureMenu[i].Index = 1
                        elseif IndexX == 0.30 then
                            data_featureMenu[i].Index = 2
                        elseif IndexX == 0.9  then
                            data_featureMenu[i].Index = 3
                        else
                            data_featureMenu[i].Index = 4
                        end
                    end
                }, i)
            end
        end
    end)
end