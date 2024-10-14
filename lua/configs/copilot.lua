local options = {
  -- filetypes = { markdown = true, lua = true },

  panel = {
    auto_refresh = true,
  },

  suggestion = {
    auto_trigger = true,
    filetypes = {
      ["."] = true,
    },
  },
}

return options

