function createApparenceMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'apparence'), function()
        for i = 1, #data_apparenceMenu do
            RageUI.List(data_apparenceMenu[i].Title, data_apparenceMenu[i].DataList, data_apparenceMenu[i].Index, GetLabelText(data_apparenceMenu[i].SubTitle), {}, true, {
                onListChange = function(Index, Item)
                    data_apparenceMenu[i].Index = Index
                    data_apparenceMenu[i].listFunction(Index, Item)
                    UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                end
            })       
        end
    end, function()
        for i = 1, #data_apparenceMenu do
            if data_apparenceMenu[i].Opacity.Activate then
                RageUI.PercentagePanel(LEEDS.Character.face.apparence[data_apparenceMenu[i].Opacity.Index[1][1]][data_apparenceMenu[i].Opacity.Index[1][2]], data_apparenceMenu[i].Opacity.Title, nil, nil, {
                    onProgressChange = function(Percentage)
                        data_apparenceMenu[i].Opacity.FunctionOpacity(Percentage)
                        UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                    end
                }, i)
            end
            if data_apparenceMenu[i].Color.Activate then
                RageUI.ColourPanel(data_apparenceMenu[i].Color.Title, data_apparenceMenu[i].Color.Value, LEEDS.Character.face.apparence[data_apparenceMenu[i].Color.Index[1][1]][data_apparenceMenu[i].Color.Index[1][2]], LEEDS.Character.face.apparence[data_apparenceMenu[i].Color.Index[2][1]][data_apparenceMenu[i].Color.Index[2][2]], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        data_apparenceMenu[i].Color.FunctionColor1(MinimumIndex, CurrentIndex)
                        UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                    end
                }, i, {
                    Seperator = { Text = "/" }
                })
            end
            if data_apparenceMenu[i].Color.Activate2 then
                RageUI.ColourPanel(data_apparenceMenu[i].Color.Title2, data_apparenceMenu[i].Color.Value, LEEDS.Character.face.apparence[data_apparenceMenu[i].Color.Index[3][1]][data_apparenceMenu[i].Color.Index[3][2]], LEEDS.Character.face.apparence[data_apparenceMenu[i].Color.Index[4][1]][data_apparenceMenu[i].Color.Index[4][2]], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        data_apparenceMenu[i].Color.FunctionColor2(MinimumIndex, CurrentIndex)
                        UpdateEntityFace(PlayerPedId(), LEEDS.Character.face)
                    end
                }, i, {
                    Seperator = { Text = "/" }
                })
            end
        end
    end)
end