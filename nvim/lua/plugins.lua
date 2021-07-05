return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'
  use 'nanotech/jellybeans.vim'
  use 'ChristianChiarulli/nvcode-color-schemes.vim'
  use 'tjdevries/nlua.nvim'

  use {
    'glepnir/galaxyline.nvim', -- Status bar
    branch = 'main',
    -- your statusline
		-- config = [[require('plugin/statusbar')]],
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'kyazdani42/nvim-tree.lua' -- File explorer sidebar
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'romgrk/barbar.nvim'
  use { 'neovim/nvim-lspconfig' }
  use 'norcalli/nvim-colorizer.lua'
	use 'mattn/emmet-vim'
	use 'windwp/nvim-autopairs'
	use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
	use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
	use {
    "hrsh7th/nvim-compe",
		config = [[require('plugin/compe')]],
    }
    use "ray-x/lsp_signature.nvim"
end)
