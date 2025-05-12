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
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          close = "<Esc>",
          next = "<C-P>",
          prev = "<C-O>",
          select = "<CR>",
          dismiss = "<C-X>",
        },
      },
    })
  end,
}
