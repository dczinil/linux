#!/bin/bash
#installation file for fedora

sudo dnf check
sudo dnf update -y
sudo dnf install exa nmap gh ncli git htop vim tree curl wget xclip openssh-server ca-certificates gnupg vagrant podman buildah skopeo python3-pip 2>/dev/null

mkdir -p $HOME/{pro,.fonts/{Droid-Sans-Mono,Inconsolata,Source-Code-Pro},go/{bin,pkg,src}}

echo "SSH Configuration"
echo "Warning... An SSH paaword will be generated with a specific name and revealing its utility."
echo "The flags "-q" make it silent and "-P" make it not use a phrase."
ssh-keygen -t ed25519 -C "$GIT_AUTHOR_EMAIL" -f $HOME/.ssh/id_github -q -P "$SSH_PASSPHRASE"

echo "Git Configuration"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.editor vim




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
git clone https://github.com/jwiegley/git-scripts.git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git && echo source ~/.oh-my-git/prompt.sh >> ~/.bashrc
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
#Ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
activate-global-python-argcomplete3 --user
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