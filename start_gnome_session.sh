set -x
# Define necessary environment variables
export DISPLAY="$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'):1.0"
export DESKTOP_SESSION="ubuntu"
export GDMSESSION="ubuntu"
export XDG_SESSION_DESKTOP="ubuntu"
export XDG_CURRENT_DESKTOP="ubuntu:GNOME"
export XDG_SESSION_TYPE="x11"
export XDG_BACKEND="x11"
export XDG_SESSION_CLASS="user"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/:/var/lib/snapd/desktop"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_RUNTIME_DIR="$HOME/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share" 
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"

# Start desktop environment
gnome-session
