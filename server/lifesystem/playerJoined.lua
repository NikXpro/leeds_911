LEEDS.PlayerList = {}

RegisterNetEvent('leeds:playerJoined')
AddEventHandler('leeds:playerJoined', function()
    local src_ = source
    if LEEDS.PlayerList[src_] == nil then
        LEEDS.PlayerList[src_] = {
            userName = GetPlayerName(src_),
            license = (string.gsub(GetPlayerIdentifiers(src_)[1], "license:", ""))
        }
    end
    getUserCreated(src_, false)
end)


function getUserCreated(source, loop)
    MySQL.Async.execute("SELECT id, username, permission FROM users WHERE license = @license", {
        ["license"] = LEEDS.PlayerList[source].license
    }, function(userData)
        if userData[1] then
            LEEDS.PlayerList[source].userId = userData[1].id
            LEEDS.PlayerList[source].permission = json.decode(userData[1].permissions)
            if not userData[1].username == LEEDS.PlayerList[source].userName then
                MySQL.Sync.execute("UPDATE users SET username = @username WHERE license = @license", {["username"] = LEEDS.PlayerList[source].userName, ["license"] = NTH.PlayerList[source].license})
            end
            if not loop then
                print("^2[DB] User ^7"..NTH.PlayerList[source].username.."^2 already exists ! Loading data...")
            end
            MySQL.Sync.execute("UPDATE users SET lastconnection = NOW() WHERE license = @license", {["license"] = LEEDS.PlayerList[source].license})
        else
            if loop then
                --Bug la personne doit deco reco si le probléme persiste elle doit contacter un administrateur
            else
                MySQL.Async.execute("INSERT INTO users (username, license, permissions) VALUES (@username, @license, @permissions)", {
                    ["username"] = LEEDS.PlayerList[source].userName,
                    ["license"] = LEEDS.PlayerList[source].license,
                    ["permissions"] = Config.DefaultPermissions
                }, function()
                    print("^2[DB] ^1User ^7"..LEEDS.PlayerList[source].userName.." ^1registered ! Loading data...^7")
                    getUserCreated(source, true)
                end)
            end
        end
    
    
    end)

end

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
    MySQL
    print("^2[CONNECT] ^5"..LEEDS.PlayerList[src_].userName.." ^2 vient de rejoindre le serveur !^7")
    TriggerClientEvent('leeds:playerSpawned', src_)
end