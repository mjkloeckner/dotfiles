"                              _
"        _ __   ___  _____   _(_)_ __ ___
"       | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"       | | | |  __/ (_) \ V /| | | | | | |
"       |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"       by github.com/mjkloeckner

" Plugins call
	call plug#begin('~/.config/nvim/plugged')

	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'
	Plug 'ayosec/hltermpaste.vim'
	Plug 'chrisbra/Colorizer'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'flazz/vim-colorschemes'
	Plug 'flw-cn/vim-nerdtree-l-open-h-close'
	Plug 'hattya/vcs-info.vim'
	Plug 'iamcco/markdown-preview.nvim',
				\{ 'do': { -> mkdp#util#install() },
				\'for': [ 'markdown', 'vim-plug' ]}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'justinmk/vim-syntax-extra'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'sainnhe/edge'
	Plug 'sainnhe/gruvbox-material'
	Plug 'skywind3000/asyncrun.vim'
	Plug 'tikhomirov/vim-glsl'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-python/python-syntax'

	Plug 'mjkloeckner/autosave.vim'

	call plug#end()

" Basic settings
	syntax on
	set title
	" remove the `NVIM` ending from the title
	" (see https://neovim.io/doc/user/options.html#'titlestring')
	set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
	set encoding=utf-8
	scriptencoding utf-8
	set fileencoding=utf-8
	set noemoji
	set tabstop=4
	set shiftwidth=4
	set scrolloff=5
	set path+=./**
	set lcs+=space:·
	set iskeyword-=(,)
	set wildmenu
	set incsearch
	set smartcase
	" set noshowmode
	set number
	set relativenumber
	set cursorline
	set listchars=tab:\|\ ,trail:-,nbsp:+,space:·
	set list
	set mouse=a
	set undofile
	set undodir=~/.cache/nvim/undo
	set dir=~/.cache/nvim/swap
	set backupdir=~/.cache/nvim/backup
	set clipboard=unnamedplus

	" Enable blinking together with different cursor shapes for
	" insert/command mode, and cursor highlighting:
	set guicursor=n-v:block,i-ci-ve-c:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff4000-blinkon2500-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175

	" Set colorscheme and transparent background
	function! AdaptColorscheme()
		hi Normal guibg=NONE ctermbg=NONE
		hi LineNr guibg=NONE ctermbg=NONE
		hi Folded guibg=NONE ctermbg=NONE
		hi FoldColumn ctermbg=NONE
		hi EndOfBuffer guibg=NONE ctermbg=NONE ctermfg=12
		hi SpecialKey guibg=NONE ctermbg=NONE
		hi VertSplit guibg=NONE ctermbg=NONE
		hi SignColumn guibg=NONE ctermbg=NONE
		hi TabLineSel ctermfg=LightGreen ctermbg=NONE
		hi TabLineFill ctermfg=Gray ctermbg=NONE
		hi Title ctermfg=LightBlue ctermbg=NONE
		hi MatchParen ctermfg=234 ctermbg=208

		if &bg == 'light'
			hi ColorColumn ctermbg=254
		else
			hi ColorColumn ctermbg=240
			hi CursorLine ctermbg=240
		endif
	endfunction

	function! DarkTheme()
		set bg=dark
		let g:gruvbox_contrast_dark='hard'
		colorscheme gruvbox
		call AdaptColorscheme()
	endfunction

	function! LightTheme()
		set bg=light
		let g:gruvbox_contrast_light='hard'
		colorscheme gruvbox
		call AdaptColorscheme()
	endfunction

	hi TrailingWhitespace ctermbg=yellow guibg=yellow
	call matchadd("TrailingWhitespace", '\v\s+$')

	if filereadable('/home/mk/.config/scheme/light')
		call LightTheme()
	else
		call DarkTheme()
	endif

	function ToggleTheme()
		if &bg == 'dark'
			call LightTheme()
		else
			call DarkTheme()
		endif
	endfunction

	nnoremap <silent> <F12> :call ToggleTheme()<CR>


" Key remaps
	let mapleader =' '
	map <leader>f :NERDTreeToggle<CR>
	map <leader>F :NERDTreeFocus<CR>
	map <leader>r :NERDTreeFind<CR>
	map <leader>s :source $HOME/.config/nvim/init.vim<CR>
	map <leader>c :make

	" Disable ex-mode keybinding (type visual thing)
	map Q <NOP>

	" Improves indenting chunks of code with '<' '>' keys
	vnoremap < <gv
	vnoremap > >gv

	" Type a replacement term and press . to repeat the replacement again. Useful
	" for replacing a few instances of the term (comparable to multiple cursors).
	nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
	xnoremap <silent> s* "sy:let @/=@s<CR>cgn

	" Stops highlight after a search hitting return;
	nnoremap <silent> <CR> :nohlsearch<CR>

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

	" Go to next/prev quickfix
	nnoremap <C-n> :cnext<CR>zz
	nnoremap <C-p> :cprev<CR>zz

	" Go to tab by number
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

	" Scroll half page with PageUp/PageDown
	nnoremap <PageUp> <C-u>
	nnoremap <PageDown> <C-d>

	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

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
	let NERDTreeMinimalUI=1

	" Highjack nerdtree's highjacking to keep normal nerdtree from loading on directories
	" let g:NERDTreeHijackNetrw=0
	" augroup NERDTreeHijackNetrw
	"    autocmd VimEnter * silent! autocmd! FileExplorer
	" augroup END

	" autocmd VimEnter * call CloseExtraNERDTree()

	" If vim is started with a file, simply show that file
	" If vim is started with nothing or a directory close extra NERDTree buffer
	" function CloseExtraNERDTree()
	"   wincmd l " move to right pane
	"   let l:main_bufnr = bufnr('%')
	"   let l:fname = expand('%') " get name of current buffer
	"   if l:fname ==# 'NERD_tree_1'
	"   exe bufwinnr(l:main_bufnr) . "wincmd w"
	"   bd
	"   endif
	" endfunction

	function VerboseMark()
		echo ''
		let c = getchar()
		if ((c >= 0x41) && (c <= 0x5A)) || ((c >= 0x61) && (c <= 0x7A))
			normal! m nr2char(c)
			echon "mark `" nr2char(c) "`: line " line(".")  ", col " col(".")
		else
			return
		endif
	endfunction

	let g:asyncrun_open = 12

	" Pressing Ctrl-C during command mode breaks highlight
	cnoremap <C-c> <Esc>

	" Oposite of <Shift-k>
	nnoremap K :m-2<CR>J

	function Compile()
		echohl Question
		let l:input = split(input("Compile command: ", &makeprg, "filetype"), ' ')
		echohl None

		if empty(l:input)
			return
		endif
		redraw

		if(!empty(matchstr(l:input, "%")))
			if(empty(expand('%')))
				echohl Question
				echo 'Filename empty'
				echohl None
				return
			endif
		endif

		let string = join(l:input, ' ')
		" exe "set makeprg = " .. string
		let &makeprg = string
		let l:s = &makeprg
		exe "AsyncRun " .. l:s
		mod
	endfunction

	" autocmd BufEnter *.txt if &filetype == 'help' | wincmd T | endif
	function SearchHelp()
		mod
		echohl Question
		let l:input = substitute(input("Search vim help: ", "", "help"), "\\\'\\\|\\\"", '', 'g')
		echohl None
		mod

		if empty(l:input)
			return
		endif

		let v:errmsg = ""
		let l:cmd = "help " .. l:input
		silent! execute(l:cmd)

		if matchstr(v:errmsg, "no help") != ""
			echohl WarningMsg
			mod
			echo "Sorry, no help for: `" .. l:input .. "`"
			echohl None
		else
			exe "wincmd T | mod | set nornu"
		endif
	endfunction

	" autocmd BufEnter *.txt if &filetype == 'man' | wincmd T | endif
	function SearchMan()
		echohl Question
		" let l:input = input("Search man page: ")
		let l:input = substitute(input("Search man page: "), "\\\'\\\|\\\"", '', 'g')
		echohl None
		mod

		if empty(l:input)
			return
		endif

		" let l:string = join(l:input, ' ')
		let l:cmd = "man " .. l:input .. " > /dev/null 2>&1"
		call system(l:cmd)
		if v:shell_error == 0
			exe "Man " .. l:input
			exe "wincmd T | set relativenumber"
		else
			echohl WarningMsg
			mod
			echon l:input .. ": nothing appropriate."
			echohl None
		endif
	endfunction

	function Search()
		echohl Question
		let l:input = split(input("Search keyword in CWD: "), ' ')
		echohl None
		if empty(l:input)
			return
		endif
		mod

		let l:string = join(l:input, ' ')
		echo l:string
		exe "silent grep -r -I -s --exclude-dir=.git " .. l:string .. " *"
		copen
	endfunction

	function JumpBuffer()
		let l:prev_buffer = expand("#:t")
		echohl Question
		let l:input = split(input("Change buffer: ", l:prev_buffer, "buffer"), ' ')
		echohl None
		if empty(l:input)
			return
		endif
		mod

		let l:string = join(l:input, ' ')
		echo l:string
		if bufexists(l:string)
			exe "b " .. l:string
		else
			if filereadable(l:string)
				exe "e " .. l:string
			else
				exe "e " .. l:string
				mod
				echo "file doesn't exists: editinig new file `".. l:string .. "`"
			endif
		endif
	endfunction

	nnoremap <Leader>C :call Compile()<CR>
	nnoremap <Leader>v :call Search()<CR>
	nnoremap <Leader>m :call SearchMan()<CR>
	nnoremap <Leader>h :call SearchHelp()<CR>
	nnoremap <Leader>b :call JumpBuffer()<CR>

	function Text()
		if winwidth('%') > 86
			set nuw=8
		endif
		set tw=80
		set colorcolumn=80
		set spelllang=es,en
		set spell
	endfunction

	let g:TextMode = 0
	function ToggleText()
		if g:TextMode == 0
			let g:TextMode = 1
			call Text()
		else
			let g:TextMode = 0
			set nuw=4
			set tw=0
			set colorcolumn=0
			set nospell
		endif
	endfunction

	let g:mkdp_browser = 'qutebrowser'

	" make MarkdownPreview's tableofcontents pattern same as latex (for use
	" with pandoc)
	let g:mkdp_preview_options = {
		\ 'toc': { 'placeholder': '\\tableofcontents' }
		\ }

	nnoremap <silent> <Leader>T :call ToggleText()<CR>
	nnoremap m :call VerboseMark()<CR>

	au TextYankPost * silent! lua vim.highlight.on_yank()
	let g:python_highlight_all = 1

	autocmd ColorScheme gruvbox call AdaptColorscheme()

	" close if quickfix is the last window
	au BufEnter * call MyLastWindow()
	function! MyLastWindow()
	  " if the window is quickfix go on
	  if &buftype=="quickfix"
		" if this window is last on screen quit without warning
		if winbufnr(2) == -1
		  quit!
		endif
	  endif
	endfunction

	" enable auto_save for only these filetypes, to see all posible ifletypes
	" see: https://vi.stackexchange.com/questions/5780/list-known-filetypes
	let g:auto_save_file_types = [ 'markdown' ]

	" enable auto_save for all filetypes
	let g:auto_save_all_filetypes = 0

	" Switch to last-active tab
	if !exists('g:Lasttab')
		let g:Lasttab = 1
		let g:Lasttab_backup = 1
	endif
	autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
	autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
	nmap <silent> <Leader>; :exe "tabn " . g:Lasttab<cr>

	" Markdown mode
	function MarkdownMode()
		so ~/.config/nvim/md-toc.vim
		function! GeneratePDF()
			mod
			let l:filename = expand("%:r")
			let l:md_filename = l:filename .. ".md"
			let l:pdf_filename = l:filename .. ".pdf"

			if filereadable(l:md_filename)
				let l:pdf_generate_cmd = "!md2pdf " .. l:md_filename
				mod
				" exe l:pdf_generate_cmd
				exe "AsyncRun -mode=term -pos=bottom -rows=3 " .. l:pdf_generate_cmd
			else
				mod
				echohl WarningMsg
				echo "File `" .. l:md_filename .. "` not found in CWD"
				echohl None
			endif
		endfunction

		" requires neovim-remote to clear command line
		function! OpenPDF()
			let l:filename = expand("%:r")
			let l:pdf_filename = l:filename .. ".pdf"
			let l:server_name = v:servername

			" Check if pdf exists
			if filereadable(l:pdf_filename)
				let l:open_pdf_cmd = "!xdg-open " .. l:pdf_filename .. " &"
				silent exe l:open_pdf_cmd
				mod
				echohl Question
				echon "Opening `" .. l:pdf_filename .. "`"
				echohl None
			else
				echohl WarningMsg
				echo "File `" .. l:pdf_filename .. "` not found in CWD"
				echohl None
			endif
		endfunction

		nnoremap <buffer> <F9> :MarkdownPreviewToggle<CR>
		nnoremap <buffer> <F11> :call GeneratePDF()<CR>
		nnoremap <buffer> <F12> :call OpenPDF()<CR>

		" do not treat underscore as errors in certain contexts
		" https://github.com/tpope/vim-markdown/issues/21
		hi link markdownError NONE
	endfunction

	au FileType markdown silent! call MarkdownMode()
	" au CursorHold,CursorHoldI * mod

	" delete word in command/prompt mode with Ctrl + Backspace
	cnoremap <C-H> <C-w>
	cnoremap <C-BS> <C-H>

	let $FZF_DEFAULT_OPTS = ""
	let g:fzf_layout = {'down':'10'}
    " let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.25, 'relative': v:true, 'yoffset': 1.0 } }

	autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber cmdheight=0
      \| autocmd BufLeave <buffer> set laststatus=1 showmode ruler number relativenumber cmdheight=1

	" enable syntax highlight inside markdown codeblocks
	let g:markdown_fenced_languages = [
				\"html", "javascript", "js=javascript", "go", "golang=go",
				\"css", "dot", "xml", "python", "c", "c++=cpp", "sh",
				\"bash=sh", "vim", "lua" ]

