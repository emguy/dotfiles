# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export HISTCONTROL="ignorespace:ignoredups"
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=10000
export HISTFILESIZE=5000
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export CFLAGS="-march=native -pipe -O2"
export LDFLAGS="-L/home/emguy/local/lib/"
export CXXFLAGS="${CFLAGS}"
export LESSCOLOR="yes"
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export JAVA_HOME="/opt/jdk1.8.0_221"
export MAVEN_HOME="/opt/apache-maven-3.6.1"

shopt -s histappend #makes bash append to history rather than overwrite

#export CFLAGS="-march=native -pipe -O2 -I/home/emguy/local/include"
#export TEXMFCACHE="/var/cache/texmf-cache"
#export NODE_PATH="/opt/npm/lib/node_modules"

#export PATH="$JAVA_HOME/bin:$HOME/local/bin:$MAVEN_HOME/bin:$HOME/local/gradle/bin:$HOME/local/node/bin:$PATH"
#export PATH="$PATH:/opt/nodejs/bin:/opt/npm/bin:/opt/context/tex/texmf-linux-64/bin:/opt/context/tex/texmf-linux-64/bin"


## essential 
alias ls="ls --color --hide=desktop.ini --hide=ntuser* --hide=NTUSER* --hide=IntelGraphicsProfiles* --hide=*OneDrive* --hide=*Games* --hide=Searches --hide=Videos --hide=Music --hide=Links --hide=Favorites --hide=3D*Objects"
alias cp="cp -v"
alias rm="rm -i"
alias mv="mv -i -v"

alias df="df -h"
alias du="du -h"

alias less="less -r"                          # raw control characters
alias whence="type -a"                        # where, of a sort
alias grep="grep --color"                     # show differences in colour
alias egrep="egrep --color=auto"              # show differences in colour
alias fgrep="fgrep --color=auto"              # show differences in colour

alias dic="sdcv"
alias iconv="iconv -f gb18030"

alias gcc="gcc -march=native -pipe -O2"
alias g++="g++ -std=c++11 -march=native -pipe -O2"

#alias ip="ipython3 --no-banner --no-confirm-exit"

### bash-completion
#[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

alias pip="pip --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org"

#[ -z "$TMUX" ] && { tmux attach &> /dev/null || exec tmux new-session -s main && exit;}

#alias nvim="$HOME/local/nvim/bin/nvim"
#alias vim="nvim"
#alias vi="nvim"

export PATH="$JAVA_HOME/bin:$MAVEN_HOME/bin:$HOME/local/bin:$PATH"
export PATH=/home/emguy/local/ConTeXt/tex/texmf-linux-64/bin:$PATH
