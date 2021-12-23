data_departementCreatorMenu = {
    {Title = "Nom du département", SubTitle = "Nom du département", RightLabel = "~c~MRPD", Type = "button", Coords = "depName", Format = "string"},
    {Title = "Nom texture", SubTitle = "Nom de votre personnage", RightLabel = "~c~mrpd_texture", Type = "button", Coords = "depTexture", Format = "string"},
    {Title = "Faction", SubTitle = "Faction de votre personnage", Type = "list", Data = {"Law Enforcement", "Fire & Rescue", "Civilian"}, Index = 1, Coords = "depFaction"},
    {Title = "Coordonnées", SubTitle = "Nom du département", RightLabel = "~c~undefined", Type = "button", Coords = {"depCoords", "depHeading"}, Format = "coords"},
    {Title = "Nom du blip", SubTitle = "Nom du blip", RightLabel = "~c~MRPD", Type = "button", Coords = "depBlipName", Format = "string"},
    {Title = "Id du blip", SubTitle = "Id du blip", RightLabel = "~c~1", Type = "button", Coords = "depBlipId", Format = "number"},
    --{Title = "Type du blip", SubTitle = "Type du blip", RightLabel = "~c~", Type = "button", Coords = "depBlipId", Format = "number"},
    {Title = "Taille du blip", SubTitle = "Taille du blip", RightLabel = "~c~0.8", Type = "button", Coords = "depBlipScale", Format = "number"},
    {Title = "Couleur du blip", SubTitle = "Couleur du blip", RightLabel = "~c~1", Type = "button", Coords = "depBlipColor", Format = "number"},
}