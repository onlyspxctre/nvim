return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    event = "VeryLazy",
    version = '*',

    opts = {
        keymap = {
            preset = 'default',
        },

        cmdline = {
            completion = {
                menu = {
                    auto_show = true,
                },
            },
            keymap = {
                preset = 'default',
            }
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        completion = {
            menu = {
                enabled = true,
                border = 'rounded',
            },
            -- documentation = {
            --     window = {
            --         border = 'padded',
            --     },
            -- },
        },

        signature = {
            enabled = true,
            trigger = {
                enabled = true,
            },
            window = {
                border = 'rounded',
            },
        },

        sources = {
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
    },
}
