vim.g.mapleader = " " 
vim.keymap.set("", "<Space>", "<leader>", { noremap = true})

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

