-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  statusline = { theme = "minimal" },
  theme_toggle = { "catppuccin", "one_light" },

  -- transparency = true,
  telescope = { style = "bordered" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
