-----------------------------------------------------------
-- Lazy.nvim Package Manager Configuration
-----------------------------------------------------------

return {
    -----------------------------------------------------------
    -- Default Settings
    -----------------------------------------------------------
    defaults = { 
        lazy = true  -- Enable lazy-loading by default
    },

    -- Default colorscheme to install
    install = { 
        colorscheme = { "nvchad" } 
    },

    -----------------------------------------------------------
    -- UI Customization
    -----------------------------------------------------------
    ui = {
        icons = {
            ft = "",           -- Filetype icon
            lazy = "󰂠 ",       -- Lazy loading indicator
            loaded = "",      -- Plugin loaded indicator
            not_loaded = "",  -- Plugin not loaded indicator
        },
    },

    -----------------------------------------------------------
    -- Performance Optimization
    -----------------------------------------------------------
    performance = {
        rtp = {
            -- Disable unused built-in plugins for better startup time
            disabled_plugins = {
                -- File type and syntax plugins
                "2html_plugin",
                "tohtml",
                "syntax",
                "synmenu",
                "ftplugin",

                -- File management plugins
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",

                -- Archive handling plugins
                "tar",
                "tarPlugin",
                "zip",
                "zipPlugin",
                "gzip",
                "vimball",
                "vimballPlugin",

                -- Utility plugins
                "getscript",
                "getscriptPlugin",
                "logipat",
                "matchit",
                "rrhelper",
                "spellfile_plugin",
                "tutor",
                "rplugin",
                "optwin",
                "compiler",
                "bugreport",
            },
        },
    },
}
