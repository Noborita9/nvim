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

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
	float = {
		focuseable = false,
	},
})

local on_attach_func = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = 0 })
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = 0 })
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		if server_name == "sumneko_lua" then
			lspconfig[server_name].setup({
				on_attach = on_attach_func,
				capabilities = capabilities,
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
			})
		else
			lspconfig[server_name].setup({
				on_attach = on_attach_func,
				capabilities = capabilities,
			})
		end
	end,
})
