local shell = {}

local function escape_arg(arg)
  local s = tostring(arg)
  if s:match("[^A-Za-z0-9_/:=-]") then
    s = "'"..s:gsub("'", "'\\''").."'"
  end
  return s
end

function shell.escape(args)
  if type(args) ~= "table" then
    return escape_arg(args)
  end

  local ret = {}
  for _, arg in pairs(args) do
    local s = escape_arg(arg)
    table.insert(ret,s)
  end
  return table.concat(ret, " ")
end

return shell
