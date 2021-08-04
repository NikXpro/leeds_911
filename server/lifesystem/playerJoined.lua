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

RegisterNetEvent('leeds:characterSelected')
AddEventHandler('leeds:characterSelected', function(catId, areaId)
    local src_ = source
    if Config.groupList[catId].AreaList[areaId] then
        LEEDS.PlayerList[src_].Role = Config.groupList[catId].Role
        SetEntityCoords(GetPlayerPed(src_), Config.groupList[catId].AreaList[areaId].Coords, false, false, false, true)
        print('^2[SELECT] ^5'..LEEDS.PlayerList[src_].userName..'^2 vient de rejoindre ^5"'.. LEEDS.PlayerList[src_].Role ..'"^7')
        TriggerClientEvent('leeds:characterSelect', src_)
    end
end)

function playerJoined(src_)
    print("^2[CONNECT] ^5"..LEEDS.PlayerList[src_].userName.." ^2 vient de rejoindre le serveur !^7")
    TriggerClientEvent('leeds:playerSpawned', src_)
end