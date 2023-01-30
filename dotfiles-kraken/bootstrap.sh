#!/bin/sh/
##/data/data/com.termux/files/usr/bash/
#######################################
## Desktop emvironment provisioning  ##
##           and development         ##
#######################################


###ENV GIT
stty -echo
printf "SSH PASSPHRASE: "
read SSH_PASSPHRASE
stty echo
echo
printf "Git Nickname: "
read GIT_AUTHOR_NAME
printf "Git Mail: "
read GIT_AUTHOR_EMAIL

export SSH_PASSPHRASE GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL

#SSH_PASSPHRASE=$1
#Git credentials
#GIT_AUTHOR_NAME=$2
#GIT_COMMITER_NAME="$GIT_AUTHOR_NAME"
#GIT_AUTHOR_EMAIL=$3
#GIT_COMMITER_EMAIL="$GIT_AUTHOR_EMAIL"
# #Docker
# add-apt-repository ppa:gns3/ppa
# dpkg --add-architecture i386
# apt install -y gns3-gui gns3-server gns3-iou
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] 
#     https://download.docker.com/linux/ubuntu \
#         $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev
#     /null
#     chmod a+r /etc/apt/keyrings/docker.gpg
# sudo usermod -aG docker $USER
# #Github gh
# type -p curl >/dev/null || sudo apt install curl -y
# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
#   && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
#   && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/gith
#   ubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
#     && sudo apt update \
#     && sudo apt install gh -y
# #Terraform
#         ##Ubuntu
# wget -O- https://apt.releases.hashicorp.com/gpg | \
#     gpg --dearmor | \
#     sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# gpg --no-default-keyring \
#     --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
#     --fingerprint
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
#     https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
#     sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo apt update
# sudo apt install -y terraform
# install -y  exa nmap net-tools git htop vim tree curl \
#             wget xclip openssh-server apt-transport-https \
#             ca-certificates gnupg software-properties-common \
#             vagrant podman buildah skopeo python3-argcomplete