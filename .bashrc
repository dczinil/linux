# .bashrc editd
# Modified version. No system data.

# Alias definitions
if [ -f /bash_aliases]; then
	. /.bash_aliases
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# PS1
export PS1='\[\e[0m\][\[\e[0;38;5;51m\]\u\[\e[0m\]@\[\e[0;38;5;51m\]\h \[\e[0;38;5;201m\]\W\[\e[0m\]]\[\e[0;5m\]🚀 \[\e[0;38;5;196m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]'
