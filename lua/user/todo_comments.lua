local status_ok_todo_comments, todo_comments = pcall(require, "todo-comments")
if not status_ok_todo_comments then
    return
end

todo_comments.setup({
    gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- ! The gui style to use for the bg highlight group.
    },
    highlight = {
        multiline = true
    }
})
