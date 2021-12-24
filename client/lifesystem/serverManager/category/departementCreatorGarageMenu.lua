local color = {r = 148, g = 37, b = 37, hr = 181, hg = 54, hb = 54}
function createDepartementCreatorGarageMenu()
    local verif = {
        LEEDS.Departement.depGarageName == "",
        LEEDS.Departement.depGarageCoords == nil,
    }
    if LEEDS.Table.contains(verif, true) then 
        color.r = 148 color.g = 37 color.b = 37 color.hr = 181 color.hg = 54 color.hb = 54
    else 
        color.r = 37 color.g = 148 color.b = 54 color.hr = 54 color.hg = 181 color.hb = 73
    end
    RageUI.IsVisible(RMenu:Get('serverManager', 'departementCreatorGarage'), function()
        for i = 1, #data_departementCreatorGarageMenu do
            if data_departementCreatorGarageMenu[i].Type == "button" then
                RageUI.Button(data_departementCreatorGarageMenu[i].Title, data_departementCreatorGarageMenu[i].SubTitle, {RightLabel = data_departementCreatorGarageMenu[i].RightLabel}, true, {
                    onSelected = function()
                        if data_departementCreatorGarageMenu[i].Format ~= "coords" then
                            LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords] = KeyboardInput(data_departementCreatorGarageMenu[i].Title, nil, 10)
                            if data_departementCreatorGarageMenu[i].Format == "string" and #LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords] >= 3 then

                                LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]
                                data_departementCreatorGarageMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords]

                            elseif data_departementCreatorGarageMenu[i].Format == "date" and LEEDS.String.IsDate(LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]) then

                                LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]
                                data_departementCreatorGarageMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords]

                            elseif data_departementCreatorGarageMenu[i].Format == "size" and tonumber(LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]) >= 120 and tonumber(LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]) <= 250 then
                                
                                LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]
                                data_departementCreatorGarageMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords]
                            elseif data_departementCreatorGarageMenu[i].Format == "number" and type(tonumber(LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords])) == "number" then
                                
                                LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords] = LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords]
                                data_departementCreatorGarageMenu[i].RightLabel = "~g~"..LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords]
                            else
                                print("Format invalide !")
                            end
                        elseif data_departementCreatorGarageMenu[i].Format == "coords" then
                            LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords[1]] = GetEntityCoords(PlayerPedId())
                            LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords[2]] = GetEntityHeading(PlayerPedId())
                            LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords[1]] = LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords[1]]
                            LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords[2]] = LEEDS.Index.tempsDepartement[data_departementCreatorGarageMenu[i].Coords[2]]
                            data_departementCreatorGarageMenu[i].RightLabel = "~g~Coordonnées copier"
                        end

                    end
                })
            elseif data_departementCreatorGarageMenu[i].Type == "submenu" then
                RageUI.Button(data_departementCreatorGarageMenu[i].Title, data_departementCreatorGarageMenu[i].SubTitle, {RightLabel = data_departementCreatorGarageMenu[i].RightLabel}, true, { onSelected = function() end}, RMenu:Get('characterManager', 'nationality'))
            elseif data_departementCreatorGarageMenu[i].Type == "list" then
                RageUI.List(data_departementCreatorGarageMenu[i].Title, data_departementCreatorGarageMenu[i].Data, data_departementCreatorGarageMenu[i].Index, data_departementCreatorGarageMenu[i].SubTitle, {}, true, {
                    onListChange = function(Index, Item)
                        data_departementCreatorGarageMenu[i].Index = Index
                        LEEDS.Departement[data_departementCreatorGarageMenu[i].Coords] = data_departementCreatorGarageMenu[i].Data[Index]
                    end
                })
            else
                print("DepartementCreator: bouton #"..i.." non typé" )
            end
        end
        RageUI.Button(nil, "Une fois confirmer vous ne pourrez plus faire marche arriére", {CenterLabel = "Continuer",Color={HightLightColor={color.hr, color.hg, color.hb},BackgroundColor={color.r, color.g, color.b}}}, true, {
            onSelected = function()
                if not LEEDS.Table.contains(verif, true) then
                    TriggerServerEvent("leeds:manageDepartement", "createGarage", {depSelected = LEEDS.PlayerData.depSelected, depGarageName = LEEDS.Departement.depGarageName, depGarageCoords = LEEDS.Departement.depGarageCoords, depGarageHeading = LEEDS.Departement.depGarageHeading})
                    RageUI.Visible(RMenu:Get('serverManager', 'departementEditGarage'), true)
                else
                    print("Error")
                end
                
            end
        })
    end, function()
    end)
end