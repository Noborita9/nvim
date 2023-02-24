-- TODO: Categorize plugins again, its messy

return require("packer").startup(function()
	-- Packer manages itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- My plugins
	-- Colorscheme
	use("folke/tokyonight.nvim") -- 8/10
	use("EdenEast/nightfox.nvim") -- 6/8
	use("rebelot/kanagawa.nvim") -- 7/8
	use("mhartington/oceanic-next") -- 8/10
	use("sainnhe/edge") -- 8/10
	use("Rigellute/shades-of-purple.vim")

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Status bar
	use("nvim-lualine/lualine.nvim")

	-- Completition
	use("windwp/nvim-autopairs")

	use("saadparwaiz1/cmp_luasnip")

	-- LSP

	-- Formater
	use("jose-elias-alvarez/null-ls.nvim")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("folke/todo-comments.nvim")

	-- Code organization
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("Vimjas/vim-python-pep8-indent")

	use("nvim-treesitter/nvim-treesitter-context")
	-- Git intrgrations
	use("lewis6991/gitsigns.nvim")

	-- Navigation
	use("ThePrimeagen/harpoon")

	-- GOTTA GO FAST
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")

	-- Others
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nguyenvukhang/nvim-toggler")

	-- Note Taking
	use({
		"phaazon/mind.nvim",
		branch = "v2.2",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("mind").setup()
		end,
	})
	use("ahmedkhalf/project.nvim")
    use("chrisbra/NrrwRgn")
    use("leafo/moonscript-vim")

	-- CMP
    -- NOTE: This breaks packer, check it out later
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            {use("neovim/nvim-lspconfig")},
            {use("williamboman/mason.nvim")},
            {use("williamboman/mason-lspconfig.nvim")},
            {use("hrsh7th/nvim-cmp")},
            {use("hrsh7th/cmp-nvim-lsp")},
            {use("hrsh7th/cmp-buffer")},
            {use("hrsh7th/cmp-path")},
            {use("hrsh7th/cmp-cmdline")},
            {use("hrsh7th/cmp-nvim-lua")},
            {use("L3MON4D3/LuaSnip")},
            {use("rafamadriz/friendly-snippets")},
        }
    })
end)
