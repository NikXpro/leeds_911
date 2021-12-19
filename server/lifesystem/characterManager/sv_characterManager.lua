NTH = {}
LEEDS.PlayerList = {}
LEEDS.CharList = {}

RegisterNetEvent('leeds:playerJoined')
AddEventHandler('leeds:playerJoined', function()
    local src_ = source
    if LEEDS.PlayerList[src_] == nil then
        LEEDS.PlayerList[src_] = {
            username = GetPlayerName(src_),
            license = (string.gsub(GetPlayerIdentifiers(src_)[1], "license:", ""))
        }
        getUserCreated(src_, false)
    end
end)

RegisterNetEvent('leeds:editCharacter')
AddEventHandler('leeds:editCharacter', function(type, charaterData, charType, areaId)
    local src_ = source
    if type == "create" then
        if LEEDS.PlayerList[src_].permissions.characterAutorized > #LEEDS.PlayerList[src_].charList then
            
            MySQL.Async.execute("INSERT INTO `characters` (user, lastname, firstname, height, sexe, dob, pob, type, nationality, appearance) VALUES (@user, @lastname, @firstname, @height, @sexe, @dob, @pob, @type, @nationality, @appearance)", {
                ["user"] = LEEDS.PlayerList[src_].userId,
                ["lastname"] = charaterData.identity.lastname,
                ["firstname"] = charaterData.identity.firstname,
                ["height"] = charaterData.identity.height,
                ["sexe"] = charaterData.identity.sexe,
                ["dob"] = charaterData.identity.dob,
                ["pob"] = charaterData.identity.pob,
                ["type"] = charaterData.identity.faction,
                ["nationality"] = charaterData.identity.nationality,
                ["appearance"] = json.encode(charaterData.face)
            }, function()
                local id = MySQL.Sync.execute("SELECT id FROM `characters` WHERE user = @user ORDER BY id DESC LIMIT 1", {["user"] = LEEDS.PlayerList[src_].userId})
                MySQL.Sync.execute("INSERT INTO positions (of, type, x, y, z) VALUES (@of, @type, @x, @y, @z)", {
                    ["of"] = id[1].id,
                    ["type"] = "character",
                    ["x"] = Config.spawnPoint[1],
                    ["y"] = Config.spawnPoint[2],
                    ["z"] = Config.spawnPoint[3],
                    ["heading"] = Config.spawnPoint[4]
                })
            end)
            characterSelector(src_, false)  
        end
    elseif type == "select" then
        LEEDS.PlayerList[src_].charId = charaterData
        local characterAppearance = MySQL.Sync.execute("SELECT `characters`.appearance, `characters`.type, positions.x, positions.y, positions.z, positions.heading FROM `characters`, positions WHERE `characters`.user = @user AND `characters`.id = @id AND positions.type = 'character' AND positions.of = @id", {["user"] = LEEDS.PlayerList[src_].userId, ["id"] = LEEDS.PlayerList[src_].charId})
        if LEEDS.CharList[LEEDS.PlayerList[src_].charId] == nil then
            LEEDS.CharList[LEEDS.PlayerList[src_].charId] = src_
        end
        if charType == nil or areaId == nil then
            SetEntityCoords(GetPlayerPed(src_), tonumber(characterAppearance[1].x), tonumber(characterAppearance[1].y), tonumber(characterAppearance[1].z), false, false, false, false)
            SetEntityHeading(GetPlayerPed(src_), characterAppearance[1].heading)
        else
            if Config.departementList[charType][areaId] then
                SetEntityCoords(GetPlayerPed(src_), Config.departementList[charType][areaId].Coords, false, false, false, true)
                SetEntityHeading(GetPlayerPed(src_), Config.departementList[charType][areaId].Heading)
            end
        end

        TriggerClientEvent('leeds:characterSelected', src_, characterAppearance[1].appearance, characterAppearance[1].type)
    elseif type == "delete" then
        if LEEDS.CharList[LEEDS.PlayerList[src_].charId] ~= nil then
            table.remove(LEEDS.CharList, LEEDS.PlayerList[src_].charId)
        end
        MySQL.Sync.execute("UPDATE `characters` SET deleted = @deleted WHERE user = @user AND id = @id", {["deleted"] = 1, ["user"] = LEEDS.PlayerList[src_].userId, ["id"] = charaterData})
        characterSelector(src_, false)
    end
end)


function getUserCreated(source, loop)
    MySQL.Async.execute("SELECT id, username, permissions FROM users WHERE license = @license", {["license"] = LEEDS.PlayerList[source].license}, function(userData)
        if userData[1] then
            LEEDS.PlayerList[source].userId = userData[1].id
            LEEDS.PlayerList[source].permissions = json.decode(userData[1].permissions)
            if not userData[1].username == LEEDS.PlayerList[source].username then
                MySQL.Async.execute("UPDATE users SET username = @username WHERE license = @license", {["username"] = LEEDS.PlayerList[source].username, ["license"] = LEEDS.PlayerList[source].license})
            end
            if not loop then
                print("^2[DB] User ^7"..LEEDS.PlayerList[source].username.."^2 already exists ! Loading data...")
            end

            MySQL.Async.execute("UPDATE users SET lastconnection = NOW() WHERE license = @license", {["license"] = LEEDS.PlayerList[source].license})

            characterSelector(source, true)
        else
            if loop then
                --Notif de bug au joueur
            elseif not loop then
                MySQL.Async.execute("INSERT INTO users (username, license, permissions) VALUES (@username, @license, @permissions)", {["username"] = LEEDS.PlayerList[source].username, ["license"] = LEEDS.PlayerList[source].license, ["permissions"] = '{"characterAutorized":2}'}, function()
                    print("^2[DB] ^1User ^7"..LEEDS.PlayerList[source].username.." ^1registered ! Loading data...^7")
                    getUserCreated(source, true)
                end)
            end

        end
    
    end)
end

function characterSelector(source, first)
    MySQL.Async.execute("SELECT `characters`.id, `characters`.lastname, `characters`.firstname, `characters`.type, `characters`.appearance FROM users INNER JOIN `characters` ON (users.id = `characters`.user) WHERE users.id = @id AND `characters`.deleted = 0", {["id"] = LEEDS.PlayerList[source].userId}, function(characterList)
        LEEDS.PlayerList[source].charList = characterList
        TriggerClientEvent('leeds:sendCharacterList', source, characterList, LEEDS.PlayerList[source].permissions, first)
    end)
end