

# Create a Device Specific Security Group
$IntuneGroupName = "Intune Devices"
$IntuneGroupMailName = "IntuneDevices"
$IntuneGroupQuery = "(device.displayName -contains ""Corp-Devices"")"

# Create Dynamic Azure Active Directory Group filtered to Devices and set to Paused
$IntuneDevices = New-AzureADMSGroup `
    -Description "$($IntuneGroupName)" `
    -DisplayName "$($IntuneGroupName)" `
    -MailEnabled $false `
    -SecurityEnabled $true `
    -MailNickname "$($IntuneGroupMailName)" `
    -GroupTypes "DynamicMembership" `
    -MembershipRule "$($IntuneGroupQuery)" `
    -MembershipRuleProcessingState "Paused"
 
# Set the Dynamic Azure Active Directory Group to Sync
Set-AzureADMSGroup -Id $IntuneDevices.Id -MembershipRuleProcessingState "Paused"

class IntuneDevices {
    [string]$IntuneGroupName
    [string]$IntuneGroupMailName
    [string]$IntuneGroupQuery
}