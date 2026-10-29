return {
    src = 'https://github.com/neovim/nvim-lspconfig',
    data = {
        event = 'DeferredUIEnter',
        after = function()
            vim.lsp.config('clangd', {
                cmd = {
                    'clangd',
                    '--background-index',
                    '--pch-storage=memory',         -- store precompiled headers in RAM
                    '--malloc-trim',                -- release unused memory back to OS
                    '--limit-results=50',           -- limit autocomplete suggestions
                    '--header-insertion=never',     -- disable heavy on-the-fly header insertion
                    '--clang-tidy',
                    '--function-arg-placeholders=0',
                    '--enable-config',
                    '--query-driver=/**/.espressif/tools/**/*gcc,/**/.espressif/tools/**/*g++'
                }
            })

            vim.diagnostic.config({
                float = {
                    border = "rounded",
                }
            })

            vim.lsp.enable('clangd')
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('gopls')

            -- shit languages
            vim.lsp.enable('jdtls')
            vim.lsp.enable('pyright')
            vim.lsp.enable('ts_ls')
        end
    }
}
