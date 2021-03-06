#!/bin/bash

# set -u
set -eux pipefail

while true; do
    read -p "Do you want to run $0? (y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 0;;
        * ) echo "Please answer yes or no.";;
    esac
done

# =====
# change apt mirror server
# =====
sudo sed -i.bak -e "s%http://\(jp\.\)*archive\.ubuntu\.com/ubuntu/%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list

# =====
# apt update/upgrade
# =====
(sudo apt update -y -qq && sudo apt upgrade -y -qq)

# =====
# install zsh
# =====

cat <<EOF

███████╗███████╗██╗  ██╗
╚══███╔╝██╔════╝██║  ██║
  ███╔╝ ███████╗███████║
 ███╔╝  ╚════██║██╔══██║
███████╗███████║██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝
                        
EOF

type zsh > /dev/null 2>&1 || sudo apt install -qq -y zsh

# =====
# set zsh and create ~/.zshrc
# =====
[ $SHELL == "$(which zsh)" ] || chsh -s $(which zsh)

ZSHENV="$HOME/.zshenv"
if ! [ -f $ZSHENV ]; then
  echo "export DOTPATH=\$HOME/.dotfiles" >> $ZSHENV
  echo "source \$DOTPATH/.zshenv" >> $ZSHENV
  echo "source \$DOTPATH/.zshrc" >> $ZSHENV
fi

# =====
# remove unnnecessary files
# =====
ARCHIVEDIR="$HOME/.archives"
mkdir -p $ARCHIVEDIR
for i in $(cd $HOME; ls -A); do
  if [ $HOME/$i != $(cd `dirname $0` && pwd)  -a $HOME/$i != $ARCHIVEDIR -a $HOME/$i != $ZSHENV ]; then
    mv $HOME/$i $ARCHIVEDIR
  fi
done

# =====
# continue to setup.zsh
# =====

# echo "\e[32m[Success to install ZSH]\e[m After restart terminal, \e[30;43m please run setup.sh \e[m"

# while true; do
#     read -p "Do you restart terminal? (y/n)" yn
#     case $yn in
#         [Yy]* ) break;;
#         [Nn]* ) exit 0;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
# gnome-terminal && exit

