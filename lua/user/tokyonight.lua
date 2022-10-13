local ok_status, tokyonight = pcall(require, "tokyonight")
if not ok_status then
	return
end

tokyonight.setup({
	style = "storm",
	transparent = true,
	terminal_colors = true,
	styles = {
		functions = { italic = true },
	},
	hide_inactive_statusline = false,
})

-- this is a comment
require("user.colorscheme")
