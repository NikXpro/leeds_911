LEEDS.RegisterCallback("leeds:requestData", function(type, source, cb)
    if type == "departement" then
        local departementList = MySQL.Sync.execute("SELECT departement.id, departement.type, departement.name, departement.texture, positions.x, positions.y, positions.z, blips.blipName, blips.blipId, blips.blipType, blips.blipScale, blips.blipColor FROM `departement`, `positions`, `blips` WHERE positions.type = 'departement' AND departement.id = positions.of AND departement.id = blips.of AND blips.type = 'departement' AND departement.deleted = 0 LIMIT 0, 300")
        cb(departementList)        
    end
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
            end)

        elseif type == "edit" then
            

        elseif type == "delete" then
            MySQL.Sync.execute("UPDATE `departement` SET deleted = 1 WHERE id = @id", {["id"] = data})
            TriggerEvent("LEEDS-CallBackServer:leeds:requestData", "departement")
        end

    else
        LEEDS.Discord.SendAnticheat(src_, "trigger", {trigger = "leeds:manageDepartement"})
        print("User "..GetPlayerName(src_).." have execute unauthorized request")
    end


end)

