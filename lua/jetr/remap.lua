vim.g.mapleader = " "
vim.keymap.set("", "<Space>", "<leader>", { noremap = true })

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set('n', '<leader>wq', function()
  vim.cmd(":close")
end)

vim.keymap.set('n', '<leader>wv', function()
  vim.cmd(":vsplit")
end)

vim.keymap.set('n', '<leader>wf', function()
  vim.cmd(":split")
end)

vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wl', '<C-w>l')

vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>er', ':NvimTreeFindFile<CR>')

vim.keymap.set('n', '<leader>xx', function() require("trouble").toggle() end)
vim.keymap.set('n', '<leader>xw', function() require("trouble").toggle('workspace_diagnostics') end)
vim.keymap.set('n', '<leader>xd', function() require("trouble").toggle('document_diagnostics') end)
vim.keymap.set('n', '<leader>xq', function() require("trouble").toggle('quickfix') end)
vim.keymap.set('n', '<leader>xl', function() require("trouble").toggle('loclist') end)
