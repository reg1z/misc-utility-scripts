#!/bin/bash

echo -e "What's the exact name of the davinci resolve zip you downloaded (including file extension)?\nNOTE THAT THE ZIP MUST BE IN YOUR ~/Downloads FOLDER."

read davinci

yay_path=".cache/yay/davinci-resolve/$davinci"
paru_path=".cache/paru/clone/davinci-resolve/$davinci"

cp -f /home/$USER/Downloads/$davinci /home/$USER/$yay_path

yay -S davinci-resolve
