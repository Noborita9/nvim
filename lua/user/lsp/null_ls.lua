local ok_status, null_ls = pcall(require, "null-ls")
if not ok_status then
    return
end

local formatting = null_ls.builtins.formatting
local linting = null_ls.builtins.linting

null_ls.setup({
    debug = false,
    sources = {
        formatting.stylua,
        formatting.autoflake,
        formatting.flake8,
        linting.flake8,
    },
})
