vim.g.mapleader = " "

local bind = vim.keymap.set


bind("i", "<C-c>", "<Esc>")
bind({"n", "v"}, "<leader>y", [["+y]])
bind("n", "<leader>Y", [["+Y]])
bind("x", "<leader>p", [["_dP]])
bind("n", "q:", ":q<CR>")
