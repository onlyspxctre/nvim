require('spxctre.opts')
require('spxctre.remap')
require('spxctre.autocmd')

vim.pack.add({ 'https://github.com/lumen-oss/lz.n' })

--- @type lz.n.pack.Spec[]
local plugins = {
    {
        src = 'https://github.com/rose-pine/neovim',
        data = {
            colorscheme = "rose-pine-main",
            after = function()
                require('rose-pine').setup({
                    styles = {
                        italic = false,
                        transparency = true
                    }
                })
            end
        }
    },
    {
        src = 'https://github.com/stevearc/conform.nvim',
        data = {
            event = 'DeferredUIEnter',
            after = function()
                local conform = require('conform')
                vim.keymap.set('n', '<leader>f', function()
                    conform.format({ async = true })
                end)

                conform.setup({
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
                            append_args = { "--wrap-len", "80" }
                        }
                    }
                })
            end
        },
    },
    require('spxctre.plugins.minipick'),
    require('spxctre.plugins.lsp'),
    require('spxctre.plugins.blink'),
    {
        src = 'https://github.com/yilisharcs/cme.nvim',
        data = {
            event = 'DeferredUIEnter',
            after = function()
                vim.keymap.set('n', '<leader>mx', function()
                    vim.ui.input({
                        prompt = 'Command: ',
                        default = vim.g.cme_last_cmd or 'make -k',
                    }, function(input)
                        if input == '' or input == nil then
                            vim.defer_fn(function()
                                vim.cmd.echon('""')
                            end, 1)
                            return
                        end

                        vim.cmd('Compile ' .. input)
                    end)
                end)
            end
        },
    },
}

vim.pack.add(plugins, { load = require('lz.n').load })
vim.cmd.colorscheme 'rose-pine-main'
