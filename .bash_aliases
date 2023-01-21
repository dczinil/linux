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
# "maxproc" See the processes that consume the most
# Add in negative the number of processes to review"
alias maxproc='ps axuf | sort -nr -k3 | head '
# "maxproc5" See the processes that consume the most
alias maxproc5='ps axuf | sort -nr -k3 | head -5'
if [[ -x "$(command -v dnf)" ]]; then # RedHat/Fedora
	alias has='dnf info'
	alias updateall='sudo dnf upgrade --refresh'
	alias gupdate='sudo dnf upgrade'
	alias install='sudo dnf install'
	alias remove='sudo dnf remove'
	alias autoremove='sudo dnf autoremove'
	alias search='sudo dnf search'
	alias list='dnf list installed'
	alias dependencies='yum whatprovides'
elif [[ -x "$(command -v yum)" ]]; then # RedHat/Fedora
	alias has='yum info'
	alias updateall='sudo yum clean all && yum -y update'
	alias gupdate='sudo yum update'
	alias install='sudo yum install'
	alias remove='sudo yum remove'
	alias autoremove='sudo yum autoremove'
	alias search='sudo yum search'
	alias list='yum list installed'
	alias dependencies='yum whatprovides'
elif [[ -x "$(command -v apt)" ]]; then # Debian/Ubuntu/Raspbian
	# Link: https://itsfoss.com/apt-command-guide/
	alias has='apt show'
	alias updateall='sudo apt update --assume-yes && sudo apt upgrade --assume-yes && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias update='sudo apt-get install --only-upgrade'
	alias install='sudo apt install'
	alias remove='sudo apt remove'
	alias autoremove='sudo apt autoremove'
	alias search='sudo apt search'
	alias list='sudo apt list --installed'
	alias check='sudo apt update --assume-yes && apt list --upgradable'
elif [[ -x "$(command -v apt-get)" ]]; then # Debian/Ubuntu
	# Link: https://help.ubuntu.com/community/AptGet/Howto
	alias has='apt-cache show'
	alias updateall='sudo apt-get update && sudo apt-get upgrade && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias gupdate='sudo apt-get install --only-upgrade'
	alias install='sudo apt-get install'
	alias remove='sudo apt-get remove'
	alias autoremove='sudo apt-get autoremove'
	alias search='sudo apt-cache search'
	alias list='sudo dpkg -l'
elif [[ -x "$(command -v zypper)" ]]; then # SUSE
	# Link: https://en.opensuse.org/SDB:Zypper_usage
	alias has='zypper info'
	alias gupdateall='sudo zypper patch'
	alias update='sudo zypper up'
	alias install='sudo zypper in'
	alias remove='sudo zypper rm'
	alias autoremove='sudo zypper packages --orphaned'
	alias search='sudo zypper se'
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
# "forest" exec scripts git-scripts (jwiegley/git-scripts)
alias git-forest='forest'

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
