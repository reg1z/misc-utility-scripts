#!/bin/bash

# sudo echo "LH or RH?"
# read hand
# GLOVE80="GLV80${hand}BOOT"
# echo $GLOVE80
# sleep 3
USER=$(whoami)
MOUNT_LOC="/run/media/$USER"


sudo echo -e "Preparing to flash both halves of your Glove 80 ...\n"
sleep 1

echo -e "Your .uf2 file must be in the default ~/Downloads directory.\nPlease enter the name of the glove80 .uf2 file (including extension): "
read dot_uf2

LOC="/home/${USER}/Downloads/${dot_uf2}"
echo -e "\nFile Location: $LOC \n"

SECONDS=15
echo "Press enter twice to continue. You will have ${SECONDS} seconds to put each half into the boot state."
read enter

sleep ${SECONDS}s

echo "Flashing..."

sudo cp $LOC $MOUNT_LOC/GLV80RHBOOT/$dot_uf2
sudo cp $LOC $MOUNT_LOC/GLV80LHBOOT/$dot_uf2

echo "Success!"



