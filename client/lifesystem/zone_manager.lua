Citizen.CreateThread(function()
    for cat, _ in pairs(data) do
        if cat == "garageList" or cat == "vestiaireList" or cat == "armurerieList" then
            for _, v in pairs(data[cat]) do
                if v.Settings.Ped.Activate then
                    LoadModel(v.Settings.Ped.PedName)
                    local ped = CreatePed(5, v.Settings.Ped.PedName, v.Settings.Position, v.Settings.Ped.Heading, false, 1)
                    FreezeEntityPosition(ped, 1)
                    SetBlockingOfNonTemporaryEvents(ped, true)
                end
            end
        end
    end
    for cat, _ in pairs(data) do
        if cat == "vestiaireList" then
            for _, v in pairs(data[cat]) do
                if v.Settings.Blip.Activate then
                    local blip = AddBlipForCoord(vector3(v.Settings.Position[1], v.Settings.Position[2], v.Settings.Position[3]))
                    SetBlipSprite(blip, v.Settings.Blip.BlipId)
                    SetBlipScale(blip, v.Settings.Blip.BlipScale)
                    SetBlipColour(blip, v.Settings.Blip.BlipColor)
                    SetBlipAsShortRange(blip, true)
                    if v.Settings.Blip.Type ~= "" then
                         SetBlipCategory(blip, v.Settings.Blip.Type)
                    end
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString(v.Settings.Blip.BlipName)
                    EndTextCommandSetBlipName(blip)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 2000
        for cat, _ in pairs(data) do
            if cat == "garageList" or cat == "vestiaireList" or cat == "armurerieList" then
                for _, v in pairs(data[cat]) do
                    local pPed = PlayerPedId()
                    local pCoords = GetEntityCoords(pPed, true)
                    local dst = GetDistanceBetweenCoords(pCoords, v.Settings.Position, true)
                    if dst <= v.Settings.ZoneSize then
                        if GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
                            wait = 6
                            LEEDS.Visual.ShowHelpNotification(v.Settings.ZoneMessage)
                            if IsControlJustReleased(0, 38) then
                                if cat == "garageList" then
                                    MenuGarage = v.MenuId
                                    CreateGarageMenu()
                                elseif cat == "vestiaireList" then
                                    MenuVestiaire = v.MenuId
                                    CreateVestiaireMenu()
                                elseif cat == "armurerieList" then
                                    MenuArmurerie = v.MenuId
                                    CreateArmurerieMenu()
                                end
                            end
                        end
                    end
                    if cat == "garageList" then
                        local dstRemover = GetDistanceBetweenCoords(pCoords, v.DeleterPoint.Position, true)
                        if dstRemover <= v.DeleterPoint.ZoneSize then
                            if IsPedSittingInAnyVehicle(pPed) then 
                                wait = 7
                                DrawMarker(1, v.DeleterPoint.Position, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.DeleterPoint.ZoneSize, v.DeleterPoint.ZoneSize, v.DeleterPoint.ZoneSize / 6, 255, 0, 0, 100, false, true, 2, true, false, false, false)
                                LEEDS.Visual.ShowHelpNotification(v.DeleterPoint.ZoneMessage)
                                if IsControlJustReleased(0, 38) then
                                    DeleteEntity(GetVehiclePedIsIn(pPed, 0))
                                end
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    for cat, _ in pairs(data) do
        if cat == "blipList" then
            for _, v in pairs(data[cat]) do
                if v.Activate then
                    local blip = AddBlipForCoord(v.BlipPosition)
                    SetBlipSprite(blip, v.BlipId)
                    SetBlipScale(blip, v.BlipScale)
                    SetBlipColour(blip, v.BlipColor)
                    SetBlipAsShortRange(blip, true)
                    SetBlipDisplay(blip, v.BlipDisplay)
                    if v.BlipType ~= "" then
                         SetBlipCategory(blip, v.BlipType)
                    end
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString(v.BlipName)
                    EndTextCommandSetBlipName(blip)
                end
            end
        end
    end
end)