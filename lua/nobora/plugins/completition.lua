local lsp_zero = require("lsp-zero")
local cmp = require("cmp")

-- 1. KEYMAPS & ATTACH LOGIC (Native LspAttach Autocommand)
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		local bind = vim.keymap.set

		bind("n", "K", vim.lsp.buf.hover, opts)
		bind("n", "<leader>se", vim.diagnostic.open_float, opts)
		bind("n", "gD", vim.lsp.buf.definition, opts)
		bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- bind("n", "<leader>fc", vim.lsp.buf.format, opts)
	end,
})

-- 2. SERVER CONFIGURATION (Native vim.lsp.config)
-- Define capabilities once to use for all servers (crucial for nvim-cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_config = {
	capabilities = capabilities,
}

local configurations = {
	lua_ls = {
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},
	rust_analyzer = {
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = true,
				check = {
					command = "clippy", -- Useful for inline linting errors
				},
			},
		},
	},
	ts_ls = default_config,
	basedpyright = {
		capabilities = capabilities,
		settings = {
			basedpyright = {
				analysis = {
					diagnosticMode = "workspace", -- or "workspace"
					typeCheckingMode = "strict", -- or "strict", "off", "standard"
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,

					reportInvalidAbstractMethod = "error",
				},
			},
		},
	},
}

for server, config in pairs(configurations) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end

-- 3. COMPLETION SETUP (CMP)
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
	},
	-- snippet support is often required for rust-analyzer to autocomplete functions with arguments
	snippet = {
		expand = function(args)
			-- You need a snippet engine (like luasnip) for this
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- (Optional) Autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- local lsp_zero = require("lsp-zero")
-- -- Add this to vim.lsp.config for every server
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- vim.lsp.config['lua_ls'].capabilities = capabilities
-- vim.lsp.config['ts_ls'].capabilities = capabilities

-- -- 1. KEYMAPS & ATTACH LOGIC (Native LspAttach Autocommand)
-- -- This replaces lsp.on_attach
-- vim.api.nvim_create_autocmd('LspAttach', {
--     desc = 'LSP actions',
--     callback = function(event)
--         local opts = { buffer = event.buf }
--         local bind = vim.keymap.set

--         bind("n", "K", vim.lsp.buf.hover, opts)
--         bind("n", "<leader>se", vim.diagnostic.open_float, opts)
--         bind("n", "gD", vim.lsp.buf.definition, opts)
--         bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
--         -- bind("n", "<leader>fc", vim.lsp.buf.format, opts)
--     end,
-- })

-- -- 2. SERVER CONFIGURATION (Native vim.lsp.config)
-- -- Replaces require("lspconfig").xxx.setup(...)

-- -- Configure Lua LS
-- vim.lsp.config['lua_ls'] = {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' } -- Fixes "Undefined global 'vim'"
--             }
--         }
--     }
-- }
-- vim.lsp.enable('lua_ls')

-- -- Configure TS LS (Typescript)
-- vim.lsp.config['ts_ls'] = {}
-- vim.lsp.enable('ts_ls')

-- -- 3. COMPLETION SETUP (CMP)
-- -- This part remains largely the same, handling the autocomplete menu
-- local cmp = require("cmp")
-- local cmp_action = lsp_zero.cmp_action()

-- cmp.setup({
--     sources = {
--         {name = 'nvim_lsp'},
--         {name = 'buffer'},
--     },
--     mapping = {
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm({ select = false }),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--     },
--     -- snippet = { -- You might need this if you don't have it elsewhere
--     --     expand = function(args)
--     --         require('luasnip').lsp_expand(args.body)
--     --     end,
--     -- },
-- })

-- -- (Optional) Autopairs
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
