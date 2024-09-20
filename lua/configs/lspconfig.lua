local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "biome",
  "html", -- html
  "cssls", -- css, scss, sass, less
  "ts_ls", -- js, ts, jsx, tsx
  "clangd", -- c, cpp
  "svelte", -- svelte
  "astro", -- astro
  "tailwindcss", -- tailwindcss
  "rust_analyzer", -- rust
  "eslint", -- js, ts, jsx, tsx (eslint)
  "emmet_language_server", -- emmet
  "nil_ls", -- lua
  "csharp_ls", -- dotnet sdk
  "jsonls", -- json
  "sqls", -- sql
  -- "phpactor", -- php,
  "phan", -- php
}

for _, lsp in ipairs(servers) do
  if lsp == "tailwindcss" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
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
    }
  else
    lspconfig[lsp].setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
