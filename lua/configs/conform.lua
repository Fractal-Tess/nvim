local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    yml = { { "prettierd", "prettier" } },
    toml = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    tsx = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },

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
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
