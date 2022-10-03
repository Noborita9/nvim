vim.cmd [[
try
  colorscheme tokyonight-night 
  hi Normal guibg=NONE ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]-- OceanicNext
  -- colorscheme tokyonight-night
