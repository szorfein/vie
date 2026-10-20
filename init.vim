set nocompatible
"filetype plugin indent on
"syntax on

" Relative line number
set number relativenumber

set autoindent " copy indent from the previous line
set autoread " reload from disk
set backspace=indent,eol,start " modern backspace behavior

set belloff=all " disable bell
"set complete-=i " don't scan current on included

" Files for completions
set display=lastline,msgsep " display more msg text
set encoding=utf-8
"set fillchars=vert:: " separator character

"set fsync " robust file saving
"set history=10000 " maximum
"set hlsearch " highlight search results
"set incsearch " move cursor as you type wh searching
"set langnoremap " helps avoid mappings breaking

" hide bottom bar completly
set laststatus=0 " hide status line, =2 to display
set noshowmode
set noshowcmd
set noruler

"set listchars=tab:>\ ,trail:-,nbsp:+ " char for :list
set nrformats=bin,hex " <c-a> and <c-x> support
"set ruler " display current line # in corner
"set sessionoptions-=options " do not carry options accross session
"set shortmess=F " less verbose file info
"set showcmd " show last command in status line
set sidescroll=1

"set tabpagemax=50 " max number of tabs open by -p flag
"set tags=./tags;,tags " filename to look for tags
"set ttyfast
set viminfo+=! " save global variables accross session

" netrw config (:Vexplore)
"let g:netrw_browse_split = 0
"let g:netrw_altfile = 1

set softtabstop=4
set cindent

" https://geanmar.com/posts/make-nvim-blazingly-fast/#setting-synmaxcol
"let g:synmaxcol = 500

" smaller swapfile
setlocal noswapfile

" Shell
"set shell=/bin/zsh

" Disable some default providers
let g:loaded_node_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" Mardown - enable folding (also called 'accordeon')
" https://elderlybeginner.github.io/vim_folding/
" https://bitcrowd.dev/folding-sections-of-markdown-in-vim/
" To open fold: zo
" To close fold: zc
"let g:markdown_folding = 1
"au FileType markdown setlocal foldlevel=1 "Start 0, this skip first level '# '

" leader key
let g:mapleader = ' '
let g:maplocalleader = '\\'

" Load lazy stuff
lua require('vie')
