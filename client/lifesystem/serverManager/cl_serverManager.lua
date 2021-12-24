LEEDS.Data = {}
local serverManagerIsActive = false
LEEDS.Index.tempsDepartement = {
    ["depName"] = "",
    ["depTexture"] = "",
    ["depFaction"] = "Law Enforcement",
    ["depCoords"] = "",
    ["depHeading"] = "",
    ["depBlipName"] = "",
    ["depBlipId"] = 0,
    ["depBlipScale"] = 0.8,
    ["depBlipColor"] = 0,
    ["depGarageName"] = "",
    ["depGarageCoords"] = "",
    ["depGarageHeading"] = "",
}

LEEDS.Departement = {
    depName = "",
    depTexture = "",
    depFaction = "Law Enforcement",
    depCoords = nil,
    depHeading = nil,
    depBlipName = "",
    depBlipId = nil,
    depBlipScale = nil,
    depBlipColor = nil,
    depGarageName = "",
    depGarageCoords = nil,
    depGarageHeading = nil,
}
function serverManagerMenu()
    LEEDS.Data.Departement = {}

    LEEDS.TriggerCallback("leeds:requestData", function(data)
        LEEDS.Data.Departement = data
        print(json.encode(LEEDS.Data.Departement, {indent=true}))
    end, "departement")
    RMenu.Add('serverManager', 'home', RageUI.CreateMenu("", "~b~Server Manager"))
    RMenu.Add('serverManager', 'departement', RageUI.CreateSubMenu(RMenu:Get('serverManager', 'home'), "", "~b~Département manager"))
    RMenu.Add('serverManager', 'departementCreator', RageUI.CreateSubMenu(RMenu:Get('serverManager', 'departement'), "", "~b~Département Creator"))

    RMenu.Add('serverManager', 'departementSelected', RageUI.CreateSubMenu(RMenu:Get('serverManager', 'departement'), "", "~b~Département: "))
    RMenu.Add('serverManager', 'departementEdit', RageUI.CreateSubMenu(RMenu:Get('serverManager', 'departementSelected'), "", "~b~Département: "))
    RMenu.Add('serverManager', 'departementEditGarage', RageUI.CreateSubMenu(RMenu:Get('serverManager', 'departementEdit'), "", "~b~Département: "))
    RMenu.Add('serverManager', 'departementCreatorGarage', RageUI.CreateSubMenu(RMenu:Get('serverManager', 'departementEditGarage'), "", "~b~Département: "))
    RMenu:Get('serverManager', 'home').Closed = function(close)
        if close then
            serverManagerIsActive = false
        end
    end


    RageUI.Visible(RMenu:Get('serverManager', 'home'), not RageUI.Visible(RMenu:Get('characterManager', 'home')))
    serverManagerIsActive = true
    while serverManagerIsActive do

        if RageUI.Visible(RMenu:Get('serverManager', 'home')) then
            RageUI.IsVisible(RMenu:Get('serverManager', 'home'), function()
                RageUI.Button("Département manager", nil, {RightLabel = LEEDS.Emoticon.Droite}, true, { onSelected = function() end}, RMenu:Get('serverManager', 'departement'))
            end)
        end

        if RMenu:Get('serverManager', 'departement') then
            createDepartementManagerMenu()
        end

        if RMenu:Get('serverManager', 'departementSelected') then
            createDepartementSelectedMenu()
        end

        if RMenu:Get('serverManager', 'departementEdit') then
            createDepartementEditMenu()
        end
        
        if RMenu:Get('serverManager', 'departementEditGarage') then
            createDepartementEditGarageMenu()
        end
        
        if RMenu:Get('serverManager', 'departementCreator') then
            createDepartementCreatorMenu()
        end
        if RMenu:Get('serverManager', 'departementCreatorGarage') then
            createDepartementCreatorGarageMenu()
        end
        Citizen.Wait(0)
    end
end

Keys.Register('F6', 'F6', 'Menu interaction.', function()
    serverManagerMenu()
end)