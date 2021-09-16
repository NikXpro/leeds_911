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
            Position = vector3(459.9075012207, -990.84808349609, 29.689577102661),
            Ped = {Activate = true, PedName = "s_m_y_cop_01", Heading = 91.3957061767578},
            Blip = {Activate = true, Type = "", BlipName = "LSPD", BlipId = 60, BlipColor = 16, BlipScale = 0.8}
        },
        TenuList = {
            --{Label = "Uniforme LSPD Homme", RightEmoticon = "♂️", Type = "ped", PedName = "s_m_y_cop_01"},
            {
                Label = "LSPD Class A";
                RightEmoticon = "♂️",
                Type = "freemode",
                Outfit = {
                    mp_m_freemode_01 = {
                        Hat = "0:0",
                        Glasses = "0:0",
                        Ear = "0:0",
                        Watch = "0:0",
                        Mask = "102:1",
                        Top = "201:1",
                        UpperSkin = "5:1",
                        Decal = "1:1",
                        UnderCoat = "57:1",
                        Pants = "36:1",
                        Shoes = "52:1",
                        Accessories = "9:1",
                        Armor = "1:1",
                        Parachute = "53:1"
                    },
                    mp_f_freemode_01 = {
                        Hat = "0:0",
                        Glasses = "0:0",
                        Ear = "0:0",
                        Watch = "0:0",
                        Mask = "102:1",
                        Top = "203:1",
                        UpperSkin = "4:1",
                        Decal = "1:1",
                        UnderCoat = "34:1",
                        Pants = "35:1",
                        Shoes = "53:1",
                        Accessories = "9:1",
                        Armor = "1:1",
                        Parachute = "53:1"
                    }
                }
            },
        }

    }
}