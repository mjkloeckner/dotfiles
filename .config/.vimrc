	call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'
	Plug 'flw-cn/vim-nerdtree-l-open-h-close'
	Plug 'tpope/vim-commentary'

	call plug#end()

" Basic settings
	syntax on
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set incsearch
	set smartcase
	set smartindent
	set number
	set relativenumber
	set mouse=a
	set undofile
	set undodir=~/.config/nvim/undodir
	set clipboard=unnamedplus
	set nobackup
	set nowritebackup
	set noswapfile
	" set noshowmode
	" set backupdir=~/.config/nvim/tmp/backup

	" This fixs the delay in the cursor shape when switching mode
	set ttimeout
	set ttimeoutlen=1
	set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
	set ttyfast

	set fillchars+=vert:\ 
	highlight VertSplit cterm=NONE

	highlight ExtraWhitespace ctermbg=red guibg=red

" Keys remap
	let mapleader = ' '

	" Open file tree;
	map <leader>f :NERDTreeToggle<CR>

	" Open current dir in NERDTree
	map <leader>r :NERDTreeFind<CR>

	" Disable ex-mode keybinding (type visual thing)
	map Q <NOP>

	" Improves indenting chunks of code with '<' '>' keys
	vnoremap < <gv
	vnoremap > >gv

	" Move between windows with Ctrl + hjkl
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l

	" Change cursor shape with modes
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"

" NetRW config
	let g:netrw_banner=0
	let g:netrw_winsize = 25
	let g:netrw_browse_split=2
	let g:netrw_altv=1
	let g:netrw_liststyle=3
	let g:netrwJ_list_hide=netrw_gitignore#Hide()
