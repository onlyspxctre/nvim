return {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install(require('spxctre.treesitter').parsers)
    end
}
