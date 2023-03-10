local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
    'eslint',
    'lua_ls',
    'emmet_ls'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<Tab>"] = cmp.mapping.confirm({ select = true })
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format document on save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync
        })
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>R", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Restores 'Error Lens'
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
