#!/bin/bash
clear
if [ "$EUID" -ne 0 ]
  then echo "Please run script with sudo!"
  exit
else
  echo "Check on root priviliges succesfull"
  echo "Starting installation"
fi

#adding OK2CQR PPA to repositories
echo "adding OK2CQR PPA to repositories"
sleep 5
add-apt-repository -y ppa:ok2cqr/ppa

#Running apt-get update
clear
echo "Running apt-get update"
sleep 5
apt-get update

#Installing CQRlog
clear
echo "Installing CQRlog"
sleep 5
apt-get -y install cqrlog

#checking if user is a dialout member
clear
echo "checking if user: $SUDO_USER , is a member of the dialout group" 

dialout=$(groups $SUDO_USER|grep dialout)
if [[ "$dialout" = "dialout" ]]; then
    echo "User is a member of the dialout group"
else
    echo "user is not a member of the dialout group"
    echo "Adding user to the dialout group"
    usermod -a -G dialout $SUDO_USER
fi

#Done installing.
sleep 5
clear
echo "***********************************"
echo "*     Installation is finished    *"
echo "*  PLEASE REBOOT YOUR SYSTEM NOW  *"
echo "***********************************"



