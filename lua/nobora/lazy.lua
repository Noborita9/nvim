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
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        }
    },
    {
        "nvim-tree/nvim-web-devicons", lazy = true
    },
    {
        "folke/tokyonight.nvim",
        priority=1000,
        lazy=false,
        config=function ()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
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
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
    },
    {
        "terrortylor/nvim-comment"
    }
})
