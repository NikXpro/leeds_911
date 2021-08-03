LEEDS = {}

function LEEDS.RequestAnimSet(animSet, cb)
	if not HasAnimSetLoaded(animSet) then
		RequestAnimSet(animSet)

		while not HasAnimSetLoaded(animSet) do
			Citizen.Wait(4)
		end
	end

	if cb ~= nil then
		cb()
	end
end

function LEEDS.RequestAnimDict(animDict, cb)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(4)
		end
	end

	if cb ~= nil then
		cb()
	end
end