--[[ local ok_status, _ = pcall(require, "lspconfig") ]]
--[[ if not ok_status then ]]
--[[ 	return ]]
--[[ end ]]
--[[]]
--[[ require("user.lsp.mason") ]]
--[[ -- require("user.lsp.lspconfig") ]]
--[[ require("user.lsp.null_ls") ]]
--[[]]

require("mason.settings").set({
    ui = {
        border = "rounded"
    }
})

local mason = require("mason")
mason.setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        --[[ "pyright", ]]
    }
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr) end

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })
    end
})



local ok_status, lsp = pcall(require, "lsp-zero")
if not ok_status then
    return
end

lsp.preset("recommended")

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
})
