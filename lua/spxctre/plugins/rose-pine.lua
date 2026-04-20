return {
    "rose-pine/neovim",
    name = "rose-pine",
    event = 'UIEnter',
    config = function()
        require('rose-pine').setup({
            styles = {
                italic = false,
                transparency = true
            },
        })

        vim.cmd.colorscheme 'rose-pine-main'
    end
}
