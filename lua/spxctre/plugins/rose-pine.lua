return {
    "rose-pine/neovim",
    name = "rose-pine",
    event = 'UIEnter',
    config = function()
        require('rose-pine').setup({
            styles = {
                italic = false
            },
        })
        vim.cmd("colorscheme rose-pine")
    end
}
