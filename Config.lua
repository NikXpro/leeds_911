Config = {}

Config.debug = false

Config.DefaultPermissions = '{"characterAutorized":2}'
Config.interactMenu = false
Config.meType = "command" --Vide = Désactiver, command = Marche aveec un /me, key = marche avec la touche "T"

Config.speedometer = "KMH"

Config.spawnAnim = {
    {type = "anim", lib = "anim@heists@heist_corona@single_team", anim = "single_team_loop_boss", flag = 1},
    {type = "anim", lib = "random@street_race", anim = "_car_b_lookout", flag = 1},
    {type = "anim", lib = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop", flag = 1},
    {type = "anim", lib = "random@shop_gunstore", anim = "_idle", flag = 1}
}

Config.groupList = {
    {
        Label = "Law Enforcement",
        Role = "police",
        Ped = "s_m_y_cop_01",
        Texture = "lspd",
        AreaList = {
            {Label = "LSPD", Texture = "mrpd", Activate = true, Coords = vector3(455.34024047852, -991.51263427734, 30.689617156982)},
            {Label = "LSSD", Texture = "vpd", Activate = true, Coords = vector3(-437.11752319336, 6020.279296875, 31.490112304688)}
        }
    },
    {
        Label = "Fire & Rescue",
        Role = "ambulance",
        Ped = "s_m_m_paramedic_01",
        Texture = "lsfd",
        AreaList = {
            {Label = "LSFD", Description = "", Texture = "mrpd", Activate = true, Coords = vector3(219.51557922363, -1645.0241699219, 29.677095413208)},
            {Label = "LSCoFD", Description = "", Texture = "mrpd", Activate = true, Coords = vector3(1691.7346191406, 3580.4772949219, 35.596828460693)}
        }
    },
    {
        Label = "Civilian",
        Role = "civil",
        Ped = "a_m_m_afriamer_01",
        Texture = "shopui_title_gr_gunmod",
        AreaList = {
            {Label = "Los Santos County", Description = "", Texture = "mrpd", Activate = true, Coords = vector3(1959.1683349609, 3732.5795898438, 32.226196289062)},
            {Label = "Los Santos City", Description = "", Texture = "mrpd", Activate = true, Coords = vector3(-1604.7893066406, -956.60559082031, 13.016840934753)}
        }
    }
}