return {
    src = 'https://github.com/neovim/nvim-lspconfig',
    data = {
        event = 'DeferredUIEnter',
        after = function()
            vim.lsp.config('clangd', {
                cmd = {
                    'clangd',
                    '--background-index',
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
        end
    }
}
