return {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format({ async = true })
            end,
            mode = '',
            desc = 'Format buffer (conform.nvim)',
        },
    },
    opts = {
        formatters_by_ft = {
            tex = { "tex-fmt" },
            latex = { "tex-fmt" },
        },
        default_format_opts = {
            lsp_format = 'fallback',
        },
        formatters = {
            tex_fmt = {
                append_args = { "--wrap-len", "80"}
            }
        }
    }
}
