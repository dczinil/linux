#!/bin/bash/
#!/data/data/com.termux/files/usr/bash/
#######################################
## Desktop emvironment provisioning  ##
##           and development         ##
#######################################

echo "SSH Configuration"
echo "Warning... An SSH paaword will be generated with a specific name and revealing its utility."
echo "The flags "-q" make it silent and "-P" make it not use a phrase."
SSH_PASSPHRASE=$1

ssh-keygen -t ed25519 -C "$GIT_AUTHOR_EMAIL" -f $HOME/.ssh/id_github -q -P "$SSH_PASSPHRASE"

echo "Git credentials"

GIT_AUTHOR_NAME=$2
GIT_COMMITER_NAME="$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL=$3
GIT_COMMITER_EMAIL="$GIT_AUTHOR_EMAIL"

echo "Git Configuration"

git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.editor vim

ssh-keygen -t ed25519 -C "$GIT_AUTHOR_EMAIL"
