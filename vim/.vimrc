set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
colorscheme synthwave

call plug#begin('~/.vim/plugged')

  " nerdtree
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'jistr/vim-nerdtree-tabs'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

call plug#end()

autocmd vimenter * NERDTree	" Open a nerd tree when vim start up

  set history=1000                " Store lots of :cmdline history
  set noswapfile                  " Don't use swapfile
  set nobackup                    " Don't create annoying backup files
  set cursorline                  " Highlight the current line
  set clipboard+=unnamed          " Shared clipboard
  set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
  set linespace=0                 " How to change the space between lines in vim?
  set updatetime=100
  set switchbuf=usetab,usetab     " Open new buffers always in new tabs
  set wildignore+=*/.git/*,       " Linux/MacOSX
      \*/.hg/*,*/.svn/*,
      \*/cscope*,*/*.csv/,
      \*/*.log,*tags*,*/bin/*        
  
  set showcmd                     " Show me what I'm typing
  set showmode                    " Show current mode down the bottom
  set number                      " Show line numbers
  set numberwidth=4               " Number width
  set showmatch                   " Do not show matching brackets by flickering
  set completeopt-=preview        " Don't show preview window
  
  set incsearch                   " Shows the match while typing
  set hlsearch                    " Highlight found searches
  set ignorecase                  " Search case insensitive...
  set smartcase                   " ... but not when search pattern contains upper case characters
  
  set shiftwidth=4                " Default indent settings
  set softtabstop=4               " 
  set expandtab                   " Use spaces instead of tabs
  set autoindent                  " Automatic indent
  set smartindent                 " Smart indent