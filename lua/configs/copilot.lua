-----------------------------------------------------------
-- GitHub Copilot Configuration
-----------------------------------------------------------

local options = {
    -- Enable Copilot for specific filetypes (currently all enabled)
    -- filetypes = { 
    --     markdown = true,
    --     lua = true,
    -- },

    -----------------------------------------------------------
    -- Suggestion Panel Settings
    -----------------------------------------------------------
    panel = {
        auto_refresh = true,  -- Automatically refresh suggestions
    },

    -----------------------------------------------------------
    -- Inline Suggestion Settings
    -----------------------------------------------------------
    suggestion = {
        auto_trigger = true,  -- Enable automatic suggestion triggering
        filetypes = {
            ["."] = true,     -- Enable for all filetypes
        },
    },
}

return options
