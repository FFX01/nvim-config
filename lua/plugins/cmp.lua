return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" }
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				-- `Enter` key to confirm completion
				['<CR>'] = cmp.mapping.confirm({select = false}),
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end
			}
		})
	end
}
