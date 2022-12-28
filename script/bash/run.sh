#!/bin/bash

echo "########################"
echo "## create repo folder ##"
echo "########################"

mkdir -p /tmp/{installdeb,installrun,installgit,installtar}

apt update
apt upgrade -y
apt install -y exa nmap net-tools git htop vim tree curl wget xclip openssh-server apt-transport-https ca-certificates gnupg software-properties-common

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
wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
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
