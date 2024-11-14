return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({})

    fzf_lua.register_ui_select()

    local map = vim.keymap.set
    map("n", "<leader>ff", fzf_lua.files, { desc = "[F]ind [F]iles" })
    map("n", "<leader>fb", fzf_lua.buffers, { desc = "[F]ind open [B]uffers" })

    map("n", "<leader>sf", fzf_lua.grep_project, { desc = "[S]earch inside [F]iles" })
    map("n", "<leader>sb", fzf_lua.grep_curbuf, { desc = "[S]earch in current [B]uffer" })
    map("n", "<leader>sk", fzf_lua.keymaps, { desc = "[S]earch [K]eymaps" })
    map("n", "<leader>sh", fzf_lua.helptags, { desc = "[S]earch [H]elptags" })

    map("n", "<leader>ld", fzf_lua.diagnostics_document, { desc = "[L]ist [D]iagnostics in current buffer" })
  end
}
