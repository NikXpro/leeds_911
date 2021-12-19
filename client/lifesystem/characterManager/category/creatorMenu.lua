function createCreatorMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'creator'), function()
        RageUI.List(GetLabelText("FACE_SEX"), {GetLabelText("FACE_FEMALE"), GetLabelText("FACE_MALE")}, LEEDS.Character.sexe, GetLabelText("FACE_MM_H2"), {}, true, {
            onListChange = function(Index, Item)
                LEEDS.Character.sexe = Index
                if LEEDS.Character.sexe == 1 then
                    LEEDS.Character.face.model = "mp_f_freemode_01"
                elseif LEEDS.Character.sexe == 2 then
                    LEEDS.Character.face.model = "mp_m_freemode_01"
                end
                LoadCharacter(LEEDS.Character.face.model, LEEDS.Character.face)
            end
        })
        for i = 1, #data_creatorMenu do
            RageUI.Button(data_creatorMenu[i].Title, data_creatorMenu[i].SubTitle, {RightLabel = LEEDS.Emoticon.Droite}, true, {onSelected = function() EditCam(Config.camPos[data_creatorMenu[i].camPos]) end}, RMenu:Get(data_creatorMenu[i].MenuCat, data_creatorMenu[i].MenuName)) 
        end
    end)
end