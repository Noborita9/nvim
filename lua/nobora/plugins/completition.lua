local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	local bind = vim.keymap.set
	bind("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	bind("n", "<leader>se", vim.diagnostic.open_float, { buffer = 0 })
	-- bind("n", "<leader>fc", vim.lsp.buf.format, { buffer = 0 })
	bind("n", "gD", vim.lsp.buf.definition, { buffer = 0 })
	bind("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })

	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").luau_lsp.setup(lsp.nvim_lua_ls())
require("lspconfig").pyright.setup({
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- ["<C-J>"] = cmp_action.luasnip_jump_forward(),
		-- ["<C-K>"] = cmp_action.luasnip_jump_backward(),
	},
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
