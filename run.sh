#!/bin/bash
set -ex
mkdir -p ~/.vnc ~/.config/xfce4
tar -xvf /app/panel.tar -C ~/.config/xfce4
rm -rf /usr/share/icons/Adwaita
cp -r /usr/share/icons/Humanity-Dark /usr/share/icons/Adwaita

mkdir -p /Desktop

cat << EOF >  /Desktop/AnyDesk.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=AnyDesk
Comment=
Exec=/usr/bin/anydesk
Icon=anydesk
Path=
Terminal=false
StartupNotify=true
EOF

exec supervisord -c /app/supervisord.conf
