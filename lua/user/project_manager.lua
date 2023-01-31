local ok_status, manager = pcall(require, "project_nvim")
if not ok_status then
	return
end

manager.setup(
    {
        manual_mode = true
    }
)
require('telescope').load_extension('projects')
