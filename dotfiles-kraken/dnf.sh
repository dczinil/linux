#!/bin/bash
#installation file for fedora

sudo dnf check
sudo dnf update -y
sudo dnf install exa nmap packer gh git htop vim tree curl wget xclip openssl openssh-server ca-certificates gnupg vagrant vagrant-libvirt podman buildah skopeo python3-pip gnome-tweaks 2>/dev/null
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#Virtualbox
src='https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo'
dst='/etc/yum.repos.d/virtualbox.repo'
sudo curl ${src} > sudo ${dst}
dnf check-update
sudo dnf install VirtualBox-*
sudo dnf install -y virtualbox-guest-additions.x86_64
sudo akmods --kernels 6.1.9-200.fc37.x86_64 && sudo systemctl restart vboxdrv.service
sudo usermod -aG vboxsf $USER
sudo usermod -aG vboxusers $USER
groups $USER | grep -i vbo
##Vagrant autocomplet
vagrant autocomplete install --bash
cat ~/.bashrc | tail -4
#Pro - Golang - Fonts
mkdir -p $HOME/{pro,.fonts/{Droid-Sans-Mono,Inconsolata,Source-Code-Pro},go/{bin,pkg,src}}
#SSH
echo "SSH Configuration"
echo "Warning... An SSH paaword will be generated with a specific name and revealing its utility."
echo "The flags "-q" make it silent and "-P" make it not use a phrase."
ssh-keygen -t ed25519 -C "$GIT_AUTHOR_EMAIL" -f $HOME/.ssh/id_github -q -P "$SSH_PASSPHRASE"
#Git_SSH
echo "Git Configuration"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.editor vim
#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
#pro repo
cd $HOME/pro/
git clone git@github.com:dczinil/linux.git
git clone git@github.com:dczinil/pages.git
git clone git@github.com:dczinil/vagrant.git
git clone git@github.com:dczinil/ansible.git
git clone git@github.com:dczinil/python.git
git clone git@github.com:dczinil/dczinil.git
git clone git@github.com:dczinil/dczinil/git.git
git clone git@github.com:dczinil/docker.git
git clone git@github.com:dczinil/dczinil.github.io.git
git clone git@github.com:jwiegley/git-scripts.git
git clone git@github.com:arialdomartini/oh-my-git.git ~/.oh-my-git && echo source ~/.oh-my-git/prompt.sh >> ~/.bashrc
#Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install vivid
#.fonts
git clone http://github.com/gabrielelana/awesome-terminal-fonts $HOME/pro/awesome-terminal-fonts
cd $HOME/pro/awesome-terminal-fonts
git checkout patching-strategy
source inconsolata.sh
# fc-cache -fv ~/.fonts
##Link
sudo ln -sf $HOME/pro/linux/dotfiles-kraken/custom.sh /etc/profile.d/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.gitconfig $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/git-completion.bash $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vim $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vimrc $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.bash_aliases $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/ansible.cfg
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.hosts_ansible
tee -a ~/.bashrc <<EOF
if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/custom.sh; do
    if [ -r  ]; then
      . $i
    fi
  done
  unset i
fi
EOF
#Golang
cd $HOME/pro/
wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
go version
sudo rm -rf go1.19.4.linux-amd64.tar.gz
#Python3-pip
python3 -m pip install --upgrade pip
#RVM Ruby and Rails
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
curl -sSL https://get.rvm.io | bash -s stable --rails
#Ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
python3 -m pip install --user argcomplete
sudo activate-global-python-argcomplete --user
#ansible-config init --disabled -t all > $HOME/ansible.cfg
#Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl start docker
#Terraform
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform
#END
echo "ready paste the public key into https://github.com/settings/keys"
echo "do not copy the url, type it"
xclip -selection clipboard < $HOME/.ssh/id_github.pub
