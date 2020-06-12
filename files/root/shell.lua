
local shell = {}

local function escape(...)
  local args = {...}
   local ret = {}
  for _,a in pairs(args) do
    s = tostring(a)
    if s:match("[^A-Za-z0-9_/:=-]") then
      s = "'"..s:gsub("'", "'\\''").."'"
    end
    table.insert(ret,s)
  end
  return table.concat(ret, " ")
end

shell.escape = escape

return shell
