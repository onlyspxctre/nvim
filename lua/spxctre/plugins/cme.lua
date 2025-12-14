return {
    'yilisharcs/cme.nvim',
    event = 'VeryLazy',
    config = function()
        vim.keymap.set('n', '<leader>mx', function()
            vim.cmd('Compile ' .. vim.fn.input('Command: ', vim.g.cme_last_cmd or 'make -k'))
        end)
    end
}
