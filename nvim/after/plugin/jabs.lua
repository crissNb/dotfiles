local jabs_status_ok, jabs = pcall(require, "jabs")
if not jabs_status_ok then
  return
end
jabs.setup {}
