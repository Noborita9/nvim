local ok_status, lightspeed = pcall(require, "lightspeed")
if not ok_status then
  return
end

lightspeed.setup{
  ignore_case = true,
}
