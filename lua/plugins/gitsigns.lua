return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({})

        vim.keymap.set("n", "<localleader>gb", gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame" })
    end
}
