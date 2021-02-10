#!/bin/zsh

set -eux pipefail

cat <<EOF


 ██████╗  ██████╗       ███████╗███████╗████████╗██╗   ██╗██████╗ 
██╔═████╗██╔═████╗      ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
██║██╔██║██║██╔██║█████╗███████╗█████╗     ██║   ██║   ██║██████╔╝
████╔╝██║████╔╝██║╚════╝╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
╚██████╔╝╚██████╔╝      ███████║███████╗   ██║   ╚██████╔╝██║     
 ╚═════╝  ╚═════╝       ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
                                                                  

EOF

echo -n "Do you want to run $0?(y/N): "; read -q && echo "" || exit 0

# =====
# install nerd-fonts
# =====

cat <<EOF


███╗   ██╗███████╗██████╗ ██████╗       ███████╗ ██████╗ ███╗   ██╗████████╗███████╗
████╗  ██║██╔════╝██╔══██╗██╔══██╗      ██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝
██╔██╗ ██║█████╗  ██████╔╝██║  ██║█████╗█████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗
██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║╚════╝██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║
██║ ╚████║███████╗██║  ██║██████╔╝      ██║     ╚██████╔╝██║ ╚████║   ██║   ███████║
╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝       ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝
                                                                                    

EOF
if ! [ -d /tmp/nerd-fonts ] ; then
  sudo apt install git

  sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
  sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

  cd /tmp
  git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh
  pwd
  cd $HOME/dotfiles
fi

# =====
# create symlink
# =====
TARGET=(".gitconfig" ".vim" ".tmux.conf")
for i in $TARGET; do
  ! [ -h $HOME/$i ] && ln -siv $DOTPATH/$i $HOME
done

