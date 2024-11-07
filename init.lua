-- Global configuration
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-----------------------------------------------------------
-- Package manager setup (lazy.nvim)
-----------------------------------------------------------
local lazy_install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazy_install_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        lazy_repo,
        "--branch=stable",
        lazy_install_path
    })
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazy_install_path)

-- Load lazy configuration
local lazy_config = require("configs.lazy")

-----------------------------------------------------------
-- Plugin Configuration
-----------------------------------------------------------
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-----------------------------------------------------------
-- Theme Configuration
-----------------------------------------------------------
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-----------------------------------------------------------
-- Core Configuration
-----------------------------------------------------------
require("options")
require("nvchad.autocmds")

-- Load mappings after startup
vim.schedule(function()
    require("mappings")
end)
