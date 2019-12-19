#!/bin/bash

#First we check if we are running in root......
clear
if [ "$EUID" -ne 0 ]
  then 
  echo "Please run script with sudo!"
  echo "like this: user@hostname:~$ sudo ./LM_CQRlog_installer_incl_HAMlib.sh "
  echo "your password will be asked...."
  exit
else
  echo "Check on root priviliges succesfull!"
  echo "Starting installation"
fi

## Some settings 

##HAMlib version to download
VER=3.3



## generating some variables
## Do not touch these....
FILE=hamlib-$VER.tar.gz
FOLDER=hamlib-$VER
LINK=https://github.com/Hamlib/Hamlib/releases/download/$VER/$FILE




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

#Installing CQRlog
clear
echo "Installing X-Planet"
sleep 5
apt-get -y install xplanet xplanet-images 


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


####### Installing HAMlib.

#installing build tools
clear
echo "Installing essential compiling tools"
sleep 5
apt-get -y install build-essential autoconf

#download hamlib
clear
echo "downloading HAMlib library version $VER"
sleep 5
curl -kLo $FILE $LINK

#unzipping
clear
echo "Unpacking HAMlib package" 
tar xvzf $FILE

#changing to folder
cd $FOLDER

#configuring 
clear
echo "Configuring installation for HAMlib"
sleep 5
./configure --disable-static

#running make
clear
echo "Making the installation"
sleep 5
make

#checking the make
clear
echo "Checking the installation"
sleep 5
make check

#running the install
clear
echo "Running the actual install"
sleep 5
make install

#updating the ld.so.cache
clear
echo "Updating the ld.so.cache"
sleep 5
ldconfig

#cleaning stuff
clear
echo "Cleaning up the make process"
sleep 5
make clean


#cleaning up
clear
echo "Cleaning up temporarly files"
rm -R $FOLDER
rmdir $FOLDER
rm $FILE


#Done installing.
clear
echo "****************************************************"
echo "****************************************************"
echo "**             Installation is finished           **"
echo "**    FORCE REBOOTING YOUR SYSTEM IN 30 SECONDS ! **"
echo "****************************************************"
echo "****************************************************"


sleep 30
reboot

