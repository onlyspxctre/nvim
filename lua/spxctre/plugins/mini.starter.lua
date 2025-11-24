local function items()
    return {
        { action = 'Netrw', name = 'file_explorer', section = 'Netrw' },

        { action = 'Telescope find_files', name = 'find_files', section = 'Telescope' },
        { action = 'Telescope live_grep',  name = 'live_grep',  section = 'Telescope' },
    }
end

return {
    'nvim-mini/mini.starter',
    version = false,
    event = 'UIEnter',
    config = function(_)
        local starter = require('mini.starter')

        starter.setup({
            autoopen = false,
            items = {
                items(),
            },
            footer = '',
            content_hooks = {
                starter.gen_hook.aligning('center', 'center'),
                starter.gen_hook.adding_bullet('> '),
            },
        })

        starter.open()

        vim.api.nvim_buf_create_user_command(0, 'Netrw', function()
            starter.close()
            vim.cmd('Ex')
        end, { desc = 'Break out of mini.starter into netrw'})
    end
}
