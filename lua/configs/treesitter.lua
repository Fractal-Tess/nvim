-----------------------------------------------------------
-- Treesitter Configuration
-----------------------------------------------------------

-----------------------------------------------------------
-- Custom Parser Configurations
-----------------------------------------------------------

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- Laravel Blade template parser
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade",
}

-----------------------------------------------------------
-- File Type Associations
-----------------------------------------------------------

vim.filetype.add({
    extension = {
        mdx = "mdx",
    },
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

-----------------------------------------------------------
-- Treesitter Options
-----------------------------------------------------------

local opts = {
    -- Configuration callback to register languages after setup
    config = function()
        -- Register MDX as markdown for proper highlighting
        vim.treesitter.language.register("markdown", "mdx")
    end,

    -- Languages to install
    ensure_installed = {
        -- System and Configuration
        "lua",
        "vim",
        "nginx",
        "yaml",
        "ron",
        
        -- Web Development
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "xml",
        "svelte",
        "astro",
        
        -- Backend Development
        "php",
        "blade",
        "sql",
        "go",
        "c_sharp",
        "c",
        
        -- Documentation
        "markdown",
        "markdown_inline",
    },

    -- Feature Configuration
    highlight = {
        enable = true,  -- Enable syntax highlighting
    },
    
    indent = {
        enable = true,  -- Enable indentation support
    },
    
    autopairs = {
        enable = true,  -- Enable automatic pairs
    },
}

return opts
