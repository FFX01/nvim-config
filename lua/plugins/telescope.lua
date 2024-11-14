return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function ()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it files" })
		vim.keymap.set("n", "<leader>sf", builtin.live_grep, { desc = "[S]earch inside [F]iles" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "[S]earch in current [B]uffer" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "[L]ist [D]iagnostics" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp tags" })
        vim.keymap.set("n", "<leader>qf", builtin.quickfix, { desc = "[Q]uick [F]ix" })

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["<C-q>"] = actions.send_selected_to_qflist
                    },
                    i = {
                        ["<C-q>"] = actions.send_selected_to_qflist
                    }
                }
            }
        })
	end
}
