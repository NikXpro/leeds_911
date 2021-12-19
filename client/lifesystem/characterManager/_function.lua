

function UpdateEntityFace(Ped, Table)

    if (Ped ~= nil) then
        Ped = Ped
    else
        Ped = GetPlayerPed(-1)
    end
    if (type(Table) == "table") then
        Table = Table
    else
        print("`Table` is not table")
    end

    if (Table ~= nil) then
        SetPedHeadBlendData(Ped, Table.parent.mom, Table.parent.dad, nil, Table.parent.mom, Table.parent.dad, nil, Table.parent.resemblance / 10, Table.parent.skinMix / 10, nil, true)
        SetPedComponentVariation(Ped, 2, Table.apparence.hair.style, 0, 0)
        SetPedHairColor(Ped, Table.apparence.hair.ColorPrimary -1, Table.apparence.hair.ColorSecondary -1)
--
        SetPedHeadOverlay(Ped, 1, Table.apparence.beard.style, Table.apparence.beard.opacity)
        SetPedHeadOverlayColor(Ped, 1, 1, Table.apparence.beard.ColorPrimary -1, Table.apparence.beard.ColorSecondary -1)
--
--
        SetPedHeadOverlay(Ped, 2, Table.apparence.eyebrows.style, Table.apparence.eyebrows.opacity)
        SetPedHeadOverlayColor(Ped, 2, 1, Table.apparence.eyebrows.ColorPrimary -1, Table.apparence.eyebrows.ColorSecondary -1)
--
--
        SetPedHeadOverlay(Ped, 3, Table.apparence.ageing.style, Table.apparence.ageing.opacity)
--
--
        SetPedHeadOverlay(Ped, 8, Table.apparence.lipstick.style, Table.apparence.lipstick.opacity)
        SetPedHeadOverlayColor(Ped, 8, 1, Table.apparence.lipstick.ColorPrimary - 1, Table.apparence.lipstick.ColorPrimary - 1)
--
--
        SetPedHeadOverlay(Ped, 4, Table.apparence.eyemackeup.style, Table.apparence.eyemackeup.opacity)
        SetPedHeadOverlayColor(Ped, 4, 1, Table.apparence.eyemackeup.ColorPrimary - 1, Table.apparence.eyemackeup.ColorPrimary - 1)
--
--
        SetPedEyeColor(Ped, Table.apparence.eye.style)
        SetPedHeadOverlay(Ped, 0, Table.apparence.blemishes.style, Table.apparence.blemishes.opacity)
--
--
        SetPedHeadOverlay(Ped, 6, Table.apparence.complexion.style, Table.apparence.complexion.opacity)
        SetPedHeadOverlay(Ped, 7, Table.apparence.sundamage.style, Table.apparence.sundamage.opacity)
        SetPedHeadOverlay(Ped, 9, Table.apparence.freckles.style, Table.apparence.freckles.opacity)
--
--
        --SetPedHeadOverlay(Ped, 10, Table.chestHair.style, Table.chestHair.opacity)
        --SetPedHeadOverlayColor(Ped, 10, 1, Table.chestHair.color[1], Table.chestHair.color[2])
--
--
        SetPedFaceFeature(Ped, 0, Table.features.nose.width)
        SetPedFaceFeature(Ped, 1, Table.features.nose.peakHeight)
        SetPedFaceFeature(Ped, 2, Table.features.nose.peakLength)
        SetPedFaceFeature(Ped, 3, Table.features.nose.boneHeight)
        SetPedFaceFeature(Ped, 4, Table.features.nose.peakLowering)
        SetPedFaceFeature(Ped, 5, Table.features.nose.boneTwist)
        SetPedFaceFeature(Ped, 6, Table.features.eyebrow.height)
        SetPedFaceFeature(Ped, 7, Table.features.eyebrow.forward)
        SetPedFaceFeature(Ped, 8, Table.features.cheeks.boneHeight)
        SetPedFaceFeature(Ped, 9, Table.features.cheeks.boneWidth)
        SetPedFaceFeature(Ped, 10, Table.features.cheeks.width)
        SetPedFaceFeature(Ped, 11, Table.features.eye.opening)
        SetPedFaceFeature(Ped, 12, Table.features.lips.thickness)
        SetPedFaceFeature(Ped, 13, Table.features.jaw.boneWidth)
        SetPedFaceFeature(Ped, 14, Table.features.jaw.boneBackLength)
        SetPedFaceFeature(Ped, 15, Table.features.chimp.boneLowering)
        SetPedFaceFeature(Ped, 16, Table.features.chimp.boneLength)
        SetPedFaceFeature(Ped, 17, Table.features.chimp.boneWidth)
        SetPedFaceFeature(Ped, 18, Table.features.chimp.hole)
        --SetPedFaceFeature(Ped, 19, Table.features.neck.thickness)

        return true;
    end
end

function UpdateFreemodeCharacter(model, face, outfit, tattoo)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(500)
    end
    SetPlayerModel(PlayerId(), model)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetEntityAsMissionEntity(PlayerPedId(), true, true)
    SetModelAsNoLongerNeeded(PlayerPedId())
end

function LoadCharacter(Model, Table)
        UpdateFreemodeCharacter(Model, nil, nil, nil)
        UpdateEntityFace(PlayerPedId(), Table)
end