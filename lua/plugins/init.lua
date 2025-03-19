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
    opts = require "configs.conform",
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
      require "configs.lspconfig"
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
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

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },
  ----------------------------------------------------------
  -- AI Assistance
  -----------------------------------------------------------
  -- GitHub Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   lazy = false,
  --   opts = require "configs.copilot",
  -- },
  --

  -- Supermaven
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   lazy = false,
  --   config = function()
  --     require("supermaven-nvim").setup {
  --       color = {
  --         suggestion_color = "#f38ba8",
  --         cterm = 244,
  --       },
  --     }
  --   end,
  -- },
  --
  -- Avante AI
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "claude",
      auto_suggestions_provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-latest",
        temperature = 0,
        max_tokens = 8192,
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
      mappings = {
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      behavior = {
        auto_suggestions = false, -- Experimental stage
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -----------------------------------------------------------
  -- Markdown and Documentation
  -----------------------------------------------------------
  -- Markdown rendering - used by avante
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
          local peek = require "peek"
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
  -- Code screenshot tool
  {
    "krivahtoo/silicon.nvim",
    build = "./install.sh",
    cmd = "Silicon",
    config = function()
      require("silicon").setup {
        font = "JetBrainsMono Nerd Font=14",
        theme = "catppuccin-mocha",
        background = "#1e1e2e",
        pad_horiz = 80,
        pad_vert = 60,
        line_number = true,
        line_pad = 2,
        tab_width = 2,
        round_corner = true,
        window_controls = true,
        watermark = {
          text = "@supermaven",
          color = "#6c7086",
          style = "bold",
        },
        output = {
          path = vim.fn.expand "~/Pictures/Screenshots",
          format = "silicon_[year][month][day]_[hour][minute][second].png",
        },
      }
    end,
    keys = {
      { "<leader>ss", ":Silicon<CR>", mode = "v", desc = "Screenshot code" },
    },
  },

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
  -- {
  --   "adalessa/laravel.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "tpope/vim-dotenv",
  --     "MunifTanjim/nui.nvim",
  --     "nvimtools/none-ls.nvim",
  --   },
  --   cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  --   keys = {
  --     { "<leader>la", ":Laravel artisan<cr>" },
  --     { "<leader>lr", ":Laravel routes<cr>" },
  --     { "<leader>lm", ":Laravel related<cr>" },
  --   },
  --   event = { "VeryLazy" },
  --   opts = {
  --     features = {
  --       null_ls = {
  --         enable = true,
  --       },
  --       route_info = {
  --         enable = true,
  --         position = "right",
  --         middlewares = true,
  --         method = true,
  --         uri = true,
  --       },
  --     },
  --   },
  --   config = true,
  -- },
}
