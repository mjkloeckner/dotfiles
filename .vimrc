	source	~/.config/vim/autoload/plug.vim
	call plug#begin('~/.config/vim/plugged')
	
	" Plug 'flw-cn/vim-nerdtree-l-open-h-close'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'justinmk/vim-syntax-extra'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/nerdtree'
	Plug 'morhetz/gruvbox'
	Plug 'alvan/vim-closetag'
	Plug 'hankchiutw/nerdtree-ranger.vim'

	call plug#end()

" Basic settings
	syntax on
	set nocompatible
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set viminfo+=n~/.config/vim/viminfo
	set path+=./**
	set incsearch
	set smartcase
	set smartindent
	set number
	set cursorline
	set relativenumber
	set ruler
	set mouse+=a
	if &term =~ 'xterm-256color'
		" tmux knows the extended mouse mode
		set ttymouse=xterm2
	endif

	set undofile
	set undodir=~/.config/vim/undodir
	set clipboard=unnamedplus
	set nobackup
	set nowritebackup
	set noswapfile
	" set noshowmode
	set backupdir=~/.config/vim/tmp/backup

	" This fixs the delay in the cursor shape when switching mode
	set ttimeout
	set ttimeoutlen=1
	set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
	set ttyfast
	set scrolloff=5

" Keys remap
	let mapleader = ' '

	" Open file tree;
	map <leader>f :NERDTreeToggle<CR>

	" Focus file tree;
	map <leader>F :NERDTreeFocus<CR>

	" Open current dir in NERDTree
	map <leader>r :NERDTreeFind<CR>

	" Toggle Goyo
	map <leader>g :Goyo<CR>

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
	" if exists('$TMUX')
	" 	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
	" 	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
	" 	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
	" 	autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
	" else
	" 	let &t_SI = "\<Esc>[6 q"
	" 	let &t_SR = "\<Esc>[4 q"
	" 	let &t_EI = "\<Esc>[2 q"
	" endif	
	
" Enable blinking together with different cursor shapes for insert/command mode, and cursor highlighting:
	let &t_SI = "\<Esc>[5 q"
	let &t_SR = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[1 q"

	" NetRW config
	let g:netrw_banner=0
	let g:netrw_winsize = 25
	let g:netrw_browse_split=2
	let g:netrw_altv=1
	let g:netrw_liststyle=3
	let g:netrwJ_list_hide=netrw_gitignore#Hide()
	let g:netrw_dirhistmax = 0	" Disable history

	" Goyo settings
	let g:goyo_linenr = 1
	let g:goyo_width = 100
	let g:goyo_height = 100
	autocmd! User GoyoLeave

	" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

	" This fixes the cursor shape at vim start
	normal! i

	" Set colorscheme and transparent background
	let g:gruvbox_transparent_bg = '1'
	let g:gruvbox_contrast_dark = 'hard'
	set bg=dark

	colorscheme gruvbox
	" colorscheme dracula

	function! AdaptColorscheme()
		hi clear CursorLine
		hi Normal guibg=NONE ctermbg=NONE
		hi LineNr guibg=NONE ctermbg=NONE
		hi Folded guibg=NONE ctermbg=NONE
		" hi EndOfBuffer guibg=NONE ctermbg=NONE
		hi EndOfBuffer ctermfg=12 guibg=NONE ctermbg=NONE
		hi SpecialKey guibg=NONE ctermbg=NONE
		hi VertSplit guibg=NONE ctermbg=NONE
		hi SignColumn guibg=NONE ctermbg=NONE

		hi TabLineSel ctermfg=LightGreen ctermbg=NONE
		hi TabLineFill ctermfg=Gray ctermbg=NONE
		hi Title ctermfg=LightBlue ctermbg=NONE

		hi CursorLine cterm=NONE ctermbg=235
	endfunction

	call AdaptColorscheme()

	" Set the split window separator (not the pipe char)
	set fillchars+=vert:\▏
	highlight VertSplit cterm=NONE


	autocmd! User GoyoLeave call AdaptColorscheme()
