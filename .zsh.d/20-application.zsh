# Setting some applications

# fzf
[ -f $DOTPATH/.fzf.zsh ] && source $DOTPATH/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 60% --reverse --border'

# rbenv
eval "$(anyenv init -)"
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# texlive
export MANPATH="/usr/local/texlive/2019/texmf-dist/doc/man"
export INFOPATH="/usr/local/texlive/2019/texmf-dist/doc/info"
