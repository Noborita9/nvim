vim.cmd([[
try
colorscheme tokyonight
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
colorscheme default
set background=dark
endtry
]]) -- OceanicNext
-- colorscheme tokyonight-night
