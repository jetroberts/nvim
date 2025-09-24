return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        integrations = {
          lsp_trouble = true
        },
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#101010",
            crust = "#1A1A1A",
          }
        }
      })
    end,
  },
}
