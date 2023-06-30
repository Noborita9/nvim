local ok_status, nvim_tree = pcall(require, "nvim-tree")
if not ok_status then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local bind = vim.keymap.set

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end
    -- Best bindings ever!
    bind("n", "<CR>", api.node.open.edit, opts("Open"))
    bind("n", "l", api.node.open.edit, opts("Open"))
    bind("n", "v", api.node.open.vertical, opts("Open Split"))

    bind("n", "u", api.tree.change_root_to_parent, opts("Parent Directory"))
    bind("n", "q", api.tree.close, opts("Close"))
    bind("n", "h", api.node.navigate.parent_close, opts("Close Parent Folder"))
    bind("n", "c", api.fs.copy.node, opts("Copy"))
    bind("n", "p", api.fs.paste, opts("Paste"))
    bind("n", "d", api.fs.remove, opts("Delete"))
    bind('n', 'a', api.fs.create, opts('Create'))



    bind("n", "r", api.fs.rename_basename, opts("Rename Basename"))
    bind("n", "R", api.fs.rename, opts("Rename"))
    bind("n", "E", api.tree.expand_all, opts("Expand All"))
    bind("n", "C", api.tree.collapse_all, opts("Collapse All"))
    bind("n", "<leader>gp", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    bind("n", "<leader>gf", api.fs.copy.filename, opts("Copy Filename"))
end

nvim_tree.setup({
    sort_by = "case_sensitive",
    on_attach = on_attach,
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})


bind("n", "<leader>e", ":NvimTreeToggle<CR>")
