return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
    },
    config = function()
        local hop = require("hop")
        hop.setup({
            keys = 'etovxqpdygfblzhckisuran'
        })
        vim.keymap.set("n", "hw", hop.hint_words)
    end
}
