vim.treesitter.language.register("markdown", "mdx")

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "blade",
}

vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
}

local opts = {
  ensure_installed = {
    "lua",
    "vim",
    "nginx",
    "go",

    "svelte",
    "astro",
    "html",
    "tsx",
    "css",
    "xml",
    "json",
    "javascript",
    "typescript",
    "php",
    "markdown",
    "markdown_inline",

    "c_sharp",
    "sql",
    "yaml",
    "ron",
    "c",
    "blade",
  },

  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
}

return opts
