return {
    'datsfilipe/vesper.nvim',
    name = 'vesper',
    event = 'UIEnter',
    opts = {
        italics = {
            keywords = false,
            functions = false,
            strings = false,
            variable = false,
        }
    },
    config = function(_, opts)
        require('vesper').setup(opts)
        vim.cmd.colorscheme('vesper')
    end
}
