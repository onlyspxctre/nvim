return {
    'saghen/blink.cmp',
    version = '1.*',

    event = 'VeryLazy',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },

        appearance = {
            nerd_font_variant = 'mono',
        },

        completion = {
            menu = {
                enabled = true,
                border = 'rounded',
                auto_show = true,
            },
            documentation = {
                auto_show = false,
            },
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
    },
}
