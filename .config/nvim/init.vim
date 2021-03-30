"							   _           
"		 _ __   ___  _____   _(_)_ __ ___  
"		| '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
"		| | | |  __/ (_) \ V /| | | | | | |
"		|_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"		by github.com/klewer-martin
"


" Plugins call
	call plug#begin('~/.config/nvim/plugged')

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'chrisbra/Colorizer'
	Plug 'flazz/vim-colorschemes'
	Plug 'jiangmiao/auto-pairs'
	Plug 'hattya/vcs-info.vim'

	call plug#end()


" Plugins settings
	let g:airline_theme='dark'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airleine_powerline_fonts = 1
	let g:colorizer_auto_color = 1

" Powerline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
"	let g:airline_symbols.branch = ''
"	let g:airline_symbols.readonly = ''
"	let g:airline_symbols.linenr = '☰'
"	let g:airline_symbols.maxlinenr = ''
"	let g:airline_symbols.dirty='⚡'
	let g:airline#extensions#tabline#enabled = 1
" Show just the filename
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline#extensions#syntastic#enabled = 1
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''


" Basic settings
	syntax on
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set incsearch
	set smartcase
	set noshowmode
	set number
	set norelativenumber
	set mouse=a

	set undofile
	set undodir=~/.config/nvim/undodir

	highlight VertSplit cterm=NONE

" Key remaps
	let mapleader =' '

	" Open file tree;
	map <leader>f :NERDTreeToggle<CR>

	" Open file tree;
	map <leader>s :source $HOME/.config/nvim/init.vim<CR>

	" Stops highlight after a search hitting return;
	nnoremap <CR> :noh<CR><CR>

	" Shortcut for split navigation
	noremap <C-Down> <C-W>j<CR>
	noremap <C-Up> <C-W>k<CR>
	noremap <C-Left> <C-W>h<CR>
	noremap <C-Right> <C-W>l<CR>

	" Move between windows with Ctrl + hjkl
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
