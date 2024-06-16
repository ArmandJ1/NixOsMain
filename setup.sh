#! /bin/bash
mkdir ~/.config/nixos
cd ~/.config/nixos
# github setup
git init 
git remote add origin git@github.com:ArmandJ1/NixOsMain.git
git pull origin master
git add .
git commit -m "Initial commit"
git push --set-upstream origin master
