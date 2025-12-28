return {
    'ayu-theme/ayu-vim',
    event = 'UIEnter',
    config = function()
        vim.cmd 'colorscheme ayu'
    end
}
