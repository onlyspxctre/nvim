return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function(_, opts)
        local telescope = require('telescope.builtin')

        -- Grepping --
        vim.keymap.set('n', '<leader>pf', telescope.find_files)
        vim.keymap.set('n', '<leader>ps', telescope.live_grep)

        -- Customization --
        vim.keymap.set('n', '<leader>pc', telescope.colorscheme)

        -- Documentation --
        vim.keymap.set('n', '<leader>pd', telescope.man_pages)
        vim.keymap.set('n', '<leader>ph', telescope.help_tags)
    end
}
