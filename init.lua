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

local my_config = {
    number = true,
    relativenumber = true,

    softtabstop = 4,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    guicursor = "",
    smartindent = true,
    wrap = false,

    -- Splits
    splitright = true,
    splitbelow = true,

    -- Backups
    swapfile = false,
    undofile = true,
    backup = false,

    -- Search
    hlsearch = false,
    incsearch = true,

    -- Scrolls
    scrolloff = 8,
    sidescrolloff = 10,

    -- Color
    termguicolors = true,
    colorcolumn = "80",
    guifont = "JetBrainsMono Nerd Font:h13",
    timeoutlen = 300,
    updatetime = 50,
    cmdheight = 1,

    ignorecase = true,
    showmode = false,
    showtabline = 4,
    clipboard = "unnamedplus",
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0,

    fileencoding = "utf-8",
    pumheight = 10,

    smartcase = true,
    writebackup = false,
    numberwidth = 4,
    signcolumn = "yes",
    syntax = "on",
}

for config, value in pairs(my_config)do
    vim.opt[config] = value
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.material_style = "palenight"



require("lazy").setup({
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {
            check_ts = true,
            ts_config = {

                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },

                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",

                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },


        } 
        local remap = vim.api.nvim_set_keymap
        local npairs = require('nvim-autopairs')


        npairs.setup({ map_bs = false })

        vim.g.coq_settings = { keymap = { recommended = false } }

        -- these mappings are coq recommended mappings unrelated to nvim-autopairs
        remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
        remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
        remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
        remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

        -- skip it, if you use another global object
        _G.MUtils= {}

        MUtils.CR = function()
            if vim.fn.pumvisible() ~= 0 then
                if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
                    return npairs.esc('<c-y>')
                else
                    return npairs.esc('<c-e>') .. npairs.autopairs_cr()
                end
            else
                return npairs.autopairs_cr()
            end
        end

        remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })


        MUtils.BS = function()
            if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
                return npairs.esc('<c-e>') .. npairs.autopairs_bs()
            else
                return npairs.autopairs_bs()
            end
        end
        remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    end
},
{
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("material").setup({
            contrast = {
                terminal = true,
                sidebar = true,
            },
            styles = {
                comments = { italic = true },
                strings = { --[[ bold = true ]] },
                keywords = {  italic = true  },
                functions = {italic = true},
                variables = {},
                operators = {},
                types = {},
            },
            disable = {
                colored_cursor = true,
                background = false,
            }
        })
        vim.cmd([[colorscheme material]])
    end
},
{
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup{
            theme = "neon"
        }
    end
},
{
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {"neovim/nvim-lspconfig"},
    config = function()
        local lsp = require("lspconfig")
        local coq = require("coq")

        lsp.pyright.setup({})
        lsp.rust_analyzer.setup({})
        lsp.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Setup your lua path
                        path = path
                    },
                    completion = { callSnippet = "Both" },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" }
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = library,
                        maxPreload = 2000,
                        preloadFileSize = 50000
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = { enable = false }
                }
            }
        })
        vim.cmd("COQnow -s")
    end
},
{
    "ms-jpq/coq.artifacts",
    branch = "artifacts"
},
{
    "ms-jpq/coq.thirdparty",
    branch = '3p'
},
{
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function ()
        require("todo-comments").setup()
    end
},
{
    "numToStr/Comment.nvim",
    config = function ()
        require("Comment").setup()
    end
},
{
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate",
    config = function ()
        require("nvim-treesitter.configs").setup ({
            ensure_installed = {"lua", "python", "rust"},
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
            }
        })
    end},
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function ()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true

            -- OR setup with some options
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                    mappings = {
                        list = {
                            { key = "u", action = "dir_up" },
                        },
                    },
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        -- webdev_icons = true,
                    },
                },
                filters = {
                    dotfiles = true,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                }
            })
        end
    },
    },
    {
    defaults = {
        lazy = false
    }
}
)
