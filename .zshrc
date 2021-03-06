# export TERM="screen-256color"
export TERM="xterm-256color"
 ZSH_TMUX_AUTOSTART=true
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/danai/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="┏━"
 POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="┗┫"
POWERLEVEL9K_BATTERY_STAGES=(
   $'▏    ▏' $'▎    ▏' $'▍    ▏' $'▌    ▏' $'▋    ▏' $'▊    ▏' $'▉    ▏' $'█    ▏'
   $'█▏   ▏' $'█▎   ▏' $'█▍   ▏' $'█▌   ▏' $'█▋   ▏' $'█▊   ▏' $'█▉   ▏' $'██   ▏'
   $'██   ▏' $'██▎  ▏' $'██▍  ▏' $'██▌  ▏' $'██▋  ▏' $'██▊  ▏' $'██▉  ▏' $'███  ▏'
   $'███  ▏' $'███▎ ▏' $'███▍ ▏' $'███▌ ▏' $'███▋ ▏' $'███▊ ▏' $'███▉ ▏' $'████ ▏'
   $'████ ▏' $'████▎▏' $'████▍▏' $'████▌▏' $'████▋▏' $'████▊▏' $'████▉▏' $'█████▏' )
POWERLEVEL9K_LINUX_ICON=$'\uf17c'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh dir_writable anaconda dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs  battery os_icon root_indicator vi_mode) #date time
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=(\{)
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=(\})

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    extract
    colored-man-pages
    command-not-found
    common-aliases
    copyfile
    cp
    #vi-mode
    sudo
    httpie
    git
    github
    tmux
    docker
    ruby
    gem
    github
    debian
    node
    npm
    python
    pip
    sprunge
    tmux
    web-search
    pj
)

PROJECT_PATHS=(~/Projects)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
    # export EDITOR='vim'
# else
    # export EDITOR='nvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll="exa -hgl --git"
alias la="exa -hgla --git"
alias ls="exa -hglG --git"
alias l="exa -hglG --git"

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/danai/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
bindkey "^R" history-incremental-search-backward
set -o vi

# End of lines configured by zsh-newuser-install# pack into archive

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

pk () {
    if [ $1 ] ; then
        case $1 in
            tbz)        tar cjvf $2.tar.bz2 $2      ;;
            tarbz2)     tar cjvf $2.tar.bz2 $2      ;;
            tar.bz2)    tar cjvf $2.tar.bz2 $2      ;;
            tgz)        tar czvf $2.tar.gz  $2      ;;
            targz)      tar czvf $2.tar.gz  $2      ;;
            tar.gz)     tar czvf $2.tar.gz  $2      ;;
            tar)        tar cpvf $2.tar  $2         ;;
            bz2)        bzip $2                     ;;
            gz)         gzip -c -9 -n $2 > $2.gz    ;;
            zip)        zip -r $2.zip $2            ;;
            7z)         7z a $2.7z $2               ;;
            *)          echo "'$1' cannot be packed via pk()";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# miniconda3 support
export PATH=/home/danai/miniconda3/bin:$PATH

fpath+=${ZDOTDIR:-~}/.zsh_functions

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

