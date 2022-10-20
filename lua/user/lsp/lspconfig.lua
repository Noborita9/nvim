local ok_status, lspconfig = pcall(require, "lspconfig")
if not ok_status then
    return
end

lspconfig.pyright.setup()
