local ok_status, colorizer = pcall(require, "colorizer")
if not ok_status then
	return
end

colorizer.setup({
	javascript = {
		mode = "foreground",
	},
	css = {
		mode = "foreground",
	},
	lua = {
		mode = "foreground",
	},
	html = {
		mode = "foreground",
	},
	python = {
		mode = "foreground",
	},
})
