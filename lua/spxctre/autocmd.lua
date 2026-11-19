vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'tex', 'latex' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'elixir'
    },
    callback = function()
        vim.defer_fn(vim.treesitter.start, 50)
    end
})
