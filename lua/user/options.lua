local options = {
	number         = true,
	relativenumber = true,
	shiftwidth     = 2,
	tabstop        = 2,
	guicursor      = "",
	wrap           = false,
	scrolloff      = 8,
	sidescrolloff  = 8,
	guifont        = "JetBrainsMono Nerd Font:h13",
	timeoutlen     = 100,
  updatetime     = 300,
	swapfile       = false,
	splitright     = true,
	splitbelow     = true,
	termguicolors  = true,
	cmdheight      = 2,
	hlsearch       = false,
	ignorecase     = true,
	showmode       = false,
	showtabline    = 2,
	backup         = false,
	clipboard      = "unnamedplus",
	completeopt    = { "menuone", "noselect" },
	conceallevel   = 0,
	fileencoding	 = "utf-8",
	pumheight 		 = 10,
	smartcase 		 = true,
	smartindent 	 = true,
	undofile 			 = true,
	writebackup 	 = false,
	expandtab      = true,
  numberwidth    = 4,
  signcolumn     = "yes"
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
