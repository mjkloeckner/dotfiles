"							   _           
"		 _ __   ___  _____   _(_)_ __ ___  
"		| '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
"		| | | |  __/ (_) \ V /| | | | | | |
"		|_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"		by github.com/klewer-martin


" Plugins call
	call plug#begin('~/.config/nvim/plugged')

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'flw-cn/vim-nerdtree-l-open-h-close'
	Plug 'chrisbra/Colorizer'
	Plug 'flazz/vim-colorschemes'
	Plug 'jiangmiao/auto-pairs'
	Plug 'hattya/vcs-info.vim'
	Plug 'justinmk/vim-syntax-extra'
	Plug 'sainnhe/gruvbox-material'
	Plug 'sainnhe/edge'
	Plug 'tpope/vim-commentary'
	Plug 'ryanoasis/vim-devicons'

	call plug#end()


" Basic settings
	syntax on
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set incsearch
	set smartcase
	set noshowmode
	set number
	set relativenumber
	set mouse=a
	set undofile
	set undodir=~/.config/nvim/undodir
	" set backupdir=~/.config/nvim/tmp/backup
	set clipboard=unnamedplus
	set nobackup
	set nowritebackup
	set noswapfile

" Plugins settings
	"let g:NERDTreeWinSize=27
	"let g:airline_theme='dark'
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#formatter = 'unique_tail'
	"let g:airleine_powerline_fonts = 1
	"let g:colorizer_auto_color = 1
	""let g:airline_section_b = '%{getcwd()}'
	"let g:airline_section_x=''
	"let g:airline#extensions#tabline#show_buffers = 0
	"let g:airline#extensions#tabline#tab_min_count = 2

	"" Powerline symbols
	"let g:airline#extensions#tabline#enabled = 1

	"" air-line
	"let g:airline_powerline_fonts = 1
	"let g:airline_section_c_only_filename = 0

	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	"" unicode symbols
	"let g:airline_symbols.linenr = '¶'
	"let g:airline_symbols.branch = '⎇'
	"let g:airline_symbols.paste = 'ρ'
	"let g:airline_symbols.whitespace = 'Ξ'

	" airline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	"let g:airline_symbols.linenr = ''

	"" Show just the filename
	"let g:airline#extensions#tabline#fnamemod = ':t'
	"let g:airline#extensions#syntastic#enabled = 1
	"let g:airline#extensions#tabline#left_sep = ''
	"let g:airline#extensions#tabline#left_alt_sep = ''

" Set colorscheme and transparent background
	colorscheme gruvbox

	function! AdaptColorscheme()
		hi clear CursorLine
		hi Normal guibg=none ctermbg=none
		hi LineNr guibg=none ctermbg=none
		hi Folded guibg=none ctermbg=none
		hi EndOfBuffer guibg=none ctermbg=none
		hi SpecialKey guibg=none ctermbg=none
		hi VertSplit guibg=none ctermbg=none
		hi SignColumn guibg=none ctermbg=none
	endfunction

	call AdaptColorscheme()

" Key remaps
	let mapleader =' '

	" Open file tree;
	map <leader>f :NERDTreeToggle<CR>

	" Open current dir in NERDTree
	map <leader>r :NERDTreeFind<CR>

	" Source nvim config file
	map <leader>s :source $HOME/.config/nvim/init.vim<CR>

	" Disable ex-mode keybinding (type visual thing)
	map Q <NOP>

	" Improves indenting chunks of code with '<' '>' keys
	vnoremap < <gv
	vnoremap > >gv

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
