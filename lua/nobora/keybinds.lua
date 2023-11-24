local bind = vim.keymap.set

local opts = {
    noremap = true,
    silent = true,
    nowait = true
}

bind("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

bind("i", "<C-c>", "<Esc>")
bind({ "n", "v" }, "<leader>y", [["+y]])
bind("n", "<leader>Y", [["+Y]])
bind("x", "<leader>p", [["_dP]])
bind("n", "q:", ":q<CR>")

bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)

bind("n", "<C-l>", "<C-w>l", opts)

bind("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
bind("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
bind("v", "<", "<gv", opts)
bind("v", ">", ">gv", opts)

-- Move text up and down
bind("v", "<A-j>", ":m .+1<CR>==", opts)
bind("v", "<A-k>", ":m .-2<CR>==", opts)
bind("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
bind("x", "J", ":move '>+1<CR>gv-gv", opts)
bind("x", "K", ":move '<-2<CR>gv-gv", opts)

bind("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
bind("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Format
bind("n", "<leader>fc", ":Format<CR>", opts)

-- Telescope
local telescope = require("telescope.builtin")
bind("n", "<leader>fw", telescope.live_grep, opts)
bind("n", "<leader>ff", telescope.find_files, opts)
