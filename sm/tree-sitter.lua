local ok_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok_status then
    return
end


treesitter.setup({
    ensure_installed = {"python", "lua", "html", "typescript", "javascript"},
    auto_install = true,
    highlight = {
        enable = true,
    }
})
