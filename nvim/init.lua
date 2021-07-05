-- Map leader to space
vim.g.mapleader = ' '
local fn = vim.fn
local execute = vim.api.nvim_command

require('settings')
require('keymappings')
require('plugins')
require('lsp_lua')

--require'lspconfig'.pyright.setup{}
require "lspconfig".efm.setup{
	filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "yaml", "markdown"}
}
require'lspconfig'.flow.setup{}

require "lsp_signature".on_attach()
