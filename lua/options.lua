-----------------------------------------------------------
-- Neovim Options Configuration
-----------------------------------------------------------

-- Load NvChad default options
require "nvchad.options"

-----------------------------------------------------------
-- Global Variables
-----------------------------------------------------------

--[[
  Global configuration variables for various plugins and features:
  - dap_virtual_text: Debug Adapter Protocol virtual text
  - bookmark_sign: Visual indicator for bookmarks
  - skip_ts_context_commentstring_module: Treesitter comment handling
  - tabufline_visible: Tab line visibility control
--]]
local g = {
  dap_virtual_text = true, -- Enable virtual text for debugging
  bookmark_sign = "", -- Custom bookmark indicator
  skip_ts_context_commentstring_module = true,
  tabufline_visible = true, -- Show tab line
}

-----------------------------------------------------------
-- Editor Options
-----------------------------------------------------------

--[[
  Core editor settings organized by functionality:
  1. Text Encoding & Clipboard
  2. Code Folding & Structure
  3. File Management
  4. Visual Display
  5. Text Formatting
  6. Editor Behavior
  7. Search & Navigation
  8. Path & Keyword Configuration
--]]
local opt = {
  -------------------
  -- Text Encoding & Clipboard
  -------------------
  encoding = "utf-8", -- Internal encoding
  fileencoding = "utf-8", -- File encoding
  clipboard = "unnamedplus", -- System clipboard integration (WSL-aware)

  -------------------
  -- Code Folding & Structure
  -------------------
  foldmethod = "expr", -- Use expression for folding
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldcolumn = "0", -- Hide fold column
  foldtext = "", -- No custom fold text
  foldlevel = 99, -- High initial fold level
  foldlevelstart = 5, -- Start with some folds closed
  foldnestmax = 5, -- Maximum fold nesting

  -------------------
  -- File Management
  -------------------
  backup = false, -- No backup files
  swapfile = false, -- No swap files

  -------------------
  -- Visual Display
  -------------------
  scrolloff = 10, -- Lines of context
  termguicolors = true, -- True color support
  emoji = false, -- Disable emoji support
  relativenumber = true, -- Relative line numbers
  cursorline = true, -- Highlight current line
  cursorlineopt = "both", -- Highlight line number and text

  -------------------
  -- Text Formatting
  -------------------
  wrap = true, -- Enable line wrapping
  linebreak = true, -- Break at word boundaries
  textwidth = 0, -- Disable auto text width
  wrapmargin = 0, -- No margin for wrapping
  tabstop = 2, -- 2 spaces per tab
  shiftwidth = 0, -- Match tabstop
  expandtab = true, -- Use spaces for tabs
  autoindent = true, -- Maintain indent level

  -------------------
  -- Editor Behavior
  -------------------
  updatetime = 100, -- Faster updates
  lazyredraw = false, -- Don't defer screen updates
  inccommand = "split", -- Live substitution preview

  -------------------
  -- Search & Navigation
  -------------------
  ignorecase = true, -- Case-insensitive search

  -------------------
  -- Path & Keyword Configuration
  -------------------
  iskeyword = vim.opt.iskeyword:append {
    "_", -- Treat underscore as word char
    "@", -- Include @ in keywords
    "-", -- Include dash in keywords
  },
  path = vim.opt.path:append {
    "**", -- Recursive search
    "lua", -- Lua directory
    "src", -- Source directory
  },
}

-----------------------------------------------------------
-- Apply Settings
-----------------------------------------------------------

-- Apply global variables
for k, v in pairs(g) do
  vim.g[k] = v
end

-- Apply editor options
for k, v in pairs(opt) do
  if k == "iskeyword" or k == "path" then
    -- Handle list-type options that need special treatment
    local current = vim.opt[k]:get()
    if type(v) == "table" and v._append then
      for _, item in ipairs(v._values) do
        vim.opt[k]:append(item)
      end
    else
      vim.opt[k] = v
    end
  else
    vim.opt[k] = v
  end
end
