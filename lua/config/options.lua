vim.opt.nu = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.splitright = true

vim.opt.updatetime = 50

vim.lsp.set_log_level("off")

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

vim.diagnostic.config({ virtual_text = true })

vim.o.cmdheight = 0

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.foldenable = false
