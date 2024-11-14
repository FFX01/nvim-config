return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "typescript", "sql", "vue", "html" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "[A]round [F]unction" },
							["if"] = { query = "@function.inner", desc = "[I]nside [F]unction" },
							["ac"] = { query = "@class.outer", desc = "[A]round [C]lass" },
							["ic"] = { query = "@class.inner", desc = "[I]nside [C]lass" },
						}
					}
				}
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
