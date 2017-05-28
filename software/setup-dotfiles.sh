#!/bin/bash

set -e

# check if we are root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo ""
echo "============================="
echo "| Setting Up Dotfiles       |"
echo "============================="
echo ""

HOME="/home/pi"
PWD=`pwd`
su pi -c "rm -f ${HOME}/.bashrc"
su pi -c "ln -s ${PWD}/static/linux_bashrc ${HOME}/.bashrc"

rm -f /etc/motd
touch /etc/motd

if [ -f "/etc/profile.d/sshpwd.sh" ]; then
	rm -f /etc/profile.d/sshpwd.sh
else
	echo ""
	echo "*** already removed sshpwd.sh ***"
	echo ""
fi

if [ ! -f "/etc/profile.d/motd.sh" ]; then
	sudo ln -s ${PWD}/static/motd /etc/profile.d/motd.sh
else
	echo ""
	echo "*** already setup motd.sh ***"
  	echo ""
fi

echo ""
echo "*** Done ***"
echo ""
