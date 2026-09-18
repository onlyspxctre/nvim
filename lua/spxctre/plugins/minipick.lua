return {
    src = 'https://github.com/nvim-mini/mini.pick',
    data = {
        event = 'DeferredUIEnter',
        after = function()
            local pick = require('mini.pick')

            vim.keymap.set('n', '<leader>pf', pick.builtin.files)
            vim.keymap.set('n', '<leader>ps', pick.builtin.grep_live)

            pick.setup({
                options = {
                    content_from_bottom = true,
                    use_cache = true,
                },
                window = {
                    config = function()
                        -- normalize window position to  center
                        local height = math.floor(0.75 * vim.o.lines)
                        local width = math.floor(0.8 * vim.o.columns)

                        if ((vim.o.lines - height) % 2 == 1) then height = height + 1 end
                        if ((vim.o.columns - width) % 2 == 1) then width = width + 1 end
                        return {
                          anchor = 'NW', height = height, width = width,
                          row = math.floor(0.5 * (vim.o.lines - height)) - 1,
                          col = math.floor(0.5 * (vim.o.columns - width)) - 1,
                        }
                    end,
                }
            })
        end
    }
}
