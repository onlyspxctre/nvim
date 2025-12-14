return {
    'yilisharcs/cme.nvim',
    event = 'VeryLazy',
    config = function()
        vim.keymap.set('n', '<leader>mx', function()
            vim.ui.input({
                prompt = 'Command: ',
                default = vim.g.cme_last_cmd or 'make -k',
            }, function(input)
                if input == '' or input == nil then
                    vim.defer_fn(function ()
                        vim.cmd.echon('""')
                    end, 1)
                    return
                end

                vim.cmd('Compile ' .. input)
            end)
        end)
    end
}
