
$filename = "M365_ServicePlans"
# $filetype = ".csv"
 $conf_filesdir = ($PSScriptRoot | split-path ) +'\_conf_files\'
 $tmpdir = $env:LOCALAPPDATA+"\Temp\"  
 $destination = $tmpdir+$filename+".csv"  
 $localfile = $conf_filesdir+$filename+".csv" 

 