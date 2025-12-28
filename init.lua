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

vim.api.nvim_create_autocmd({ 'ColorScheme', 'UIEnter' }, {
    callback = function()
        vim.api.nvim_set_hl(0, 'Pmenu', {
            link = 'Normal'
        })
    end
})
