#Alias definitions
if [ -e $HOME/.bash_aliases ]; then
        source $HOME/.bash_aliases
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#Git Auto-Completion
if [[ -f "$HOME/git-completion.bash"  ]]; then
          source "$HOME/git-completion.bash"
fi
# Alias and bookmark the web folder (try to guess it's location)
# This will NOT overwrite a "web" alias previously definded in .bash_aliases
if [[ "$(type -t web)" != 'alias' ]]; then
        if [[ -d /var/www/html ]]; then
                alias web='cd /var/www/html'
                export web="/var/www/html"
        elif [[ -d /srv/http ]]; then
                alias web='cd /srv/http'
                export web="/srv/http"
        fi
fi
# Finds the current Linux distribution, name, version, and kernel version
function ver() {
        if [[ -x "$(command -v uname)" ]]; then
                uname --kernel-name --kernel-release --machine && echo
        fi
        if [[ -x "$(command -v hostnamectl)" ]]; then
                hostnamectl && echo
        fi
        if [[ -x "$(command -v lsb_release)" ]]; then
                lsb_release -a && echo
        fi
        cat /etc/*-release 2> /dev/null
}
#Vivid
export LS_COLORS="$(vivid generate molokai)"
#PS1
export PS1='\[\e[0;95m\][\[\e[0;38;5;51m\]\u \[\e[0;91m\]\W \[\e[0;5;38;5;51m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;95m\]]\[\e[0m\]:\[\e[0;5m\]🚀 \[\e[0m\]'
#Git-Scripts
export PATH=$PATH:$HOME/pro/linux/dotfiles-kraken/git-script
#Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOBIN:$GOROOT/bin
#Ansible install pip
export PATH=$PATH:$HOME/.local/bin/
#.oh-my-git
source /home/sysadmin/.oh-my-git/prompt.sh
#Cargo
source $HOME/.cargo/env
