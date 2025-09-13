vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.showbreak = "󱞤 "
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:-2"
vim.opt.cpoptions:append('n')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = "trail:·"

vim.opt.smartindent = true
-- vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
vim.opt.fillchars:append('eob: ')
vim.opt.isfname:append("@-@")
vim.opt.ruler = false

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"
