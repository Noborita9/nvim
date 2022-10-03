M = { }

function M.split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function M.get_dir_files(path)
  local files_handler = io.popen("ls " .. path) --"ls " .. path)
  local fallback = ""
  if files_handler ~= nil then
    local result = files_handler:read("*a")
    local table_result = M.split(result, "\n")
    for index, file in ipairs(table_result) do
      if file == "" then
        table.remove(table_result, index)
      end
    end
    return table_result
  end
  return fallback
end

return M
