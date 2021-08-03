LEEDS.Emoticon = {
    Droite = "→",
    Cadena = "🔒",
    Plus = "➕",
    Poubelle = "🗑️",
    Check = "✅",
    Check2 = "✔️"
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if NetworkIsPlayerActive(PlayerId()) then
            TriggerServerEvent('leeds:playerJoined')
            break
        end
    end
end)