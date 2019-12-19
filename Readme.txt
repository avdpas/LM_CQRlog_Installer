#### LM CQRlog installers.


LEGAL NOTICE!!!!!
Be for we go any further.... I am not in anyway responsible if you use this script.
I wrote this to install everything in a few minutes on my own system.
Although its tested a lot, i can not guarantee that it will work on your system.
This is due to me testing it on a clean, fresh out of the box system.
I cannot test if you have other software installed that might interfere with this script.

#### The files......

LM_CQRlog_Installer_incl_HAMlib.sh
This is the installer that installs CQRlog, Hamlib and puts the user in the dialout group

LM_CQRlog_Installer.sh
This is the script that installs CQRlog and puts the user that installs it in the dialout group.

How to use this script......

1.  place the file in your home folder.
2.  open a terminal
3a. type sudo ./LM_CQRlog_Installer
3b. type sudo ./LM_CQRlog_Installer_incl_HAMlib
4.  After the script is finished IT WILL REBOOT YOUR COMPUTER!!! 
    if this is not done, this wil not work. 
    DO not try to cancel this and start CQRlog, this will mess stuff up!!


So What does the script do.......
- Add OK2CQR repository to your system so we can install it, and update it in the future using the normal update manager in Cinnamon
- Update the apt cache
- Install CQRlog
- Install X-Planet and X-Planet-images
- Checks if the user is a dialout member, if not he will be.
- Download HAMlib 3.3 (you can configure the version in the script if a newer version has been released)
- Install HAMlib 3.3
- Cleaning up some temp stuff
- Forcing a reboot in 30 seconds after it finishes

The scripts are tested on:
- LM19.2
- LM19.3