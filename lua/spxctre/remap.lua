vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", function() vim.cmd.Ex() end)
vim.keymap.set("n", "<leader>pd", ":lcd " .. vim.fn.getcwd() .. "/")

-- Improved vertical movements with wrapped lines
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})

-- Moving selected line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indenting selected line without deselection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Delete line below
vim.keymap.set("n", "J", "mzJ`z")

-- Centered half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Centered block jumps
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

-- Dehiglight the search pattern
vim.keymap.set("n", "/", [[:noh<CR>/]], { noremap = true } )
vim.keymap.set("n", "<leader>/", [[:noh<CR>]])

-- No fucking idea
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- delete into the _ register (do not cut)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<F13>", "<Esc>") -- This is going to get be cancelled harder, I barely even use it

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
