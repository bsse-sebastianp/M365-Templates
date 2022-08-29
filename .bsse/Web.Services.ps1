class webservices{
    static [string] Download($destination,$source){

        if(Test-Path($destination| split-path)){
            Invoke-WebRequest -Uri $source -OutFile $destination
            Write-Host  "Neues Hash......., jetzt bin ich stoned" 
            return $destination  
        }
        else{
            throw "Path not Found Exception"
            return $null
        }
    }
}