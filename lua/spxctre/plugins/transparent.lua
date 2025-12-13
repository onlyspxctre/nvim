return {
    'tribela/transparent.nvim',
    enabled = false,
    event = 'VeryLazy',
    opts = {
        auto = true,
        extra_groups = {
            'NormalFloat', 'FloatBorder',
            'TelescopeNormal', 'TelescopeBorder',
            'Pmenu',
        },
    },
    config = function(_, opts)
        require('transparent').setup(opts)

        vim.keymap.set('n', '<leader>pt', [[:TransparentToggle<CR>]], { silent = true })
    end
}
