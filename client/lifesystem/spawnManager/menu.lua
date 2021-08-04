local categorie = {}
local spawnManagerIsActif = false


RegisterNetEvent('leeds:playerSpawned')
AddEventHandler('leeds:playerSpawned', function()
    if not Config.debug then
        startSpawnManagerScene()
    end
end)

RegisterNetEvent('leeds:characterSelected')
AddEventHandler('leeds:characterSelected', function(coords)
    local playerId = PlayerPedId()
    SetEntityCoords(playerId, coords, false, false, false, true)
    ClearPedTasksImmediately(playerId)
    ClearPedTasks(playerId)
    SetEntityInvincible(playerId, false)
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(false, false, 500, 1, 0)
    DestroyCam(cam)
    DisplayRadar(true)
end)

local spawnManagerMenu = RageUI.CreateMenu("", "Lobby")

Citizen.CreateThread(function()
    for _, cat in pairs(Config.groupList) do
        RMenu.Add(spawnManagerMenu, cat.Label, RageUI.CreateSubMenu(spawnManagerMenu, "", cat.Label))
        table.insert(categorie, cat)
    end
end)
local dictionary = Config.groupList[1].AreaList[1].Texture

function startSpawnManagerMenu()
    spawnManagerMenu.Closed = function()
        spawnManagerIsActif = false
    end
    spawnManagerMenu.onIndexChange = function(Index)
        for k, v in pairs(Config.groupList) do
            if k == Index then
                local playerId = PlayerId()
    			local peds = GetHashKey(v.Ped)
    			RequestModel(peds)
    			while not HasModelLoaded(peds) do
      		        Wait(250)
   				end
   				SetPlayerModel(playerId, peds)
   				SetModelAsNoLongerNeeded(peds)
                LEEDS.Play.RandomAnim(PlayerPedId(), Config.spawnAnim)
            end
        end
    end
    spawnManagerMenu.Closable = false;
    RageUI.Visible(spawnManagerMenu, not RageUI.Visible(spawnManagerMenu))
    spawnManagerIsActif = true
    while spawnManagerIsActif do   
        local wait = 500
        if RageUI.Visible(spawnManagerMenu) then
            wait = 5
            RageUI.IsVisible(spawnManagerMenu, function()
                for _, cat in pairs(categorie) do 
                    RageUI.Button(cat.Label, nil, {RightLabel = LEEDS.Emoticon.Droite}, true, {
                        onActive = function()
                            spawnManagerMenu:SetSpriteBanner("banner", cat.Texture)
                        end
                    }, RMenu:Get(spawnManagerMenu, cat.Label));     
                end
            end)
        end
        for _, cat in pairs(categorie) do
            if RageUI.Visible(RMenu:Get(spawnManagerMenu, cat.Label)) then
                wait = 5
                RMenu:Get(spawnManagerMenu, cat.Label):SetSpriteBanner("banner", cat.Texture)
                RageUI.IsVisible(RMenu:Get(spawnManagerMenu, cat.Label), function()
                    RageUI.Window.Images("banner", dictionary)
                    RageUI.Separator("SÉLECTIONNER VOTRE DÉPARTEMENT")
                    for _, group in pairs(Config.groupList) do
                        if group.Label == cat.Label then
                            for _, area in pairs(group.AreaList) do
                                if area.Activate then
                                    RageUI.Button(area.Label, nil, {RightLabel = LEEDS.Emoticon.Plus}, true, {
                                        onActive = function()
                                            dictionary = area.Texture
                                        end,
                                        onSelected = function()
                                            TriggerEvent('leeds:characterSelected', area.Coords)
                                            RageUI.CloseAll()
                                        end
                                    });
                                else
                                    RageUI.Button(area.Label, nil, {}, false, {
                                        onActive = function()
                                            dictionary = area.Texture
                                        end
                                    });
                                end 
                            end
                        end
                    end
                end, function()
                end)
            end 
        end
        Citizen.Wait(wait)
    end
end

function startSpawnManagerScene()
    local playerId = PlayerPedId()
    DisplayRadar(false)
    SetEntityCoords(playerId, 1158.6204833984, -3195.5803222656, -40.007972717285, false, false, false, true)
    SetEntityHeading(playerId, 86.35992431640625)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(playerId, 0.30, 1.90, 0.450))
    SetCamRot(cam, -7.0, 0.0, 270.0)
    RenderScriptCams(true, false, 500, 1, 0)
    SetBlockingOfNonTemporaryEvents(playerId, true)
    LEEDS.Play.RandomAnim(playerId, Config.spawnAnim)
    Wait(250)
    if IsInteriorReady(246785) then
        FreezeEntityPosition(playerId, true)
        SetEntityInvincible(playerId, true)
        SetCanAttackFriendly(playerId, true, false)
        NetworkSetFriendlyFireOption(true)
        ClearPlayerWantedLevel(playerId)
        SetMaxWantedLevel(0)
        startSpawnManagerMenu()
    else
        startSpawnManagerScene()
    end
end