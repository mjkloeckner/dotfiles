call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'

call plug#end()
let g:airline_theme = "code_dark"


" Basic settings
syntax on
set encoding=utf8
set tabstop=4
set shiftwidth=4

