return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
      indent = { only_scope = true, only_current = true, char = "." },
      animate = { enabled = false },
      scope = {
        enabled = false,
      }
    },
    zen = { enabled = true },
    lazygit = { enabled = true },
    input = { enabled = true }
  },
  keys = {
    { "<leader>I",  function() Snacks.zen() end,      desc = "Toggle Zen Mode" },
    { "<leader>i",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>gg", function() Snacks.lazygit() end,  desc = "Lazygit" },
  }
}
