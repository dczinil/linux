#!/bin/bash/
##/data/data/com.termux/files/usr/bash/
#######################################
## Desktop emvironment provisioning  ##
##           and development         ##
#######################################

mkdir -p $HOME/pro
mkdir -p $HOME/.fonts

cd $HOME/pro/
git clone https://github.com/dczinil/linux.git
git clone https://github.com/dczinil/pages.git
git clone https://github.com/dczinil/vagrant.git
git clone https://github.com/dczinil/ansible.git
git clone https://github.com/dczinil/python.git
git clone https://github.com/dczinil/dczinil.git
git clone https://github.com/dczinil/git.git
git clone https://github.com/dczinil/docker.git
git clone https://github.com/dczinil/dczinil.github.io.git

install -y  exa nmap net-tools git htop vim tree curl \
            wget xclip openssh-server apt-transport-https \
            ca-certificates gnupg software-properties-common \
            vagrant podman buildah skopeo python3-argcomplete



SSH_PASSPHRASE=$1
#Git credentials
GIT_AUTHOR_NAME=$2
GIT_COMMITER_NAME="$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL=$3
GIT_COMMITER_EMAIL="$GIT_AUTHOR_EMAIL"

echo "SSH Configuration"
echo "Warning... An SSH paaword will be generated with a specific name and revealing its utility."
echo "The flags "-q" make it silent and "-P" make it not use a phrase."
ssh-keygen -t ed25519 -C "$GIT_AUTHOR_EMAIL" -f $HOME/.ssh/id_github -q -P "$SSH_PASSPHRASE"

echo "Git Configuration"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.editor vim

##Link
ln -s $HOME/pro/linux/dotfiles-kraken/custom.sh /etc/profile.d/

#.fonts
git clone http://github.com/gabrielelana/awesome-terminal-fonts $HOME/pro/awesome-terminal-fonts
git checkout patching-strategy
mkdir -p ~/.fonts/{Droid-Sans-Mono,Inconsolata,Source-Code-Pro}
cp patched/SourceCodePro+Powerline+Awesome+Regular.ttf ~/.fonts/Source-Code-Pro
cp patched/Droid+Sans+Mono+Awesome.ttf ~/.fonts/Droid-Sans-Mono
cp patched/Inconsolata+Awesome.ttf ~/.fonts/Inconsolata
cp ~/.fonts/* /usr/share/fonts/truetype
fc-cache -fv ~/.fonts

#.oh-my-git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git && echo source ~/.oh-my-git/prompt.sh >> ~/.bashrc

#dotfiles local
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.gitconfig $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/git-completion.bash $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/ $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vim $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vimrc $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.bash_aliases $HOME/

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.bashrc
nvm install --lts

#Golang
cd $HOME/pro/
wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
go version

#Python3-pip
python3 -m pip install --upgrade pip

        ##Ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
activate-global-python-argcomplete3 --user

#Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Docker
add-apt-repository ppa:gns3/ppa
dpkg --add-architecture i386
apt install -y gns3-gui gns3-server gns3-iou
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] 
    https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev
    /null
    chmod a+r /etc/apt/keyrings/docker.gpg
sudo usermod -aG docker $USER

#Github gh
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/gith
  ubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
      gh auth login --web
#Terraform
        
        ##Ubuntu
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install -y terraform
        
        ##CentOS/RHEL/Fedora
#sudo dnf install -y dnf-plugins-core
#sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
#sudo dnf -y install terraform
