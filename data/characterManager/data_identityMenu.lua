data_identityMenu = {
    {Title = "Nom de famille", SubTitle = "Nom de votre personnage", RightLabel = "~c~Oconor", Type = "button", Coords = "lastname", Format = "string"},
    {Title = "Prénom", SubTitle = "Prénom de votre personnage", RightLabel = "~c~James", Type = "button", Coords = "firstname", Format = "string"},
    {Title = "Taille", SubTitle = "Taille de votre personnage en cm", RightLabel = "~c~187", Type = "button",Coords = "height", Format = "size"},
    {Title = "Sexe", SubTitle = "Sexe de votre personnage", Type = "list", Data = {"Homme", "Femme", "Autre"}, Index = 1, Coords = "sexe"},
    {Title = "Nationalité", SubTitle = "Nationalité de votre personnage", RightLabel = "~c~Américaine", Type = "submenu", Coords = "nationality", Format = "string"},
    {Title = "Lieux de naissance", SubTitle = "Lieux de naissance de votre personnage", RightLabel = "~c~Los santos", Type = "button", Coords = "pob", Format = "string"},
    {Title = "Date de naissance", SubTitle = "Date de naissance de votre personnage", RightLabel = "~c~25/06/2003", Type = "button", Coords = "dob", Format = "date"},
}