class fileservices{
     static [bool] CheckMD5HashValue($LocalFile, $WebFile){
     
      
       $MD5_LocalFile=(Get-FileHash $LocalFile -Algorithm MD5).Hash
       $MD5_WebFile=(Get-FileHash $WebFile -Algorithm MD5).Hash

       Write-Host "------------Compare--------------------------"
       Write-Host "Local-MD5: " $MD5_LocalFile
       Write-Host "Remote-MD5:" $MD5_WebFile
       Write-Host "---------------------------------------------"

       if($MD5_LocalFile -eq $MD5_WebFile){    
           Write-Host "MD5-Hash identisch"   
            return $true;
       }
      else{
         Write-Host "MD5-Hash Unterschiedlich"
         return $false;
     }
    }
}