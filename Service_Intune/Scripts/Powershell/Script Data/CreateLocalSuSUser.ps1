$pw=ConvertTo-SecureString -String "ekssus" -AsPlainText -Force
$MyUser=New-LocalUser -Name SuS -Description "Sch�lerinnen und Sch�ler" -AccountNeverExpires -Password $pw -UserMayNotChangePassword -PasswordNeverExpires
#$MyGroup=Get-LocalGroup Admin*
#Add-LocalGroupMember -Group $MyGroup -Member $MyUser