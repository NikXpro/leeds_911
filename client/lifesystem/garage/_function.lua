
function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
	local nearbyEntities = {}

	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		local playerPed = ESX.PlayerData.ped
		coords = GetEntityCoords(playerPed)
	end

	for k,entity in pairs(entities) do
		local distance = #(coords - GetEntityCoords(entity))

		if distance <= maxDistance then
			table.insert(nearbyEntities, isPlayerEntities and k or entity)
		end
	end

	return nearbyEntities
end

function IsSpawnPointClear(coords, maxDistance)
    return #EnumerateEntitiesWithinDistance(GetGamePool('CVehicle'), false, coords, maxDistance) == 0
end

function CheckSpawnData(data)
    local found = false
    local essaiMax = #data * 2
    local essai = 0
    local pos = vector3(10.0, 10.10, 10.10)
    local heading = 100.0
    while not found do
        Wait(100)
        local r = math.random(1, #data)
        local _pos = data[r]
        if IsSpawnPointClear(_pos.pos, 2.0) then
            pos = _pos.pos
            heading = _pos.heading
            found = true
        end
        essai = essai + 1
        if essai > essaiMax then
            break
        end
    end
    return found, pos, heading
end

function spawnVeh(model, zone, heading)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do Wait(10) end
    local veh = CreateVehicle(GetHashKey(model), zone, heading, 1, 0)
    for i = 0,14 do
        SetVehicleExtra(veh, i, 0)
    end
    SetVehicleDirtLevel(veh, 0.1)
end