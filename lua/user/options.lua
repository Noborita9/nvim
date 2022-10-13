local options = {
	number = true,
	relativenumber = true,
	shiftwidth = 4,
	tabstop = 4,
	guicursor = "",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 10,
	guifont = "JetBrainsMono Nerd Font:h13",
	timeoutlen = 300,
	updatetime = 750,
	swapfile = false,
	splitright = true,
	splitbelow = true,
	termguicolors = true,
	cmdheight = 1,
	hlsearch = false,
	ignorecase = true,
	showmode = false,
	showtabline = 4,
	backup = false,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	pumheight = 10,
	smartcase = true,
	smartindent = false,
	undofile = true,
	writebackup = false,
	expandtab = true,
	numberwidth = 4,
	signcolumn = "yes",
	lazyredraw = true,
	ttyfast = true,
	syntax = "on",
}


vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
