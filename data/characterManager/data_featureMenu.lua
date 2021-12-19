data_featureMenu = {
    {Title = "FACE_F_BROW", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][1].List, Index = data_featureList[LEEDS.Character.face.model][1].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.eyebrow.height = 0.5
                LEEDS.Index.features.eyebrow.height = 0.5
                LEEDS.Character.face.features.eyebrow.forward = 0.5
                LEEDS.Index.features.eyebrow.forward = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.eyebrow.height = 0.9
                LEEDS.Index.features.eyebrow.height = 0.9
                LEEDS.Character.face.features.eyebrow.forward = 0.6
                LEEDS.Index.features.eyebrow.forward = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.eyebrow.height = 0.30
                LEEDS.Index.features.eyebrow.height = 0.30
                LEEDS.Character.face.features.eyebrow.forward = 0.70
                LEEDS.Index.features.eyebrow.forward = 0.70
            end
        end,
        type = 1,
        coords = {
            {"eyebrow", "forward"},
            {"eyebrow", "height"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.eyebrow.forward = -(X)
            LEEDS.Character.face.features.eyebrow.height = Y
            LEEDS.Index.features.eyebrow.forward = IndexX
            LEEDS.Index.features.eyebrow.height = IndexY
        end
    },
    {Title = "FACE_F_EYES", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][2].List, Index = data_featureList[LEEDS.Character.face.model][2].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.eye.opening = 0.5
                LEEDS.Index.features.eye.opening = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.eye.opening = 0.30
                LEEDS.Index.features.eye.opening = 0.30
            elseif Index == 3 then
                LEEDS.Character.face.features.eye.opening = 0.9
                LEEDS.Index.features.eye.opening = 0.9
            end
        end,
        type = 2,
        coords = {
            {"eye", "opening"}
        },
        text = {"Ouverts", "Plissés"},
        panelFunction = function(X, IndexX)
            LEEDS.Character.face.features.eye.opening = X
            LEEDS.Index.features.eye.opening = IndexX
        end
    },
    {Title = "FACE_F_NOSE", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][3].List, Index = data_featureList[LEEDS.Character.face.model][3].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.nose.width = 0.5
                LEEDS.Character.face.features.nose.peakHeight = 0.5
                LEEDS.Index.features.nose.width = 0.5
                LEEDS.Index.features.nose.peakHeight = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.nose.width = 0.9
                LEEDS.Character.face.features.nose.peakHeight = 0.6
                LEEDS.Index.features.nose.width = 0.9
                LEEDS.Index.features.nose.peakHeight = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.nose.width = 0.30
                LEEDS.Character.face.features.nose.peakHeight = 0.70
                LEEDS.Index.features.nose.width = 0.30
                LEEDS.Index.features.nose.peakHeight = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "width"},
            {"nose", "peakHeight"}
        },
        text = {"Relevé", "Bas", "Fin", "Épais"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.nose.width = -(X)
            LEEDS.Character.face.features.nose.peakHeight = Y
            LEEDS.Index.features.nose.width = IndexX
            LEEDS.Index.features.nose.peakHeight = IndexY
        end
    },
    {Title = "FACE_F_NOSEP", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][4].List, Index = data_featureList[LEEDS.Character.face.model][4].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.nose.peakLength = 0.5
                LEEDS.Character.face.features.nose.boneHeight = 0.5
                LEEDS.Index.features.nose.peakLength = 0.5
                LEEDS.Index.features.nose.boneHeight = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.nose.peakLength = 0.9
                LEEDS.Character.face.features.nose.boneHeight = 0.6
                LEEDS.Index.features.nose.peakLength = 0.9
                LEEDS.Index.features.nose.boneHeight = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.nose.peakLength = 0.30
                LEEDS.Character.face.features.nose.boneHeight = 0.70
                LEEDS.Index.features.nose.peakLength = 0.30
                LEEDS.Index.features.nose.boneHeight = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "peakLength"},
            {"nose", "boneHeight"}
        },
        text = {GetLabelText("FACE_F_P1_0"), GetLabelText("FACE_F_P1_1"), GetLabelText("FACE_F_SHORT"), GetLabelText("FACE_F_LONG")},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.nose.peakLength = -(X)
            LEEDS.Character.face.features.nose.boneHeight = Y
            LEEDS.Index.features.nose.peakLength = IndexX
            LEEDS.Index.features.nose.boneHeight = IndexY
        end
    },
    {Title = "FACE_F_NOSET", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][5].List, Index = data_featureList[LEEDS.Character.face.model][5].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.nose.peakLowering = 0.5
                LEEDS.Character.face.features.nose.boneTwist = 0.5
                LEEDS.Index.features.nose.peakLowering = 0.5
                LEEDS.Index.features.nose.boneTwist = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.nose.peakLowering = 0.9
                LEEDS.Character.face.features.nose.boneTwist = 0.6
                LEEDS.Index.features.nose.peakLowering = 0.9
                LEEDS.Index.features.nose.boneTwist = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.nose.peakLowering = 0.30
                LEEDS.Character.face.features.nose.boneTwist = 0.70
                LEEDS.Index.features.nose.peakLowering = 0.30
                LEEDS.Index.features.nose.boneTwist = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "boneTwist"},
            {"nose", "peakLowering"}
        },
        text = {"Bout vers le haut", "Bout vers me nas", "Cassé gauche", "Cassé droite"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.nose.boneTwist = -(X)
            LEEDS.Character.face.features.nose.peakLowering = Y
            LEEDS.Index.features.nose.boneTwist = IndexX
            LEEDS.Index.features.nose.peakLowering = IndexY
        end
    },
    {Title = "FACE_F_CHEEK", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][6].List, Index = data_featureList[LEEDS.Character.face.model][6].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.cheeks.boneHeight = 0.5
                LEEDS.Character.face.features.cheeks.boneWidth = 0.5
                LEEDS.Index.features.cheeks.boneHeight = 0.5
                LEEDS.Index.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.cheeks.boneWidth = 0.9
                LEEDS.Character.face.features.cheeks.boneHeight = 0.6
                LEEDS.Index.features.cheeks.boneWidth = 0.9
                LEEDS.Index.features.cheeks.boneHeight = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.cheeks.boneWidth = 0.30
                LEEDS.Character.face.features.cheeks.boneHeight = 0.70
                LEEDS.Index.features.cheeks.boneWidth = 0.30
                LEEDS.Index.features.cheeks.boneHeight = 0.70
            end
        end,
        type = 1,
        coords = {
            {"cheeks", "boneWidth"},
            {"cheeks", "boneHeight"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.cheeks.boneWidth = -(X)
            LEEDS.Character.face.features.cheeks.boneHeight = Y
            LEEDS.Index.features.cheeks.boneWidth = IndexX
            LEEDS.Index.features.cheeks.boneHeight = IndexY
        end
    },
    {Title = "FACE_F_CHEEKS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][7].List, Index = data_featureList[LEEDS.Character.face.model][7].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.cheeks.boneWidth = 0.5
                LEEDS.Index.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.cheeks.boneWidth = 0.30
                LEEDS.Index.features.cheeks.boneWidth = 0.30
            elseif Index == 3 then
                LEEDS.Character.face.features.cheeks.boneWidth = 0.9
                LEEDS.Index.features.cheeks.boneWidth = 0.9
            end
        end,
        type = 2,
        coords = {
            {"cheeks", "boneWidth"}
        },
        text = {"Émacié", "Bouffi"},
        panelFunction = function(X, IndexX)
            LEEDS.Character.face.features.cheeks.boneWidth = X
            LEEDS.Index.features.cheeks.boneWidth = IndexX
        end
    },
    {Title = "FACE_F_LIPS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][8].List, Index = data_featureList[LEEDS.Character.face.model][8].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.lips.thickness = 0.5
                LEEDS.Index.features.lips.thickness = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.lips.thickness = 0.9
                LEEDS.Index.features.lips.thickness = 0.9
            elseif Index == 3 then
                LEEDS.Character.face.features.lips.thickness = 0.30
                LEEDS.Index.features.lips.thickness = 0.30
            end
        end,
        type = 2,
        coords = {
            {"lips", "thickness"}
        },
        text = {"Épaisses", "Minces"},
        panelFunction = function(X, IndexX)
            LEEDS.Character.face.features.lips.thickness = X
            LEEDS.Index.features.lips.thickness = IndexX
        end
    },
    {Title = "FACE_F_JAW", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][9].List, Index = data_featureList[LEEDS.Character.face.model][9].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.jaw.boneBackLength = 0.5
                LEEDS.Character.face.features.jaw.boneWidth = 0.5
                LEEDS.Index.features.jaw.boneBackLength = 0.5
                LEEDS.Index.features.jaw.boneWidth = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.jaw.boneBackLength = 0.9
                LEEDS.Character.face.features.jaw.boneWidth = 0.6
                LEEDS.Index.features.jaw.boneBackLength = 0.9
                LEEDS.Index.features.jaw.boneWidth = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.jaw.boneBackLength = 0.30
                LEEDS.Character.face.features.jaw.boneWidth = 0.70
                LEEDS.Index.features.jaw.boneBackLength = 0.30
                LEEDS.Index.features.jaw.boneWidth = 0.70
            end
        end,
        type = 1,
        coords = {
            {"jaw", "boneBackLength"},
            {"jaw", "boneWidth"}
        },
        text = {"Ronde", "Carrée", "Étroite", "Large"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.jaw.boneBackLength = -(X)
            LEEDS.Character.face.features.jaw.boneWidth = Y
            LEEDS.Index.features.jaw.boneBackLength = IndexX
            LEEDS.Index.features.jaw.boneWidth = IndexY
        end
    },
    {Title = "FACE_F_CHIN", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][10].List, Index = data_featureList[LEEDS.Character.face.model][10].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.chimp.boneLength = 0.5
                LEEDS.Character.face.features.chimp.boneWidth = 0.5
                LEEDS.Index.features.chimp.boneLength = 0.5
                LEEDS.Index.features.chimp.boneWidth = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.chimp.boneWidth = 0.9
                LEEDS.Character.face.features.chimp.boneLength = 0.6
                LEEDS.Index.features.chimp.boneWidth = 0.9
                LEEDS.Index.features.chimp.boneLength = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.chimp.boneWidth = 0.30
                LEEDS.Character.face.features.chimp.boneLength = 0.70
                LEEDS.Index.features.chimp.boneWidth = 0.30
                LEEDS.Index.features.chimp.boneLength = 0.70
            end
        end,
        type = 1,
        coords = {
            {"chimp", "boneWidth"},
            {"chimp", "boneLength"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.chimp.boneWidth = X
            LEEDS.Character.face.features.chimp.boneLength = Y
            LEEDS.Index.features.chimp.boneWidth = IndexX
            LEEDS.Index.features.chimp.boneLength = IndexY
        end
    },
    {Title = "FACE_F_CHINS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[LEEDS.Character.face.model][11].List, Index = data_featureList[LEEDS.Character.face.model][11].Index,
        listFunction = function(Index)
            if Index == 1 then
                LEEDS.Character.face.features.chimp.hole = 0.5
                LEEDS.Character.face.features.chimp.boneLowering = 0.5
                LEEDS.Index.features.chimp.hole = 0.5
                LEEDS.Index.features.chimp.boneLowering = 0.5
            elseif Index == 2 then
                LEEDS.Character.face.features.chimp.hole = 0.9
                LEEDS.Character.face.features.chimp.boneLowering = 0.6
                LEEDS.Index.features.chimp.hole = 0.9
                LEEDS.Index.features.chimp.boneLowering = 0.6
            elseif Index == 3 then
                LEEDS.Character.face.features.chimp.hole = 0.30
                LEEDS.Character.face.features.chimp.boneLowering = 0.70
                LEEDS.Index.features.chimp.hole = 0.30
                LEEDS.Index.features.chimp.boneLowering = 0.70
            end
        end,
        type = 1,
        coords = {
            {"chimp", "hole"},
            {"chimp", "boneLowering"}
        },
        text = {"Arrondi", "Fossette", "Carré", "Pointu"},
        panelFunction = function(X, Y, IndexX, IndexY)
            LEEDS.Character.face.features.chimp.hole = -(X)
            LEEDS.Character.face.features.chimp.boneLowering = Y
            LEEDS.Index.features.chimp.hole = IndexX
            LEEDS.Index.features.chimp.boneLowering = IndexY
        end

    },
}
