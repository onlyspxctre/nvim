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
            python = { "ruff" },

            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
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
