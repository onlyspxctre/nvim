vim.opt.termguicolors = true

vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.scrolloff = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.fillchars:append('eob: ') -- get rid of trailing ~
vim.opt.isfname:append("@-@") -- treat @ as a valid filename ig?

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Netrw --

vim.g.netrw_keepdir = 0 -- fixes netrw fucking with the jump list probably
