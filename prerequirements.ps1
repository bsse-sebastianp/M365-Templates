if (Get-Module -ListAvailable -Name AzureADPreview) {
    Write-Host "AzureADPreview Module Already Installed" -ForegroundColor Green
} 
else {
    Write-Host "AzureADPreview Module Not Installed. Installing........." -ForegroundColor Red
        Install-Module -Name AzureADPreview -AllowClobber -Force
    Write-Host "AzureADPreview Module Installed" -ForegroundColor Green
}
Import-Module AzureADPreview

