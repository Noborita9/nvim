local options = {
	-- Tab
	softtabstop = 4,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	-- Numeric
	number = true,
	relativenumber = true,
	-- Cursor
	guicursor = "",
	smartindent = true,
	wrap = false,

	-- Splits
	splitright = true,
	splitbelow = true,

	-- Backups
	swapfile = false,
	undofile = true,
	backup = false,

	-- Search
	hlsearch = false,
	incsearch = true,

	-- Scrolls
	scrolloff = 8,
	sidescrolloff = 10,

	-- Color
	termguicolors = true,
	colorcolumn = "120",

	guifont = "JetBrainsMono Nerd Font:h13",
	timeoutlen = 300,
	updatetime = 50,
	cmdheight = 1,
	ignorecase = true,
	showmode = false,
	showtabline = 4,
	clipboard = "unnamedplus",
	completeopt = { "menu", "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	pumheight = 10,
	smartcase = true,
	writebackup = false,
	numberwidth = 4,
	signcolumn = "yes",
	syntax = "on",
	breakindent = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
