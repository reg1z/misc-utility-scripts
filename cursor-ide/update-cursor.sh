#!/bin/bash
#set -euo pipefail

# Update Cursor, a popular AI-integrated IDE.
# Official Linux builds of cursor are packaged as AppImages

CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

USER_BIN=$USER_HOME/.local/bin # User-specific binary folder.
USER_APPS=$USER_HOME/.local/share/applications
USER_APPIMG=$USER_HOME/.local/share/AppImage # AppImages will be stored here.
USER_ICONS=$USER_HOME/.local/share/icons

CURSOR_IMG=$USER_APPIMG/Cursor.AppImage

# Create target directories if they don't already exist.
mkdir -p $USER_BIN
mkdir -p $USER_APPIMG
mkdir -p $USER_APPS
mkdir -p $USER_APPIMG/past-versions
mkdir -p $USER_ICONS

cat <<EOM
Let's install the latest version of Cursor.
Go to https://www.cursor.com and download the latest AppImage available.

What is the full filename of the downloaded AppImage (including extension)?

(!) NOTE: The file MUST be in your ~/Downloads folder for this to work.
EOM

read name
NEW_VER=$USER_HOME/Downloads/$name

timestamp=$(date +"%y-%m-%d-%H-%M-%S")
BACKUP_LOC=$USER_APPIMG/past-versions/Cursor.AppImage.$timestamp
echo -e "\n-------------------------------------"
echo -e "Backing up existing Cursor executable to $BACKUP_LOC and disabling its execution permissions..."
sudo chmod -x $CURSOR_IMG
mv $CURSOR_IMG $BACKUP_LOC

echo -e "\n-------------------------------------"
echo -e "Copying and renaming $USER_HOME/Downloads/$name to $CURSOR_IMG..."
cp -f $NEW_VER $CURSOR_IMG

echo -e "\n-------------------------------------"
echo -e "Granting executable permissions to $CURSOR_IMG"
sudo chmod 700 $CURSOR_IMG

echo -e "\n-------------------------------------"
echo -e "Adding Cursor.desktop entry in $USER_APPS.\nThis will make Cursor visible in your app launcher of choice..."
cp -f ./Cursor.desktop $USER_APPS/Cursor.desktop

echo -e "\n-------------------------------------"
echo -e "Adding Cursor icon to $USER_ICONS..."
cp -f ./cursor.png $USER_ICONS/cursor.png

echo -e "\n-------------------------------------"
echo -e "Symlinking $CURSOR_IMG to $USER_BIN\n(this folder must be defined in your PATH for the app to launch properly via terminal/launcher commands)..."
ln -s $CURSOR_IMG $USER_BIN/cursor

echo -e "\n-------------------------------------"
echo "Fin."
