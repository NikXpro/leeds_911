Cuffed = false

RegisterNetEvent('leeds:handcuff')
AddEventHandler('leeds:handcuff', function(playerheading, playercoords, playerlocation)
	local playerPed = PlayerPedId()
    local x, y, z = table.unpack(playercoords + playerlocation * 1.0)
    SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
    SetEntityCoords(playerPed, x, y, z)
	SetEntityHeading(playerPed, playerheading)
    Citizen.Wait(250)
    LEEDS.Play.Play.AdvancedAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0.0, false, false, false)
    Citizen.Wait(3760)
    Cuffed = true
    LEEDS.Play.Play.AdvancedAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

RegisterNetEvent('leeds:uncuff')
AddEventHandler('leeds:uncuff', function(playerheading, playercoords, playerlocation)
	local playerPed = PlayerPedId()
    local x, y, z = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(playerPed, x, y, z)
	SetEntityHeading(playerPed, playerheading)
	Citizen.Wait(250)
    LEEDS.Play.Play.AdvancedAnim(PlayerPedId(), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0.0, false, false, false)
	Citizen.Wait(5500)
	Cuffed = false
	ClearPedTasks(playerPed)
end)


RegisterNetEvent('leeds:doHandcuff')
AddEventHandler('leeds:doHandcuff', function()
	Citizen.Wait(250)
    LEEDS.Play.Play.AdvancedAnim(PlayerPedId(), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0.0, false, false, false)
	Citizen.Wait(3000)
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('leeds:doUncuff')
AddEventHandler('leeds:doUncuff', function()
    Citizen.Wait(250)
	LEEDS.Play.AdvancedAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0.0, false, false, false)
	Citizen.Wait(5500)
	ClearPedTasks(PlayerPedId())
end) 