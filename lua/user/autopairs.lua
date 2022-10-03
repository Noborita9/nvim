local ok_status, autopair = pcall(require, "nvim-autopairs")
-- local ok_status, autopair = pcall(require, "pears")
if not ok_status then
  print("FAILED")
  return
end

autopair.setup()

