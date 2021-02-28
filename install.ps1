# CREATE MAIN DIRECTORY
$dirName = ".ubuntu"
$dir = Join-Path $HOME $dirName
if(!(Test-Path -Path $dir)){
    new-item -Name $dirName -Path $HOME -ItemType Directory
}

# FIREWALL
$confirmation = Read-Host "Add firewall rules? y/n"
if ($confirmation -eq 'y') {
    # disable default blocking rule
    # Disable-NetFirewallRule -DisplayName "VcXsrv windows xserver" -Action Block 
    echo "Public TCP Firewall rule for 'VcXsrv windows xserver' needs to be disabled manually"

    # allow xserver port in firewall
    New-NetFirewallRule -DisplayName "vcxsrv-wsl" -Direction Inbound -Protocol TCP -LocalPort 6000-6005 -Action Allow -RemoteAddress "172.16.0.0/12" -Program "C:\program files\vcxsrv\vcxsrv.exe"
}

# COPY SCRIPTS TO USER HOME
$scriptDirectory = Split-Path $MyInvocation.MyCommand.Path
Set-Location $scriptDirectory

copy-item .\reload_vcxsrv.ps1 $dir
copy-item .\start_gnome_session.sh $dir
copy-item .\start_gnome_session.ps1 $dir
copy-item .\start_ubuntu.bat $dir
copy-item .\install.sh $dir

# INSTALL IN WSL
wsl /bin/bash /mnt/c/Users/$env:username/.ubuntu/install.sh

# CREATE SHORTCUT SCRIPT
# define location variables
$shortcut_location = "$env:userprofile\Desktop\Ubuntu.lnk"
$program_location = "cmd.exe"
$icon_location = "$dir\ubuntu.ico"

# create shortcut
$object = new-object -comobject wscript.shell
$shortcut = $object.createshortcut($shortcut_location)
$shortcut.targetpath = $program_location
$shortcut.iconlocation = $icon_location
$shortcut.arguments = " /C ""$dir\start_ubuntu.bat"""
$shortcut.workingdirectory = $dir
$shortcut.save()