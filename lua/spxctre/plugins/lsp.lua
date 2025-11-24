return {
    'https://github.com/neovim/nvim-lspconfig',
    event = 'VeryLazy',
    config = function()
        vim.lsp.config('lua_ls', {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT',
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            '${3rd}/luv/library',
                            '${3rd}/busted/library',
                        },
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })

        -- Lua --
        vim.lsp.enable('lua_ls')

        -- C --
        vim.lsp.enable('clangd')
        vim.lsp.enable('cmake')

        -- Web --
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('svelte')
        vim.lsp.enable('tailwindcss')
    end
}
