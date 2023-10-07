return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = "Copilot auth",
  event = "InsertEnter",
  config = function()
    require('copilot').setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          close = "<Esc>",
          next = "<C-I>",
          prev = "<C-O>",
          select = "<CR>",
          dismiss = "<C-X>",
        },
      },
    })
  end,
}
