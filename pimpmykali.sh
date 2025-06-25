#!/bin/bash
# Remove existing pimpmykali folder
cd /home/$USER
mkdir -p repos
cd repos
rm -rf pimpmykali/

# Clone pimpmykali repository & enter the folder
git clone https://github.com/Dewalt-arch/pimpmykali

cd pimpmykali

# Execute the script - For a new Kali VM, run menu option 'N'
# (The script must be run with root privileges)
sudo ./pimpmykali.sh

# Use --auto command line arg to bypass the menu and prompts

# Use --help for full list of available command line args
