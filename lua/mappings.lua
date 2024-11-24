-----------------------------------------------------------
-- Key Mappings Configuration
-----------------------------------------------------------

-- Load NvChad default mappings
require "nvchad.mappings"

-- Utility function for cleaner mapping definitions
local map = vim.keymap.set

-----------------------------------------------------------
-- General Mappings
-----------------------------------------------------------

-- Enter command mode with semicolon
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Quick escape from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-----------------------------------------------------------
-- Copilot Integration
-----------------------------------------------------------

--[[
  Copilot keybindings for AI-assisted coding
  Alt + l: Accept current suggestion
  Alt + n: View next suggestion
  Alt + p: View previous suggestion
  Alt + d: Dismiss current suggestion
  Alt + t: Toggle suggestion auto-trigger
--]]

-- map("i", "<A-l>", function()
--     if require("copilot.suggestion").is_visible() then
--         require("copilot.suggestion").accept()
--     end
-- end, { desc = "Copilot accept suggestion" })
--
-- map("i", "<A-n>", function()
--     if require("copilot.suggestion").is_visible() then
--         require("copilot.suggestion").next()
--     end
-- end, { desc = "Copilot next suggestion" })
--
-- map("i", "<A-p>", function()
--     if require("copilot.suggestion").is_visible() then
--         require("copilot.suggestion").prev()
--     end
-- end, { desc = "Copilot previous suggestion" })
--
-- map("i", "<A-d>", function()
--     if require("copilot.suggestion").is_visible() then
--         require("copilot.suggestion").dismiss()
--     end
-- end, { desc = "Copilot dismiss suggestion" })
--
-- map("i", "<A-t>", function()
--     require("copilot.suggestion").toggle_auto_trigger()
-- end, { desc = "Copilot toggle suggestions" })

-----------------------------------------------------------
-- SuperMaven Integration
-----------------------------------------------------------

--[[
  SuperMaven keybindings:
  Tab: Check and accept SuperMaven completion if available
      otherwise behave as regular Tab
--]]

-----------------------------------------------------------
-- Line Movement
-----------------------------------------------------------

--[[
  Quick line movement in different modes:
  Alt + j: Move line down
  Alt + k: Move line up
  
  These mappings work in normal, insert, and visual modes
--]]

-- Normal mode line movement
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

-- Insert mode line movement
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })

-- Visual mode line movement
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-----------------------------------------------------------
-- Project Management
-----------------------------------------------------------

--[[
  ProjectMgr keybindings:
  <leader>pp: Open ProjectMgr window
  
  When ProjectMgr window is open:
  <CR>        - Open the project under cursor
  <C-a>       - Add a project (prompts for name, path, and optional commands)
  <C-d>/<C-x> - Delete project under cursor
  <C-e>/<C-u> - Edit the project under cursor
  <C-q>/<ESC> - Close the window
--]]

map("n", "<leader>pp", ":ProjectMgr<CR>", { desc = "ProjectMgr window" })
