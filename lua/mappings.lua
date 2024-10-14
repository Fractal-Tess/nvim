require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Copilot
map("i", "<A-l>", function() -- Accept suggestion
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  end
end, { desc = "Copilot accapet" })

map("i", "<A-n>", function() -- Next suggestion
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").next()
  end
end, { desc = "Copilot next suggestion" })

map("i", "<A-p>", function() -- Previous suggestion
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").prev()
  end
end, { desc = "Copilot previous suggestion" })

map("i", "<A-d>", function() -- Dismiss suggestion
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").dismiss()
  end
end, { desc = "Copilot dismiss suggestion" })

map("i", "<A-t>", function() -- Toggle suggestions
  require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "Copilot toggle suggestions" })

-- Move lines
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" }) -- Move line up
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" }) -- Move line down

map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" }) -- Move line up
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" }) -- Move line down

map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" }) -- Move line up
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" }) -- Move line down

-- Project management
map("n", "<leader>pp", ":ProjectMgr<CR>", { desc = "ProjectMgr window" })
-- Once this is open, you can use the following keybindings:
-- <CR>	Open the project under your cursor
-- <C-a>	Add a project. You will be asked for a name, a path, and optionally startup and shutdown commands.
-- <C-d> / <C-x>	Delete project under your cursor
-- <C-e> / <C-u>	Edit the project under your cursor
-- <C-q> / <ESC>	Close the window without doing anything
