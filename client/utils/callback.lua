LEEDS.ServerCallbacks = {}
LEEDS.ClientCallbacks = {}

LEEDS.TriggerCallback = function(name, cb, data)
	local e = 'LEEDS-CallBackServer:'
	local sendEvent = e..'' ..name
	local returnEvent = e..''..name..'_return'
	if not LEEDS.ServerCallbacks[returnEvent] then
		LEEDS.ServerCallbacks[returnEvent] = cb
		RegisterNetEvent(returnEvent)
		AddEventHandler(returnEvent, function(args)
			local cb = LEEDS.ServerCallbacks[returnEvent]
			cb(args)
		end)
	end
	TriggerServerEvent(sendEvent, data)
end


LEEDS.RegisterCallback  = function(name, cb)
	if not LEEDS.ClientCallbacks[name] then
		local e = 'LEEDS-CallBackClient:'..name
		LEEDS.ClientCallbacks[name] = cb
		RegisterNetEvent(e)
		AddEventHandler(e, function(args)
			LEEDS.ClientCallbacks[name](args, function(data)
				TriggerServerEvent(e.. '_return', data)
			end)
		end)
	end
end