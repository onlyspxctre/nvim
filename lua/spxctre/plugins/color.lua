local color = require('spxctre.color')
return {
    {
        "rose-pine/neovim", -- uwu
        name = "rose-pine",
        event = "UIEnter",
        opts = {
            variant = "main",      -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true,        -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            palette = {
                -- Override the builtin palette per variant
                -- moon = {
                --     base = '#18191a',
                --     overlay = '#363738',
                -- },
            },

            highlight_groups = {
                -- use config its better trust
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
                -- end
            end,
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)

            -- palette ripped straight from require('rose-pine.palette') since it is not exposed
            local variants = {
                main = {
                    _nc = "#16141f",
                    base = "#191724",
                    surface = "#1f1d2e",
                    overlay = "#26233a",
                    muted = "#6e6a86",
                    subtle = "#908caa",
                    text = "#e0def4",
                    love = "#eb6f92",
                    gold = "#f6c177",
                    rose = "#ebbcba",
                    pine = "#31748f",
                    foam = "#9ccfd8",
                    iris = "#c4a7e7",
                    leaf = "#95b1ac",
                    highlight_low = "#21202e",
                    highlight_med = "#403d52",
                    highlight_high = "#524f67",
                    none = "NONE",
                },
                moon = {
                    _nc = "#1f1d30",
                    base = "#232136",
                    surface = "#2a273f",
                    overlay = "#393552",
                    muted = "#6e6a86",
                    subtle = "#908caa",
                    text = "#e0def4",
                    love = "#eb6f92",
                    gold = "#f6c177",
                    rose = "#ea9a97",
                    pine = "#3e8fb0",
                    foam = "#9ccfd8",
                    iris = "#c4a7e7",
                    leaf = "#95b1ac",
                    highlight_low = "#2a283e",
                    highlight_med = "#44415a",
                    highlight_high = "#56526e",
                    none = "NONE",
                },
                dawn = {
                    _nc = "#f8f0e7",
                    base = "#faf4ed",
                    surface = "#fffaf3",
                    overlay = "#f2e9e1",
                    muted = "#9893a5",
                    subtle = "#797593",
                    text = "#464261",
                    love = "#b4637a",
                    gold = "#ea9d34",
                    rose = "#d7827e",
                    pine = "#286983",
                    foam = "#56949f",
                    iris = "#907aa9",
                    leaf = "#6d8f89",
                    highlight_low = "#f4ede8",
                    highlight_med = "#dfdad9",
                    highlight_high = "#cecacd",
                    none = "NONE",
                },
            }

            color.colorscheme_hl_groups['rose-pine-main'] = {
                {
                    groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                    opts = {
                        italic = false,
                    },
                },
                {
                    groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                    opts = {
                        bg = variants.main.base
                    },
                },

                {
                    groups = "AlphaButton",
                    opts = {
                        link = "Boolean"
                    }
                },
                {
                    groups = "AlphaButtonShortcut",
                    opts = {
                        link = "CursorLineNr"
                    }
                },
                {
                    groups = "AlphaHeader",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaArt",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaFooter",
                    opts = {
                        link = "Question"
                    }
                },
            }
            color.colorscheme_hl_groups['rose-pine-moon'] = {
                {
                    groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                    opts = {
                        italic = false,
                    },
                },
                {
                    groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                    opts = {
                        bg = variants.moon.base
                    },
                },

                {
                    groups = "AlphaButton",
                    opts = {
                        link = "Boolean"
                    }
                },
                {
                    groups = "AlphaButtonShortcut",
                    opts = {
                        link = "CursorLineNr"
                    }
                },
                {
                    groups = "AlphaHeader",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaArt",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaFooter",
                    opts = {
                        link = "Question"
                    }
                },
            }
            color.colorscheme_hl_groups['rose-pine-dawn'] = {
                {
                    groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                    opts = {
                        italic = false,
                    },
                },
                {
                    groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                    opts = {
                        bg = variants.dawn.base
                    },
                },

                {
                    groups = "AlphaButton",
                    opts = {
                        link = "Boolean"
                    }
                },
                {
                    groups = "AlphaButtonShortcut",
                    opts = {
                        link = "CursorLineNr"
                    }
                },
                {
                    groups = "AlphaHeader",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaArt",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaFooter",
                    opts = {
                        link = "Question"
                    }
                },
            }

            table.insert(color.installed, 'rose-pine')
            color.setup()
        end
    },
    {
        "rebelot/kanagawa.nvim",
        event = "UIEnter",
        config = function()

            -- ripped straight from require('kanagawa.colors').palette
            local palette = {

                -- Bg Shades
                sumiInk0 = "#16161D",
                sumiInk1 = "#181820",
                sumiInk2 = "#1a1a22",
                sumiInk3 = "#1F1F28",
                sumiInk4 = "#2A2A37",
                sumiInk5 = "#363646",
                sumiInk6 = "#54546D", --fg

                -- Popup and Floats
                waveBlue1 = "#223249",
                waveBlue2 = "#2D4F67",

                -- Diff and Git
                winterGreen = "#2B3328",
                winterYellow = "#49443C",
                winterRed = "#43242B",
                winterBlue = "#252535",
                autumnGreen = "#76946A",
                autumnRed = "#C34043",
                autumnYellow = "#DCA561",

                -- Diag
                samuraiRed = "#E82424",
                roninYellow = "#FF9E3B",
                waveAqua1 = "#6A9589",
                dragonBlue = "#658594",

                -- Fg and Comments
                oldWhite = "#C8C093",
                fujiWhite = "#DCD7BA",
                fujiGray = "#727169",

                oniViolet = "#957FB8",
                oniViolet2 = "#b8b4d0",
                crystalBlue = "#7E9CD8",
                springViolet1 = "#938AA9",
                springViolet2 = "#9CABCA",
                springBlue = "#7FB4CA",
                lightBlue = "#A3D4D5", -- unused yet
                waveAqua2 = "#7AA89F", -- improve lightness: desaturated greenish Aqua

                -- waveAqua2  = "#68AD99",
                -- waveAqua4  = "#7AA880",
                -- waveAqua5  = "#6CAF95",
                -- waveAqua3  = "#68AD99",

                springGreen = "#98BB6C",
                boatYellow1 = "#938056",
                boatYellow2 = "#C0A36E",
                carpYellow = "#E6C384",

                sakuraPink = "#D27E99",
                waveRed = "#E46876",
                peachRed = "#FF5D62",
                surimiOrange = "#FFA066",
                katanaGray = "#717C7C",

                dragonBlack0 = "#0d0c0c",
                dragonBlack1 = "#12120f",
                dragonBlack2 = "#1D1C19",
                dragonBlack3 = "#181616",
                dragonBlack4 = "#282727",
                dragonBlack5 = "#393836",
                dragonBlack6 = "#625e5a",

                dragonWhite = "#c5c9c5",
                dragonGreen = "#87a987",
                dragonGreen2 = "#8a9a7b",
                dragonPink = "#a292a3",
                dragonOrange = "#b6927b",
                dragonOrange2 = "#b98d7b",
                dragonGray = "#a6a69c",
                dragonGray2 = "#9e9b93",
                dragonGray3 = "#7a8382",
                dragonBlue2 = "#8ba4b0",
                dragonViolet = "#8992a7",
                dragonRed = "#c4746e",
                dragonAqua = "#8ea4a2",
                dragonAsh = "#737c73",
                dragonTeal = "#949fb5",
                dragonYellow = "#c4b28a", --"#a99c8b",
                -- "#8a9aa3",

                lotusInk1 = "#545464",
                lotusInk2 = "#43436c",
                lotusGray = "#dcd7ba",
                lotusGray2 = "#716e61",
                lotusGray3 = "#8a8980",
                lotusWhite0 = "#d5cea3",
                lotusWhite1 = "#dcd5ac",
                lotusWhite2 = "#e5ddb0",
                lotusWhite3 = "#f2ecbc",
                lotusWhite4 = "#e7dba0",
                lotusWhite5 = "#e4d794",
                lotusViolet1 = "#a09cac",
                lotusViolet2 = "#766b90",
                lotusViolet3 = "#c9cbd1",
                lotusViolet4 = "#624c83",
                lotusBlue1 = "#c7d7e0",
                lotusBlue2 = "#b5cbd2",
                lotusBlue3 = "#9fb5c9",
                lotusBlue4 = "#4d699b",
                lotusBlue5 = "#5d57a3",
                lotusGreen = "#6f894e",
                lotusGreen2 = "#6e915f",
                lotusGreen3 = "#b7d0ae",
                lotusPink = "#b35b79",
                lotusOrange = "#cc6d00",
                lotusOrange2 = "#e98a00",
                lotusYellow = "#77713f",
                lotusYellow2 = "#836f4a",
                lotusYellow3 = "#de9800",
                lotusYellow4 = "#f9d791",
                lotusRed = "#c84053",
                lotusRed2 = "#d7474b",
                lotusRed3 = "#e82424",
                lotusRed4 = "#d9a594",
                lotusAqua = "#597b75",
                lotusAqua2 = "#5e857a",
                lotusTeal1 = "#4e8ca2",
                lotusTeal2 = "#6693bf",
                lotusTeal3 = "#5a7785",
                lotusCyan = "#d7e3d8",
            }

            color.colorscheme_hl_groups['kanagawa-wave'] = {
                {
                    groups = { "BlinkCmpLabelMatch", "TelescopeMatching", "TelescopeSelectionCaret" },
                    opts = {
                        fg = "#ff9e3b",
                        link = ""
                    }
                },
                {
                    groups = { "TelescopeSelection", "BlinkCmpMenuSelection", "TelescopeSelectionCaret" },
                    opts = {
                        bg = palette.sumiInk5,
                        link = ""
                    },
                },
                {
                    groups = { "BlinkCmpMenuBorder" },
                    opts = {
                        fg = palette.sumiInk6,
                        link = ""
                    },
                },
                {
                    groups = "PmenuThumb",
                    opts = {
                        bg = palette.katanaGray
                    },
                },
                {
                    groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder', 'CursorLineNr', 'LineNr' },
                    opts = {
                        bg = palette.sumiInk3,
                        link = ""
                    },
                },
            }

            color.colorscheme_hl_groups['kanagawa-dragon'] = {
                {
                    groups = { "BlinkCmpLabelMatch", "TelescopeMatching", "TelescopeSelectionCaret" },
                    opts = {
                        fg = "#ff9e3b",
                        link = ""
                    }
                },
                {
                    groups = { "TelescopeSelection", "BlinkCmpMenuSelection", "TelescopeSelectionCaret" },
                    opts = {
                        bg = palette.dragonBlack5,
                        link = ""
                    },
                },
                {
                    groups = { "BlinkCmpMenuBorder", "TelescopeBorder" },
                    opts = {
                        fg = palette.dragonBlack6,
                        link = ""
                    },
                },
                {
                    groups = "PmenuThumb",
                    opts = {
                        bg = palette.sumiInk6
                    },
                },
                {
                    groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder', 'CursorLineNr', 'LineNr' },
                    opts = {
                        bg = palette.dragonBlack3,
                        link = ""
                    },
                },

                {
                    groups = "AlphaButton",
                    opts = {
                        link = "Boolean"
                    }
                },
                {
                    groups = "AlphaButtonShortcut",
                    opts = {
                        link = "CursorLineNr"
                    }
                },
                {
                    groups = "AlphaHeader",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaArt",
                    opts = {
                        link = "@keyword.operator"
                    }
                },
                {
                    groups = "AlphaFooter",
                    opts = {
                        link = "Question"
                    }
                },
            }
            table.insert(color.installed, 'kanagawa')
            color.setup()
        end
    },
    {
        "onlyspxctre/gruber-darker.nvim",
        event = "UIEnter",
        opts = {
            cursor = true
        },
        config = function(_, opts)
            require('gruber-darker').setup(opts)

            local palette = require('gruber-darker.palette')

            color.colorscheme_hl_groups['gruber-darker'] = {
                {
                    groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder', 'CursorLineNr', 'LineNr' },
                    opts = {
                        bg = palette["bg"]:to_string()
                    },
                },

                {
                    groups = "AlphaButton",
                    opts = {
                        link = "Normal"
                    }
                },
                {
                    groups = "AlphaButtonShortcut",
                    opts = {
                        link = "CursorLineNr"
                    }
                },
                {
                    groups = "AlphaHeader",
                    opts = {
                        link = "CmpItemAbbrMatchFuzzy"
                    }
                },
                {
                    groups = "AlphaArt",
                    opts = {
                        fg = "#E37933",
                    }
                },
                {
                    groups = "AlphaFooter",
                    opts = {
                        link = "@attribute"
                    }
                },
            }

            color.setup()
        end,
    }
}
