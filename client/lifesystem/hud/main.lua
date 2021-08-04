local speed = nil

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            wait = 5
            if Config.speedometer == "MPH" then
                speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(playerPed, false)) * 2.2369) .. " MPH"
            else
                speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(playerPed, false)) * 3.6) .. " KMH"
            end
            LEEDS.Visual.DrawText(0.16, 0.950, speed, 1, 0.65, 0.65)
        end
        Citizen.Wait(wait)
    end
end)