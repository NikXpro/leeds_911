RegisterNetEvent('leeds:meSyncS')
AddEventHandler('leeds:meSyncS', function(text)
    local src_ = source
    TriggerClientEvent('leeds:meSyncC', -1, text, src_)
end)