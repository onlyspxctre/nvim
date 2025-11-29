return {
    "nexcov/compile-mode.nvim",
    event = "VeryLazy",
    config = function()
        -- Opens the compile prompt
        vim.keymap.set('n', '<leader>mx', function()
            vim.cmd('CompileMode')
        end)
    end,
}
