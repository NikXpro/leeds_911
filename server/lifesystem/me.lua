RegisterNetEvent('leeds:meSyncS')
AddEventHandler('leeds:meSyncS', function(type, text)
    local src_ = source
    if type == "me" then
        TriggerClientEvent("chatMessage", -1, "^6["..GetPlayerName(src_).."] [me]", {255, 255, 255}, text)
        TriggerClientEvent('leeds:meSyncC', -1, "* "..text.." *", src_)
    elseif type == "do" then
        TriggerClientEvent("chatMessage", -1, "^3["..GetPlayerName(src_).."] [do]", {255, 255, 255}, text)
        TriggerClientEvent('leeds:meSyncC', -1, text, src_)
    elseif type == "911" then
        TriggerClientEvent("chatMessage", -1, "^2[911]", {255, 255, 255}, text)
    end
    
end)