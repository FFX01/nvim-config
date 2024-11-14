return {
	"stevearc/conform.nvim",
    config = function()
		local conform = require("conform")

		conform.setup({
            format_on_save = nil,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
			},
		})

		vim.keymap.set("v", "<localleader>f", conform.format, { desc = "[F]ormat selection" })
	end,
}
