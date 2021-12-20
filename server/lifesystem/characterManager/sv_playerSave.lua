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
    MySQL.Sync.execute("UPDATE positions SET x = @x, y = @y, z = @z, heading = @heading WHERE type = 'character' AND of = @of", {
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
    print("Resource "..GetCurrentResourceName().. " Stoped ! All player have saved !")
end)

AddEventHandler('playerDropped', function (reason)
    local src_ = source
    saveCharacterCoords(LEEDS.PlayerList[src_].charId)
    print("Player "..GetPlayerName(src_).." disconected from this server !")
end)


AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
	if eventData.secondsRemaining == 60 then
		for i = 1, #LEEDS.CharList do
            saveCharacterCoords(i)
        end
        print("Resource "..GetCurrentResourceName().. "Stoped ! All player have saved !")
	end
end)