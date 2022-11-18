local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Save file and quit
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)

-- nvim-tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Harpoon 
keymap("n", "<Leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<Leader>m", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<Leader>a", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<Leader>s", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<Leader>d", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<Leader>f", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

-- Toggler
keymap("n", "<Leader>li", ":lua require('nvim-toggler').toggle()<CR>", opts)

-- Renamer 
keymap("i", '<F2>', ':lua require("renamer").rename()<cr>', opts)
keymap('n', '<leader>rn', ':lua require("renamer").rename()<cr>', opts)
keymap('v', '<leader>rn', ':lua require("renamer").rename()<cr>', opts)
