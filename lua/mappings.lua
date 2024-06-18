require "nvchad.mappings"
local cmp = require "cmp"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  elseif cmp.visible() then
    cmp.select_next_item()
  elseif require("luasnip").expand_or_jumpable() then
    vim.fn.feedkeys(
      vim.api.nvim_replace_termcodes(
        "<Plug>luasnip-expand-or-jump",
        true,
        true,
        true
      ),
      ""
    )
  end
end, { desc = "Copilot autocomplete " })

-- TODO: Learning mappings
-- map("n", ">", ">gv", { desc = "Indent" })
