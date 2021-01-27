################
#  ZSH config  #
################

alias setup-zsh="git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh ~/.config/.oh-my-zsh"

# For tmux
export EDITOR='vim'

ZSH_THEME="agkozak"

# if this is a first time installation:
# [[ ! -d $ZSH_CUSTOM/themes ]] && mkdir $ZSH_CUSTOM/themes
# git clone https://github.com/agkozak/agkozak-zsh-prompt $ZSH_CUSTOM/themes/agkozak
# ln -s $ZSH_CUSTOM/themes/agkozak/agkozak-zsh-prompt.plugin.zsh $ZSH_CUSTOM/themes/agkozak.zsh-theme

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

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export PATH=${PATH}:/Users/tylerclark/Library/Python/3.9/bin

export PATH=$PATH:/Users/tylerclark/.local/bin

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
    if (( $# == 0))
    then
        echo usage: gppr c++file1 c++file2..
    else
    g++-10 $* -o main   #compile
    ./main              #run
    echo now removing executable...
    rm main             #remove
    fi
}
# c counterpart
gccr(){
    if (( $# == 0))
    then
        echo usage: gccr cfile1 cfile2..
    else
    gcc-10 $* -o main   #compile
    ./main              #run
    echo now removing executable...
    rm main             #remove
    fi
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
