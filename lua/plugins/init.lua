-----------------------------------------------------------
-- Neovim Plugin Configuration
-----------------------------------------------------------

return {
    -----------------------------------------------------------
    -- Project Management
    -----------------------------------------------------------
    {
        "charludo/projectmgr.nvim",
        lazy = false, -- Required for proper functionality
    },

    -----------------------------------------------------------
    -- UI and Theming
    -----------------------------------------------------------
    -- Color manipulation tools
    {
        "nvchad/volt",
        lazy = true,
    },
    {
        "nvchad/minty",
        cmd = { "Shades", "Huefy" },
    },

    -----------------------------------------------------------
    -- Code Quality and Formatting
    -----------------------------------------------------------
    -- Code formatting
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require("configs.conform"),
    },

    -- Better escape handling
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },

    -----------------------------------------------------------
    -- Language Support and LSP
    -----------------------------------------------------------
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        opts = require("configs.treesitter"),
    },

    -- TypeScript support
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
        lazy = false,
    },

    -- Auto closing tags
    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -----------------------------------------------------------
    -- AI Assistance
    -----------------------------------------------------------
    -- GitHub Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        lazy = false,
        opts = require("configs.copilot"),
    },

    -- Avante AI
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Latest changes
        opts = {},
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- Image support
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        use_absolute_path = true,
                    },
                },
            },
        },
    },

    -----------------------------------------------------------
    -- Markdown and Documentation
    -----------------------------------------------------------
    -- Markdown rendering
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
    },

    -- Browser-based markdown preview
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        keys = {
            {
                "<leader>op",
                function()
                    local peek = require("peek")
                    if peek.is_open() then
                        peek.close()
                    else
                        peek.open()
                    end
                end,
                desc = "Peek (Markdown Preview)",
            },
        },
        opts = { theme = "dark", app = "browser" },
    },

    -----------------------------------------------------------
    -- Development Tools
    -----------------------------------------------------------
    -- LazyGit integration
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },

    -- Laravel development
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        event = { "VeryLazy" },
        opts = {
            features = {
                null_ls = {
                    enable = true,
                },
                route_info = {
                    enable = true,
                    position = "right",
                    middlewares = true,
                    method = true,
                    uri = true,
                },
            },
        },
        config = true,
    },
}
