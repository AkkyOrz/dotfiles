#!/bin/zsh

set -eux pipefail

cat << EOF



 ██╗ ██████╗       ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
███║██╔═████╗      ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
╚██║██║██╔██║█████╗██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
 ██║████╔╝██║╚════╝██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
 ██║╚██████╔╝      ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
 ╚═╝ ╚═════╝       ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                                                                         

EOF


echo -n "Do you want to run $0?(y/N): "; read -q && echo "" || exit 0

# =====
# install essentials
# =====
export DEBIAN_FRONTEND=noninteractive
(sudo -E apt install -y -qq build-essential libbz2-dev libdb-dev \
  libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
  libncursesw5-dev libsqlite3-dev libssl-dev \
  zlib1g-dev uuid-dev tk-dev \
  python3-distutils)
unset DEBIAN_FRONTEND


# =====
# install Rust
# =====

cat<<EOF

██████╗ ██╗   ██╗███████╗████████╗
██╔══██╗██║   ██║██╔════╝╚══██╔══╝
██████╔╝██║   ██║███████╗   ██║   
██╔══██╗██║   ██║╚════██║   ██║   
██║  ██║╚██████╔╝███████║   ██║   
╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   

EOF

if ! [ type "rustc" > /dev/null 2>&1 ]; then 
    sudo apt install -y vim git wget curl htop gcc
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
fi



# =====
# install Rusty Commands
# =====
if ! [ type "exa" > /dev/null 2>&1 ]; then cargo install exa; fi
if ! [ type "batcat" > /dev/null 2>&1 ]; then sudo apt install -y bat fd-find; fi
if ! [ type "rg" > /dev/null 2>&1 ]; then 
    wget https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb -P /tmp
    sudo dpkg -i /tmp/ripgrep_12.1.1_amd64.deb
fi


# =====
# install Go
# =====




cat <<EOF

 ██████╗  ██████╗ 
██╔════╝ ██╔═══██╗
██║  ███╗██║   ██║
██║   ██║██║   ██║
╚██████╔╝╚██████╔╝
 ╚═════╝  ╚═════╝ 
                  

EOF


if ! [ type "go" > /dev/null 2>&1 ]; then 
  sudo -E apt install -y software-properties-common apt-transport-https gnupg
  sudo add-apt-repository ppa:longsleep/golang-backports -y
  sudo apt -y update
  # DEBIAN_FRONTEND=noninteractive sudo apt install -y systemd
  # sudo timedatectl set-timezone Asia/Tokyo
  sudo apt install -y tzdata
  sudo apt install -y golang-go
fi

if ! [ type "ghq" > /dev/null 2>&1 ]; then
  go get github.com/x-motemen/ghq
fi






# =====
# install zinit (skip recommended plugins)
# =====
# # you don't need to do anything.

# =====
# isntall pip
# =====
echo -n "$(python3 --version), is it ok?(y/N): "
if read -q && echo ""; then
  curl -s https://bootstrap.pypa.io/get-pip.py | python3
  echo $(pip --version)
else
  echo "\e[31m[CAUTION!] please install Python 3.0.0>\e[m"
fi

# =====
# install fzf
# =====
if ! [ -d $HOME/.fzf ]; then
  git clone -q --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  echo "\e[33m[WARNING] please enable fzf-keybinding and disable other settings.\e[m"
  $HOME/.fzf/install
  rm $HOME/.fzf.bash
  rm $HOME/.fzf.zsh
fi

# =====
# install vim-hybrid
# =====
mkdir -p ~/.vim/colors
(cd $DOTPATH/.vim/colors && curl -s -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim)

# =====
# install rbenv
# =====
if ! whence -w rbenv; then
  git clone -q https://github.com/rbenv/rbenv.git $HOME/.rbenv
  git clone -q https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# =====
# install trash-cli
# =====
whence -w pip && whence -w trash || pip install -q trash-cli

# =====
# install tree
# =====
whence -w tree || sudo apt install -y -qq tree

# =====
# install expect (for `unbuffer` command)
# =====
whence -w unbuffer || sudo apt install -y -qq expect

