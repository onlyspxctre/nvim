return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy", -- workaround to make highlighting non-blocking for UI
    branch = "master",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "asm", "javascript", "typescript", "tsx", "lua", "markdown", "latex", },

        sync_install = false,
        auto_install = false,

        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
