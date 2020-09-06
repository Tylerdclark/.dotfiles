################
#  ZSH config  #
################

alias setup-zsh="git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh ~/.config/.oh-my-zsh"

# For tmux
export EDITOR='vim'

ZSH_THEME="agkozak"

# Command auto-correction.
ENABLE_CORRECTION="true"

# To display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# this is for autocompletions

autoload -U compinit && compinit

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

# Path to oh-my-zsh installation.

export ZSH="/Users/tylerclark/.config/.oh-my-zsh"

export PATH="/Users/tylerclark/opt/anaconda3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

AGKOZAK_COLORS_USER_HOST=127
AGKOZAK_COLORS_PATH=blue
ZSH_AUTOSUGGEST_USE_ASYNC=1
AGKOZAK_PROMPT_CHAR=( λ %# : )

# to ls everytime I cd
chpwd() {
  ls
}
# 1337 terminal calculator
calc(){ 
    awk "BEGIN{ print $* }" ;
}
# for random cpp tinkering
gppr(){
    g++-10 "$1" #compile
    ./a.out     #run
    rm a.out    #remove
}
# c counterpart
gccr(){
    gcc-10 "$1" #compilea
    ./a.out     #run
    rm a.out    #remove
}

alias textedit='open -a TextEdit'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

####################################
#  Print system info upon opening  #
####################################

neofetch
bindkey -v
######################
# source needed here #
######################

source $ZSH/oh-my-zsh.sh
#source ~/.iterm2_shell_integration.zsh 
