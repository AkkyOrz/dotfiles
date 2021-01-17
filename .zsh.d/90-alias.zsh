# Aliases
alias ln='ln -iv'

# alias settings
alias ls="exa --group-directories-first"
alias ll="exa -alh --git --time-style=iso --group-directories-first "
alias tree="exa -T"
alias open='xdg-open'

alias ip='ip -c'
# alias grep="rg"
# alias cat="bat"
alias be="bundle exec"
alias ber='bundle exec rails'
alias berspec='bundle exec rspec'
alias python='python3'
alias zshrc="vim ~/.zshrc"
alias zshup="source ~/.zshrc"
alias push="git push"
alias pull="git fetch -p && git pull"

alias bundle-install="bundle install --path ./vendor/bundle"
alias swag-gen="bundle exec rake rswag:specs:swaggerize" 
alias sshconf="vim ~/.ssh/config"
alias fd=fdfind

alias dc='docker-compose'

# file that is deleted by rm command throw into ~/.local/files/Trash/~
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

function all-up(){
    sudo apt -y update;
    echo "------------------------update done------------------------"
    sudo apt -y upgrade;
    echo "------------------------upgrade done------------------------"
    sudo apt -y autoremove;
    echo "------------------------autoremove done------------------------"
    sudo apt -y autoclean;
    echo "------------------------autoclean done------------------------"
    sudo snap refresh;
    echo "------------------------snap done------------------------"
    zinit update;
    echo "------------------------zplug update done------------------------"
}
alias all-up=all-up


function all-test(){
    bundle exec rake rswag:specs:swaggerize; 
    bundle exec rspec ./spec;
    bundle exec rubocop -a;
    bundle exec rails_best_practices;
}
alias all-test=all-test

alias texlive-up="sudo -Es tlmgr update --self --all"
