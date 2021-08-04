local interactionMenu = RageUI.CreateMenu("", "Interaction")
local interactionIsActif, target, dst = false, nil, nil



function interactionPolice()
    RageUI.Button("Menotté", nil, {RightLabel = ""}, true, {
        onSelected = function()
            closestPlayer, closestDistance = LEEDS.Other.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                local heading = GetEntityHeading(PlayerPedId())
                local coords = GetEntityCoords(PlayerPedId())
                local location = GetEntityForwardVector(PlayerPedId())
                local target = GetPlayerServerId(target)
                TriggerServerEvent("leeds:requestCuff", nil, target, heading, coords, location)
            else
                LEEDS.Visual.ShowNotification("Aucun joueur a proximité !")
            end
        end
    });
    RageUI.Button("Démenotté", nil, {RightLabel = ""}, true, {
        onSelected = function()
            closestPlayer, closestDistance = LEEDS.Other.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                local heading = GetEntityHeading(PlayerPedId())
                local coords = GetEntityCoords(PlayerPedId())
                local location = GetEntityForwardVector(PlayerPedId())
                local target = GetPlayerServerId(target)
                TriggerServerEvent("leeds:requestUncuff", nil, target, heading, coords, location)
            else
                LEEDS.Visual.ShowNotification("Aucun joueur a proximité !")
            end
        end
    });
end

role = ""
function CreateInteractionMenu()
    interactionIsActif = true

    interactionMenu.Closed = function()
        interactionIsActif = false
    end

    RageUI.Visible(interactionMenu, not RageUI.Visible(interactionMenu))
    while interactionIsActif do
        Citizen.Wait(6)
        RageUI.IsVisible(interactionMenu, function()
            if LEEDS.PlayerData.Role == "police" then
                interactionPolice()
            elseif LEEDS.PlayerData.Role == "ambulance" then
        
            elseif LEEDS.PlayerData.Role == "civil" then
        
            end
        end)
    end
end


if Config.interactMenu then
    Keys.Register('F6', 'F6', 'Menu interaction.', function()
        closestPlayer, closestDistance = LEEDS.Other.GetClosestPlayer()
        --if closestPlayer ~= -1 and closestDistance <= 3.0 then
            if LEEDS.PlayerData.Role == "police" then
                interactionMenu:SetSpriteBanner("banner", "lspd")
                interactionMenu:SetSubtitle("interaction police")
            elseif LEEDS.PlayerData.Role == "ambulance" then
                interactionMenu:SetSpriteBanner("banner", "lsfd")
                interactionMenu:SetSubtitle("interaction secour")
            elseif LEEDS.PlayerData.Role == "civil" then
                interactionMenu:SetSpriteBanner("banner", "lsfd")
                interactionMenu:SetSubtitle("interaction civil")
            end
            CreateInteractionMenu()
        --else
        --    LEEDS.Visual.ShowNotification("Aucun joueur a proximité !")
        --end
    end)
end
