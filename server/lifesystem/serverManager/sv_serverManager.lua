LEEDS.RegisterCallback("leeds:requestData", function(type, source, cb)
    if type == "departement" then
        local departementList = MySQL.Sync.execute("SELECT departement.id, departement.type, departement.name, departement.texture, positions.x, positions.y, positions.z, blips.blipName, blips.blipId, blips.blipType, blips.blipScale, blips.blipColor FROM `departement`, `positions`, `blips` WHERE positions.type = 'departement' AND departement.id = positions.of AND departement.id = blips.id AND blips.type = 'departement' AND departement.deleted = 0 LIMIT 0, 300")
        cb(departementList)        
    end
end)

RegisterNetEvent("leeds:manageDepartement")
AddEventHandler("leeds:manageDepartement", function(type, data)
    local src_ = source
    if LEEDS.PlayerList[src_].permissions.serverManager then

        if type == "create" then
            MySQL.Async.execute("INSERT INTO `departement` (type, name, texture) VALUES (@type, @name, @texture)", {
                ["type"] = data.type,
                ["name"] = data.name,
                ["texture"] = data.texture,
            }, function()
                local id = MySQL.Sync.execute("SELECT id FROM `departement` WHERE type = @type ORDER BY id DESC LIMIT 1", {["type"] = data.type})
                MySQL.Sync.execute("INSERT INTO positions (of, type, x, y, z) VALUES (@of, @type, @x, @y, @z)", {
                    ["of"] = id[1].id,
                    ["type"] = "character",
                    ["x"] = Config.spawnPoint[1],
                    ["y"] = Config.spawnPoint[2],
                    ["z"] = Config.spawnPoint[3],
                    ["heading"] = Config.spawnPoint[4]
                })
            end)

        elseif type == "edit" then
            

        elseif type == "delete" then
            MySQL.Sync.execute("UPDATE `departement` SET deleted = 1 WHERE id = @id", {["id"] = data})
            TriggerEvent("LEEDS-CallBackServer:leeds:requestData", "departement")
        end

    else
        print("User "..GetPlayerName(src_).." have execute unauthorized request")
    end


end)

