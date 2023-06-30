local ok_status, comment = pcall(require, "nvim_comment")
if not ok_status then
    return
end


comment.setup({
    comment_empty = false,
})
