return {
    'thimc/gruber-darker.nvim',
    event = "UIEnter",
    opts = {
        -- OPTIONAL
        transparent = false, -- removes the background
        -- underline = false, -- disables underline fonts
        -- bold = false, -- disables bold fonts
    },
    config = function(_, opts)
        local hl = require('gruber-darker.groups')
        local color = require('spxctre.color')


        color.colorscheme_hl_groups['gruber-darker'] = {
            {
                groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder', 'CursorLineNr', 'LineNr' },
                opts = {
                    bg = hl.colors.bg,
                    link = ""
                },
            }
        }

        require('gruber-darker').setup(opts)
        color.set('gruber-darker')
    end,
}
