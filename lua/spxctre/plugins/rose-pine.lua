return {
	"rose-pine/neovim",
	name = "rose-pine",
    event = 'UIEnter',
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}
