LEEDS.ServerCallbacks = {}
LEEDS.ClientCallbacks = {}
LEEDS.CurrentRequestId = 0

LEEDS.TriggerCallback = function(name, cb, data, player)
	local e = 'NTH-CallBackClient:'
	local sendEvent = e..'' ..name
	local returnEvent = e..''..name..'_return'
	if not LEEDS.ClientCallbacks[returnEvent] then
		LEEDS.ClientCallbacks[returnEvent] = cb
		RegisterServerEvent(returnEvent)
		AddEventHandler(returnEvent, function(args)
			local cb = LEEDS.ClientCallbacks[returnEvent]
			cb(args)
		end)
	end
	TriggerClientEvent(sendEvent, player, data)
end


LEEDS.RegisterCallback  = function(name, cb)
	if not LEEDS.ServerCallbacks[name] then
		local e = 'NTH-CallBackServer:'..name
		LEEDS.ServerCallbacks[name] = cb
		RegisterServerEvent(e)
		AddEventHandler(e, function(args)
			local src = source
			LEEDS.ServerCallbacks[name](args, src, function(data)
				TriggerClientEvent(e.. '_return', src, data)
			end)
		end)
	end
end