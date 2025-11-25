-- Leader --
vim.g.mapleader = ' '

-- Netrw --
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
-- vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- Moving Selected Line --
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

-- Indenting Selected Line Without Deselection --
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Centered Half-Page Jumps --
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Centered Search --
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Dehighlight --
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })


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
            if vim.bo.filetype == 'tex' then
                require('knap').forward_jump()
            else
                vim.lsp.buf.definition()
            end
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
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format()
        end, opts) -- Code formatting
    end,
})
