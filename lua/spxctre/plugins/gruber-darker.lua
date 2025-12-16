return {
    'onlyspxctre/gruber-darker.nvim',
    event = 'UIEnter',
    config = function()
        require('gruber-darker').setup({
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = false,
            },
        })
        vim.cmd 'colorscheme gruber-darker'
    end
}
