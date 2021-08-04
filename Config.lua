Config = {}

Config.debug = true

Config.spawnAnim = {
    {type = "anim", lib = "anim@heists@heist_corona@single_team", anim = "single_team_loop_boss", flag = 1},
    {type = "anim", lib = "random@street_race", anim = "_car_b_lookout", flag = 1},
    {type = "anim", lib = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop", flag = 1},
    {type = "anim", lib = "random@shop_gunstore", anim = "_idle", flag = 1}
}

Config.groupList = {
    {
        Label = "Police",
        Ped = "s_m_y_cop_01",
        Texture = "lspd",
        AreaList = {
            {Label = "Mission Row", Texture = "mrpd", Activate = true, Coords = vector3(455.34024047852, -991.51263427734, 30.689617156982)},
            {Label = "Vespucci", Texture = "vpd", Activate = false, Coords = vector3(-1058.2274169922, -840.49920654297, 5.0424575805664)}
        }
    },
    {
        Label = "Secour",
        Ped = "s_m_m_paramedic_01",
        Texture = "lsfd",
        AreaList = {
            {Label = "MRPD", Description = "", Texture = "", Activate = true, Coords = vector3(-449.75180053711, 6010.6264648438, 30.716396331787)}
        }
    },
    {
        Label = "Civil",
        Ped = "s_m_m_paramedic_01",
        Texture = "shopui_title_gr_gunmod",
        AreaList = {
            {Label = "MRPD", Description = "", Texture = "", Activate = true, Coords = vector3(-449.75180053711, 6010.6264648438, 30.716396331787)}
        }
    }
}