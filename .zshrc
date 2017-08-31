# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="awtf"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gem rails github)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# GPG
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

# Aliases
alias vim='mvim -v'
alias gc='git commit -S'
alias ghs='git flow hotfix start'
alias ghf='git flow hotfix finish'
alias ghsd="git flow hotfix start data_correction$(date +%d%m)"
alias ghfd="git flow hotfix finish data_correction$(date +%d%m)"
alias rgm="rails generate migration"
alias rgminbank="rails generate migration FixInbankIssues$(date +%d%m)"
alias rgmstl="rails generate migration FixSihtlaenIssues$(date +%d%m)"
alias rgmlatvia="rails generate migration FixLatviaIssues$(date +%d%m)"
alias rspec="bin/rspec"
alias rcov="rake cov"
alias dbset="sed -i '' \"s/^LENDIFY_DBHOST=.*/LENDIFY_DBHOST=$(ifconfig en0 | grep "inet " | awk '{print $2}')/g\" .env"

# Docker aliases
alias drs='docker-compose up app nginx'
alias dbuild='SKEY="$(< ~/.ssh/id_rsa)"; export SKEY; dbset; docker-compose up --build app nginx'
alias dup="docker-compose up"
alias drc="docker-compose run --rm app rails c"
alias drun="docker-compose run --rm app"
alias drdm="docker-compose run --rm app rake db:migrate"
alias drdr="docker-compose run --rm app rake db:rollback"
alias dpry="docker attach lendify_app_1"
alias dstop="docker-compose stop"
alias sdocker=sdocker_connect

# AWS CLI aliases
alias gips=describe_instances

# CD aliases
alias wallester="cd /Users/andres1/Projects/personal/go/src/github.com/wallester"
alias mgo="cd /Users/andres1/Projects/personal/go/src/github.com/midN"
alias lendify="cd /Users/andres1/Projects/lendify"
alias invo="cd /Users/andres1/Projects/invo"
alias cf="cd /Users/andres1/Projects/infrastructure/cloudformation"
alias wcf="cd /Users/andres1/Projects/wallester/infrastructure"
alias nginx="cd /Users/andres1/Projects/dockerimages/nginx"

describe_instances() {
  if [ $1 ]
  then
    aws --profile $1 ec2 describe-instances --query 'Reservations[?Instances[?Tags[?Key == `Stack`].Value | [0] != `Main`]].Instances[].{Name:Tags[?Key==`Name`].Value | [0], Ip:PrivateIpAddress, Status:State.Name, UserData:Tags[?Key==`UserData`].Value | [0]}.sort_by(@, &Name)' --output table
  else
    aws ec2 describe-instances --query 'Reservations[?Instances[?Tags[?Key == `Stack`].Value | [0] != `Main`]].Instances[].{Name:Tags[?Key==`Name`].Value | [0], Ip:PrivateIpAddress, Status:State.Name, UserData:Tags[?Key==`UserData`].Value | [0]}.sort_by(@, &Name)' --output table
  fi
}

sdocker_connect(){
  if [ "$#" -eq 3 ]
  then
    ssh $3@$1 -o ProxyCommand="ssh $2 nc $1 22"
  elif [ "$#" -eq 4 ]
  then
    ssh $3@$1 -o ProxyCommand="ssh $2 nc $1 $4"
  else
    ssh ec2-user@$1 -o ProxyCommand="ssh $2 nc $1 22"
  fi
}

lmigra(){
  vim db/migrate/$(ls db/migrate/ | sort | tail -1)
}

dclean(){
    docker rm -v $(docker ps -f status=exited -f exited=1 -f exited=2 -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

drm_hard(){
    docker rm -v $(docker ps -a -q 2>/dev/null)
}

# GitSome
autoload bashcompinit
bashcompinit
source ~/.gh_complete.sh

# Docker
# eval $(docker-machine env)
export COMPOSE_HTTP_TIMEOUT=20000

# GOLANG
export GOPATH=/Users/andres1/Projects/personal/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/usr/local/go/bin"
fpath=(~/.zsh/completion $fpath) autoload -Uz compinit && compinit -i

# on OS X with GPGTools, comment out the next line:
eval $(ssh-agent)
eval $(gpg-agent --daemon)
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi
