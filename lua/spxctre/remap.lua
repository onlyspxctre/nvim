-- Leader --
vim.g.mapleader = ' '

-- Netrw --
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

-- Moving Selected Line --
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

-- Indenting Selected Line Without Deselection --
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Duplicating Current Line (preserving cursor position) --
vim.keymap.set('n', '<leader>yp', [[:t.<CR>]], { silent = true })

-- Yank to System Clipboard --
vim.keymap.set('v', '<leader>y', [["+y]], { silent = true })

-- Centered Half-Page Jumps --
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Centered Search --
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Dehighlight --
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })

-- Toggle Line Wrap
vim.keymap.set('n', '<leader>t', ':set wrap!<CR>', { silent = true })

-- get rid of something annoying --
vim.keymap.set('n', 'Q', '<nop>')

-- LSP --
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf, remap = false }
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({
                border = 'rounded',
                close_events = { 'BufLeave', 'BufEnter', 'CursorMoved', 'CursorMovedI' }
            })
        end, opts)
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gi", function()
            vim.lsp.buf.implementation()
        end, opts)
        vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "g]", function()
            vim.diagnostic.jump({
                count = 1,
                float = true,
            })
        end, opts)
        vim.keymap.set("n", "g[", function()
            vim.diagnostic.jump({
                count = -1,
                float = true,
            })
        end, opts)
        vim.keymap.set("n", "<leader>.", function()
            vim.lsp.buf.code_action()
        end, opts)
    end,
})
