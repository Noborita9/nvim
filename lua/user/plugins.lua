vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer manages itself
  use ('wbthomason/packer.nvim')

  -- My plugins
  -- Colorscheme
  use ('folke/tokyonight.nvim') -- 8/10
  use ("EdenEast/nightfox.nvim") -- 6/8
  use ("rebelot/kanagawa.nvim") -- 7/8
  use ("mhartington/oceanic-next") -- 8/10
  use ("sainnhe/edge") -- 8/10

  -- File Explorer
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Completition
  use ("windwp/nvim-autopairs")
  use ("L3MON4D3/LuaSnip")
  use ("rafamadriz/friendly-snippets")

  -- CMP
  use ('hrsh7th/cmp-nvim-lsp')
  use ('hrsh7th/cmp-buffer')
  use ('hrsh7th/cmp-path')
  use ('hrsh7th/cmp-cmdline')
  use ('hrsh7th/nvim-cmp')
  use ('saadparwaiz1/cmp_luasnip')
  -- LSP
  use ('neovim/nvim-lspconfig')
  use ('williamboman/mason.nvim')
  use ('williamboman/mason-lspconfig.nvim')
  -- Comments
  use ('numToStr/Comment.nvim')
  use ("JoosepAlviste/nvim-ts-context-commentstring")

  -- Code organization
  use ({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  })
  use ('nvim-treesitter/nvim-treesitter-context')
  use ("p00f/nvim-ts-rainbow")
  -- Others
end)