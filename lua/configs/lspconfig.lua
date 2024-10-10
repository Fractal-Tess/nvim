local configs = require "nvchad.configs.lspconfig"

local servers = {
  biome = {},
  html = {},
  cssls = {},
  gopls = {},
  docker_compose_language_service = {},
  dockerls = {},
  clangd = {},
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
  rust_analyzer = {},
  eslint = {},
  emmet_language_server = {},
  lua_ls = {},
  nixd = {},
  csharp_ls = {},
  jsonls = {},
  nginx_language_server = {},
  sqls = {},
  phan = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities
  require("lspconfig")[name].setup(opts)
end
