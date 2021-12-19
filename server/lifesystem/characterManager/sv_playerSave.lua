Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000 * 5)
        for i = 1, #LEEDS.CharList do
            saveCharacterCoords(i)
        end
    end
end)

function saveCharacterCoords(charId)
    local pedId = GetPlayerPed(LEEDS.CharList[charId])
    local pedCoords = GetEntityCoords(pedId)
    local pedHeading = GetEntityHeading(pedId)
    local posX, posY, posZ = table.unpack(pedCoords)
    MySQL.Sync.execute("UPDATE positions SET x = @x, u = @y, z = @z, heading = @heading WHERE type = `characters` AND of = @of", {
        ["x"] = posX,
        ["y"] = posY,
        ["z"] = posZ,
        ["heading"] = pedHeading,
        ["of"] = charId
    })
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    for i = 1, #LEEDS.CharList do
        saveCharacterCoords(i)
    end
    print("Resource "..GetCurrentResourceName().. "Stoped ! All player have saved !")
end)

AddEventHandler('playerDropped', function (reason)
    local src_ = source
    print("Player "..GetPlayerName(src_).." disconected from this server !")
end)