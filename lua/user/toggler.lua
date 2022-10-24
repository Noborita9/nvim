local ok_status, toggler = pcall(require, "nvim-toggler")
if not ok_status then
	return
end

toggler.setup({
	inverses = {
		["True"] = "False",
		["from"] = "import",
	},
	remove_default_keybinds = true,
})
