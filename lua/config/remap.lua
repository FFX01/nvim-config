vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>oe", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Use leader y to yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>ca", "gg0vG$\"+y", { desc = "[Y]ank [A]ll to clipboard" })
