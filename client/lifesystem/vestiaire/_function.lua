local function convertInput(input)
    local cloth_prop = tonumber(LEEDS.String.Split(input, ":")[1])-1
    local cloth_text = tonumber(LEEDS.String.Split(input, ":")[2])-1
    return ({cloth_prop, cloth_text})
end

function SetTenue(outfit)
    local ped = PlayerPedId()
    local pedHash = GetEntityModel(ped)
    local pedModels = {
        [1885233650] = "mp_m_freemode_01",
        [-1667301416] =  "mp_f_freemode_01"
    }
    
    local components = {{outfit[pedModels[pedHash]].Mask, 1},{outfit[pedModels[pedHash]].UpperSkin, 3},{outfit[pedModels[pedHash]].Pants, 4},{outfit[pedModels[pedHash]].Parachute, 5},{outfit[pedModels[pedHash]].Shoes, 6},{outfit[pedModels[pedHash]].Accessories, 7},{outfit[pedModels[pedHash]].UnderCoat, 8},{outfit[pedModels[pedHash]].Armor, 9},{outfit[pedModels[pedHash]].Decal, 10},{outfit[pedModels[pedHash]].Top, 11}}
    local props = {{outfit[pedModels[pedHash]].Hat, 0},{outfit[pedModels[pedHash]].Glasses, 1},{outfit[pedModels[pedHash]].Watch, 6}}

    for i in ipairs(components) do
		if components[i][1] then
			SetPedComponentVariation(ped, components[i][2], convertInput(components[i][1])[1], convertInput(components[i][1])[2], 0)
		end
	end

	for i in ipairs(props) do
		if props[i][1] then
			if convertInput(props[i][1])[1] == -1 then
				ClearPedProp(ped, props[i][2])
			else
				SetPedPropIndex(ped, props[i][2], convertInput(props[i][1])[1], convertInput(props[i][1])[2], true)
			end
		end
	end
end
