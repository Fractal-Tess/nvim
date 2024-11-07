-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "decay",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.expand = function(fallback)
  local luasnip = require "luasnip"
  local suggestion = require "supermaven-nvim.completion_preview"

  if luasnip.expandable() then
    luasnip.expand()
  elseif suggestion.has_suggestion() then
    suggestion.on_accept_suggestion()
  else
    fallback()
  end
end

return M
