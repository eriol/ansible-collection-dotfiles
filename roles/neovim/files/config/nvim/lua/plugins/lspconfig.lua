-- Configuration for nvim-lspconfig and lsp-status.

-- Redefine sign.
local signs = { Error = "", Warn = "", Hint = "", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspconfig = require "lspconfig"
local lsp_status = require "lsp-status"
require("lsp_signature").setup()

lsp_status.register_progress()

local opts = { noremap = true, silent = true }

-- Enable floating window borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
    border = "single",
})

local common_on_attach = function(client, bufnr)
    -- Mappings.
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "]d",
        '<cmd>lua vim.diagnostic.goto_next({severity_limit = "Warn", popup_opts = {border = "single"}})<cr>',
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "[d",
        '<cmd>lua vim.diagnostic.goto_prev({severity_limit = "Warn", popup_opts = {border = "single"}})<cr>',
        opts
    )

    lsp_status.on_attach(client)
end

-- Use a loop to call `setup` on multiple servers.
local servers = {
    "ansiblels",
    "esbonio",
    "gopls",
    "pyright",
    "rust_analyzer",
    "texlab",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = lsp_status.capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        on_attach = common_on_attach,
    })
end
