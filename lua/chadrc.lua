-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_light",
  theme_toggle = { "gruvbox_light", "ayu_light" },
}

M.nvdash = {
  load_on_startup = true,
}

M.lsp = {
  signature = false,
}

return M
