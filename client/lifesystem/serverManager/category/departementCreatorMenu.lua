local color = {r = 148, g = 37, b = 37, hr = 181, hg = 54, hb = 54}
function createDepartementCreatorMenu()
    local verif = {
        LEEDS.Departement.depName == "",
        LEEDS.Departement.depTexture == "",
        LEEDS.Departement.depCoords == nil,
        LEEDS.Departement.depHeading == nil,
        LEEDS.Departement.depBlipName == "",
        LEEDS.Departement.depBlipId == nil,
        LEEDS.Departement.depBlipScale == nil,
        LEEDS.Departement.depBlipColor == nil,
    }
    if LEEDS.Table.contains(verif, true) then 
        color.r = 148 color.g = 37 color.b = 37 color.hr = 181 color.hg = 54 color.hb = 54
    else 
        color.r = 37 color.g = 148 color.b = 54 color.hr = 54 color.hg = 181 color.hb = 73
    end
    RageUI.IsVisible(RMenu:Get('serverManager', 'departementCreator'), function()
        for i = 1, #data_departementCreatorMenu do
            if data_departementCreatorMenu[i].Type == "button" then
                RageUI.Button(data_departementCreatorMenu[i].Title, data_departementCreatorMenu[i].SubTitle, {RightLabel = data_departementCreatorMenu[i].RightLabel}, true, {
                    onSelected = function()
                        if data_departementCreatorMenu[i].Format ~= "coords" then
                            LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords] = KeyboardInput(data_departementCreatorMenu[i].Title, nil, 10)
                            if data_departementCreatorMenu[i].Format == "string" and #LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords] >= 3 then

                                LEEDS.Departement[data_departementCreatorMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]
                                data_departementCreatorMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorMenu[i].Coords]

                            elseif data_departementCreatorMenu[i].Format == "date" and LEEDS.String.IsDate(LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]) then

                                LEEDS.Departement[data_departementCreatorMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]
                                data_departementCreatorMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorMenu[i].Coords]

                            elseif data_departementCreatorMenu[i].Format == "size" and tonumber(LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]) >= 120 and tonumber(LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]) <= 250 then
                                
                                LEEDS.Departement[data_departementCreatorMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]
                                data_departementCreatorMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorMenu[i].Coords]
                            elseif data_departementCreatorMenu[i].Format == "number" and type(tonumber(LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords])) == "number" then
                                
                                LEEDS.Departement[data_departementCreatorMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords]
                                data_departementCreatorMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorMenu[i].Coords]
                            else
                                print("Format invalide !")
                            end
                        elseif data_departementCreatorMenu[i].Format == "coords" then
                            LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords[1]] = GetEntityCoords(PlayerPedId())
                            LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords[2]] = GetEntityHeading(PlayerPedId())
                            LEEDS.Departement[data_departementCreatorMenu[i].Coords[1]] = LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords[1]]
                            LEEDS.Departement[data_departementCreatorMenu[i].Coords[2]] = LEEDS.Index.tempsDepartement[data_departementCreatorMenu[i].Coords[2]]
                            data_departementCreatorMenu[i].RightLabel = "~g~Coordonnées copier"
                        end

                    end
                })
            elseif data_departementCreatorMenu[i].Type == "submenu" then
                RageUI.Button(data_departementCreatorMenu[i].Title, data_departementCreatorMenu[i].SubTitle, {RightLabel = data_departementCreatorMenu[i].RightLabel}, true, { onSelected = function() end}, RMenu:Get('characterManager', 'nationality'))
            elseif data_departementCreatorMenu[i].Type == "list" then
                RageUI.List(data_departementCreatorMenu[i].Title, data_departementCreatorMenu[i].Data, data_departementCreatorMenu[i].Index, data_departementCreatorMenu[i].SubTitle, {}, true, {
                    onListChange = function(Index, Item)
                        data_departementCreatorMenu[i].Index = Index
                        LEEDS.Departement[data_departementCreatorMenu[i].Coords] = data_departementCreatorMenu[i].Data[Index]
                    end
                })
            else
                print("DepartementCreator: bouton #"..i.." non typé" )
            end
        end
        RageUI.Button(nil, "Une fois confirmer vous ne pourrez plus faire marche arriére", {CenterLabel = "Continuer",Color={HightLightColor={color.hr, color.hg, color.hb},BackgroundColor={color.r, color.g, color.b}}}, true, {
            onSelected = function()
                if not LEEDS.Table.contains(verif, true) then
                    TriggerServerEvent("leeds:manageDepartement", "create", LEEDS.Departement)
                    RageUI.Visible(RMenu:Get('serverManager', 'departement'), true)
                else
                    print("Error")
                end
                
            end
        })
    end, function()
    end)
end