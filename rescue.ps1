# Benutzername und Passwort definieren
$username = "rescue"
$password = "Geheim1234"

# Passwort in ein sicheres Format konvertieren
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Neuen lokalen Benutzer erstellen
New-LocalUser -Name $username -Password $securePassword -FullName "Rescue Account" -Description "Lokaler Administrator für Notfälle"

# Benutzer zur Gruppe der Administratoren hinzufügen
Add-LocalGroupMember -Group "Administratoren" -Member $username