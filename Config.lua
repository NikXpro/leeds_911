Config = {}

Config.debug = false
Config.ServerName = "Last Town V2"
Config.spawnPoint = {100, 111, 100, 100}

Config.DefaultPermissions = '{"characterAutorized":2}'
Config.interactMenu = false
Config.meType = "command" --Vide = Désactiver, command = Marche aveec un /me, key = marche avec la touche "T"

Config.speedometer = "KMH"


Config.DefaultSexe = 1

Config.cmAnimList = {
    {type = "anim", lib = "anim@heists@heist_corona@single_team", anim = "single_team_loop_boss", flag = 1},
    {type = "anim", lib = "random@street_race", anim = "_car_b_lookout", flag = 1},
    {type = "anim", lib = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop", flag = 1},
    {type = "anim", lib = "random@shop_gunstore", anim = "_idle", flag = 1}
}

Config.camPos = {
    ["body"] = {x = 0.17, y = 1.60, z = 0.550, rotx = -13.8, roty = 0.0, rotz = 270.0},
    ["body_face"] = {x = 0.17, y = 1.0, z = 0.610, rotx = -13.8, roty = 0.0, rotz = 270.0},
    ["face"] = {x = 0.0, y = 0.45, z = 0.775, rotx = -10.0, roty = 0.0, rotz = 270.0}
}

Config.MotherList = {
    Index = 1,
    List = {
        {Name = "Hannah", Value = 21},
        {Name = "Aubrey", Value = 22},
        {Name = "Jasmine", Value = 23},
        {Name = "Gisele", Value = 24},
        {Name = "Amelia", Value = 25},
        {Name = "Isabella", Value = 26},
        {Name = "Zoe", Value = 27},
        {Name = "Ava", Value = 28},
        {Name = "Camila", Value = 29},
        {Name = "Violet", Value = 30},
        {Name = "Sophia", Value = 31},
        {Name = "Eveline", Value = 32},
        {Name = "Nicole", Value = 33},
        {Name = "Ashley", Value = 34},
        {Name = "Grace", Value = 35},
        {Name = "Brianna", Value = 36},
        {Name = "Natalie", Value = 37},
        {Name = "Olivia", Value = 38},
        {Name = "Elizabeth", Value = 39},
        {Name = "Charlotte", Value = 40},
        {Name = "Emma", Value = 41},
        {Name = "Misty", Value = 45}
    }
}
Config.FatherList = {
    Index = 1,
    List = {
        {Name = "Benjamin", Value = 0},
        {Name = "Daniel", Value = 1},
        {Name = "Joshua", Value = 2},
        {Name = "Noah", Value = 3},
        {Name = "Andrew", Value = 4},
        {Name = "Juan", Value = 5},
        {Name = "Alex", Value = 6},
        {Name = "Isaac", Value = 7},
        {Name = "Evan", Value = 8},
        {Name = "Ethan", Value = 9},
        {Name = "Vincent", Value = 10},
        {Name = "Angel", Value = 11},
        {Name = "Diego", Value = 12},
        {Name = "Adrian", Value = 13},
        {Name = "Gabriel", Value = 14},
        {Name = "Michael", Value = 15},
        {Name = "Santiago", Value = 16},
        {Name = "Kevin", Value = 17},
        {Name = "Louis", Value = 18},
        {Name = "Samuel", Value = 19},
        {Name = "Anthony", Value = 20},
        {Name = "John", Value = 42},
        {Name = "Niko", Value = 43},
        {Name = "Claude", Value = 44}
    }
}

Config.outfitList = {
    {
        Label = "Costar",
        ClothList = {
            {Label = "Costar blanc", Tenue = {}},
            {Label = "Costar noir", Tenue = {}},
            {Label = "Costar rouge", Tenue = {}},
        }
    },
    {
        Label = "Sport",
        ClothList = {
            {Label = "Sport blanc", Tenue = {}},
            {Label = "Sport noir", Tenue = {}},
            {Label = "Sport rouge", Tenue = {}},
        }
    }
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