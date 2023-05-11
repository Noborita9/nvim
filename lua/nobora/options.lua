local options = {
    -- Basics
	number = true,
	relativenumber = true,
	syntax="yes",
	guicursor = "",

    -- Tabbing
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
    wrap = false,

    -- File Secure
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    swapfile = false,
    backup = false,
    undofile = true,

    -- Search
    hlsearch = false,
    incsearch = true,
    -- Color
    termguicolors = true,

    -- Niceness
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
    colorcolumn = "80",
    completeopt = { "menu", "menuone", "noselect" },
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.isfname:append("@-@")


