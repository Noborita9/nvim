local mason_ok_status, mason = pcall(require, "mason")
if not mason_ok_status then
  return
end

local util_ok_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not util_ok_status then
  return
end

local lspconfig_ok_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok_status then
  return
end

local on_attach_func = function ()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
end

-- for _, server in pairs
mason.setup()
mason_lspconfig.setup_handlers {
  function (server_name)
    if server_name == "sumneko_lua" then
      lspconfig[server_name].setup {
        on_attach = on_attach_func,
        settings = {

            Lua = {
              diagnostics = {
                globals = { "vim", "use" },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
      }
    else
      lspconfig[server_name].setup {
        on_attach = on_attach_func
      }
    end
  end,
}
--mason_lspconfig.setup(
 -- {
  --  ensure_installed = {},
   -- automatic_installation = true,
  --}
--)
