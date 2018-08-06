#!/bin/bash
read -p "need install nvm(y/n)?" installNvm
read -p "need vim-setting(y/n)?" vimSetting

if [ $installNvm == "y" -o $installNvm == "Y" ];then
echo "nvm installing..."
echo "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi
source ~/.nvm/nvm.sh
echo "install the latest version of node."
nvm install node

if [ $vimSetting == "y" -o $vimSetting == "Y" ];then
echo "vim setting..."
echo "curl -o- https://raw.githubusercontent.com/prerabale/vim-setting/plug/install.sh | bash"
curl -o- https://raw.githubusercontent.com/prerabale/vim-setting/plug/install.sh | bash
fi