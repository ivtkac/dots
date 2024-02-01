return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle", "TodoTrouble" },
  opts = {},
  init = function()
    require("core.utils").load_mappings "trouble"
  end,
}
