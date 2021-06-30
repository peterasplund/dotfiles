return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'
  use 'nanotech/jellybeans.vim'
  use 'ChristianChiarulli/nvcode-color-schemes.vim'

  use {
    'glepnir/galaxyline.nvim', -- Status bar
    branch = 'main',
    -- your statusline
    config = function() require'statusbar' end, -- remove this line
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
  use 'neovim/nvim-lspconfig' -- LSP
  -- use 'kabouzeid/nvim-lspinstall'
  use 'norcalli/nvim-colorizer.lua'
	use 'mattn/emmet-vim'
	use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
end)

