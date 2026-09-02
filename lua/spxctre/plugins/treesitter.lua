return {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local treesitter = require('nvim-treesitter')
        local ns = vim.api.nvim_create_namespace('treesitter.async')

        local parsers = {
            'c',
            'haskell',
            'css',
            'html',
            'svelte',
            'javascript',
            'typescript',
        }

        local parsers_pending = {}
        local parsers_loaded = {}
        local parsers_failed = {}

        treesitter.install(parsers, { max_jobs = 8 })

        vim.api.nvim_set_decoration_provider(ns, {
            on_start = vim.schedule_wrap(function()
                if parsers_pending == 0 then
                    return false
                end
                for _, data in ipairs(parsers_pending) do
                    if vim.api.nvim_buf_is_valid(data.buf) then
                        if pcall(vim.treesitter.start, data.buf, data.lang) then
                            parsers_loaded[data.lang] = true
                        else
                            parsers_failed[data.lang] = true
                        end
                    end
                end
                parsers_pending = {}
            end),
        })

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(event)
                -- if vim.tbl_contains(ignore_filetypes, event.match) then
                --     return
                -- end

                local lang = vim.treesitter.language.get_lang(event.match) or event.match
                local buf = event.buf

                if parsers_failed[lang] then
                    return
                end

                if parsers_loaded[lang] then
                    -- Parser already loaded, start immediately (fast path)
                    pcall(vim.treesitter.start, buf, lang)
                else
                    -- Queue for async loading
                    table.insert(parsers_pending, { buf = buf, lang = lang })
                end

                -- -- Auto-install missing parsers (async, no-op if already installed)
                -- treesitter.install({ lang })
            end,
        })
    end
}
