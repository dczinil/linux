#!/bin/bash
echo "#################################################"
echo "## Depending on the installed package managers ##"
echo "#################################################"
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




echo "########################"
echo "## create repo folder ##"
echo "########################"

mkdir -p /tmp/{installdeb,installrun,installgit,installtar}

update
upgrade -y
install -y exa nmap net-tools git htop vim tree curl wget xclip openssh-server apt-transport-https ca-certificates gnupg software-properties-common

echo "########################"
echo "########################"
echo "### Install languages ##"
echo "########################"
echo "########################"

echo "#########################"
echo "##     Install nvm     ##"
echo "#########################"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.bashrc
nvm install --lts

echo "#########################"
echo "##   Install Golang    ##"
echo "#########################"
cd /tmp/installtar
wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export GOBIN=$GOPATH/bin" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
source $HOME/.bashrc
go version

echo #########################
echo ##     install pip3    ##
echo #########################
apt install -y pytho3-pip
python3 -m pip install --upgrade pip

echo "########################"
echo "########################"
echo "###   Install tools   ##"
echo "########################"
echo "########################"

echo "########################"
echo "## Add docker GPG key ##"
echo "########################"
add-apt-repository ppa:gns3/ppa
dpkg --add-architecture i386
echo "########################"
echo "## Add docker GPG key ##"
echo "########################"
apt update
apt install -y gns3-gui gns3-server gns3-iou

echo ########################
echo ## Add docker GPG key ##
echo ########################
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /etc/apt/keyrings/docker.gpg
echo "#########################"
echo "## Install Docker full ##"
echo "#########################"
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "#########################"
echo "##   add user docker   ##"
echo "#########################"
usermod -aG docker sysadmin

echo "#########################"
echo "##   Install gh cli    ##"
echo "#########################"
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

echo "####################################"
echo "## Install podman buildah skopeo  ##"
echo "####################################"
apt install -y podman buildah skopeo
  
echo "########################"
echo "########################"
echo "###     Install deb   ##"
echo "########################"
echo "########################"

echo "#########################"
echo "##      Config git     ##"
echo "#########################"
mkdir -p $HOME/pro
mkdir -p $HOME/.ssh/github/

echo "#########################"
echo "##      Clone repo     ##"
echo "#########################"
cd $HOME/pro
git clone git@github.com:dczinil/linux.git
git clone git@github.com:dczinil/python.git
git clone git@github.com:dczinil/docker.git
git clone git@github.com:dczinil/git.git
git clone git@github.com:dczinil/pages.git
git clone git@github.com:dczinil/ansible.git
git clone git@github.com:dczinil/dczinil.github.io.git

echo "#####################################"
echo "## add link to configuration files ##"
echo "#####################################"
ln -s $HOME/pro/linux/custom.sh /etc/profile.d/
ln -s $HOME/pro/linux/.bash_aliases $HOME/
ln -s $HOME/pro/linux/.vim $HOME/
ln -s $HOME/pro/linux/.vimrc $HOME/

