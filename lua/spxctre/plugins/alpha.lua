--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local button_opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        hl = "AlphaButton",
        align_shortcut = "right",
        hl_shortcut = "AlphaButtonShortcut",
    }
    if keybind then
        keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        button_opts.keymap = { "n", sc, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = button_opts,
    }
end

return {
    "goolord/alpha-nvim",
    event = "UIEnter",
    opts = {
        section = {
            header   = {
                type = "text",
                val = {
                    [[                               __]],
                    [[  ___     ___    ___   __  __ /\_\    ___ ___]],
                    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
                    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
                    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
                },
                opts = {
                    position = "center",
                    hl = "AlphaHeader",
                    -- wrap = "overflow";
                },
            },
            terminal = {
                type = "terminal",
                command = nil,
                width = 69,
                height = 8,
                opts = {
                    redraw = true,
                    window_config = {},
                },
            },
            art      = {
                type = "text",
                val = {
                    [[⣿⡇⠘⡇⢀⣶⣶⠄⠈⣾⡟⢂⣿⣿⣿⣿⣿⣿⡿⢉⢾⢃⣿⣿⡟⣸⢸⣿⣿⣸]],
                    [[⣿⢸⣦⢧⢸⣿⣿⢱⠄⠄⣇⣼⣿⣿⣿⣿⣿⢟⣼⣿⡯⠸⣿⢳⢱⡏⣼⣿⢇⣿]],
                    [[⡏⣾⢽⣼⢸⣿⣿⡘⣆⢀⠛⣿⣿⣿⣿⡿⣫⣾⣿⣿⢇⣿⠂⢌⡾⡇⣿⡿⢸⣿]],
                    [[⢧⣿⠄⢹⢸⣿⣿⣷⣭⢸⡄⣿⣿⣿⢋⣵⣿⣿⡿⠟⡨⡡⠄⣾⣿⡆⣭⡇⣿⣿]],
                    [[⣼⡏⡀⠄⢀⢿⣿⣿⡟⣾⡇⣿⡿⣡⢁⣿⣿⣫⡶⢃⡵⣡⣿⣮⡻⡇⣿⢸⣮⢿]],
                    [[⣿⡇⣧⢠⠸⡎⡍⡭⢾⡏⣧⢋⢾⠏⣼⣿⣿⠿⣵⣾⣕⠿⣿⣿⣷⢡⠏⣾⣿⣿]],
                    [[⣿⠁⣿⠈⠄⠄⢃⢹⡀⠸⢸⢿⠸⢰⢻⢿⣟⢁⣀⠄⠄⠉⠒⢝⢿⠸⣴⣿⣿⣿]],
                    [[⡍⠇⣿⣷⢰⢰⢸⠄⡃⡆⠈⠈⡀⡌⠠⠸⠃⣿⣏⡳⢷⢄⡀⠄⠄⠰⣿⣿⣿⣿]],
                    [[⡇⠄⠸⣿⢸⣿⣶⡄⣇⠃⡇⡄⡇⠁⠃⠄⠈⢊⠻⠿⣿⣿⣿⣦⠄⠘⣿⣿⣿⣿]],
                    [[⡇⠄⠄⢻⣸⣿⣿⠏⡙⢸⣇⣡⢰⢀⠄⠄⠄⠈⡁⢱⢈⢿⣿⡿⡄⣰⣶⣿⣿⣿]],
                    [[⡇⠄⠄⠄⢻⣿⡿⢰⡇⠆⠲⠶⣝⠾⠸⢴⢠⠄⠇⢸⢸⠄⡶⡜⣽⣿⣿⣿⣿⢏]],
                    [[⠁⠄⠄⠄⠄⢿⡇⠧⢣⣸⣦⣄⣀⠁⠓⢸⣄⠸⢀⠄⡀⡀⡪⣽⣿⣿⢿⣿⢟⣬]],
                    [[⠄⠄⠄⠄⠄⠈⢧⠯⢸⣿⣿⣿⡿⠰⣷⠄⣿⣇⡿⠄⡀⠦⣰⣿⡿⣱⣿⡏⢾⣫]],
                    [[⠄⠄⠄⠄⠄⠄⠈⣌⢌⢿⣿⣿⠇⠼⢃⢠⢇⣻⣧⣿⡡⣸⣿⠿⢁⡟⢁⣳⣿⣿]],
                    [[⠄⠄⠄⠄⠄⠄⠄⠄⠳⢝⣒⣒⠰⣘⣴⡧⠿⣿⣛⡯⣱⡿⣫⢎⣪⣎⣿⣧⢻⠿]],
                },
                opts = {
                    position = "center",
                    hl = "AlphaArt",
                    -- wrap = "overflow";
                },
            },
            buttons  = {
                type = "group",
                val = {
                    -- button("e", "  New file", "<cmd>ene <CR>"),
                    button("<leader>pv",
                        "  " ..
                        (require("lazy.core.config").spec.plugins["oil"] == nil and "oil.nvim" or "netrw") ..
                        " - File Explorer"),
                    button("<leader>pf", "󰈞  Telescope - Find Files"),
                    -- button("SPC f h", "󰊄  Recently opened files"),
                    -- button("SPC f r", "  Frecency/MRU"),
                    button("<leader>ps", "󰈬  Telescope - Live Grep"),
                    -- button("SPC f m", "  Jump to bookmarks"),
                    -- button("SPC s l", "  Open last session"),
                },
                opts = {
                    spacing = 1,
                },
            },
            footer   = {
                type = "text",
                val = "i love big titty goth girls",
                opts = {
                    position = "center",
                    hl = "AlphaFooter",
                },
            },
        }
    },
    config = function(_, opts)

        require('alpha').setup({
            layout = {
                { type = "padding", val = 2 },
                opts.section.header,
                { type = "padding", val = 2 },
                opts.section.buttons,
                { type = "padding", val = 5 },
                opts.section.art,
                { type = "padding", val = 2 },
                opts.section.footer,
            },
            opts = {
                margin = 5,
                noautocmd = false,
            },
        })
        vim.cmd.Alpha()

        -- Keybindings to switch to and from netrw
        vim.api.nvim_create_autocmd({ 'BufEnter', 'filetype' }, {
            pattern = { 'netrw', 'oil' },
            callback = function(args)
                local function quit()
                    if vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative ~= '' then
                        vim.api.nvim_win_close(vim.api.nvim_get_current_win(), false) -- If explorer is open in a floating window, just close the floating window
                        return
                    end

                    vim.cmd.bd(args.buf)
                    vim.cmd.Alpha()
                end
                local opts = { buffer = args.buf, remap = false }

                vim.keymap.set('n', '<Esc>', quit, opts)
                vim.keymap.set('n', '<F13>', quit, opts)
                vim.keymap.set('n', '<leader>q', quit, opts)
            end
        })
    end
}
