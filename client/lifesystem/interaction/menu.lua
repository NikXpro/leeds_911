data.pedsList = {
    {
        catLabel = "LSPD",
        catPedsList = {
            {label = "1", hash = "a_f_m_beach_01"},
            {label = "2", hash = "a_f_m_bevhills_01"},
            {label = "3", hash = "a_f_m_bevhills_02"},
            {label = "4", hash = "a_f_m_bodybuild_0"},
            {label = "5", hash = "a_f_m_business_02"},
            {label = "6", hash = "a_f_m_downtown_01"},
        }
    },
}


local interactionMenu = RageUI.CreateMenu("Interaction", "Interaction")
local vehicleMenu = RageUI.CreateSubMenu(interactionMenu, "Vehicule", "Vehicule")
local loadoutMenu = RageUI.CreateSubMenu(interactionMenu, "Loadout", "Loadout")
local pedsMenu = RageUI.CreateSubMenu(interactionMenu, "Peds", "Peds")


local categorie = {
    vehicle = {},
    loadout = {},
    peds = {}
}

Citizen.CreateThread(function()
  for k,v in pairs(data.vehicleList) do
    RMenu.Add(vehicleMenu, v.catLabel, RageUI.CreateSubMenu(vehicleMenu, "", v.catLabel))
    table.insert(categorie.vehicle, v)
  end
  for k,v in pairs(data.loadoutList) do
    RMenu.Add(loadoutMenu, v.catLabel, RageUI.CreateSubMenu(loadoutMenu, "", v.catLabel))
    table.insert(categorie.loadout, v)
  end
  for k,v in pairs(data.pedsList) do
    RMenu.Add(pedsMenu, v.catLabel, RageUI.CreateSubMenu(pedsMenu, "", v.catLabel))
    table.insert(categorie.peds, v)
  end
end)

Citizen.CreateThread(function()
    while true do
        local attente = 500
        if RageUI.Visible(interactionMenu) then
            attente = 6
            RageUI.IsVisible(interactionMenu, function()
                RageUI.Button("Vehicule", nil, {RightLabel = "→"}, true, {onSelected = function() end}, vehicleMenu);
                RageUI.Button("Loadout", nil, {RightLabel = "→"}, true, {onSelected = function() end}, loadoutMenu);
                RageUI.Button("Peds", nil, {RightLabel = "→"}, true, {onSelected = function() end}, pedsMenu);
            end)
        end

        if RageUI.Visible(vehicleMenu) then
            attente = 6
            RageUI.IsVisible(vehicleMenu, function()
                RageUI.Button("Retirer le vehicule", nil, {RightLabel = "❌"}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        SetEntityAsMissionEntity(vehicle, false, true)
	                    DeleteVehicle(vehicle)
                    end
                });
                for _, v in pairs(categorie.vehicle) do 
                    RageUI.Button(v.catLabel, nil, {RightLabel = "🔎"}, true, {onSelected = function() end}, RMenu:Get(vehicleMenu, v.catLabel));     
                end
            end, function()
            end)
        end

        if RageUI.Visible(loadoutMenu) then
            attente = 6
            RageUI.IsVisible(loadoutMenu, function()
                RageUI.Button("Retirer toute les arme", nil, {RightLabel = "❌"}, true, {
                    onSelected = function()
                        RemoveAllPedWeapons(PlayerPedId(), false)
                    end
                });
                for _, v in pairs(categorie.loadout) do 
                    RageUI.Button(v.catLabel, nil, {RightLabel = "🔎"}, true, {onSelected = function() end}, RMenu:Get(loadoutMenu, v.catLabel));     
                end
            end, function()
            end)
        end

        if RageUI.Visible(pedsMenu) then
            attente = 6
            RageUI.IsVisible(pedsMenu, function()
                for _, v in pairs(categorie.peds) do 
                    RageUI.Button(v.catLabel, nil, {RightLabel = "🔎"}, true, {onSelected = function() end}, RMenu:Get(pedsMenu, v.catLabel));     
                end
            end, function()
            end)
        end

        for _, b in pairs(categorie.vehicle) do
            if RageUI.Visible(RMenu:Get(vehicleMenu, b.catLabel)) then
                attente = 5
                RageUI.IsVisible(RMenu:Get(vehicleMenu, b.catLabel), function()
                    for _, d in pairs(data.vehicleList) do
                        if d.catLabel == b.catLabel then
                            for _, f in pairs(d.catVehicleList) do
                                RageUI.Button(f.label, nil, {RightLabel = "~b~("..f.name..")"}, true, {
                                    onSelected = function()
                                        local playerCoords = GetEntityCoords(PlayerPedId())
                                        local heading = GetEntityHeading(PlayerPedId())
                                        if GetVehiclePedIsIn(PlayerPedId(), false) then
                                            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                                        end
                                        RequestModel(GetHashKey(f.name))
                                        while not HasModelLoaded(GetHashKey(f.name)) do
                                            Wait(10)
                                        end
                                        local vehicle = CreateVehicle(GetHashKey(f.name), playerCoords.x, playerCoords.y, playerCoords.z, heading, true, true)
                                        SetVehicleEngineOn(vehicle, true, true)
                                        SetVehicleForwardSpeed(vehicle, 1000)
                                        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    end
                                });
                            end
                        end
                    end
                end, function()
                  --Panels
                end)
            end
        end

        for _, b in pairs(categorie.loadout) do
            if RageUI.Visible(RMenu:Get(loadoutMenu, b.catLabel)) then
                attente = 5
                RageUI.IsVisible(RMenu:Get(loadoutMenu, b.catLabel), function()
                    for _, d in pairs(data.loadoutList) do
                        if d.catLabel == b.catLabel then
                            for _, f in pairs(d.catLoadoutList) do
                                RageUI.Button(f.label, nil, {RightLabel = "➕"}, true, {
                                    onSelected = function()
                                        RemoveAllPedWeapons(PlayerPedId(), false)
                                        for _, g in pairs(f.weaponList) do
                                            GiveWeaponToPed(PlayerPedId(), g.weaponName, g.weaponAmmo, false)
                                        end
                                    end
                                });
                            end
                        end
                    end
                end, function()
                  --Panels
                end)
            end
        end

        for _, b in pairs(categorie.peds) do
            if RageUI.Visible(RMenu:Get(pedsMenu, b.catLabel)) then
                attente = 5
                RageUI.IsVisible(RMenu:Get(pedsMenu, b.catLabel), function()
                    for _, d in pairs(data.pedsList) do
                        if d.catLabel == b.catLabel then
                            for _, f in pairs(d.catPedsList) do
                                RageUI.Button(f.label, nil, {RightLabel = "~b~("..f.hash..")"}, true, {
                                    onSelected = function()
                                        local playerId = PlayerId()
    			                        local peds = GetHashKey(f.hash)
    			                        RequestModel(peds)
    			                        while not HasModelLoaded(peds) do
      		    	                        Wait(250)
   				                        end
   				                        SetPlayerModel(playerId, peds)
   				                        SetModelAsNoLongerNeeded(peds)
                                    end
                                });
                            end
                        end
                    end
                end, function()
                  --Panels
                end)
            end
        end
        Citizen.Wait(attente)
    end
end)

Keys.Register('F6', 'F6', 'Menu test cardealer.', function()
    RageUI.Visible(interactionMenu, not RageUI.Visible(interactionMenu))
end)