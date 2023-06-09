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
# "only" only see hidden files
alias only='find . -name ".*" -maxdepth 1 -exec ls --color=auto -d {} \;  2>/dev/null'
alias onlyd='find . -name ".*" -maxdepth 1 -type d -exec ls -d --color=auto {} \;  2>/dev/null'
alias onlyf='find . -name ".*" -maxdepth 1 -type f -exec ls -d --color=auto {} \;  2>/dev/null'
## "" Go back directories
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
# "rm" delet
alias rm='rm -rIf'
# "pro"
alias pro='cd ~/pro'
alias k8sv='cd ~/pro/k8s-vag-ansi/'
# "scriptbash"
alias scriptbash='cd ~/pro/linux/script/bash'
# "scriptpython"
alias scriptpython='cd ~/pro/linux/script/python'
# "scriptgo"
alias scriptgo='cd ~/pro/linux/script/golang'
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
fi
#! bash oh-my-bash.module
#  ---------------------------------------------------------------------------
alias perm='stat --printf "%a %n \n "'      # perm: Show permission of target in number
alias 000='chmod 000'                       # ---------- (nobody)
alias 640='chmod 640'                       # -rw-r----- (user: rw, group: r, other: -)
alias 644='chmod 644'                       # -rw-r--r-- (user: rw, group: r, other: -)
alias 755='chmod 755'                       # -rwxr-xr-x (user: rwx, group: rx, other: x)
alias 775='chmod 775'                       # -rwxrwxr-x (user: rwx, group: rwx, other: rx)
alias mx='chmod a+x'                        # ---x--x--x (user: --x, group: --x, other: --x)
alias ux='chmod u+x'                        # ---x------ (user: --x, group: -, other: -)
#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------
alias apacheEdit='sudo vim /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo vim /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:       Shows apache error logs
#! bash oh-my-bash.module
#  ---------------------------------------------------------------------------
# Directory Listing aliases
alias dir='ls -hFx'
alias l.='ls -d .* --color=tty' # short listing, only hidden files - .*
alias l='ls -lathF'             # long, sort by newest to oldest
alias L='ls -latrhF'            # long, sort by oldest to newest
alias la='ls -Al'               # show hidden files
alias lc='ls -lcr'              # sort by change time
alias lk='ls -lSr'              # sort by size
alias lh='ls -lSrh'             # sort by size human readable
alias lm='ls -al | more'        # pipe through 'more'
alias lo='ls -laSFh'            # sort by size largest to smallest
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lu='ls -lur'              # sort by access time
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias dud='du -d 1 -h'                      # Short and human-readable file listing
alias duf='du -sh *'                        # Short and human-readable directory listing
# Archives
function untar {
  if [ -z "$1" ]; then
    echo "Usage: untar <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}
# function "gitls" check status of git repository
function gitls {
	git status --porcelain | \
		awk 'BEGIN {FS=" "}
		{
			xstat = substr($0, 1, 1);
			ystat = substr($0, 2, 1);
			f = substr($0, 4);
			ri = index(f, " -> ");
			if (ri > 0) f = substr(f, 1, ri);
			if (xstat == " " && ystat ~ "M|D") stat = "not_updated";
			else if (xstat == "M" && ystat ~ " |M|D") stat = "updated_in_index";
			else if (xstat == "A" && ystat ~ " |M|D") stat = "added_to_index";
			else if (xstat == "D" && ystat ~ " |M") stat = "deleted_from_index";
			else if (xstat == "R" && ystat ~ " |M|D") stat = "renamed_in_index";
			else if (xstat == "C" && ystat ~ " |M|D") stat = "copied_in_index";
			else if (xstat ~ "M|A|R|C" && ystat == " ") stat = "index_and_work_tree_matches";
			else if (xstat ~ " |M|A|R|C" && ystat == "M") stat = "work_tree_changed_since_index";
			else if (xstat ~ " |M|A|R|C" && ystat == "D") stat = "deleted_in_work_tree";
			else if (xstat == "D" && ystat == "D") stat = "unmerged,both_deleted";
			else if (xstat == "A" && ystat == "U") stat = "unmerged,added_by_us";
			else if (xstat == "U" && ystat == "D") stat = "unmerged,deleted_by_them";
			else if (xstat == "U" && ystat == "A") stat = "unmerged,added_by_them";
			else if (xstat == "D" && ystat == "U") stat = "unmerged,deleted_by_us";
			else if (xstat == "A" && ystat == "A") stat = "unmerged,both_added";
			else if (xstat == "U" && ystat == "U") stat = "unmerged,both_modified";
			else if (xstat == "?" && ystat == "?") stat = "untracked";
			else if (xstat == "!" && ystat == "!") stat = "ignored";
			else stat = "unknown_status";
			print f "   " stat;
		}' | \
		column -t -s "  " | "$PAGER"
}
# List folders recursively in a tree
if [[ -x "$(command -v tree)" ]]; then
	alias treed='\tree -CAFd'
fi
#######################################################
# grc Generic Colouriser
# Link: https://github.com/garabik/grc
#######################################################

_SKIP_GRC=false

		if [[ $_SKIP_GRC = false ]] && [[ -x "$(command -v grc)" ]]; then
			# If grc Generic Colouriser is installed
			# Link: https://github.com/garabik/grc
			alias ll='grc ls -l --all --classify --group-directories-first --human-readable --color=always'
		else
			# Use standard long listing format
			alias ll='llcolor'
		fi
	fi
else
	alias ls='ls -aFh --color=always'     # do add built-in colors to file types
	alias ll='ls -Fls'                    # long listing
	alias labc='ls -lap'                  # sort alphabetically
	alias lx='ll -laXBh'                  # sort by extension
	alias lk='ll -laSrh'                  # sort by size
	alias lt='ll -latrh'                  # sort by date
	alias lc='ll -lacrh'                  # sort by change time
	alias lu='ll -laurh'                  # sort by access time
	alias new='ls -latr | tail -10 | tac' # list recently created/updated files
	alias lw='ls -xAh'                    # wide listing format
	alias lm='ll -alh | \less -S'         # pipe through less
	alias lr='ls -lRh'                    # recursive ls
	alias l.='ll -d .*'                   # show hidden files
	alias lfile="ls -l | egrep -v '^d'"      # files only
	alias ldir="ls -la | egrep '^d'"      # directories only
fi

if [[ $_SKIP_GRC = false ]] && [[ -x "$(command -v grc)" ]]; then
	GRC_ALIASES=true
	if [[ -f "$HOME/.local/bin/grc.sh" ]]; then
		source ~/.local/bin/grc.sh
	elif [[ -f "/etc/profile.d/grc.sh" ]]; then
		source /etc/profile.d/grc.sh
	elif [[ -f "/etc/grc.sh" ]]; then
		source /etc/grc.sh
	else
		GRC="$(which grc)"
		if tty -s && [ -n "$TERM" ] && [ "$TERM" != dumb ] && [ -n "$GRC" ]; then
			alias as='colourify as'
			alias blkid='colourify blkid'
			alias colourify="$GRC -es"
			alias configure='colourify ./configure'
			if [[ "$(type -t df)" != 'alias' ]]; then alias df='colourify df -khT'; fi
			if [[ "$(type -t diff)" != 'alias' ]]; then alias diff='colourify diff'; fi
			alias dig='colourify dig'
			alias docker-compose='colourify docker-compose'
			alias docker-machine='colourify docker-machine'
			alias docker='colourify docker'
			alias du='colourify du'
			#alias env='colourify env'
			alias fdisk='colourify fdisk'
			alias findmnt='colourify findmnt'
			alias free='colourify free -m'
			alias g++='colourify g++'
			alias gas='colourify gas'
			alias gcc='colourify gcc'
			alias getsebool='colourify getsebool'
			alias head='colourify head'
			alias id='colourify id'
			alias ifconfig='colourify ifconfig'
			alias ip='colourify ip'
			alias iptables='colourify iptables'
			alias journalctl='colourify journalctl'
			alias kubectl='colourify kubectl'
			if [[ "$(type -t ld)" != 'alias' ]]; then alias ld='colourify ld'; fi
			alias lsblk='colourify lsblk --fs --perms'
			alias lsof='colourify lsof'
			alias lspci='colourify lspci'
			alias m='colourify mount'
			alias make='colourify make'
			alias mount='colourify mount'
			alias mtr='colourify mtr'
			alias netstat='colourify netstat'
			alias ping='colourify ping -c 5'
			alias ps='colourify ps auxf'
			alias semanage='colourify semanage'
			alias sockstat='colourify sockstat'
			alias ss='colourify ss'
			alias tail='colourify tail'
			alias traceroute6='colourify traceroute6'
			alias traceroute='colourify traceroute'
		fi
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
# "pip3"
#alias pip3='python3 -m pip'
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
alias forest='/home/sysadmin/pro/git-scripts/git-forest'
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
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔╦╗╔═╗╦═╗╦═╗╔═╗╔═╗╔═╗╦═╗╔╦╗
╠═╣║  ║╠═╣╚═╗   ║ ║╣ ╠╦╝╠╦╝╠═╣╠╣ ║ ║╠╦╝║║║
╩ ╩╩═╝╩╩ ╩╚═╝   ╩ ╚═╝╩╚═╩╚═╩ ╩╚  ╚═╝╩╚═╩ ╩
Comment
# Aliases
# (sorted alphabetically)
alias t='terraform'
alias tapply='terraform apply'
alias tfmt='terraform fmt'
alias tinit='terraform init'
alias tplan='terraform plan'
#Ansible
alias invAnsible='vim $HOME/.hosts_ansible'
alias destvv='vagrant destroy -f'
#   ---------------------------------------
#                 VBoxManage
#   ---------------------------------------
# "vbm" cli VBoxManage
alias vbm='VBoxManage'
# "vbmlr" VBoxManage list Runningsvm
alias vbm='vbm list runningvms'
function killvms() {
	  VBoxManage list runningvms | awk '{print $2;}' | xargs -I vmid VBoxManage controlvm vmid poweroff
		  VBoxManage list vms | awk '{print $2;}' | xargs -I vmid VBoxManage unregistervm --delete vmid
		}
#   ---------------------------------------
#                   Vagrant
#   ---------------------------------------
# "vdd" delet vagrant directory
alias vdd='rm -rf .vagrant/'
# "vgi" vagrant start
alias vgi='vagrant init'
# "vup" Vagrant up
alias vup='vagrant up'
# "vupp" vagrant up provision
alias vupp='vagrant up --provision'
# "vupnp" vagrant up no provision
alias vupnp='vagrant up --no-provision'
# "vd" Vagrant destroy
alias vd='vagrant destroy'
# "vdf" vagrant destroy force
alias vdf='vagrant destroy -f'
# "vssh" vagrant ssh
alias vssh='vagrant ssh'
# "vsshc" vagrant ssh-config
alias vsshc='vagrant ssh-config'
# "vrdp" vagrant rdp
alias vrdp='vagrant rdp'
# "vh" vagrant halt
alias vh='vagrant halt'
# "vssp" vagrant suspend
alias vssp='vagrant suspend'
# "vst" vagrant status
alias vst='vagrant status'
# "vre" vagrant resume
alias vre='vagrant resume'
# "vgs" vagrant global status 
alias vgs='vagrant global-status'
# "vpr" vagrant provision
alias vpr='vagrant provision'
# "vr" vagrant reload
alias vr='vagrant reload'
# "vrp" vagrant reload provision
alias vrp='vagrant reload --provision'
# "vp" vagrant push 'code'
alias vp='vagrant push'
# "vsh" vagrant share
alias vsh='vagrant share'
# "vbs" vagrant box add
alias vba='vagrant box add'
# "vbr" vagrant box remove 'NAME-BOX'
alias vbr='vagrant box remove'
# "vpru" vagrant prune 'This command removes old versions of installed boxes.'
alias vpru='vagrant box prune'
# "vbl" vagrant box list
alias vbl='vagrant box list'
# "vbo" vagrant box outdated 'This command tells you whether or not the box you are using in your current Vagrant environment is outdated.'
alias vbo='vagrant box outdated'
# "vbu" vagrant box update
alias vbu='vagrant box update'
# "vpli" vagrant plugin intall 'NAME-PLUGIN'
alias vpli='vagrant plugin install'
# "vpll" vagrant plugin list
alias vpll='vagrant plugin list'
# "vplun" vagrant plugin uninstall 'NAME-PLUGIN'
alias vplun='vagrant plugin uninstall'
# "vplu" vagrant plugin updatr
alias vplu='vagrant plugin update'