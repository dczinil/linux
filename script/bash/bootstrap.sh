#!/bin/bash/
#!/data/data/com.termux/files/usr/bash/
#######################################
## Desktop emvironment provisioning  ##
##           and development         ##
#######################################

update
upgrade -y
install -y  exa nmap net-tools git htop vim tree curl \
            wget xclip openssh-server apt-transport-https \
            ca-certificates gnupg software-properties-common \
            vagran teraform ansible

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
