$LastPass = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LastPass.lnk"

if(Test-Path -Path $LastPass -PathType Leaf){
  Remove-Item $LastPass
}
