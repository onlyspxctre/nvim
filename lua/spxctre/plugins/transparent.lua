return {
    'tribela/transparent.nvim',
    event = 'UIEnter',
    opts = {
        auto = true,
        extra_groups = {
            'NormalFloat', 'FloatBorder', 'FloatShadow',
            'TelescopeNormal', 'TelescopeBorder',
            'Pmenu','StatusLine','StatusLineNC',
            'StatusLineTerm', 'StatusLineNC'
        },
    },
    config = function(_, opts)
        require('transparent').setup(opts)

        vim.keymap.set('n', '<leader>pt', [[:TransparentToggle<CR>]], { silent = true })
    end
}
