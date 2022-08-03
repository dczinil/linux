# Banner
# https://patorjk.com/software/taag/#p=display&f=Calvin%20S&t=Type%20Something%20
# Calvin S
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╦  ╦╔╗╔╦ ╦═╗ ╦
╠═╣║  ║╠═╣╚═╗  ║  ║║║║║ ║╔╩╦╝
╩ ╩╩═╝╩╩ ╩╚═╝  ╩═╝╩╝╚╝╚═╝╩ ╚═
Comment
# Update file
alias sourcea='source $HOME/.bash_aliases && source $HOME/.profile && source $HOME/.bashrc'
# Remove and confirm
alias rm='rm -i'
# Copy and confirm
alias cp='cp -i'
# Move and confirm
alias mv='mv -i'
# edit .bash_aliase
alias editalias='vim ~/.bash_aliases && sourcea'
# grep .bash_aliase
alias showalias='cat ~/.bash_aliases | grep'
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔═╗╦ ╦╔╦╗╦ ╦╔═╗╔╗╔
╠═╣║  ║╠═╣╚═╗  ╠═╝╚╦╝ ║ ╠═╣║ ║║║║
╩ ╩╩═╝╩╩ ╩╚═╝  ╩   ╩  ╩ ╩ ╩╚═╝╝╚╝
Comment
# Generate virtual version
alias vpy='python3 -m venv venv'
# Active virtual version
alias avenv='source venv/bin/activate'
<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔═╗╦╔╦╗
╠═╣║  ║╠═╣╚═╗  ║ ╦║ ║ 
╩ ╩╩═╝╩╩ ╩╚═╝  ╚═╝╩ ╩ 
Comment
alias branch='git branch -r'
# Initialize repository in current folder
alias ginit='git init'
# Commit
alias gcommit='git commit -m'
# Remove add
alias gremote='git remote add'
# Graphical history of the comments
alias ggraph='git log --all --graph --decorate --oneline'
# Create banch and enter this
alias gcheckb='git checkout -b'
# Push origin
alias gpusho='git push origin'
# Merge
alias gmerge='git merge'
# Clone reporitory
alias gclone='git clone'
# Creates file gitignore
alias gignore='touch .gitignore'

<< 'Comment'
╔═╗╦  ╦╔═╗╔═╗  ╔╦╗╔═╗╔═╗╦╔═╔═╗╦═╗
╠═╣║  ║╠═╣╚═╗   ║║║ ║║  ╠╩╗║╣ ╠╦╝
╩ ╩╩═╝╩╩ ╩╚═╝  ═╩╝╚═╝╚═╝╩ ╩╚═╝╩╚═
Comment
# Stop al running container
alias dstopped='docker stop $(docker ps -aq) 2> /dev/null && docker ps -aq'
# Remove all container
alias dcleanc='docker rm -f $(docker ps -aq) 2> /dev/null  && docker ps -aq'
# Remove all image
alias dcleani='docker rmi image -f $(docker image ls -aq) 2> /dev/null && docker image ls -aq'
# Remove all
alias dcleana='docker rm -f $(docker ps -aq) 2> /dev/null && docker rmi image -f $(docker image ls -aq)  2> /dev/null && docker ps -aq && docker image ls -aq'
# Kills all the detainees
alias dkilld='docker rm $(docker ps --filter status=exited -q)'



