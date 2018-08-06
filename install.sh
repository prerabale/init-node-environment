#!/bin/bash
read -p "==> need nvm(y/n)?" installNvm
read -p "==> need vim-setting(y/n)?" vimSetting
# 安装git
if command -v git >/dev/null 2>&1; then
  echo "==> git has been installed"
else
  echo '==> git installing'
  if command -v yum >/dev/null 2>&1; then
    yum install git-core || { echo "install git failure"; exit -1; }
    echo "==> git installed successfully!"
  elif command -v apt-get >/dev/null 2>&1; then
    apt-get update
    apt-get install git || { echo "install git failure"; exit -1; }
    echo "==> git installed successfully!"
  else
    echo "==> pls install git first"
    exit -1
  fi
fi

# 安装zsh
if command -v zsh >/dev/null 2>&1; then
  echo "==> zsh has been installed"
else
  echo "==> zsh installing..."
  if command -v yum >/dev/null 2>&1; then
    yum install zsh;
  elif command -v apt-get >/dev/null 2>&1; then
    apt-get update
    apt-get install zsh
  fi
fi

# 安装nvm
if [ $installNvm == "y" -o $installNvm == "Y" ];then
  if [ -d $HOME/.nvm ]; then
    echo "==> you will need to remove $HOME/.nvm if you want to re-install nvm"
  else
    echo "==> nvm installing..."
    echo "==> curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash || { echo "nvm install failure."; exit -1; }
    echo "export NVM_DIR=\"\$HOME/.nvm\"" >> $HOME/.zshrc
    echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"  # This loads nvm" >> $HOME/.zshrc
    echo "[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"  # This loads nvm bash_completion" >> $HOME/.zshrc
    echo "export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node" >> $HOME/.zshrc
    source $HOME/.zshrc
    if command -v node >/dev/null 2>&1; then
      echo "==> node exist. skip install node"
    else
      echo "install the latest version of node."
      nvm install node
    fi
  fi
fi

# vim配置-非常耗时
if [ $vimSetting == "y" -o $vimSetting == "Y" ];then
  echo "vim setting..."
  echo "curl -o- https://raw.githubusercontent.com/prerabale/vim-setting/plug/install.sh | bash"
  curl -o- https://raw.githubusercontent.com/prerabale/vim-setting/plug/install.sh | bash
fi
