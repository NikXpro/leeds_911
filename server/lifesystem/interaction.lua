RegisterNetEvent("leeds:requestCuff")
AddEventHandler("leeds:requestCuff", function(type, targetid, playerheading, playerCoords,  playerlocation)
    local src_ = source
    TriggerClientEvent('leeds:handcuff', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('leeds:doHandcuff', src_)
end)

RegisterNetEvent("leeds:requestUncuff")
AddEventHandler("leeds:requestUncuff", function(type, targetid, playerheading, playerCoords,  playerlocation)
    local src_ = source
    TriggerClientEvent('leeds:uncuff', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('leeds:doUncuff', src_)
end)