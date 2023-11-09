return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = "Copilot auth",
  event = "InsertEnter",
  config = function()
    vim.keymap.set('i', '<tab>', '<nop>')

    require('copilot').setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
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
