enum file_type {
    'csv',
    'tmp'
}



# $filetype = ".csv"

  


class MicrosoftServicePlans {

    static MicrosoftServicePlans() {

    }

    static [void] Update(){
        $source = "https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/licensing-service-plan-reference"
        $filename = "M365_ServicePlans"
        $tmpdir = $env:LOCALAPPDATA+"\Temp\"  
        $destination = $tmpdir+$filename+".csv" 
        $conf_filesdir = ($PSScriptRoot | split-path ) +'\_conf_files\'
        $localfile = $conf_filesdir+$filename+".csv" 

        $WebFile=[webservices]::Download($destination, $source)


        if([fileservices]::CheckMD5HashValue($localfile,$WebFile)){
            Write-Debug "Alles beim alten......."
         }
         else{
            Write-Debug"Neuen Hash gefunden, kopiere Daten......."
            [MicrosoftServicePlans]::ArchiveOldServicesPlan()
            Copy-Item -Path $destination -Destination $localfile
         }  
    }

    static [void] ArchiveOldServicesPlan($localfile,$conf_filesdir){

        Copy-Item -Path $localfile -Destination ($conf_filesdir+"\Archive\"+(Get-Date).tostring("dd-MM-yyyy-hh-mm-ss_")+$filename+".csv")

    }

}



[MicrosoftServicePlans]::Update()
