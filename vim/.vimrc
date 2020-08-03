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

"for Wakatime - the time-keeper™
Plug 'wakatime/vim-wakatime'

" We will see how this works
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
  
"will try out ale
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'

call plug#end()

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
set mouse=a                     "Don't yell at me 
set nowrap
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
set noerrorbells                " Getting annoying also not working...
set noeb vb t_vb=               "this actually stops the bells

" Put all temporary files in the same directory
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo


"neat column highlight
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = " "

" Some NERDTree configs  
autocmd vimenter * NERDTree	" Open a nerd tree when vim start up
autocmd VimEnter * wincmd p     " Go to previous (last accessed) window.
map <C-n> :NERDTreeFocusToggle<CR>  " Open NERDTree with ctrl + n
"some nav
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Some more configs
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+

let g:coc_global_extensions = [
            \ 'coc-emoji', 'coc-eslint', 'coc-prettier',
            \ 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin',
            \ 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml']
  

set cmdheight=2                 " Better display for messages
set updatetime=300              " Smaller updatetime for CursorHold & CursorHold
set shortmess+=c                " don't give |ins-completion-menu| messages.
set signcolumn=yes              " always show signcolumns

" ALE svelte config
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'svelte': ['stylelint', 'eslint']}
let g:ale_fixers = {'svelte': ['prettier', 'prettier_standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
