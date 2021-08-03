
MenuGarage = ""
function CreateGarageMenu()
    garageIsActif = true
    for k,v in pairs(data.garageList) do
        local garageMenu = RageUI.CreateMenu(v.Settings.TitleMenu, v.Settings.SubTitleMenu)
        garageMenu:SetSpriteBanner(v.Settings.Banner.Dictionary, v.Settings.Banner.Texture)
        garageMenu:SetSubtitle(v.Settings.SubTitleMenu)
        garageMenu.Closed = function()
            garageIsActif = false
        end
        if MenuGarage == v.MenuId then
            RageUI.Visible(garageMenu, not RageUI.Visible(garageMenu))
            while garageIsActif do
                Citizen.Wait(6)
                RageUI.IsVisible(garageMenu, function()
                    for _, vehicle in pairs(v.VehiculeList) do
                        RageUI.Button(vehicle.vehiculeLabel, nil, {RightLabel = "🔑"}, true, {
                            onSelected = function()
                                local found, zone, heading = CheckSpawnData(v.SpawnPoints)
                                if found then
                                    spawnVeh(vehicle.vehiculeName, zone, heading)
                                end
                            end
                        });
                    end
                end)
            end
        end
    end
end