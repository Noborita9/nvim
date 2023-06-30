local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    },
    {
        "nvim-tree/nvim-web-devicons", lazy = true
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = false,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { italic = true },
                    sidebar = "dark",
                    floats = "dark"
                }
            })
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            local ok_status, autopair = pcall(require, "nvim-autopairs")
            if not ok_status then
                return
            end
            autopair.setup {}
        end
    },
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     lazy = false,
    -- },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
    },
    {
        "terrortylor/nvim-comment"
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    {
        "nathom/filetype.nvim",
        config = function()
            local ok_status, filetype_pg = pcall(require, "filetype")
            if not ok_status then
                return
            end

            filetype_pg.setup({})
        end
    },

    {
        "mhartington/formatter.nvim"
    },
    {
        "ianxek/cone.vim"
    }
})
