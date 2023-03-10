local opts = { silent = true, noremap = true }

vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
    }
}

vim.keymap.set("n", "<A-h>", "<cmd>BufferLineMovePrev<cr>", opts)
vim.keymap.set("n", "<A-l>", "<cmd>BufferLineMoveNext<cr>", opts)

vim.keymap.set("n", "<C-h>", "<cmd>bNext<cr>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>bnext<cr>", opts)

vim.keymap.set("n", "<C-j>", "<cmd>bdelete<cr>", opts)
