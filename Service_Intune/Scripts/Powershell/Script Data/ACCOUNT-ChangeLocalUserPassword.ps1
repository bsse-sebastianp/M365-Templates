$user = 'Admin'
$pw =ConvertTo-SecureString -String "L3hr3r!nSchul3" -AsPlainText -Force
echo $user
$op = Get-LocalUSer | where-Object Name -eq $user | Measure
if ($op.Count -eq 1) {
     Set-LocalUser -Name $user -Password $pw #Only LocalUser
     #Set-ADAccountPassword -Identity $user -Reset -NewPassword $pw Only for DomainUser
     echo "User-Password changed"
} else {
     echo "User not found"
}



