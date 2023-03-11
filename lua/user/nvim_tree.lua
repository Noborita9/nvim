local ok_status, nvim_tree = pcall(require, "nvim-tree")
if not ok_status then
	return
end

local ok_status_config, nvim_tree_config = pcall(require, "nvim-tree.config")
if not ok_status_config then
	return
end


local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 30,
		--height = 30,
		side = "left",
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "u", action = "dir_up" },},},},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	filters = {
		dotfiles = false,
	},
})

local function open_nvim_tree(data)
  local dir = vim.fn.isdirectory(data.file) == 1
  if not dir then
    return
  end
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
