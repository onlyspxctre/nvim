return {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.0'),
    data = {
        event = 'DeferredUIEnter',
        after = function()
            require('blink.cmp').setup({
                keymap = { preset = 'default' },

                appearance = {
                    nerd_font_variant = 'mono',
                },

                completion = {
                    menu = {
                        enabled = true,
                        border = 'rounded',
                        auto_show = false,
                    },
                    documentation = {
                        auto_show = false,
                    },
                    -- ghost_text = {
                        --     enabled = true,
                        -- }
                },

                cmdline = {
                    enabled = true,
                    keymap = { preset = 'inherit' },
                    completion = {
                        menu = {
                            auto_show = true,
                        },
                    },
                    sources = { 'buffer', 'cmdline' },
                },

                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
            })
        end
    }
}

