local function items()
    return {
        { action = 'Telescope find_files', name = 'explorer', section = 'Netrw' },

        { action = 'Telescope find_files', name = 'find_files', section = 'Telescope' },
        { action = 'Telescope live_grep',  name = 'live_grep',  section = 'Telescope' },
    }
end

-- local footer = [[
-- <M-j/k>, <C-n/p>, <Down/Up>:    move selection
-- <CR>:                           confirm current selection
-- <C-c>:                          Close this window
-- ]]
local footer = ''

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
            footer = footer,
            content_hooks = {
                starter.gen_hook.aligning('center', 'center'),
                starter.gen_hook.adding_bullet('> '),
            },
        })

        starter.open()
    end
}
