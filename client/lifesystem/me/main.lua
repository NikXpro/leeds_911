local type = "command"

local tags = {}
local plyNetId = GetPlayerServerId(PlayerId())
RegisterNetEvent('leeds:meSyncC')
AddEventHandler('leeds:meSyncC', function(text, serverId)
    local tgtPly = GetPlayerFromServerId(serverId)
	if tgtPly ~= 0 or plyNetId == serverId then
		if tags[serverId] then
			RemoveMpGamerTag(tags[serverId])
			Wait(50)
		end
		tags[serverId] = CreateFakeMpGamerTag(GetPlayerPed(tgtPly), text, false, false, "", false)
		Wait(5500)
		RemoveMpGamerTag(tags[serverId])
	end
end)

if type == "command" then
	RegisterCommand("me", function(source, args, rawcommand)
		TriggerServerEvent('leeds:meSyncS', "me", "La personne " .. table.concat(args, " "))
    end, false)
	RegisterCommand("do", function(source, args, rawcommand)
		TriggerServerEvent('leeds:meSyncS', "do", table.concat(args, " "))
    end, false)
	RegisterCommand("911", function(source, args, rawcommand)
		TriggerServerEvent('leeds:meSyncS', "911", table.concat(args, " "))
    end, false)
elseif type == "key" then
	LEEDS.Keys.Register('T', 'T', 'Fait un /me', false, function()
		Wait(250)
		local text = KeyboardInput("Texte de votre ~g~/me", "", 50)
		TriggerServerEvent('leeds:meSyncS', "* La personne " .. text .. " *")
	end)
end
