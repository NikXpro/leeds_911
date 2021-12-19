LEEDS.Entity = {};
local Entity = LEEDS.Entity;

function Entity.LoadModel(model)
    while not HasModelLoaded(model) do
         RequestModel(model)
         Wait(100)
    end
    return GetHashKey(model)
end

function Entity.SpawnObject(objectName, coords, cb, networked)
	Citizen.CreateThread(function()
        local model = LEEDS.Entity.LoadModel(objectName)
		local param = type(networked) == "boolean" and type(coords) == "vector3" and type(model) == "number";
		if param then
			local object = CreateObject(model, coords, networked, false, true)
			print(object)
			if cb then
				return cb(object)
			end
		else
			print("^8[ERROR]^3[FUNCTION] ^1parameter error ^7\"^5Entity.SpawnObject^7\"") 
		end
	end)	
end