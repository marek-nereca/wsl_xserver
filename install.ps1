# create main directory
$dirName = ".ubuntu"
$dir = Join-Path $HOME $dirName
if(!(Test-Path -Path $dir)){
    new-item -Name $dirName -Path $HOME -ItemType Directory
}

copy-item .\reload_vcxsrv.ps1 $dir
copy-item .\start_gnome_session.sh $dir
copy-item .\start_gnome_session.ps1 $dir
copy-item .\start_ubuntu.bat $dir
copy-item .\install.sh $dir

# CREATE SHORTCUT SCRIPT

# Define location variables
# $shortcut_location = "$env:userprofile\Desktop\Ubuntu.lnk"
$shortcut_location = "$dir\Ubuntu.lnk"
# $program_location = "cmd.exe /C ""$dir\start_ubuntu.bat"""
$program_location = "$dir\start_ubuntu.bat"
$icon_location = "$dir\ubuntu.ico"

# Create shortcut
$object = new-object -comobject wscript.shell
$shortcut = $object.createshortcut($shortcut_location)
$shortcut.targetpath = $program_location
$shortcut.iconlocation = $icon_location
$shortcut.save()