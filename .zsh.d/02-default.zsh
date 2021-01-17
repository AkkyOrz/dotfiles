# general
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# keybind
bindkey -e
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^Q" backward-kill-word # push-line
bindkey "^W" forward-word # backward-kill-word
bindkey "^S" backward-word # history-incremental-search-forward

# enable zsh default function
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 100
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# history
export HISTFILE="$HOME/.zsh_history" # Don't forget to give permission `600`
HISTSIZE=10000
SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt hist_ignore_dups
setopt inc_append_history
function history-all { history -E 1 }


# 他のzshと履歴を共有
setopt share_history

# スペースキーを入れたときhistoryに入れない．
setopt hist_ignore_space

# cd した先のディレクトリをディレクトリスタックに追加する
# `cd +<Tab>` でディレクトリの履歴が表示され，ソコに移動できる
setopt auto_pushd
setopt pushd_ignore_dups

# パスを直接入力してもcdする
setopt AUTO_CD

# 環境変数を補完
setopt AUTO_PARAM_KEYS


# history保存先
export HISTFILE="$HOME/.zsh_history" # Don't forget to give permission `600`

setopt append_history
setopt hist_no_store
setopt hist_reduce_blanks

