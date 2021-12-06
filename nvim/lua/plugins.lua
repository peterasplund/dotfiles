return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'
  use 'nanotech/jellybeans.vim'
  use 'ChristianChiarulli/nvcode-color-schemes.vim'
  use 'tjdevries/nlua.nvim'
  use {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init({ with_text = false })
    end,
  }

  use {
    'glepnir/galaxyline.nvim', -- Status bar
    branch = 'main',
    -- your statusline
		-- config = [[require('plugin/statusbar')]],
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'kyazdani42/nvim-tree.lua', -- File explorer sidebar
    config = function()
      require("nvim-tree").setup()
    end
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'romgrk/barbar.nvim'
  use { 'neovim/nvim-lspconfig' }
  use 'norcalli/nvim-colorizer.lua'
  --use 'windwp/nvim-autopairs'
  
  
	use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
  use "hrsh7th/vim-vsnip"
  use "ray-x/lsp_signature.nvim"
  use "jparise/vim-graphql"

  --use 'chemzqm/vim-jsx-improve'
  -- use 'maxmellon/vim-jsx-pretty'

  use 'editorconfig/editorconfig-vim'

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "BufRead",
    commit = "25d4b182ece5b03cd4b2d8c196f3c38e0df58801",
  }

end)
