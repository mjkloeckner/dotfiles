
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

	call plug#end()


" Plugins settings
	let g:airline_theme='dark'
	let g:airline#extensions#tabline#enable = 1
	let g:colorizer_auto_color = 1



" Basic settings
	syntax on
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4

" Key remaps
	let mapleader ='\'

	map <leader>n :NERDTreeToggle<CR>

	" Shortcut for split navigation
	noremap <C-Down> <C-W>j<CR>
	noremap <C-Up> <C-W>k<CR>
	noremap <C-Left> <C-W>h<CR>
	noremap <C-Right> <C-W>l<CR>
