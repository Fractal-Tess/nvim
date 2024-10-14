local options = {
  lsp_fallback = false,

  formatters_by_ft = {
    lua = { "stylua" },

    yml = { "prettierd", "prettier", stop_after_first = true },
    svelte = { "prettierd", "prettier", stop_after_first = true },
    toml = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd" },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    astro = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },

    rust = { "rustfmt" },

    sh = { "shfmt" },
    nix = { "nixpkgsfmt" },

    c = { "clangformat" },
    cpp = { "clangformat" },
  },

  formatters = {
    nixpkgsfmt = {
      command = "nixpkgs-fmt",
      args = {},
    },
    clangformat = {
      inherit = false,
      command = "clang-format",
    },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_fallback = false,
  },
}

return options
