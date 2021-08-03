LEEDS.PlayerList = {}

RegisterNetEvent('leeds:playerJoined')
AddEventHandler('leeds:playerJoined', function()
    local src_ = source
    if LEEDS.PlayerList[src_] == nil then
        LEEDS.PlayerList[src_] = {}
        LEEDS.PlayerList[src_].serverId = src_
        LEEDS.PlayerList[src_].userName = GetPlayerName(src_)
        LEEDS.PlayerList[src_].license = (string.gsub(GetPlayerIdentifiers(src_)[1], "license:", ""))
    end
    playerJoined(src_)
end)

function playerJoined(src_)
    print("^2[CONNECT] ^5"..LEEDS.PlayerList[src_].userName.." ^2 vient de rejoindre le serveur !^7")
    TriggerClientEvent('leeds:playerSpawned', src_)
end