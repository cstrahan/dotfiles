-- Don't preselect completion items.
--
-- https://github.com/LazyVim/LazyVim/discussions/5186
return {
  "saghen/blink.cmp",
  -- Make blink.cmp toogleable
  opts = function(_, opts)
    -- https://cmp.saghen.dev/configuration/reference#completion
    opts.completion = opts.completion or {}
    opts.completion.list = opts.completion.list or {}
    opts.completion.list.selection = opts.completion.list.selection or {}
    opts.completion.list.selection.preselect = false
    opts.completion.list.selection.auto_insert = true
    return opts
  end,
}

-- Notes:
--   show:     Ctrl+spc
--   unselect: Ctrl+e
