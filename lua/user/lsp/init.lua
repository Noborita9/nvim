local ok_status, _ = pcall(require, "lspconfig")
if not ok_status then
  return
end

require("user.lsp.mason")
require("user.lsp.config")
require("user.lsp.null_ls")
