function runasuser() {
    _display_id=":$(find /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
    _username=$(who | grep "\(${_display_id}\)" | awk '{print $1} | head -n 1')
    _user_id=$(id -u "$_username")
    _environment=("DISPLAY=$_display_id" "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$_user_id/bus")
    sudo -Hu "$_username" env "${_environment[@]}" "$@"
}

cp /etc/egpu-switcher/egpu.conf /etc/X11/xorg.conf.d/99-egpu-switcher.conf
runasuser gsettings set org.gnome.desktop.interface.text-scaling-factor 1.0
