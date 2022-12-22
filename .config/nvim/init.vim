"                              _
"		 _ __   ___  _____   _(_)_ __ ___
"		| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"		| | | |  __/ (_) \ V /| | | | | | |
"		|_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"		by github.com/mjkloeckner


" Plugins call
	call plug#begin('~/.config/nvim/plugged')

	Plug 'alvan/vim-closetag'
	Plug 'chrisbra/Colorizer'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'flazz/vim-colorschemes'
	Plug 'flw-cn/vim-nerdtree-l-open-h-close'
	Plug 'hattya/vcs-info.vim'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
	Plug 'justinmk/vim-syntax-extra'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'sainnhe/edge'
	Plug 'sainnhe/gruvbox-material'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'

	call plug#end()

" Basic settings
	syntax on
	set encoding=utf-8
	scriptencoding utf-8
	set fileencoding=utf-8
	set noemoji
	set tabstop=4
	set shiftwidth=4
	set scrolloff=5
	set path+=./**
	set wildmenu
	set incsearch
	set smartcase
	" set noshowmode
	set number
	set relativenumber
	set cursorline
	set mouse=a
	set undofile
	set undodir=~/.cache/nvim/undo
	set dir=~/.cache/nvim/swap
	set backupdir=~/.cache/nvim/backup
	set clipboard=unnamedplus

	" Enable blinking together with different cursor shapes for insert/command mode,
	" and cursor highlighting:
	set guicursor=n-v:block,i-ci-ve-c:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff4000-blinkon2500-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175

	" Plugins settings
	" source "$HOME/.config/nvim/plugins.vim"

	" Set colorscheme and transparent background
	function! AdaptColorscheme()
		" hi clear CursorLine
		hi Normal guibg=NONE ctermbg=NONE
		hi LineNr guibg=NONE ctermbg=NONE
		hi Folded guibg=NONE ctermbg=NONE
		" hi EndOfBuffer guibg=NONE ctermbg=NONE
		hi EndOfBuffer guibg=NONE ctermbg=NONE ctermfg=12
		hi SpecialKey guibg=NONE ctermbg=NONE
		hi VertSplit guibg=NONE ctermbg=NONE
		hi SignColumn guibg=NONE ctermbg=NONE

		hi TabLineSel ctermfg=LightGreen ctermbg=NONE
		hi TabLineFill ctermfg=Gray ctermbg=NONE
		hi Title ctermfg=LightBlue ctermbg=NONE

		" hi CursorLine cterm=NONE ctermbg=235
	endfunction

	function! DarkTheme()
		set bg=dark
		let g:gruvbox_contrast_dark='hard'
		colorscheme gruvbox
		call AdaptColorscheme()
		hi CursorLine cterm=NONE ctermbg=235
	endfunction

	function! LightTheme()
		set bg=light
		let g:gruvbox_contrast_light='hard'
		colorscheme gruvbox
		call AdaptColorscheme()
		" hi CursorLine cterm=NONE ctermbg=bg5
	endfunction

	hi TrailingWhitespace ctermbg=yellow guibg=yellow
	call matchadd("TrailingWhitespace", '\v\s+$')

	if filereadable('/home/mk/.config/scheme/light')
		call LightTheme()
	elseif filereadable('/home/mk/.config/scheme/dark')
		call DarkTheme()
	endif

	" Key remaps
	let mapleader =' '

	"" Open file tree
	map <leader>f :NERDTreeToggle %<CR>

	"" Focus file tree
	map <leader>F :NERDTreeFocus<CR>

	"" Open current dir in NERDTree
	map <leader>r :NERDTreeFind<CR>

	"" Source nvim config file
	map <leader>s :source $HOME/.config/nvim/init.vim<CR>

	"" Open current dir in NERDTree
	map <leader>c :make

	"" Disable ex-mode keybinding (type visual thing)
	map Q <NOP>

	"" Improves indenting chunks of code with '<' '>' keys
	vnoremap < <gv
	vnoremap > >gv

	"" Stops highlight after a search hitting return;
	nnoremap <silent> <CR> :noh<CR><CR>

	"" Shortcut for split navigation
	noremap <C-Down> <C-W>j<CR>
	noremap <C-Up> <C-W>k<CR>
	noremap <C-Left> <C-W>h<CR>
	noremap <C-Right> <C-W>l<CR>

	"" Move between windows with Ctrl + hjkl
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l

	"" Go to next/prev quickfix
	nnoremap <C-n> :cnext<CR>zz
	nnoremap <C-p> :cprev<CR>zz

	"" Go to tab by number
	noremap <leader>1 1gt
	noremap <leader>2 2gt
	noremap <leader>3 3gt
	noremap <leader>4 4gt
	noremap <leader>5 5gt
	noremap <leader>6 6gt
	noremap <leader>7 7gt
	noremap <leader>8 8gt
	noremap <leader>9 9gt
	noremap <leader>0 :tablast<cr>

	" Highlight whitespace problems.
	" flags is '' to clear highlighting, or is a string to
	" specify what to highlight (one or more characters):
	"   e  whitespace at end of line
	"   i  spaces used for indenting
	"   s  spaces before a tab
	"   t  tabs not at start of line
	function! ShowWhitespace(flags)
	  let bad = ''
	  let pat = []
	  for c in split(a:flags, '\zs')
		if c == 'e'
		  call add(pat, '\s\+$')
		elseif c == 'i'
		  call add(pat, '^\t*\zs \+')
		elseif c == 's'
		  call add(pat, ' \+\ze\t')
		elseif c == 't'
		  call add(pat, '[^\t]\zs\t\+')
		else
		  let bad .= c
		endif
	  endfor
	  if len(pat) > 0
		let s = join(pat, '\|')
		exec 'syntax match ExtraWhitespace "'.s.'" containedin=ALL'
	  else
		syntax clear ExtraWhitespace
	  endif
	  if len(bad) > 0
		echo 'ShowWhitespace ignored: '.bad
	  endif
	endfunction

	function! ToggleShowWhitespace()
	  if !exists('b:ws_show')
		let b:ws_show = 0
	  endif
	  if !exists('b:ws_flags')
		let b:ws_flags = 'est'  " default (which whitespace to show)
	  endif
	  let b:ws_show = !b:ws_show
	  if b:ws_show
		call ShowWhitespace(b:ws_flags)
	  else
		call ShowWhitespace('')
	  endif
	endfunction

	nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>

	highlight ExtraWhitespace ctermbg=red guibg=red

	nnoremap <A-j> :m .+1<CR>==
	nnoremap <A-k> :m .-2<CR>==

	nnoremap <Leader>/ :vsplit<CR>
	nnoremap <Leader>" :split<CR>

	inoremap <A-j> <Esc>:m .+1<CR>==gi
	inoremap <A-k> <Esc>:m .-2<CR>==gi

	vnoremap <A-j> :m '>+1<CR>gv=gv
	vnoremap <A-k> :m '<-2<CR>gv=gv

	nnoremap n nzzzv
	nnoremap N Nzzzv

	function! ToggleQuickFix()
		if empty(filter(getwininfo(), 'v:val.quickfix'))
			copen
		else
			cclose
		endif
	endfunction

	nnoremap <silent> <leader>c :call ToggleQuickFix()<cr>

	set laststatus=1
	autocmd VimEnter * set laststatus=1

	let NERDTreeHijackNetrw=1

	" Highjack nerdtree's highjacking to keep normal nerdtree from loading on directories
	" let g:NERDTreeHijackNetrw=0
	" augroup NERDTreeHijackNetrw
	" 	autocmd VimEnter * silent! autocmd! FileExplorer
	" augroup END

	" autocmd VimEnter * call CloseExtraNERDTree()

	" If vim is started with a file, simply show that file
	" If vim is started with nothing or a directory close extra NERDTree buffer
	" function CloseExtraNERDTree()
	"   wincmd l " move to right pane
	"   let l:main_bufnr = bufnr('%')
	"   let l:fname = expand('%') " get name of current buffer
	"   if l:fname ==# 'NERD_tree_1'
	" 	exe bufwinnr(l:main_bufnr) . "wincmd w"
	" 	bd
	"   endif
	" endfunction

	" :echo '' | let c = nr2char(getchar()) | exe "ma" c | echon "created mark '" c "' at line " line(".")
	function VerboseMark()
		echo ''
		let c = getchar()
		if ((c >= 0x41) && (c <= 0x5A)) || ((c >= 0x61) && (c <= 0x7A))
			exe "mark" nr2char(c)
			echon "created mark '" nr2char(c) "' at line " line(".")
		else
			return
		endif
	endfunction

	function Text()
		set tw=80
		set colorcolumn=80
		set spelllang=es
	endfunction

	let g:mkdp_browser = 'qutebrowser'

	nnoremap <Leader>t :call Text()<CR>
	nnoremap m :call VerboseMark()<CR>
