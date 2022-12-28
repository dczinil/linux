<< 'Comment'
Banner
https://patorjk.com/software/taag/#p=display&f=Calvin%20S&t=Type%20Something%20
Calvin S
comment
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╦  ╦╔╗╔╦ ╦═╗ ╦
╠═╣║  ║╠═╣╚═╗  ║  ║║║║║ ║╔╩╦╝
╩ ╩╩═╝╩╩ ╩╚═╝  ╩═╝╩╝╚╝╚═╝╩ ╚═
Comment
# Clear terminal
alias cls='clear'
# "sourcea" Update file
alias sourcea='source /etc/profile'
# "rm" Remove and confirm
alias rm='rm -i'
# "cp" Copy and confirm
alias cp='cp -i'
# "mv" Move and confirm
alias mv='mv -i'
# "editalias" .bash_aliase
alias editalias='vim ~/.bash_aliases && sourcea'
# "showa" show custom commands
alias showa='cat ~/.bash_aliases | grep "#"'
# "cpkey" copy key file
alias cpkey='xclip -selection clipboard <'
# "" Go back directories
alias ..='\cd ..'
alias ...='\cd ../..'
alias ....='\cd ../../..'
alias .....='\cd ../../../..'
# Change to the home directory
alias home='\cd ~'
# "ping" echo 
alias ping='ping -c 5'
# "ports" showopen ports
alias ports='netstat -tulanp'
# "iplocal" get local ip 
alias iplocal="ip -br -c a"
# "ipexternal" get public ip
alias ipexternal='wget -O - -q icanhazip.com && echo'
# "untar" unzip files
alias untar='tar -xvf'
# "nano" edit nano
alias nano='nano --smarthome --multibuffer --const --autoindent'


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
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔═╗╦ ╦╔╦╗╦ ╦╔═╗╔╗╔
╠═╣║  ║╠═╣╚═╗  ╠═╝╚╦╝ ║ ╠═╣║ ║║║║
╩ ╩╩═╝╩╩ ╩╚═╝  ╩   ╩  ╩ ╩ ╩╚═╝╝╚╝
Comment
# "vpy" Generate virtual version
alias vpy='python3 -m venv venv'
# "avenv" Active virtual version
alias avenv='source venv/bin/activate'
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔═╗╦╔╦╗
╠═╣║  ║╠═╣╚═╗  ║ ╦║ ║ 
╩ ╩╩═╝╩╩ ╩╚═╝  ╚═╝╩ ╩ 
Comment
# "repos" repo dev
alias repos='cd ~/pro'
# "gbranch"
alias gbranch='git branch -r'
# "ginit" Initialize repository in current folder
alias ginit='git init'
# "gcommit" Commit
alias gcommit='git commit -m'
# "gr" Remove add
alias gremote='git remote add'
# "ggr" Graphical history of the comments
alias ggr='git log --all --graph --decorate --oneline'
# "ggl" git lg color
alias ggl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
# "gcheckb" Create banch and enter this
alias gcheckb='git checkout -b'
# "gp" Push origin
alias gp='git push origin'
# "gmerge" Merge
alias gmerge='git merge'
# "gclone" Clone reporitory
alias gclone='git clone'
# "gignore" Creates file gitignore
alias gignore='touch .gitignore'
# "gstatus" status repo
alias gstatus='git status'

# Find all Git repos in the current directory recursively
# Note: Excludes hidden and temp directories
# You can find all git repos on the entire system using: locate .git | grep "/.git$"
alias gitrepos="find . -type d -not -path '*/.git/*' -not -path '*/tmp/*' -not -path '*/temp/*' -not -path '*/.*' -exec test -e '{}/.git' ';' -print -prune"
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔╦╗╔═╗╔═╗╦╔═╔═╗╦═╗
╠═╣║  ║╠═╣╚═╗   ║║║ ║║  ╠╩╗║╣ ╠╦╝
╩ ╩╩═╝╩╩ ╩╚═╝  ═╩╝╚═╝╚═╝╩ ╩╚═╝╩╚═
Comment
# "dstopped" Stop al running container
alias dstopped='docker stop $(docker ps -aq) 2> /dev/null && docker ps -aq'
# "dcleanc" Remove all container
alias dcleanc='docker rm -f $(docker ps -aq) 2> /dev/null  && docker ps -aq'
# "dcleani" Remove all image
alias dcleani='docker rmi image -f $(docker image ls -aq) 2> /dev/null && docker image ls -aq'
# "dcleana" Remove all
alias dcleana='docker rm -f $(docker ps -aq) 2> /dev/null && docker rmi image -f $(docker image ls -aq)  2> /dev/null && docker ps -aq && docker image ls -aq'
# "dkilld" Kills all the detainees
alias dkilld='docker rm $(docker ps --filter status=exited -q)'
