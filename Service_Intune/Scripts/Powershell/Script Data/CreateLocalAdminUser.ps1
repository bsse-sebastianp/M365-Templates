$pw=ConvertTo-SecureString -String "L3hr3r!nSchul3" -AsPlainText -Force
$MyUser=New-LocalUser -Name Admin -Description "Lokaler Administrator" -AccountNeverExpires -Password $pw -UserMayNotChangePassword -PasswordNeverExpires
$MyGroup=Get-LocalGroup Admin*
Add-LocalGroupMember -Group $MyGroup -Member $MyUser