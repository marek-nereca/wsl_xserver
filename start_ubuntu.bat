Powershell.exe -executionpolicy remotesigned -File reload_vcxsrv.ps1
timeout /t 3
Powershell.exe -executionpolicy remotesigned -File start_gnome_session.ps1