data_apparenceMenu = {
    {Title = GetLabelText("FACE_HAIR"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][1].List, Index = data_apparenceList[LEEDS.Character.face.model][1].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.hair.style = Item.Value
        end,
        Opacity = {
            Activate = false,
        },
        Color = {
            Activate = true,
            Activate2 = true,
            Title = "Couleur principal",
            Title2 = "Couleur secondaire",
            Value = RageUI.PanelColour.HairCut,

            Index = {
                {"hair", "MinPrimary"},
                {"hair", "ColorPrimary"},
                {"hair", "MinSecondary"},
                {"hair", "ColorSecondary"},
            },
            FunctionColor1 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.hair.MinPrimary = MinimumIndex
                LEEDS.Character.face.apparence.hair.ColorPrimary = CurrentIndex
            end,
            FunctionColor2 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.hair.MinSecondary = MinimumIndex
                LEEDS.Character.face.apparence.hair.ColorSecondary = CurrentIndex
            end
        },
    },
    {Title = GetLabelText("FACE_F_EYEBR"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][2].List, Index = data_apparenceList[LEEDS.Character.face.model][2].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.eyebrows.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"eyebrows", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.eyebrows.opacity = Percentage 
            end
        },
        Color = {
            Activate = true,
            Activate2 = true,
            Title = "Couleur principal",
            Title2 = "Couleur secondaire",
            Value = RageUI.PanelColour.HairCut,

            Index = {
                {"eyebrows", "MinPrimary"},
                {"eyebrows", "ColorPrimary"},
                {"eyebrows", "MinSecondary"},
                {"eyebrows", "ColorSecondary"},
            },
            FunctionColor1 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.eyebrows.MinPrimary = MinimumIndex
                LEEDS.Character.face.apparence.eyebrows.ColorPrimary = CurrentIndex
            end,
            FunctionColor2 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.eyebrows.MinSecondary = MinimumIndex
                LEEDS.Character.face.apparence.eyebrows.ColorSecondary = CurrentIndex
            end
        },
    },
    {Title = "Barbe", SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][3].List, Index = data_apparenceList[LEEDS.Character.face.model][3].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.beard.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"beard", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.beard.opacity = Percentage 
            end
        },
        Color = {
            Activate = true,
            Activate2 = true,
            Title = "Couleur principal",
            Title2 = "Couleur secondaire",
            Value = RageUI.PanelColour.HairCut,

            Index = {
                {"beard", "MinPrimary"},
                {"beard", "ColorPrimary"},
                {"beard", "MinSecondary"},
                {"beard", "ColorSecondary"},
            },
            FunctionColor1 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.beard.MinPrimary = MinimumIndex
                LEEDS.Character.face.apparence.beard.ColorPrimary = CurrentIndex
            end,
            FunctionColor2 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.beard.MinSecondary = MinimumIndex
                LEEDS.Character.face.apparence.beard.ColorSecondary = CurrentIndex
            end
        },
    },
    {Title = GetLabelText("FACE_F_SKINB"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][4].List, Index = data_apparenceList[LEEDS.Character.face.model][4].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.blemishes.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"blemishes", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.blemishes.opacity = Percentage 
            end
        },
        Color = {
            Activate = false,
        },
    },
    {Title = GetLabelText("FACE_F_SKINA"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][5].List, Index = data_apparenceList[LEEDS.Character.face.model][5].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.ageing.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"ageing", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.ageing.opacity = Percentage 
            end
        },
        Color = {
            Activate = false,
        },
    },
    {Title = GetLabelText("FACE_F_SKC"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][6].List, Index = data_apparenceList[LEEDS.Character.face.model][6].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.complexion.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"complexion", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.complexion.opacity = Percentage 
            end
        },
        Color = {
            Activate = false,
        },
    },
    {Title = GetLabelText("FACE_F_MOLE"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][7].List, Index = data_apparenceList[LEEDS.Character.face.model][7].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.freckles.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"freckles", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.freckles.opacity = Percentage 
            end
        },
        Color = {
            Activate = false,
        },
    },
    {Title = GetLabelText("FACE_F_SUND"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][8].List, Index = data_apparenceList[LEEDS.Character.face.model][8].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.sundamage.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"sundamage", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.sundamage.opacity = Percentage 
            end
        },
        Color = {
            Activate = false,
        },
    },
    {Title = GetLabelText("FACE_APP_EYE"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][9].List, Index = data_apparenceList[LEEDS.Character.face.model][9].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.eye.style = Item.Value
        end,
        Opacity = {
            Activate = false,
        },
        Color = {
            Activate = false,
        },
    },
    {Title = GetLabelText("FACE_F_EYEM"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][10].List, Index = data_apparenceList[LEEDS.Character.face.model][10].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.eyemackeup.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"eyemackeup", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.eyemackeup.opacity = Percentage 
            end
        },
        Color = {
            Activate = true,
            Activate2 = false,
            Title = "Couleur principal",
            Value = RageUI.PanelColour.HairCut,

            Index = {
                {"eyemackeup", "MinPrimary"},
                {"eyemackeup", "ColorPrimary"},
            },
            FunctionColor1 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.eyemackeup.MinPrimary = MinimumIndex
                LEEDS.Character.face.apparence.eyemackeup.ColorPrimary = CurrentIndex
            end,
        },
    },
    {Title = GetLabelText("FACE_F_LIPST"), SubTitle = "FACE_APP_H", DataList = data_apparenceList[LEEDS.Character.face.model][11].List, Index = data_apparenceList[LEEDS.Character.face.model][11].Index,
        listFunction = function(Index, Item)
            LEEDS.Character.face.apparence.lipstick.style = Item.Value
        end,
        Opacity = {
            Activate = true,
            Title = "Opacité",
            Index = {
                {"lipstick", "opacity"}
            },
            FunctionOpacity = function(Percentage)
                LEEDS.Character.face.apparence.lipstick.opacity = Percentage 
            end
        },
        Color = {
            Activate = true,
            Activate2 = false,
            Title = "Couleur principal",
            Value = RageUI.PanelColour.HairCut,

            Index = {
                {"lipstick", "MinPrimary"},
                {"lipstick", "ColorPrimary"},
            },
            FunctionColor1 = function(MinimumIndex, CurrentIndex)

                LEEDS.Character.face.apparence.lipstick.MinPrimary = MinimumIndex
                LEEDS.Character.face.apparence.lipstick.ColorPrimary = CurrentIndex
            end,
        },
    },
}