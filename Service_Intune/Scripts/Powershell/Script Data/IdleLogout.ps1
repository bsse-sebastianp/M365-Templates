# Create Task to logout user after 2 hours idle time

$Sta = New-ScheduledTaskAction -Execute "shutdown.exe" -Argument "-L"
$Stset = New-ScheduledTaskSettingsSet -RunOnlyIfIdle -IdleDuration 02:00:00 -IdleWaitTimeout 00:02:00 `        -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
$trigger = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask -Action $Sta -TaskName IdleLogout -Description "Meldet Benutzer nach 2 Stunden Inaktivität ab" `
        -User System -Trigger $trigger -Settings $Stset