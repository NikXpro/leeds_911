data.vestiaireList = {
    {
        MenuId = "LSSD",
        Settings = {
            TitleMenu = "",
            SubTitleMenu = "Vestiaire LSSD",
            ZoneMessage = "Appuyer sur ~INPUT_CONTEXT~ pour demander votre tenue",
            ZoneSize = 1.5,
            Banner = {Dictionary = "banner", Texture = "lspd"},
            Position = vector3(215.01309204102, -1651.5227050781, 28.803216934204),
            Ped = {Activate = true, PedName = "s_m_y_sheriff_01", Heading = 38.07},
            Blip = {Activate = true, Type = "", BlipName = "LSSD", BlipId = 60, BlipColor = 16, BlipScale = 0.8}
        },
        TenuList = {
            {Label = "Uniforme LSSO Homme", RightEmoticon = "♂️", PedName = "s_m_y_sheriff_01"},
            {Label = "Uniforme LSSO Femme", RightEmoticon = "♀️", PedName = "s_f_y_sheriff_01"}
        }
   },
   {
        MenuId = "LSPD",
        Settings = {
            TitleMenu = "",
            SubTitleMenu = "Vestiaire LSPD",
            ZoneMessage = "Appuyer sur ~INPUT_CONTEXT~ pour demander votre tenue",
            ZoneSize = 1.5,
            Banner = {Dictionary = "banner", Texture = "lspd"},
            Position = vector3(215.01309204102, -1651.5227050781, 28.803216934204),
            Ped = {Activate = true, PedName = "s_m_y_cop_01", Heading = 85.5},
            Blip = {Activate = true, Type = "", BlipName = "LSPD", BlipId = 60, BlipColor = 16, BlipScale = 0.8}
        },
        TenuList = {
            {Label = "Uniforme LSPD Homme", RightEmoticon = "♂️", PedName = "s_m_y_cop_01"},
            {Label = "Uniforme LSPD Femme", RightEmoticon = "♀️", PedName = "s_f_y_cop_01"}
        }

    }
}