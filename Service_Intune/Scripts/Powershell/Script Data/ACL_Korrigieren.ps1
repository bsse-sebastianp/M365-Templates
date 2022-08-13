# Ordner erstellen
$LogFolder=New-Item "c:\Install\BSSE GmbH\RemovePermissions" -ItemType Directory

# Berechtigungen in c:\ entfernen

$myPath="c:\"
$acl=Get-Acl $myPath

# Alte Berechtigung dokumentieren
$myPath > ($LogFolder.fullname + "\" + "ACL.log")
$acl.Access >> ($LogFolder.fullname + "\" + "ACL.log")

# Berechtigungen entfernen

$ace=$acl.Access|Where-Object{$_.IdentityReference -eq "NT-AUTORITÄT\Authentifizierte Benutzer"}
foreach ($myAce in $ace) {
    $acl.RemoveAccessRule($myAce)
}
Set-Acl -Path $myPath -AclObject $Acl

# Verzeichnisse in c:\ einlesen

$myDirs=(get-item c:\).GetDirectories()

# Direkte Berechtigungen in allen Verzeichnissen unter c:\ entfernen

foreach ($myDir in $myDirs) {
    $acl=Get-Acl $myDir.FullName

    # Dokumentieren
    $myDir >> ($LogFolder.fullname + "\" + "ACL.log")
    $acl.Access >> ($LogFolder.fullname + "\" + "ACL.log")
    
    # Rechte entfernen

    $ace=$acl.Access|Where-Object{$_.IdentityReference -eq "NT-AUTORITÄT\Authentifizierte Benutzer" -and (-not $_.isInherited) -and ($_.AccessControlType -eq 'allow')}
    foreach ($myAce in $ace) {
        $acl.RemoveAccessRule($myAce)
    }
    Set-Acl -Path $myDir -AclObject $Acl
}


# Berechtigungen für INTERAKTIV in Public entfernen

$acl=Get-Acl $env:PUBLIC

    $env:PUBLIC >> ($LogFolder.fullname + "\" + "ACL.log")
    $acl.Access >> ($LogFolder.fullname + "\" + "ACL.log")

$ace=$acl.Access|Where-Object{$_.IdentityReference -eq "NT-AUTORITÄT\INTERAKTIV" -and (-not $_.isInherited) -and ($_.AccessControlType -eq 'allow')}
foreach ($myAce in $ace) {
    $acl.RemoveAccessRule($myAce)
}
Set-Acl -Path $env:PUBLIC -AclObject $Acl

