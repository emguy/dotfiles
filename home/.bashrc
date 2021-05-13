if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# bash history configurations
shopt -s histappend #makes bash append to history rather than overwrite
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r" # after each command, append to the history file and reread it
export HISTCONTROL="ignorespace:ignoredups" # ingore duplications
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=50000 # HISTSIZE is the number of cached commands
export HISTFILESIZE=50000 # how many commands can be stored in the . bash_history file

export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export CFLAGS="-march=native -pipe -O2"
export LDFLAGS="-L/home/emguy/.local/lib/"
export CXXFLAGS="${CFLAGS}"
export LESSCOLOR="yes"

export NPM_PACKAGES="$HOME/.npm-global"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export JAVA_HOME="/opt/jdk11"
export MAVEN_HOME="/opt/maven"
export PATH="$HOME/.local/ConTeXt/tex/texmf-linux-64/bin:/opt/node/bin:$NPM_PACKAGES/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

export KUBE_EDITOR="nvim"
export DOCKER_CONFIG="$HOME/.docker"

## essential 
alias ls="ls --color"
alias cp="cp -v"
alias rm="rm -i"
alias mv="mv -i -v"

alias df="df -h"
alias du="du -h"

alias less="less -r"
alias grep="grep --color"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias dic="sdcv"
alias iconv="iconv -f gb18030"

alias gcc="gcc -march=native -pipe -O2"
alias g++="g++ -std=c++11 -march=native -pipe -O2"

#alias ip="ipython3 --no-banner --no-confirm-exit"
#alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

alias vim="nvim"
alias vi="nvim"
alias argbash="docker run -v \$(pwd):/work --rm argbash"
alias argbash-init="docker run -v \$(pwd):/work --rm -e PROGRAM=argbash-init argbash"

if [ -x "$(command -v kubectl)" ]; then
  # shellcheck source=/dev/null
  source <(kubectl completion bash)
fi
if [ -f "$HOME/.bash_customization.sh" ]; then
  # shellcheck source=./.bash_customization.sh
  source "$HOME/.bash_customization.sh"
fi

if [ -f "/etc/profile.d/bash-completion.sh" ]; then
  # shellcheck source=/dev/null
  source "/etc/profile.d/bash-completion.sh"
fi

#if [ -n "$SSH_CLIENT" ] && [ -n "$SSH_CONNECTION" ]; then
  [ -z "$TMUX" ] && { tmux attach &> /dev/null || exec tmux new-session -s main && exit;}
#fi

if [ -d "$HOME/conTeXt" ]; then
  export PATH=/home/emguy/conTeXt/tex/texmf-linux-64/bin:$PATH
fi

#source  $HOME/venv/bin/activate

alias gpm='git add --all && git commit --amend --no-edit && git push origin HEAD:refs/drafts/master'
alias gpd='git add --all && git commit --amend --no-edit && git push origin HEAD:refs/for/develop'
