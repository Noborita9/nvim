local ok_status, tokyonight = pcall(require, "tokyonight")
if not ok_status then
  return
end

tokyonight.setup({
  style = "day",
  transparent = true,
  terminal_colors = true,
})
