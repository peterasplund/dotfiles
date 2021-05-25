" General {
	set nocompatible
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8
	" Display incomplete commands
	set showcmd
	" Allow switching buffsers without saving changes to file
	set hidden
	" Don't add invisible linebreak at EOF
	set binary noeol

	set cindent
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2

	autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2

	filetype plugin indent on

	let mapleader=" "
	
	if has("win32")
		" Ensure .vim is in path, gvim in Windows does not use this by default
		set rtp+=~/.vim
	endif
" }

" Vim Plug {
	" Automatic installation of Vim Plug
	" Use $HOME to account for windows
	if empty(glob($HOME . "/.vim/autoload/plug.vim"))
		if has("win32")
			silent ! powershell (md "$env:HOMEPATH\.vim\autoload")
			silent ! powershell (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', $env:HOMEPATH + '\.vim\autoload\plug.vim')
		else
			silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		endif
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	
	silent call plug#begin($HOME . "/.vim/plugged")
	
	" Vim Plug itself
	Plug 'junegunn/vim-plug'

	" Syntax
	Plug 'StanAngeloff/php.vim'
	Plug 'mxw/vim-jsx'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'rust-lang/rust.vim'
	Plug 'tpope/vim-markdown'
	Plug 'vim-scripts/HTML-AutoCloseTag'
	Plug 'calviken/vim-gdscript3'
	Plug 'elixir-lang/vim-elixir'
	Plug 'jparise/vim-graphql'

	" Tools
	Plug 'airblade/vim-rooter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'dense-analysis/ale'
	Plug 'godlygeek/tabular'
	Plug 'jgdavey/tslime.vim'
	Plug 'kien/ctrlp.vim'
	Plug 'mileszs/ack.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-scripts/L9'
	Plug 'vim-scripts/bufkill.vim'
	Plug 'xolox/vim-misc'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'honza/vim-snippets'
	Plug 'mattn/emmet-vim'
	Plug 'mhinz/vim-signify'
	Plug 'racer-rust/vim-racer'
	Plug 'tpope/vim-surround'

	" Colorschemes
	Plug 'xolox/vim-colorscheme-switcher'
	Plug 'junegunn/seoul256.vim'
	Plug 'Lokaltog/vim-distinguished'
	Plug 'whatyouhide/vim-gotham'
	Plug 'nanotech/jellybeans.vim'
	Plug 'KabbAmine/yowish.vim'
	Plug 'ntk148v/vim-horizon'

	call plug#end()
" }

" Syntastic {
	let g:syntastic_check_on_open=1
	
	" It uses PHP Mess Detector and PHP_CodeSniffer, I do not like how those behaves
	let g:syntastic_php_checkers=['php']
	let g:syntastic_css_checkers=['csslint', 'prettycss']
	let g:synastic_java_checkers=[]

	let g:syntastic_error_symbol='✗'
	let g:syntastic_warning_symbol='⚠'

	let g:syntastic_hdevtools_options='-g -W -g -Wall -g -fwarn-tabs -g -fwarn-incomplete-record-updates'

	" Turn off signs in syntastic, syntastic garbles the editor window with
	" these
	let g:syntastic_enable_signs=0
	let g:syntastic_full_redraws=1

	" Ignore angularjs stupidity
	let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-']

	" let g:syntastic_javascript_checkers = ['eslint']
	let g:syntastic_rust_checkers = ['rustc']
	let g:syntastic_cpp_compiler_options = ' -std=c++11'

	" integration with typescript module
	let g:tsuquyomi_disable_quickfix = 1
" }

" ALE {
	" Gutter off
	let g:ale_set_signs=0

	" Enable Airline integration
	let g:airline#extensions#ale#enabled = 1

	let g:ale_linters={'javascript':['flow-language-server','xo']}
" }

" ACK {
	let g:ackprg = 'rg --vimgrep --no-heading'
" }

" airline {
	set laststatus=2
	let g:airline_powerline_fonts=1
	let g:airline_theme='distinguished'
	let g:airline#extensions#whitespace#enabled=1
	let g:airline#extensions#whitespace#mixed_indent_algo=2
	let g:airline_section_b = ''
	let g:airline_section_y = ''
	let g:airline_section_z = ''
	" Skip trailing checks:
	let g:airline#extensions#whitespace#checks=['indent', 'long', 'mixed-indent-file']
" }

" Emmet {
	" let g:user_emmet_expandabbr_key='<Tab>'
	imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" }

" Rooter {
	let g:rooter_cd_cmd="lcd"
	" Prevent Rooter from printing the directory every time it changes
	let g:rooter_silent_chdir=1
" }

" Bufkill {
	let g:BufKillCreateMappings=0
" }

" Nerdtree {
	let NERDTreeShowHidden=1
	set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.git
	let NERDTreeRespectWildIgnore=1
	set autochdir
	let NERDTreeChDirMode=2
" }

" lukerandall/haskellmode-vim {
	let g:haddock_browser="open"
	let g:haddock_browser_callformat="%s %s"
" }

" luochen1990/rainbow {
	let g:rainbow_active=1
	let g:rainbow_conf={'separately': { 'html': 0 }}
" }

" Javascript {
	" I use Flow
	let g:javascript_plugin_flow = 1

	" mxw/vim-jsx: Fixes issue with closing parenthesis in "React-like components"
	let g:jsx_ext_required = 0
" }

" CtrlP {
	let g:ctrlp_custom_ignore = {
	\	'dir' : 'node_modules\|DS_Store\|git\|code/core\|media\|target\|dist' ,
	\ }
	let g:ctrlp_show_hidden = 1
	let g:ctrlp_max_depth = 10
	let g:ctrlp_dont_split = 'NERD'
" }

" PHP {
	" Slow syntax highlighting
	let php_html_load=0
	let php_html_in_heredoc=0
	let php_html_in_nowdoc=0
	let php_sql_query=0
	let php_sql_heredoc=0
	let php_sql_nowdoc=0
" }

" Backup, Swap and View Files {
	" Create dirs, $HOME to ensure it works on windos, need to check to avoid
	" lots of command windows in Windows when running gvim
	if !isdirectory($HOME . "/.vim/.backup")
		if has("win32")
			silent ! powershell (md "$env:HOMEPATH\.vim\.backup")
			silent ! powershell (md "$env:HOMEPATH\.vim\.swap")
			silent ! powershell (md "$env:HOMEPATH\.vim\.views")
			silent ! powershell (md "$env:HOMEPATH\.vim\.undo")
		else
			silent execute '!mkdir -p $HOME/.vim/.backup'
			silent execute '!mkdir -p $HOME/.vim/.swap'
			silent execute '!mkdir -p $HOME/.vim/.views'
			silent execute '!mkdir -p $HOME/.vim/.undo'
		endif
	endif

	" Store backups in $HOME to keep the directory trees clean
	set backup
	set undofile
	set backupdir=$HOME/.vim/.backup//
	set directory=$HOME/.vim/.swap//
	set viewdir=$HOME/.vim/.views//
	set undodir=$HOME/.vim/.undo//
" }

" Tabs and Indentation {
	set noexpandtab
	set autoindent
	
	set tabstop=4
	set shiftwidth=4

	" Disable code folding
	set nofoldenable
	" disable PIV's folding
	let g:DisableAutoPHPFolding = 1

	fun! <SID>StripTrailingWhitespaces()
		let l=line(".")
		let c=col(".")
		%s/\s\+$//e
		call cursor(l, c)
	endfun
	
	" Different tab-width on YAML and Ruby files
	autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=2
	" PHP indent is 4 spaces and remove trailing spaces
	autocmd FileType php setlocal expandtab
	autocmd FileType php autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
	" Python should be indented with spaces preferrably
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
	" Haskell should be indented with spaces preferrably
	autocmd FileType haskell setlocal expandtab shiftwidth=4 tabstop=4
	autocmd FileType cabal setlocal expandtab shiftwidth=4 tabstop=4
	" Javascript 2 spaces and automatically remove trailing spaces
	autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
	" Rust automatically remove trailing spaces
	autocmd FileType rust autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
	" XML should be indented with spaces preferrably
	autocmd FileType xml setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

	au FileType html,htmldjango,sql,javascript setlocal indentexpr=
" }

" Font and Color {
	if has("gui_running")
		if has("win32")
			set guifont=Consolas:h12
		else
			set guifont=Menlo:h12
		endif

		set antialias
		set linespace=3
		set lines=47 columns=179
		" Prevent mouse usage, trackpad makes it way too easy to resort to
		" clicking to move the cursor
		set mouse=c
	else
		" set t_Co=80
		" Do not use terminal background color when clearing screen
		set t_ut=
	endif
	
	syntax on

	" Function for fixing many problems with colorschemes
	function! CorrectColorScheme()
		" Fix the listchars style
		hi clear NonText
		hi clear SpecialKey
		hi NonText ctermfg=240 guifg=#585858
		hi SpecialKey ctermfg=240 guifg=#585858
		
		" Change vertical bar styling
		hi VertSplit ctermfg=238 guifg=#444444 ctermbg=238 guibg=#444444
		
		" Fix LineNr styling, so it matches with most themes
		hi clear LineNr
		hi LineNr ctermfg=240 guifg=#585858
		
		" Fix autocomplete, the standard is "OMG MY EYES ARE BLEEDING!"
		hi Pmenu ctermfg=245 ctermbg=0 guifg=#8a8a8a guibg=#000000
		hi PmenuSel ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
		
		" Fix todo highlight
		hi clear Todo
		hi Todo ctermfg=124 guifg=#af0000

		" Fix sign column where syntastic errors are displayed
		hi SignColumn ctermfg=238 guifg=#444444 ctermbg=238 guibg=#444444
		
	endfunction
	
	" autocmd ColorScheme * call CorrectColorScheme()

	colorscheme jellybeans

	" Use underline on language server errors
	highlight ALEError ctermbg=124 guibg=Red3 ctermfg=15 guifg=White
	highlight ALEWarning cterm=underline ctermbg=227 guibg=LightGoldenrod ctermfg=40 guifg=Black

	set cursorline
	hi CursorLine guibg=Grey15 ctermbg=235
" }

" UI {
	" Shorter timeouts after keypresses before updating UI
	set timeoutlen=500 ttimeoutlen=500

	" Display hidden unicode characters as hex
	set display+=uhex
	
	" Relative line numbers on, with current line showing current line number
	set number
	
	" Highlight all search matches
	set showmatch
	
	" Incremental search (ie. search while you type)
	set incsearch
	set hlsearch
	
	" Ignore case for search unless it contains uppercase characters
	set ignorecase
	set smartcase

	" After vertical split, select lower pane
	" (hozontal splitting, keep default: select left pane)
	set splitbelow
	
	" Always keep this many lines below the line currently being edited
	set scrolloff=5
	
	" Remove scrollbars
	set guioptions+=lrbRL
	set guioptions-=lrbRL
	
	" No audio bell
	set vb
	" No visual bell either
	set t_vb=

	if has("gui_running")
		" Remove toolbar, menubar, scrollbar, dialogs
		set guioptions-=T
		set guioptions-=m
		set guioptions-=s
		set guioptions+=c

		" Ensure we always re-run t_vb when gui is loaded since it resets it
		autocmd! GUIEnter * set vb t_vb=
	endif
" }

" Key Mappings {
	" Normal backspace
	set backspace=2
	
	" Avoid escape
	inoremap jj <Esc>
	
	" Don't allow arrow keys in insert mode
	inoremap <Left>  <NOP>
	inoremap <Right> <NOP>
	inoremap <Up>    <NOP>
	inoremap <Down>  <NOP>

	" Make so that J and K moves up and down a line while keeping the caret in the
	" same column
	nmap j gj
	nmap k gk
	vmap j gj
	vmap k gk
	
	" easier cursor navigation between split windows using CTRL and h,j,k, or l
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l

	nnoremap <F3> :noh<CR>
	nnoremap <F4> :NERDTreeFind<CR>
	nnoremap <F5> :ALEGoToDefinition<CR>

	" Allow saving of files as sudo when vim is not running under sudo
	" NOTE: Does not work in gvim
	cmap w!! w !sudo tee > /dev/null %

	map <Leader>j :bnext<CR>
	map <Leader>k :bprevious<CR>

	map <Leader>w :bp\|bd #<CR>

	map <Leader>= <C-w>=

	map <Leader><Tab> :NERDTreeToggle<CR>

	" map <C-m> :NERDTreeToggle<CR>
	map <C-m> :NERDTree .<CR>

	" CTRL+W d to replace word without modifying the yank
	nnoremap <leader>d "_d


	noremap <silent> <C-S> :update<CR>
	vnoremap <silent> <C-S> <C-C>:update<CR>
	inoremap <silent> <C-S> <C-O>:update<CR>

" }

" Include local settings {
	if filereadable(glob($HOME . "/dotfiles/projects.vim"))
		source $HOME/dotfiles/projects.vim
	endif
" }

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1