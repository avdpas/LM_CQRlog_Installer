#!/bin/bash

#First we check if we are running in root......
clear
if [ "$EUID" -ne 0 ]
  then 
  echo "Please run script with sudo!"
  echo "like this: user@hostname:~$ sudo ./LM_HAMlib_installer.sh "
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
sleep 5
clear
echo "***********************************"
echo "*     Installation is finished    *"
echo "*  PLEASE REBOOT YOUR SYSTEM NOW  *"
echo "***********************************"
