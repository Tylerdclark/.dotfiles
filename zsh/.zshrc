################
#  ZSH config  #
################

alias setup-zsh="git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh ~/.config/.oh-my-zsh"

# Path to oh-my-zsh installation.
export ZSH="/Users/tylerclark/.config/.oh-my-zsh"
# For tmux
export EDITOR='vim'

ZSH_THEME="agkozak"


# Command auto-correction.
ENABLE_CORRECTION="true"

# To display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# For wildcard tabs
# setopt NO_CASE_GLOB

# this is for autocompletions

autoload -U compinit && compinit 
#source path/to/zsh-autocomplete.plugin.zsh

plugins=(
    git
    tmux
    tmuxinator
    wakatime
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    )


######################
# User configuration #
######################


export PATH="/Users/tylerclark/opt/anaconda3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# to ls everytime I cd
chpwd() {
  ls
}

alias textedit='open -a TextEdit'

####################################
#  Print system info upon opening  #
####################################

neofetch

######################
# source needed here #
######################

source $ZSH/oh-my-zsh.sh
source ~/.iterm2_shell_integration.zsh