" postlogic's vimrc

set nocompatible
set hidden				" Don't close buffers, hide them.
set nowrap				" Don't wrap lines
set expandtab				" Insert softtabstop number of spaces
set softtabstop=4			" Number of spaces
set shiftwidth=4			" Number of spaces to use for indenting
set backspace=indent,eol,start		" Allow backspacing over everything in insert mode
set autoindent				" Always set autoindenting on
set copyindent				" Copy the previous indentation on autoindenting
set number				" Show line numbers
set shiftround				" Use multiples of shiftwidth when indenting with > and <
set showmatch				" Show matching parenthesis
set ignorecase				" Ignore case when searching
set smartcase				" Ignore case if search is all lowercase, case-sensitive otherwise
set hlsearch				" Highlight searchterms
set incsearch				" Show search matches as you type
set history=1000			" Remember more commands and search history
set undolevels=1000			" Use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class " Ignore some file endings
set title				" Change terminals title
set visualbell				" Don't beep
set noerrorbells			" Don't beep
set nobackup				" No backup files!
set noswapfile				" No swap files!
set scrolloff=4				" Keep 4 lines off the edges of the screen when scrolling
set gdefault				" Search/replace globally
set nolist				" Don't show invisible chars by default
set mouse=a				" Turn on mouse support where applicable
set modelines=0
set fileformats="unix,dos,mac"

filetype plugin indent on

" Set window size and color scheme for gvim
if has("gui_running")
    set lines=40
    set columns=100
endif

colorscheme twilight

" Automatically use regular regexp for matching by prepending \v
nnoremap / /\v
vnoremap / /\v

" Bindings
cmap w!! w !sudo tee % >/dev/null	" Sudo to write
set pastetoggle=<F3>			" Toggle paste mode with F3

" Functions
fun! s:ToggleMouse()
	if !exists("s:old_mouse")
		let s:old_mouse = "a"
	endif

	if &mouse == ""
		let &mouse = s:old_mouse
		echo "Mouse is for Vim (" . &mouse . ")"
	else
		let s:old_mouse = &mouse
		let &mouse = ""
		echo "Mouse is for terminal"
	endif
endfunction

" Pathogen settings
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" NERDTree settings
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NER2TreeMouseMode=2
nmap <F9> <Esc>:NERDTreeToggle<CR>

" OS X doesn't seem to want syntax as default...
syntax on

