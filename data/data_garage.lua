data.garageList = {
    {
        MenuId = "LSSD",
        Settings = {
            TitleMenu = "",
            SubTitleMenu = "Garage LSSD",
            ZoneMessage = "Appuyer sur ~INPUT_CONTEXT~ pour ouvrir le garage",
            ZoneSize = 1.5,
            Banner = {Dictionary = "banner", Texture = "lspd"},
            Position = vector3(-449.61730957031, 6003.9799804688, 30.49010848999),
            Ped = {Activate = true, PedName = "s_m_y_sheriff_01", Heading = 126.62908935546876}
        },
        DeleterPoint = {
            Position = vector3(-468.84625244141, 6019.1430664062, 30.340553283691),
            ZoneSize = 4.5,
            ZoneMessage = "Appuyer sur ~INPUT_CONTEXT~ pour rentrer le vehicule dans le garage"
        },
        SpawnPoints = {
            { pos = vector3(-482.5964050293,6024.8706054688,31.340551376343), heading = 231.07778930664},
            { pos = vector3(-479.39752197266,6027.73828125,31.340551376343), heading = 231.41006469727},
            { pos = vector3(-475.69668579102,6031.6743164062,31.340551376343), heading = 220.23754882812},
            { pos = vector3(-472.43255615234,6035.4516601562,31.340551376343), heading = 233.31307983398},
            { pos = vector3(-468.71588134766,6038.7094726562,31.340551376343), heading = 222.35475158691},
            { pos = vector3(-454.88598632812,6001.9892578125,31.340553283691), heading = 91.969161987305},
            { pos = vector3(-451.42398071289,5998.1782226562,31.340553283691), heading = 85.128646850586},
            { pos = vector3(-447.92626953125,5994.375,31.340553283691), heading = 85.618339538574}
        },
        VehiculeList = {
            {vehiculeLabel = "Sheriff Stanier",vehiculeName = "sheriff"},
            {vehiculeLabel = "Sheriff Granger",vehiculeName = "sheriff2"},
        }
    },
    {
        MenuId = "LSPD",
        Settings = {
            TitleMenu = "",
            SubTitleMenu = "Garage LSPD",
            ZoneMessage = "Appuyer sur ~INPUT_CONTEXT~ pour ouvrir le garage",
            ZoneSize = 1.5,
            Banner = {Dictionary = "banner", Texture = "lspd"},
            Position = vector3(459.08197021484, -1017.1141967773, 27.151100158691),
            Ped = {Activate = true, PedName = "s_m_y_cop_01", Heading = 96.8994140625}
        },
        DeleterPoint = {
            Position = vector3(456.31402587891, -1017.4040527344, 27.398015975952),
            ZoneSize = 4.5,
            ZoneMessage = "Appuyer sur ~INPUT_CONTEXT~ pour rentrer le vehicule dans le garage"
        },
        SpawnPoints = {
           { pos = vector3(446.08596801758,-1026.0086669922,28.647966384888), heading = 348.05746459961},
           { pos = vector3(442.50015258789,-1026.3876953125,28.7154712677), heading = 5.4512419700623},
           { pos = vector3(438.78497314453,-1027.1968994141,28.785760879517), heading = 7.4895009994507},
           { pos = vector3(434.8776550293,-1027.3218994141,28.854543685913), heading = 7.9458661079407},
           { pos = vector3(431.50695800781,-1027.6596679688,28.915742874146), heading = 4.2442054748535},
        },
        VehiculeList = {
            {vehiculeLabel = "Sheriff Stanier",vehiculeName = "sheriff"},
        }
    }
}