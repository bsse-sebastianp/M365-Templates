New-Itemproperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters -Name AllowInsecureGuestAuth -Value "1" -Type DWord 
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters -Name AllowInsecureGuestAuth -Value "1"
