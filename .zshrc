#
# Stylize Terminal
#
function precmd() {echo}
PROMPT="
%B%F{green}%n%f%b %F{blue}%~ $%f "


#
# Preserve History
#
# Do this first so changes in .zshrc don't accidentally
# result in my precious .zsh_history getting deleted
#
HISTFILE=~/.zsh_history
export HISTSIZE=99999999
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY


#
# Modify $PATH
#
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

#
# Golang
#
# export PATH="/opt/homebrew/opt/go@1.19/bin:$PATH"
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

#
# Java & Spark
#
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@11/11.0.19/libexec/openjdk.jdk/Contents/Home"
# export SPARK_HOME="/opt/homebrew/Cellar/apache-spark/3.4.0/libexec/"
# export PATH="$JAVA_HOME:$SPARK_HOME:$PATH"
# export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

#
# Python
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

#
# Ruby
#
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"


#
# Aliases
#
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

alias gb="git branch -vv"
alias gl='git log \
	--pretty=format:"%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]" \
	--decorate \
	--date=short'
alias gr="git reset --soft HEAD~1"
alias gs="git status"

alias grepjs='grep --exclude-dir "*/node_modules" --exclude "*.json"'
alias greptf='grep --exclude-dir "*/.terraform/*" --exclude "*.md" --exclude "*.y*ml" --exclude "*examples*"'

alias k="kubectl"
alias kctx='kubectl config get-contexts'
alias kgp='kubectl get pods'

alias lower="tr '[:upper:] [:lower:]'"
alias lsa="ls -la --color"
alias lsd='ls -la --color | grep "^d"'

alias lscpu="sysctl -a | grep cpu | grep hw"
alias nproc="sysctl -n hw.physicalcpu"

alias loadenv='export $(grep -v "^#" .env | xargs)'
alias rmds='find . -name ".DS_Store" -delete'
alias s2d='TZ=utc date -j -r '
alias zipenvs='mkdir -p envs && for f in $(ls -a | grep ".env") ; do cp $f ./envs/dot$f ; done && zip -r envs.zip envs && rm -rf envs'


#
# Constants
#
export AWS_REGION="us-west-2"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export PS4='+(%x:%I): %N(%i): '


#
# Load Auto Completions
#
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit


#
# Load Version Managers
#
# NodeJS = fnm
# Python = pyenv
#
eval "$(fnm env --log-level=quiet --use-on-cd)"
eval "$(pyenv init --no-push-path --no-rehash --path zsh)"


#
# Load ZSH History Manager
#
export MCFLY_RESULTS_SORT=LAST_RUN
eval "$(mcfly init zsh)"

typeset -aU path
