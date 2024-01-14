local M = {}

function M.table_extend(deep, target, ...)
  local arg = { ... }
  for _, t in ipairs(arg) do
    if t then
      for k, v in pairs(t) do
        if deep and type(v) == "table" then
          if type(target[k]) == "table" then
            M.table_extend(deep, target[k], v)
          else
            target[k] = M.table_extend(deep, {}, v)
          end
        else
          target[k] = v
        end
      end
    end
  end
  return target
end

return M
