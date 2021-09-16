MenuVestiaire = ""
function CreateVestiaireMenu()
    vestiaireIsActif = true
    for k,v in pairs(data.vestiaireList) do
        local vestiaireMenu = RageUI.CreateMenu(v.Settings.TitleMenu, v.Settings.SubTitleMenu)
        vestiaireMenu:SetSpriteBanner(v.Settings.Banner.Dictionary, v.Settings.Banner.Texture)
        vestiaireMenu:SetSubtitle(v.Settings.SubTitleMenu)
        vestiaireMenu.Closed = function()
            vestiaireIsActif = false
        end
        if MenuVestiaire == v.MenuId then
            RageUI.Visible(vestiaireMenu, not RageUI.Visible(vestiaireMenu))
            while vestiaireIsActif do
                Citizen.Wait(6)
                RageUI.IsVisible(vestiaireMenu, function()
                    for _, tenu in pairs(v.TenuList) do
                        RageUI.Button(tenu.Label, nil, {
                            RightLabel = tenu.RightEmoticon
                        }, true, {
                            onSelected = function()
                                if tenu.Type == "ped" then
                                    local playerId = PlayerId()
                                    local peds = GetHashKey(tenu.PedName)
                                    RequestModel(peds)
                                    while not HasModelLoaded(peds) do
                                        Wait(250)
                                    end
                                    SetPlayerModel(playerId, peds)
                                    SetModelAsNoLongerNeeded(peds)
                                else
                                    CreateThread(function()
                                        SetTenue(tenu.Outfit)
                                    end)
                                    
                                end
                            end
                        });
                    end
                end)
            end
        end
    end
end
