return {
    "monkoose/matchparen.nvim",
    event = "VeryLazy",

    opts = {
        enabled = true,
        hl_group = "MatchParen",
        debounce_time = 0,
    },

    config = function(_, opts)
        require('matchparen').setup(opts)
    end
}
