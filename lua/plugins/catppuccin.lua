return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")

		require("catppuccin").setup({
            default_integrations = true,
			integrations = {
				treesitter = true,
				fzf = true
			},
		})
	end,
}
