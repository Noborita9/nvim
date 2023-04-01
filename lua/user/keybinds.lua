local bind = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

bind("n", "<leader>e", ":NvimTreeToggle<CR>")

bind({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
bind("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
bind("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
bind("i", "jk", "<ESC>", { silent = true })

bind("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
bind("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
bind("n", "<leader>gl", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
bind("n", "<leader>gL", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
bind("n", "<leader>q", ":q<CR>")
bind("n", "<leader>w", ":w<CR>")

bind("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
bind("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
bind("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
bind("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
bind("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Formating

bind("n", "<leader>ff", ":FormatWrite<CR>")

-- better window navigation
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)
bind("n", "<C-l>", "<C-w>l", opts)

-- Moving Text
bind("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
bind("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Stay in indent mode
bind("v", "<", "<gv", opts)
bind("v", ">", ">gv", opts)

-- Move text up and down
bind("v", "<A-j>", ":m .+1<CR>==", opts)
bind("v", "<A-k>", ":m .-2<CR>==", opts)
bind("v", "p", '"_dP', opts)

-- Visual Block
-- Move text up and down
bind("x", "J", ":move '>+1<CR>gv-gv", opts)
bind("x", "K", ":move '<-2<CR>gv-gv", opts)
bind("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
bind("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Harpoon
bind("n", "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
bind("n", "<Leader>h", ":lua require('harpoon.mark').add_file()<CR>", opts)
bind("n", "<Leader>a", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
bind("n", "<Leader>s", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
bind("n", "<Leader>d", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
bind("n", "<Leader>f", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
-- Gitsign
bind("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
