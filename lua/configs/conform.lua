-----------------------------------------------------------
-- Conform.nvim Formatter Configuration
-----------------------------------------------------------

local options = {
    -- Disable LSP formatting fallback
    lsp_fallback = false,

    -----------------------------------------------------------
    -- Formatter Assignments by File Type
    -----------------------------------------------------------
    formatters_by_ft = {
        -- Lua
        lua = { "stylua" },

        -- Web Development
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        astro = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd" },
        yml = { "prettierd", "prettier", stop_after_first = true },
        toml = { "prettierd", "prettier", stop_after_first = true },

        -- Systems Programming
        rust = { "rustfmt" },
        c = { "clangformat" },
        cpp = { "clangformat" },

        -- Shell and Configuration
        sh = { "shfmt" },
        nix = { "nixpkgsfmt" },
    },

    -----------------------------------------------------------
    -- Custom Formatter Configurations
    -----------------------------------------------------------
    formatters = {
        -- Nix formatter configuration
        nixpkgsfmt = {
            command = "nixpkgs-fmt",
            args = {},
        },

        -- C/C++ formatter configuration
        clangformat = {
            inherit = false,
            command = "clang-format",
        },
    },

    -----------------------------------------------------------
    -- Format on Save Settings
    -----------------------------------------------------------
    format_on_save = {
        timeout_ms = 2500,    -- Maximum time to wait for formatting
        lsp_fallback = false, -- Don't fallback to LSP formatting
    },
}

return options
