local config_ok_status, lspconfig = pcall(require, "lspconfig")
if not config_ok_status then
  return
end

local util_ok_status, util = pcall(require, "lspconfig/util")
if not util_ok_status then
  return
end

local on_attach_func = function ()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
end

lspconfig.rust_analyzer.setup({
  on_attach = on_attach_func,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    }
  }
})


