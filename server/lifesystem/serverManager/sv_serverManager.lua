
function updateData(source)
    local Departement = {}
    local loadDepartement = MySQL.Sync.execute("SELECT departement.id, departement.type, departement.name, departement.texture, positions.x, positions.y, positions.z FROM `departement`, `positions` WHERE positions.type = 'departement' AND departement.id = positions.of AND departement.deleted = 0 LIMIT 0, 300")
    for i = 1, #loadDepartement do
        Departement[i] = loadDepartement[i]
        local loadGarage = MySQL.Sync.execute("SELECT garages.id, garages.type, garages.garageName, positions.x, positions.y, positions.z, positions.heading FROM `garages`,`positions` WHERE garages.of = @garage_of AND garages.type = 'departement' AND positions.type = 'garage' AND garages.id = positions.of", {["garage_of"] = Departement[i].id})
        if loadGarage[1] then
            Departement[i].garage = loadGarage
            for j = 1, #Departement[i].garage do
                local loadSpawnGarage = MySQL.Sync.execute("SELECT positions.x, positions.y, positions.z, positions.heading FROM `positions` WHERE positions.type = 'spawnGarage' AND positions.of = @of", {["of"] = Departement[i].garage[j].id})
                Departement[i].garage[j].spawnList = loadSpawnGarage 
            end
        else
            Departement[i].garage = {}
        end
    end
    TriggerClientEvent("leeds:updateData", source, Departement)
end

LEEDS.RegisterCallback("leeds:requestData", function(t, source, cb)
    local Departement = {}
    local loadDepartement = MySQL.Sync.execute("SELECT departement.id, departement.type, departement.name, departement.texture, positions.x, positions.y, positions.z FROM `departement`, `positions` WHERE positions.type = 'departement' AND departement.id = positions.of AND departement.deleted = 0 LIMIT 0, 300")
    for i = 1, #loadDepartement do
        Departement[i] = loadDepartement[i]
        local loadGarage = MySQL.Sync.execute("SELECT garages.id, garages.type, garages.garageName, positions.x, positions.y, positions.z, positions.heading FROM `garages`,`positions` WHERE garages.of = @garage_of AND garages.type = 'departement' AND positions.type = 'garage' AND garages.id = positions.of", {["garage_of"] = Departement[i].id})
        print(json.encode(loadGarage))
        if loadGarage[1] then
            Departement[i].garage = loadGarage
            for j = 1, #Departement[i].garage do
                local loadSpawnGarage = MySQL.Sync.execute("SELECT positions.x, positions.y, positions.z, positions.heading FROM `positions` WHERE positions.type = 'spawnGarage' AND positions.of = @of", {["of"] = Departement[i].garage[j].id})
                Departement[i].garage[j].spawnList = loadSpawnGarage 
            end
        else
            Departement[i].garage = {}
        end
        
    end
    cb(Departement)
end)


RegisterNetEvent("leeds:manageDepartement")
AddEventHandler("leeds:manageDepartement", function(type, data)
    local src_ = source
    if LEEDS.PlayerList[src_].permissions.serverManager then

        if type == "create" then
            print(data.depFaction)
            MySQL.Async.execute("INSERT INTO `departement` (type, name, texture) VALUES (@type, @name, @texture)", {
                ["type"] = data.depFaction,
                ["name"] = data.depName,
                ["texture"] = data.depTexture,
            }, function()
                local id = MySQL.Sync.execute("SELECT id FROM `departement` WHERE type = @type ORDER BY id DESC LIMIT 1", {["type"] = data.depFaction})
                MySQL.Sync.execute("INSERT INTO positions (of, type, x, y, z) VALUES (@of, @type, @x, @y, @z)", {
                    ["of"] = id[1].id,
                    ["type"] = "departement",
                    ["x"] = data.depCoords[1],
                    ["y"] = data.depCoords[2],
                    ["z"] = data.depCoords[3],
                    ["heading"] = data.depHeading
                })
                MySQL.Sync.execute("INSERT INTO blips (of, type, blipName, blipId, blipType, blipScale, blipColor) VALUES (@of, @type, @blipName, @blipId, @blipType, @blipScale, @blipColor)", {
                    ["of"] = id[1].id,
                    ["type"] = "departement",
                    ["blipName"] = data.depBlipName,
                    ["blipId"] = data.depBlipId,
                    ["blipType"] = "",
                    ["blipScale"] = data.depBlipScale,
                    ["blipColor"] = data.depBlipColor,
                })
                updateData(src_)
            end)
        elseif type == "createGarage" then
            MySQL.Async.execute("INSERT INTO `garages` (of, type, garageName) VALUES (@of, @type, @garageName)", {
                ["of"] = data.depSelected,
                ["type"] = "departement",
                ["garageName"] = data.depGarageName
            }, function()
                local id = MySQL.Sync.execute("SELECT id FROM `garages` WHERE type = 'departement' ORDER BY id DESC LIMIT 1", {})
                MySQL.Sync.execute("INSERT INTO positions (of, type, x, y, z) VALUES (@of, @type, @x, @y, @z)", {
                    ["of"] = id[1].id,
                    ["type"] = "garage",
                    ["x"] = data.depGarageCoords[1],
                    ["y"] = data.depGarageCoords[2],
                    ["z"] = data.depGarageCoords[3],
                    ["heading"] = data.depGarageHeading
                })
                updateData(src_)
            end)
        elseif type == "edit" then
            

        elseif type == "delete" then
            MySQL.Sync.execute("UPDATE `departement` SET deleted = 1 WHERE id = @id", {["id"] = data})
            TriggerEvent("LEEDS-CallBackServer:leeds:requestData", "departement")
            updateData(src_)
        end

    else
        LEEDS.Discord.SendAnticheat(src_, "trigger", {trigger = "leeds:manageDepartement"})
        print("User "..GetPlayerName(src_).." have execute unauthorized request")
    end


end)

