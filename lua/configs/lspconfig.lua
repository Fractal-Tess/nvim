-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  -- HTML
  emmet_language_server = {},
  html = {},

  -- CSS
  cssls = {},

  -- Js frameworks
  svelte = {},
  astro = {},
  tailwindcss = {
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          },
        },
      },
    },
  },

  -- JSON
  jsonls = {},
  -- Eslint
  eslint = {},

  -- Docker
  docker_compose_language_service = {},
  dockerls = {},

  -- Nginx
  nginx_language_server = {},

  -- Rust
  rust_analyzer = {},

  -- Clang (c/c++)
  clangd = {},

  -- Go
  gopls = {},

  -- Lua
  lua_ls = {},

  -- Nix
  nixd = {},

  -- C#
  -- csharp_ls = {},

  -- SQL
  sqls = {},

  -- PHP
  phpactor = {},
}

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities
  lspconfig[name].setup(opts)
end
