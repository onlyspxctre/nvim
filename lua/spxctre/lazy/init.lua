-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    performance = {
        rtp = {
            disabled_plugins = {
                "netrwPlugin",
                "matchparen",
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    spec = {
        { import = "spxctre.plugins" }
    },
    install = {
        -- colorscheme = { "gruber-darker" },
    },
    defaults = { lazy = true },
    checker = { enabled = false },
    change_detection = {
        notify = false,
    },
    ui = {
        title = "Lazy.nvim",
        backdrop = 100,
        border = "rounded"
    },
    profiling = {
        require = true
    },
}

require('lazy').setup(opts)
