#!/bin/bash

W=$1
H=$2
PASSWORD=`pwgen | awk '{print $1}'`

if [ -z "$W" ]
   then
      W=1920
fi
if [ -z "$H" ]
   then
      H=1080
fi

GEOMETRY="$W\x$H"

clear
echo -e "One time VNC password: $PASSWORD\n"

sudo sh -c "x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -auth /var/run/lightdm/root/:0 -geometry $GEOMETRY -passwd $PASSWORD 2>srvpn.log 1>srvpn.log"

echo -e "\nVNC server closed"
