-----------------------------------------------------------
-- LSP Configuration
-----------------------------------------------------------

-- Load NvChad LSP defaults
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

-----------------------------------------------------------
-- Language Server Configurations
-----------------------------------------------------------

local servers = {
    -----------------------------------------------------------
    -- Web Development
    -----------------------------------------------------------
    -- HTML & CSS
    emmet_language_server = {},
    html = {},
    cssls = {},
    
    -- JavaScript & Frameworks
    svelte = {},
    astro = {},
    
    -- Tailwind CSS
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
    
    -- JSON & Linting
    jsonls = {},
    eslint = {},

    -----------------------------------------------------------
    -- DevOps & Infrastructure
    -----------------------------------------------------------
    -- Docker
    docker_compose_language_service = {},
    dockerls = {},
    
    -- Server Configuration
    nginx_language_server = {},

    -----------------------------------------------------------
    -- Systems Programming
    -----------------------------------------------------------
    -- Rust
    rust_analyzer = {},
    
    -- C/C++
    clangd = {},
    
    -- Go
    gopls = {},

    -----------------------------------------------------------
    -- Scripting & Configuration
    -----------------------------------------------------------
    -- Lua
    lua_ls = {},
    
    -- Nix
    nixd = {},
    
    -- C# (currently disabled)
    -- csharp_ls = {},

    -----------------------------------------------------------
    -- Database & Backend
    -----------------------------------------------------------
    -- SQL
    sqls = {},
    
    -- PHP
    phpactor = {},
}

-----------------------------------------------------------
-- Apply Server Configurations
-----------------------------------------------------------

-- Iterate through servers and apply common configuration
for name, opts in pairs(servers) do
    opts.on_init = nvlsp.on_init
    opts.on_attach = nvlsp.on_attach
    opts.capabilities = nvlsp.capabilities
    lspconfig[name].setup(opts)
end
