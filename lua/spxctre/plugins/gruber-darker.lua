return {
    'onlyspxctre/gruber-darker.nvim',
    event = 'VeryLazy',
    config = function()
        require('gruber-darker').setup({
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = false,
            },
        })
    end
}
