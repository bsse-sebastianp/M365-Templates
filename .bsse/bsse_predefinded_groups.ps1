 #Enumeration
 enum AzureGroupType
 {
    Dynamic_device
    Dynamic_user
    DynamicMembership
 }

 #Hash-Table
 $MicrosoftServicePlans = @{
     AZUREACTIVEDIRECTORYPREMIUMP1 = '41781fb2-bc02-4b7c-bd55-b576c07bb09d'
     AZUREACTIVEDIRECTORYPREMIUMP2 = 'eec0eb4f-6444-4f95-aba0-50c24d67f998'
 }


 class AzureAD_Group {
     [string]$Group_name
     [AzureGroupType]$Group_type
     [string]$Rule_syntax
}

function CreateObject{
     $Group1 = [AzureAD_Group]::new()
     $Group1.Group_type = [AzureGroupType]::DynamicMembership
     $Group1.Group_name = ""
     $Group1.Rule_syntax = ""
     
     
     
     Write-Host $MicrosoftServicePlans.AZUREACTIVEDIRECTORYPREMIUMP1
}

CreateObject
