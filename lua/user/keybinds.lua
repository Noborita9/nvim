local bind = vim.keymap.set


bind("n", "<leader>e", ":NvimTreeToggle<CR>")

bind({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- Remap for dealing with word wrap
bind('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
bind('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
bind('i', 'jk', "<ESC>", { silent = true })

bind('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
bind('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
bind('n', '<leader>gl', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
bind('n', '<leader>gL', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
bind('n', '<leader>q', ':q<CR>')
bind('n', '<leader>w', ':w<CR>')

bind('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
bind('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
bind('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
bind('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
bind('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Formating

bind('n', '<leader>ff', ":FormatWrite<CR>")
