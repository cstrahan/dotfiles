return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local noeol_component = {
      function()
        return "[noeol]"
      end,
      cond = function()
        --return not vim.bo.endofline
        return true
      end,
      color = { fg = "#e55561", gui = "bold" },
    }

    table.insert(opts.sections.lualine_x, noeol_component)

    return opts
  end,
}
