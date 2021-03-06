local utils = require('utils')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'colorscheme snazzy'
cmd 'au FileType html,sql,javascript setlocal indentexpr='
--cmd 'set noexpandtab'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
--utils.opt('b', 'autoindent', true)
--utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
--utils.opt('b', 'cindent', true)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', false)
utils.opt('o', 'clipboard','unnamed,unnamedplus')

vim.o.termguicolors = true

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
