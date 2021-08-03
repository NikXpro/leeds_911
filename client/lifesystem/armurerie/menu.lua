MenuArmurerie = ""
function CreateArmurerieMenu()
    armurerieIsActif = true
    for k,v in pairs(data.armurerieList) do
        local armurerieMenu = RageUI.CreateMenu(v.Settings.TitleMenu, v.Settings.SubTitleMenu)
        armurerieMenu:SetSpriteBanner(v.Settings.Banner.Dictionary, v.Settings.Banner.Texture)
        armurerieMenu:SetSubtitle(v.Settings.SubTitleMenu)
        armurerieMenu.Closed = function()
            armurerieIsActif = false
        end
        if MenuArmurerie == v.MenuId then
            RageUI.Visible(armurerieMenu, not RageUI.Visible(armurerieMenu))
            while armurerieIsActif do
                Citizen.Wait(6)
                RageUI.IsVisible(armurerieMenu, function()
                    for _, weapon in pairs(v.WeaponList) do
                        RageUI.Button(weapon.Label, nil, {RightLabel = weapon.RightEmoticon}, true, {
                            onSelected = function()
                                GiveWeaponToPed(PlayerPedId(), weapon.WeaponName, weapon.Ammo, false)
                            end
                        });
                    end
                end)
            end
        end
    end
end