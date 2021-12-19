LEEDS.Index.tempsIdentity = {
    ["lastname"] = "",
    ["firstname"] = "",
    ["dob"] = "",
    ["pob"] = "",
    ["sexe"] = "",
    ["height"] = "",
}

function createNationalityMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'nationality'), function()
        for i = 1, #data_nationalityList do
            RageUI.Button(data_nationalityList[i].Title, nil, {RightLabel = data_nationalityList[i].RightLabel}, true, {
                onSelected = function()
                    data_identityMenu[5].RightLabel = "~g~"..data_nationalityList[i].Title
                    LEEDS.Character.identity.nationality = data_nationalityList[i].Title
                    RageUI.GoBack()
                end
            })
        end
    end)
end

local color = {r = 148, g = 37, b = 37, hr = 181, hg = 54, hb = 54}

function createIdentityMenu()
    local verif = {LEEDS.Character.identity.lastname == "",LEEDS.Character.identity.firstname == "",LEEDS.Character.identity.nationality == "",LEEDS.Character.identity.dob == "",LEEDS.Character.identity.pob == "",LEEDS.Character.identity.height == ""}
    if LEEDS.Table.contains(verif, true) then 
        color.r = 148 color.g = 37 color.b = 37 color.hr = 181 color.hg = 54 color.hb = 54
    else 
        color.r = 37 color.g = 148 color.b = 54 color.hr = 54 color.hg = 181 color.hb = 73
    end
    RageUI.IsVisible(RMenu:Get('characterManager', 'identity'), function()
        for i = 1, #data_identityMenu do
            if data_identityMenu[i].Type == "button" then
                RageUI.Button(data_identityMenu[i].Title, data_identityMenu[i].SubTitle, {RightLabel = data_identityMenu[i].RightLabel}, true, {
                    onSelected = function()
                        LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords] = KeyboardInput(data_identityMenu[i].Title, nil, 10)
                        if data_identityMenu[i].Format == "string" and #LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords] >= 3 then

                            LEEDS.Character.identity[data_identityMenu[i].Coords] = LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords]
                            data_identityMenu[i].RightLabel = "~g~"..LEEDS.Character.identity[data_identityMenu[i].Coords]

                        elseif data_identityMenu[i].Format == "date" and LEEDS.String.IsDate(LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords]) then

                            LEEDS.Character.identity[data_identityMenu[i].Coords] = LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords]
                            data_identityMenu[i].RightLabel = "~g~"..LEEDS.Character.identity[data_identityMenu[i].Coords]

                        elseif data_identityMenu[i].Format == "size" and tonumber(LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords]) >= 120 and tonumber(LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords]) <= 250 then
                            
                            LEEDS.Character.identity[data_identityMenu[i].Coords] = LEEDS.Index.tempsIdentity[data_identityMenu[i].Coords]
                            data_identityMenu[i].RightLabel = "~g~"..LEEDS.Character.identity[data_identityMenu[i].Coords]

                        else
                            print("Format invalide !")
                        end
                    end
                })
            elseif data_identityMenu[i].Type == "submenu" then
                RageUI.Button(data_identityMenu[i].Title, data_identityMenu[i].SubTitle, {RightLabel = data_identityMenu[i].RightLabel}, true, { onSelected = function() end}, RMenu:Get('characterManager', 'nationality'))
            elseif data_identityMenu[i].Type == "list" then
                RageUI.List(data_identityMenu[i].Title, data_identityMenu[i].Data, data_identityMenu[i].Index, data_identityMenu[i].SubTitle, {}, true, {
                    onListChange = function(Index, Item)
                        data_identityMenu[i].Index = Index
                        LEEDS.Character.identity[data_identityMenu[i].Coords] = data_identityMenu[i].Data[Index]
                    end
                })
            else
                print("IdentityCreator: bouton #"..i.." non typé" )
            end
        end
        RageUI.Button(nil, "Une fois confirmer vous ne pourrez plus faire marche arriére", {CenterLabel = "Confirmer",Color={HightLightColor={color.hr, color.hg, color.hb},BackgroundColor={color.r, color.g, color.b}}}, true, {
            onSelected = function()
                if not LEEDS.Table.contains(verif, true) then
                    TriggerServerEvent("leeds:editCharacter", "create", LEEDS.Character)

                    LEEDS.Character = {sexe = 1,identity = {["lastname"] = "",["firstname"] = "",["nationality"] = "",["dob"] = "",["pob"] = "",["sexe"] = "Homme",["height"] = ""},face = {model = "mp_f_freemode_01",parent = {mom = 1,dad = 1,resemblance = 5,skinMix = 5},features = {["eyebrow"] = {["height"] = 0.5, ["forward"] = 0.5},["eye"] = {["opening"] = 0.5},["nose"] = {["width"] = 0.5,["peakHeight"] = 0.5,["peakLength"] = 0.5,["peakLowering"] = 0.5,["boneHeight"] = 0.5,["boneTwist"] = 0.5},["cheeks"] = {["boneHeight"] = 0.5, ["boneWidth"] = 0.5},["lips"] = {["thickness"] = 0.5},["jaw"] = {["boneWidth"] = 0.5, ["boneBackLength"] = 0.5},["chimp"] = {["hole"] = 0.5, ["boneLength"] = 0.5, ["boneWidth"] = 0.5, ["boneLowering"] = 0.5}},apparence = {["hair"] = {["style"] = -1,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["beard"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["eyebrows"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["blemishes"] = {["style"] = -1,["opacity"] = 1.0},["ageing"] = {["style"] = -1,["opacity"] = 1.0},["complexion"] = {["style"] = -1,["opacity"] = 1.0},["freckles"] = {["style"] = -1,["opacity"] = 1.0},["sundamage"] = {["style"] = -1,["opacity"] = 1.0},["eye"] = {["style"] = -1},["eyemackeup"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1},["lipstick"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1}}}}
                    LEEDS.Index.features = {["eyebrow"] = {["height"] = 0.5, ["forward"] = 0.5},["eye"] = {["opening"] = 0.5},["nose"] = {["width"] = 0.5,["peakHeight"] = 0.5,["peakLength"] = 0.5,["peakLowering"] = 0.5,["boneHeight"] = 0.5,["boneTwist"] = 0.5},["cheeks"] = {["boneHeight"] = 0.5, ["boneWidth"] = 0.5},["lips"] = {["thickness"] = 0.5},["jaw"] = {["boneWidth"] = 0.5, ["boneBackLength"] = 0.5},["chimp"] = {["hole"] = 0.5, ["boneLength"] = 0.5, ["boneWidth"] = 0.5, ["boneLowering"] = 0.5}}
                    LEEDS.Index.apparence = {["hair"] = {["style"] = -1,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["beard"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["eyebrows"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["blemishes"] = {["style"] = -1,["opacity"] = 1.0},["ageing"] = {["style"] = -1,["opacity"] = 1.0},["complexion"] = {["style"] = -1,["opacity"] = 1.0},["freckles"] = {["style"] = -1,["opacity"] = 1.0},["sundamage"] = {["style"] = -1,["opacity"] = 1.0},["eye"] = {["style"] = -1},["eyemackeup"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1},["lipstick"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1}}
                    LEEDS.Index.tempsIdentity = {["lastname"] = "",["firstname"] = "",["dob"] = "",["pob"] = "",["sexe"] = "",["height"] = ""}
                    data_identityMenu[1].RightLabel = "~c~Oconor"
                    data_identityMenu[2].RightLabel = "~c~James"
                    data_identityMenu[3].RightLabel = "~c~187"
                    data_identityMenu[4].Index = 1
                    data_identityMenu[5].RightLabel = "~c~Américaine"
                    data_identityMenu[6].RightLabel = "~c~Los santos"
                    data_identityMenu[7].RightLabel = "~c~25/06/2003"
                    data_identityMenu[8].Index = 1
                    RageUI.Visible(RMenu:Get('characterManager', 'home'), true)
                else
                    print("Error")
                end
                
            end
        })
    end)
end