echo "#########################"
echo "##  edit file .bashrc  ##"
echo "#########################"
cd /tmp/installgit
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git
echo source ~/.oh-my-git/prompt.sh >> ~/.bashrc
source $HOME/oh-my-git/prompt.sh
# Copy the awesome fonts to ~/.fonts
cd /tmp/installgit
git clone http://github.com/gabrielelana/awesome-terminal-fonts
cd awesome-terminal-fonts
git checkout patching-strategy
mkdir -p ~/.fonts{Droid-Sans-Mono,Inconsolata,Source-Code-Pro}
cp patched/SourceCodePro+Powerline+Awesome+Regular.ttf ~/.fonts/Source-Code-Pro
cp patched/Droid+Sans+Mono+Awesome.ttf ~/.fonts/Droid-Sans-Mono
cp patched/Inconsolata+Awesome.ttf ~/.fonts/Inconsolata
cp ~/.fonts/* /usr/share/fonts/truetype
# update the font-info cache
fc-cache -fv ~/.fonts
# Git Auto-Completion
wget -O ~/git-completion.bash https://github.com/git/git/raw/master/contrib/completion/git-completion.bash


(
cat <<EOF
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# Git Auto-Completion
if [[ -f "$HOME/git-completion.bash" ]]; then
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
#######################################################
# Vivid LS_COLORS Generator
# Link: https://github.com/sharkdp/vivid
# Themes: https://github.com/sharkdp/vivid/tree/master/themes
#######################################################
# Colors for ls
export CLICOLOR=1

if [[ -x "$(command -v vivid)" ]]; then
	# Vivid is installed
	export LS_COLORS="$(vivid generate one-dark)"
	_LS_COLORS_SOURCE="Vivid"
elif [[ -f "$HOME/.local/share/lscolors.sh" ]]; then
	# LS_COLORS is installed locally
	source "$HOME/.local/share/lscolors.sh"
	_LS_COLORS_SOURCE="LS_COLORS Local"
elif [[ -f /usr/share/LS_COLORS/dircolors.sh ]]; then
	# LS_COLORS is installed system wide
	source /usr/share/LS_COLORS/dircolors.sh
	_LS_COLORS_SOURCE="LS_COLORS System Wide"
elif [[ -x /usr/bin/dircolors ]]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	_LS_COLORS_SOURCE="dircolors"
else
	# Export a custom ls color profile based on LS_COLORS
	export LS_COLORS='bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*.txt=38;5;253:*README=38;5;220;1:*README.rst=38;5;220;1:*README.md=38;5;220;1:*LICENSE=38;5;220;1:*COPYING=38;5;220;1:*INSTALL=38;5;220;1:*COPYRIGHT=38;5;220;1:*AUTHORS=38;5;220;1:*HISTORY=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*PATENTS=38;5;220;1:*VERSION=38;5;220;1:*NOTICE=38;5;220;1:*CHANGES=38;5;220;1:*.log=38;5;190:*.adoc=38;5;184:*.asciidoc=38;5;184:*.etx=38;5;184:*.info=38;5;184:*.markdown=38;5;184:*.md=38;5;184:*.mkd=38;5;184:*.nfo=38;5;184:*.org=38;5;184:*.pod=38;5;184:*.rst=38;5;184:*.tex=38;5;184:*.textile=38;5;184:*.bib=38;5;178:*.json=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.libsonnet=38;5;142:*.ndjson=38;5;178:*.msg=38;5;178:*.pgn=38;5;178:*.rss=38;5;178:*.xml=38;5;178:*.fxml=38;5;178:*.toml=38;5;178:*.yaml=38;5;178:*.yml=38;5;178:*.RData=38;5;178:*.rdata=38;5;178:*.xsd=38;5;178:*.dtd=38;5;178:*.sgml=38;5;178:*.rng=38;5;178:*.rnc=38;5;178:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.db=38;5;60:*.fmp12=38;5;60:*.fp7=38;5;60:*.localstorage=38;5;60:*.mdb=38;5;60:*.mde=38;5;60:*.sqlite=38;5;60:*.typelib=38;5;60:*.nc=38;5;60:*.cbr=38;5;141:*.cbz=38;5;141:*.chm=38;5;141:*.djvu=38;5;141:*.pdf=38;5;141:*.PDF=38;5;141:*.mobi=38;5;141:*.epub=38;5;141:*.docm=38;5;111;4:*.doc=38;5;111:*.docx=38;5;111:*.odb=38;5;111:*.odt=38;5;111:*.rtf=38;5;111:*.pages=38;5;111:*.odp=38;5;166:*.pps=38;5;166:*.ppt=38;5;166:*.pptx=38;5;166:*.ppts=38;5;166:*.pptxm=38;5;166;4:*.pptsm=38;5;166;4:*.csv=38;5;78:*.tsv=38;5;78:*.numbers=38;5;112:*.ods=38;5;112:*.xla=38;5;76:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.key=38;5;166:*config=1:*cfg=1:*conf=1:*rc=1:*authorized_keys=1:*known_hosts=1:*.ini=1:*.plist=1:*.profile=1:*.bash_profile=1:*.bash_login=1:*.bash_logout=1:*.zshenv=1:*.zprofile=1:*.zlogin=1:*.zlogout=1:*.viminfo=1:*.pcf=1:*.psf=1:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.last-run=1:*.merged-ca-bundle=1:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-project=1:*.sublime-workspace=1:*.tmTheme=1:*.user-ca-bundle=1:*.rstheme=1:*.epf=1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.gitmodules=38;5;240:*.awk=38;5;172:*.bash=38;5;172:*.bat=38;5;172:*.BAT=38;5;172:*.sed=38;5;172:*.sh=38;5;172:*.zsh=38;5;172:*.vim=38;5;172:*.kak=38;5;172:*.ahk=38;5;41:*.py=38;5;41:*.ipynb=38;5;41:*.xsh=38;5;41:*.rb=38;5;41:*.gemspec=38;5;41:*.pl=38;5;208:*.PL=38;5;160:*.pm=38;5;203:*.t=38;5;114:*.msql=38;5;222:*.mysql=38;5;222:*.pgsql=38;5;222:*.sql=38;5;222:*.tcl=38;5;64;1:*.r=38;5;49:*.R=38;5;49:*.gs=38;5;81:*.clj=38;5;41:*.cljs=38;5;41:*.cljc=38;5;41:*.cljw=38;5;41:*.scala=38;5;41:*.sc=38;5;41:*.dart=38;5;51:*.asm=38;5;81:*.cl=38;5;81:*.lisp=38;5;81:*.rkt=38;5;81:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.lua=38;5;81:*.moon=38;5;81:*.c=38;5;81:*.C=38;5;81:*.h=38;5;110:*.H=38;5;110:*.tcc=38;5;110:*.c++=38;5;81:*.h++=38;5;110:*.hpp=38;5;110:*.hxx=38;5;110:*.ii=38;5;110:*.M=38;5;110:*.m=38;5;110:*.cc=38;5;81:*.cs=38;5;81:*.cp=38;5;81:*.cpp=38;5;81:*.cxx=38;5;81:*.cr=38;5;81:*.go=38;5;81:*.f=38;5;81:*.F=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.f90=38;5;81:*.F90=38;5;81:*.f95=38;5;81:*.F95=38;5;81:*.f03=38;5;81:*.F03=38;5;81:*.f08=38;5;81:*.F08=38;5;81:*.nim=38;5;81:*.nimble=38;5;81:*.s=38;5;110:*.S=38;5;110:*.rs=38;5;81:*.scpt=38;5;219:*.swift=38;5;219:*.sx=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.hi=38;5;110:*.hs=38;5;81:*.lhs=38;5;81:*.agda=38;5;81:*.lagda=38;5;81:*.lagda.tex=38;5;81:*.lagda.rst=38;5;81:*.lagda.md=38;5;81:*.agdai=38;5;110:*.zig=38;5;81:*.v=38;5;81:*.pyc=38;5;240:*.tf=38;5;168:*.tfstate=38;5;168:*.tfvars=38;5;168:*.css=38;5;125;1:*.less=38;5;125;1:*.sass=38;5;125;1:*.scss=38;5;125;1:*.htm=38;5;125;1:*.html=38;5;125;1:*.jhtm=38;5;125;1:*.mht=38;5;125;1:*.eml=38;5;125;1:*.mustache=38;5;125;1:*.coffee=38;5;074;1:*.java=38;5;074;1:*.js=38;5;074;1:*.mjs=38;5;074;1:*.jsm=38;5;074;1:*.jsp=38;5;074;1:*.php=38;5;81:*.ctp=38;5;81:*.twig=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*Dockerfile=38;5;155:*.dockerignore=38;5;240:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:*.nix=38;5;155:*.dhall=38;5;178:*.rake=38;5;155:*.am=38;5;242:*.in=38;5;242:*.hin=38;5;242:*.scan=38;5;242:*.m4=38;5;242:*.old=38;5;242:*.out=38;5;242:*.SKIP=38;5;244:*.diff=48;5;197;38;5;232:*.patch=48;5;197;38;5;232;1:*.bmp=38;5;97:*.dicom=38;5;97:*.tiff=38;5;97:*.tif=38;5;97:*.TIFF=38;5;97:*.cdr=38;5;97:*.flif=38;5;97:*.gif=38;5;97:*.icns=38;5;97:*.ico=38;5;97:*.jpeg=38;5;97:*.JPG=38;5;97:*.jpg=38;5;97:*.nth=38;5;97:*.png=38;5;97:*.psd=38;5;97:*.pxd=38;5;97:*.pxm=38;5;97:*.xpm=38;5;97:*.webp=38;5;97:*.ai=38;5;99:*.eps=38;5;99:*.epsf=38;5;99:*.drw=38;5;99:*.ps=38;5;99:*.svg=38;5;99:*.avi=38;5;114:*.divx=38;5;114:*.IFO=38;5;114:*.m2v=38;5;114:*.m4v=38;5;114:*.mkv=38;5;114:*.MOV=38;5;114:*.mov=38;5;114:*.mp4=38;5;114:*.mpeg=38;5;114:*.mpg=38;5;114:*.ogm=38;5;114:*.rmvb=38;5;114:*.sample=38;5;114:*.wmv=38;5;114:*.3g2=38;5;115:*.3gp=38;5;115:*.gp3=38;5;115:*.webm=38;5;115:*.gp4=38;5;115:*.asf=38;5;115:*.flv=38;5;115:*.ts=38;5;115:*.ogv=38;5;115:*.f4v=38;5;115:*.VOB=38;5;115;1:*.vob=38;5;115;1:*.ass=38;5;117:*.srt=38;5;117:*.ssa=38;5;117:*.sub=38;5;117:*.sup=38;5;117:*.vtt=38;5;117:*.3ga=38;5;137;1:*.S3M=38;5;137;1:*.aac=38;5;137;1:*.amr=38;5;137;1:*.au=38;5;137;1:*.caf=38;5;137;1:*.dat=38;5;137;1:*.dts=38;5;137;1:*.fcm=38;5;137;1:*.m4a=38;5;137;1:*.mod=38;5;137;1:*.mp3=38;5;137;1:*.mp4a=38;5;137;1:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.opus=38;5;137;1:*.s3m=38;5;137;1:*.sid=38;5;137;1:*.wma=38;5;137;1:*.ape=38;5;136;1:*.aiff=38;5;136;1:*.cda=38;5;136;1:*.flac=38;5;136;1:*.alac=38;5;136;1:*.mid=38;5;136;1:*.midi=38;5;136;1:*.pcm=38;5;136;1:*.wav=38;5;136;1:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.afm=38;5;66:*.fon=38;5;66:*.fnt=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.ttf=38;5;66:*.otf=38;5;66:*.woff=38;5;66:*.woff2=38;5;66:*.PFA=38;5;66:*.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.WARC=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*.apk=38;5;215:*.ipa=38;5;215:*.deb=38;5;215:*.rpm=38;5;215:*.jad=38;5;215:*.jar=38;5;215:*.ear=38;5;215:*.war=38;5;215:*.cab=38;5;215:*.pak=38;5;215:*.pk3=38;5;215:*.vdf=38;5;215:*.vpk=38;5;215:*.bsp=38;5;215:*.dmg=38;5;215:*.crx=38;5;215:*.xpi=38;5;215:*.iso=38;5;124:*.img=38;5;124:*.bin=38;5;124:*.nrg=38;5;124:*.qcow=38;5;124:*.fvd=38;5;124:*.sparseimage=38;5;124:*.toast=38;5;124:*.vcd=38;5;124:*.vdi=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vfd=38;5;124:*.vmdk=38;5;124:*.swp=38;5;244:*.swo=38;5;244:*.tmp=38;5;244:*.sassc=38;5;244:*.pacnew=38;5;33:*.un~=38;5;241:*.orig=38;5;241:*.BUP=38;5;241:*.bak=38;5;241:*.o=38;5;241:*core=38;5;241:*.mdump=38;5;241:*.rlib=38;5;241:*.dll=38;5;241:*.aria2=38;5;241:*.dump=38;5;241:*.stackdump=38;5;241:*.zcompdump=38;5;241:*.zwc=38;5;241:*.part=38;5;239:*.r[0-9]{0,2}=38;5;239:*.zx[0-9]{0,2}=38;5;239:*.z[0-9]{0,2}=38;5;239:*.pid=38;5;248:*.state=38;5;248:*lockfile=38;5;248:*lock=38;5;248:*.err=38;5;160;1:*.error=38;5;160;1:*.stderr=38;5;160;1:*.pcap=38;5;29:*.cap=38;5;29:*.dmp=38;5;29:*.allow=38;5;112:*.deny=38;5;196:*.service=38;5;45:*@.service=38;5;45:*.socket=38;5;45:*.swap=38;5;45:*.device=38;5;45:*.mount=38;5;45:*.automount=38;5;45:*.target=38;5;45:*.path=38;5;45:*.timer=38;5;45:*.snapshot=38;5;45:*.lnk=38;5;39:*.application=38;5;116:*.cue=38;5;116:*.description=38;5;116:*.directory=38;5;116:*.m3u=38;5;116:*.m3u8=38;5;116:*.md5=38;5;116:*.properties=38;5;116:*.sfv=38;5;116:*.theme=38;5;116:*.torrent=38;5;116:*.urlview=38;5;116:*.webloc=38;5;116:*.asc=38;5;192;3:*.bfe=38;5;192;3:*.enc=38;5;192;3:*.gpg=38;5;192;3:*.signature=38;5;192;3:*.sig=38;5;192;3:*.p12=38;5;192;3:*.pem=38;5;192;3:*.pgp=38;5;192;3:*.p7s=38;5;192;3:*id_dsa=38;5;192;3:*id_rsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*.32x=38;5;213:*.cdi=38;5;213:*.fm2=38;5;213:*.rom=38;5;213:*.sav=38;5;213:*.st=38;5;213:*.a00=38;5;213:*.a52=38;5;213:*.A64=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.adf=38;5;213:*.atr=38;5;213:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gel=38;5;213:*.gg=38;5;213:*.ggl=38;5;213:*.ipk=38;5;213:*.j64=38;5;213:*.nds=38;5;213:*.nes=38;5;213:*.sms=38;5;213:*.8xp=38;5;121:*.8eu=38;5;121:*.82p=38;5;121:*.83p=38;5;121:*.8xe=38;5;121:*.stl=38;5;216:*.dwg=38;5;216:*.ply=38;5;216:*.wrl=38;5;216:*.xib=38;5;208:*.iml=38;5;166:*.DS_Store=38;5;239:*.localized=38;5;239:*.CFUserTextEncoding=38;5;239:*CodeResources=38;5;239:*PkgInfo=38;5;239:*.nib=38;5;57:*.car=38;5;57:*.dylib=38;5;241:*.entitlements=1:*.pbxproj=1:*.strings=1:*.storyboard=38;5;196:*.xcconfig=1:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.pot=38;5;7:*.pcb=38;5;7:*.mm=38;5;7:*.gbr=38;5;7:*.scm=38;5;7:*.xcf=38;5;7:*.spl=38;5;7:*.Rproj=38;5;11:*.sis=38;5;7:*.1p=38;5;7:*.3p=38;5;7:*.cnc=38;5;7:*.def=38;5;7:*.ex=38;5;7:*.example=38;5;7:*.feature=38;5;7:*.ger=38;5;7:*.ics=38;5;7:*.map=38;5;7:*.mf=38;5;7:*.mfasl=38;5;7:*.mi=38;5;7:*.mtx=38;5;7:*.pc=38;5;7:*.pi=38;5;7:*.plt=38;5;7:*.rdf=38;5;7:*.ru=38;5;7:*.sch=38;5;7:*.sty=38;5;7:*.sug=38;5;7:*.tdy=38;5;7:*.tfm=38;5;7:*.tfnt=38;5;7:*.tg=38;5;7:*.vcard=38;5;7:*.vcf=38;5;7:*.xln=38;5;7:'
	_LS_COLORS_SOURCE="Custom Colors"
fi


if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/custom.sh; do
  if [ -r  ]; then
      . $i
    fi
  done
  unset i
fi
EOF
) >> ~/.bashrc
source ~/.bashrc 2>1& > /dev/null

echo "#########################"
echo "##     Install deb     ##"
echo "#########################"
cd /bin
curl -O https://github.com/dczinil/linux/blob/master/script/bash/dpkg-url.sh
chmod u+x dpkg-url.sh
mkdir -p /tpm/installdeb
cd /tpm/installdeb

echo "#########################"
echo "##    Install VMware   ##"
echo "#########################"
curl -O https://download.virtualbox.org/virtualbox/7.0.4/virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb
dpkg -i virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb

echo "#########################"
echo "##    Install VMware   ##"
echo "#########################"
wget -c "https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid_0.8.0_amd64.deb"
dpkg -i vivid_0.8.0_amd64.deb


echo "#########################"
echo "##    Install VMware   ##"
echo "#########################"
curl -O https://www.vmware.com/go/getworkstation-linux/VMware-Workstation-Full-17.0.0-20800274.x86_64.bundle
chmod u+x VMware-Workstation-Full-17.0.0-20800274.x86_64.bundle
./VMware-Workstation-Full-17.0.0-20800274.x86_64.bundle

echo "#########################"
echo "##    Install  VScode  ##"
echo "#########################"
curl -O https://az764295.vo.msecnd.net/stable/e8a3071ea4344d9d48ef8a4df2c097372b0c5161/code_1.74.2-1671533413_amd64.deb

echo "#########################"
echo "##   Install Anydesk   ##"
echo "#########################"
curl -O https://download.anydesk.com/linux/anydesk_6.2.1-1_amd64.deb
dpkg -i anydesk_6.2.1-1_amd64.deb
(
cat <<EOF
# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncomment the line below to force the login screen to use Xorg
WaylandEnable=false

# Enabling automatic login
#  AutomaticLoginEnable = true
#  AutomaticLogin = user1

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
EOF
) > /etc/gdm3/custom.conf

echo "#########################"
echo "## Install Displaylink ##"
echo "#########################"
curl -O https://www.synaptics.com/sites/default/files/exe_files/2022-08/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.6.1-EXE.zip

echo "#########################"
echo "##    Install Chrome   ##"
echo "#########################"
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

ssh-keygen -t ed25519 -f $HOME/.ssh/github/git
cd /tpm/installdeb/
rm -rf anydesk_6.2.1-1_amd64.deb code_1.74.2-1671533413_amd64.deb google-chrome-stable_current_amd64.deb virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb VMware-Workstation-Full-17.0.0-20800274.x86_64.bundle
