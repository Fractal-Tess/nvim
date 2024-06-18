-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html", -- html
  "cssls", -- css, scss, sass, less
  "tsserver", -- js, ts, jsx, tsx
  "clangd", -- c, cpp
  "svelte", -- svelte
  "tailwindcss", -- tailwindcss
  "rust_analyzer", -- rust
  "eslint", -- js, ts, jsx, tsx (eslint)
  "emmet_language_server", -- emmet
  "nil_ls", -- lua
  "csharp_ls", -- dotnet sdk
  "jsonls", -- json
  "sqls", -- sql
  "phpactor", -- php
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
