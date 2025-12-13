return {
    "rose-pine/neovim",
    name = "rose-pine",
    event = 'VeryLazy',
    config = function()
        require('rose-pine').setup({
            styles = {
                italic = false
            },
        })
    end
}
