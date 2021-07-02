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
	let mapleader=" "

	set completeopt=menuone,noselect
	set termguicolors
	set mouse=a
" }

" UI {
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

	" Fix LineNr styling, so it matches with most themes
	hi clear LineNr
	hi LineNr ctermfg=240 guifg=#585858

	set cursorline
	hi CursorLine guibg=Grey15 ctermbg=235
" }

" Store backups in $HOME to keep the directory trees clean {
	set backup
	set undofile
	set backupdir=$HOME/.vim/.backup/
	set directory=$HOME/.vim/.swap/
	set viewdir=$HOME/.vim/.views/
	set undodir=$HOME/.vim/.undo/
" }

" Emmet {
	" let g:user_emmet_expandabbr_key='<Tab>'
	imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" }

" Tabs and Indentation {
	set noexpandtab
	set autoindent
	
	set cindent
	set softtabstop=2
	set tabstop=2
	set shiftwidth=2
	filetype plugin indent on

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
	" PHP indent is 4 spaces and remove trailing spaces
	autocmd FileType php setlocal autoindent expandtab shiftwidth=4 tabstop=4
	autocmd FileType php autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
	" Python should be indented with spaces preferrably
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
	" Haskell should be indented with spaces preferrably
	autocmd FileType haskell setlocal expandtab shiftwidth=4 tabstop=4
	autocmd FileType cabal setlocal expandtab shiftwidth=4 tabstop=4
	" Javascript 2 spaces and automatically remove trailing spaces
	autocmd FileType javascript setlocal autoindent expandtab shiftwidth=2 tabstop=2
	autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
	" Rust automatically remove trailing spaces
	autocmd FileType rust autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
	" XML should be indented with spaces preferrably
	autocmd FileType xml setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

	au FileType html,htmldjango,sql,javascript setlocal indentexpr=
" }

" easier cursor navigation between split windows using CTRL and h,j,k, or l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <F3> :noh<CR>
" Toggle tree explorer
nnoremap <C-m> :NvimTreeToggle<CR>

nnoremap <F4> :NvimTreeFindFile<CR>
" nnoremap <F5> :ALEGoToDefinition<CR>

" Move between buffers easier
map <Leader>j :bnext<CR>
map <Leader>k :bprevious<CR>

map <Leader>w :bp\|bd #<CR>

map <C-p> :Telescope find_files<CR>
map <F2> :Telescope live_grep<CR>

" colorscheme jellybeans
colorscheme snazzy

lua require('plugins')

lua << EOF

require'lspconfig'.pyright.setup{}
require "lspconfig".efm.setup{
	filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "yaml", "markdown", "flow" }
}
require'lspconfig'.flow.setup{}

EOF

lua require'colorizer'.setup()
lua require('gitsigns').setup()
lua require('nvim-autopairs').setup()
