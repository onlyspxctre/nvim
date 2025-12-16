vim.loader.enable()

require('spxctre.remap')
require('spxctre.opts')

require('spxctre.lazy')

vim.api.nvim_create_autocmd('FileType', {
    pattern = require('spxctre.treesitter').parsers,
    callback = function()
        vim.defer_fn(function() pcall(vim.treesitter.start) end, 15)
    end,
})
