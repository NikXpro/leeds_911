local zoneIsActive = false

function CreateZone()
    local pedId = PlayerPedId()
    local inVehicle = nil
    Citizen.CreateThread(function()
        while zoneIsActive do
            inVehicle = IsPedInAnyVehicle(pedId, true)
            Citizen.Wait(1000)
        end
    end)

    Citizen.CreateThread(function()
        for _, blipData in pairs(data.builder) do
            if blipData.Settings.Blip.Activate then
                
                
                
            end
        end
    end)
end