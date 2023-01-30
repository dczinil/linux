#!/bin/bash
#installation file for fedora

sudo dnf check
sudo dnf update -y
sudo dnf install exa nmap ncli git htop vim tree curl wget xclip openssh-server ca-certificates gnupg vagrant podman buildah skopeo python3-pip 2>/dev/null

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

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install vivid

#.fonts
git clone http://github.com/gabrielelana/awesome-terminal-fonts $HOME/pro/awesome-terminal-fonts
cd $HOME/pro/awesome-terminal-fonts
git checkout patching-strategy
source inconsolata.sh
# fc-cache -fv ~/.fonts


#END
echo "ready paste the public key into https://github.com/settings/keys"
echo "do not copy the url, type it"
xclip -selection clipboard < $HOME/.ssh/id_github.pub