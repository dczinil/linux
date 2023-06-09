#!/bin/bash
#installation file for fedora
#<!------------------------------!>#
#     Create Directory Basic
#<!------------------------------!>#
mkdir -p $HOME/{.local{bin},local{bin},bin,.config,.bash_completion.d,pro,.fonts/{Droid-Sans-Mono,Inconsolata,Source-Code-Pro},go/{bin,pkg,src}}
mkdir -p /etc/ansible
#<!-----------------!>#
#     UPDATE OS
#<!-----------------!>#
export PATH=$PATH:$HOME/pro/git-scriptssudo dnf check
sudo dnf update -y
sudo dnf install exa nmap packer gh git htop vim tree curl wget xclip openssl openssh-server tree grc ca-certificates gnupg podman buildah skopeo python3-pip gnome-tweaks 2>/dev/null
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 2>/dev/null
sudo dnf instalar https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 2>/dev/null
sudo dnf group update core
#<!-------------------------!>#
#     Install VirtualBox
#<!-------------------------!>#
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
#<!--------------------!>#
#     Install KVM
#<!--------------------!>#
sudo dnf install @virtualization
sudo dnf group install --with-optional virtualization
sudo dnf install qemu*
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
#<!-----------------------------------!>#
#     Install and config Vagrant
#<!-----------------------------------!>#
sudo dnf install vagrant vagrant-libvirt -y
vagrant autocomplete install --bash
#<!--------------------!>#
#     Config SSH Git
#<!--------------------!>#
echo "SSH Configuration"
echo "Warning... An SSH paaword will be generated with a specific name and revealing its utility."
echo "The flags "-q" make it silent and "-P" make it not use a phrase."
ssh-keygen -t ed25519 -C "$GIT_AUTHOR_EMAIL" -f $HOME/.ssh/id_github -q -P "$SSH_PASSPHRASE"
#<!-------------------------!>#
#     Config Git Global
#<!-------------------------!>#
echo "Git Configuration"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.editor vim
#<!-------------------------!>#
#     Install NVM and TLS
#<!-------------------------!>#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install --tls
#<!-------------------------!>#
#     Download Repo
#<!-------------------------!>#
cd $HOME/pro/
git clone https://github.com/dczinil/linux.git
git clone https://github.com/dczinil/pages.git
git clone https://github.com/dczinil/vagrant.git
git clone https://github.com/dczinil/ansible.git
git clone https://github.com/dczinil/python.git
git clone https://github.com/dczinil/dczinil.git
git clone https://github.com/dczinil/git.git
git clone https://github.com/dczinil/docker.git
git clone https://github.com/dczinil.github.io.git
git clone https://github.com/jwiegley/git-scripts.git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git && echo source ~/.oh-my-git/prompt.sh >> ~/.bashrc
#<!------------------------------!>#
#     Install Cargo and vivid
#<!------------------------------!>#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install vivid
#<!--------------!>#
#     .fonts
#<!--------------!>#
git clone http://github.com/gabrielelana/awesome-terminal-fonts $HOME/pro/awesome-terminal-fonts
cd $HOME/pro/awesome-terminal-fonts
git checkout patching-strategy
source inconsolata.sh
fc-cache -fv ~/.fonts
#<!--------------!>#
#     Link
#<!--------------!>#
sudo ln -sf $HOME/pro/linux/dotfiles-kraken/custom.sh /etc/profile.d/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.gitconfig $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/git-completion.bash $HOME/.bash_completion.d/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vim $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vim /root/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vimrc $HOME/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.vimrc /root/
sudo ln -fs $HOME/pro/linux/dotfiles-kraken/.bash_aliases $HOME/
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
#<!-------------------!>#
#     Install Go
#<!-------------------!>#
cd $HOME/pro/
wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
go version
sudo rm -rf go1.19.4.linux-amd64.tar.gz
#<!-------------------!>#
#     Python3-pip
#<!-------------------!>#
python3 -m pip install --upgrade pip
#<!-------------------!>#
#     Ansible
#<!-------------------!>#
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
python3 -m pip install --user argcomplete
sudo activate-global-python-argcomplete --user
ansible-config init --disabled -t all > /etc/ansible/ansible.cfg
#<!-------------------!>#
#     Install Docker
#<!-------------------!>#
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl start docker
#<!------------------------!>#
#     Install Terraform
#<!------------------------!>#
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform
echo #<!---------!>#
echo #     END
echo #<!---------!>#
echo "ready paste the public key into https://github.com/settings/keys"
echo "do not copy the url, type it"
xclip -selection clipboard < $HOME/.ssh/id_github.pub