"
" ~postlogic's vimrc
"   -- with tons of stuff borrowed from all over.


"Functions 'n stuff

fun! <SID>SetStatusLine()
  let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
  let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
  let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
  execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun

if v:progname =~? "evim"
  finish
endif

if v:version >= 700
  try
    setlocal numberwidth=3
  catch
  endtry
endif

if has('gui_running')
    set columns=90
    set lines=40
    set clipboard+=unnamed
    set guioptions+=a
    set guioptions+=c
    set guioptions+=m
    colorscheme desert
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
elseif (&term == 'screen.linux') || (&term =~ '^linux')
    set t_Co=8
    colorscheme desert
elseif (&term == 'rxvt-unicode') || (&term =~ '^xterm') || (&term =~ '^screen')
    set mouse=a
    set ttymouse=xterm
    colorscheme desert
else
    colorscheme desert
endif

" Options

set nocompatible
set backspace=indent,eol,start
set nobackup
set history=50
set ruler
set showcmd
set incsearch
set nowrap
set cmdheight=3
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set number
set laststatus=2
set encoding=utf-8
set t_Co=256 " More colors!
let html_use_css=1
call <SID>SetStatusLine()
map Q gq

" File explorer stuff
let g:netrw_browse_split=2
let g:netrw_winsize=20
let g:netrw_preview=1

runtime ftplugin/man.vim

set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full

if v:version >= 700
    set cursorline
    set completeopt=menu,menuone,longest,preview
    set spelllang=en_us
    set numberwidth=1
    " imma commnt with missspellings, use me tu tesst
    
    "popup coloring - use mine, not yours
    hi Pmenu ctermbg=2 guibg=darkolivegreen
    hi PmenuSel ctermbg=0 guibg=black
endif

" Plugins

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  
  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=78

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
  set smartindent
endif

" Mapping
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
