# .bashrc editd
# Modified version. No system data.

# Alias definitions
# .bashrc editd
# Modified version. No system data.
# Alias definitions
if [ -e $HOME/.bash_aliases ]; then
source $HOME/.bash_aliases
fi

# PS1
export PS1='\[\e[0m\][\[\e[0;38;5;51m\]\u\[\e[0m\] \[\e[0;38;5;160m\]\W\[\e[0;38;5;165m\]]\[\e[0m\]:\[\e[0;5;38;5;165m\]🚀\[\e[0;38;5;118m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]'