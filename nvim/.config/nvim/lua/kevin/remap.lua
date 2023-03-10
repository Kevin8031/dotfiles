-- File explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- While in visual line allows to move lines around
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps the cursor in the same place when appending lines below
--
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps the cursor in the center when moving half page
--
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Doesn't loose the last element copied in the copy buffer
-- when replacing another item
--
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Copies to system clipboard
vim.keymap.set("n", "<C-y>", "\"+y")
vim.keymap.set("v", "<C-y>", "\"+y")
vim.keymap.set("n", "<C-Y>", "\"+Y")

-- Undo/Redo
-- vim.keymap.set("n", "<U>", vim.cmd.redo)

vim.keymap.set("n", "<C-b>", function()
    require 'nvim-tree.api'.tree.toggle()
end)
