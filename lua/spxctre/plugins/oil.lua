return {
    'stevearc/oil.nvim',
    event = { 'UIEnter' },
    opts = {
        constrain_cursor = 'name',
        skip_confirm_for_simple_edits = true,

        columns = {
            'permissions',
            'size',
            'mtime',
        },
        win_options = {
        },
        view_options = {
            show_hidden = true,
        },
        confirmation = {
            border = 'rounded',
        },
    },
    config = function(_, opts)
        require('oil').setup(opts)

        vim.api.nvim_create_user_command('Ex', 'Oil', {
        })
    end
}
