$confirmation = Read-Host "restart wsl?"
if ($confirmation -eq 'y') {
    wsl --shutdown
}

# Stop vcxsrv proccess that contains "1.0" in the program window title
get-process vcxsrv | where { $_.mainwindowtitle -like "*1.0*" } | stop-process
# Start vcxsrv process in a large program window on display number one
start-process "c:\program files\vcxsrv\vcxsrv.exe" -argument ":1 -ac -nowgl -multimonitors -dpms -keyhook"
