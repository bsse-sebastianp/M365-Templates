$Template = @{
     $Group_name = "Windows 10 Devices"
     $Group_type= "Dynamic device"
     $Rule_syntax= "(device.deviceOSVersion -startsWith “10.0.1”) -and (device.DeviceOSType -startsWith “Windows”) -and (device.managementType -eq “MDM”)"
     $Gruppe = $MicrosoftServicePlan.AzureActiveDirectoryPremium_P1  

     