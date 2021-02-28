# wsl_xserver
Scripts for enabling gnome desktop in wsl ubuntu.

## Prerequisities
To make it work you need to have default Ubuntu 18.04 or Ubuntu 20.04 in WSL version 2.

```powershell
wsl -l -v
```

VcsSrv needs to be installed in default path e.g. c:\program files\vcxsrv\

To install vcxsrv via https://chocolatey.org
```powershell
choco install vcxsrv
```

## Installation

Run installation script as administrator

```powershell
Start-Process powershell -verb runas -ArgumentList $("-file " + $(Join-Path (Get-Location) "install.ps1")) 
```
Public TCP Firewall rule for 'VcXsrv windows xserver' needs to be disabled manually.

Start xserver with shortcut Ubuntu.lnk created on your desktop.
Disable lock screen in terminal opened from gnome-session execute 

```bash
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
```