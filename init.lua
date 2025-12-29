vim.loader.enable()

require('spxctre.remap')
require('spxctre.opts')

require('spxctre.lazy')
require('spxctre.neovide')

vim.api.nvim_create_autocmd('FileType', {
    pattern = require('spxctre.treesitter').parsers,
    callback = function()
        vim.defer_fn(function() pcall(vim.treesitter.start) end, 15)
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf' },
    callback = function(ev)
        vim.defer_fn(function()
            vim.api.nvim_set_current_win(vim.fn.win_findbuf(ev.buf)[1])
        end, 5) -- deferred to make sure autocmd catches the window init after init has finished
    end
})

vim.api.nvim_create_autocmd({ 'ColorScheme', 'UIEnter' }, {
    callback = function()
        vim.api.nvim_set_hl(0, 'Pmenu', {
            link = 'Normal'
        })
        vim.api.nvim_set_hl(0, 'NormalFloat', {
            link = 'Normal'
        })
        vim.api.nvim_set_hl(0, 'FloatBorder', {
            link = 'Normal'
        })
        vim.api.nvim_set_hl(0, 'TelescopeBorder', {
            link = 'Normal'
        })
    end
})
