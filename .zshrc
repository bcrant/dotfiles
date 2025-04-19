#
# Stylize Terminal
#
function precmd() {
        echo
}
PROMPT="
%B%F{green}%n%f%b %F{blue}%~ $%f "


#
# Preserve History
#
# Do this first so changes in .zshrc don't accidentally
# result in my precious .zsh_history getting deleted
#
HISTFILE=~/.zsh_history
HISTSIZE=99999999
HISTFILESIZE=99999999
SAVEHIST=99999999
setopt INC_APPEND_HISTORY


#
# Modify $PATH
#
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export JAVA_HOME="/opt/homebrew/Cellar/openjdk@11/11.0.19/libexec/openjdk.jdk/Contents/Home"
export SPARK_HOME="/opt/homebrew/Cellar/apache-spark/3.4.0/libexec/"
export PATH="$JAVA_HOME:$SPARK_HOME:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

export PATH="/opt/homebrew/opt/go@1.19/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"


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

alias k="kubectl"
alias kctx='kubectl config get-contexts'
alias kgp='kubectl get pods'

alias lsa="ls -la --color"
alias lsd='ls -la --color | grep "^d"'

alias lscpu="sysctl -a | grep cpu | grep hw"
alias nproc="sysctl -n hw.physicalcpu"

alias loadenv='export $(grep -v "^#" .env | xargs)'
alias ls2list='python -c "import glob, pprint; pprint.pprint(sorted(glob.glob(\"$PWD/*\")), sort_dicts=True)"'
alias rmds='find . -name ".DS_Store" -delete'
alias s2d='TZ=utc date -j -r '
alias zipenvs='mkdir -p envs && for f in $(ls -a | grep ".env") ; do cp $f ./envs/dot$f ; done && zip -r envs.zip envs && rm -rf envs'


#
# Load Interpreters and mcfly
#
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(mcfly init zsh)"
