return {
  -- Project management
  {
    "charludo/projectmgr.nvim",
    lazy = false, -- important!
  },
  -- Typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    lazy = false,
  },

  -- Markdown previewer
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

  -- Auto formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  -- Language servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
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

  -- Better escaping
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- event = "InsertEnter",
    lazy = false,
    config = function()
      require "configs.copilot"
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       config = function()
  --         require("copilot_cmp").setup()
  --       end,
  --     },
  --   },
  --   opts = {
  --     sources = {
  --       { name = "nvim_lsp" },
  --       { name = "luasnip" },
  --       { name = "buffer" },
  --       { name = "nvim_lua" },
  --       { name = "path" },
  --       { name = "copilot" },
  --     },
  --   },
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       config = function()
  --         require("copilot_cmp").setup()
  --       end,
  --     },
  --   },
  --   opts = {
  --     sources = {
  --       { name = "nvim_lsp" },
  --       { name = "luasnip" },
  --       { name = "buffer" },
  --       { name = "nvim_lua" },
  --       { name = "path" },
  --       { name = "copilot" },
  --     },
  --   },
  -- },

  -- Indenting
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = function()
  --     return require "configs.blank-line"
  --   end,
  -- },
}
