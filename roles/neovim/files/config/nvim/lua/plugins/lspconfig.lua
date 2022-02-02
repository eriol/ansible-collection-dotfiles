-- Configuration for null-ls, nvim-lspconfig and lsp-status.

-- Redefine sign.
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
local lsp_status = require('lsp-status')
require('lsp_signature').setup()

lsp_status.register_progress()

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

-- Enable floating window borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single'
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = 'single'
  }
)

local common_on_attach = function(client, bufnr)
    -- Mappings.
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({severity_limit = "Warn", popup_opts = {border = "single"}})<cr>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({severity_limit = "Warn", popup_opts = {border = "single"}})<cr>', opts)

    lsp_status.on_attach(client)
end

null_ls.setup({
    debug = false,
    sources = {
        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        -- Rust
        null_ls.builtins.formatting.rustfmt,
        -- Yaml
        null_ls.builtins.diagnostics.yamllint,
        -- HTML and others
        null_ls.builtins.formatting.prettier,
    },
    on_attach =  function(client, bufnr)
        -- Format on save.
        if client.resolved_capabilities.document_formatting then
            buf_set_keymap('n', '<A-f>', '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', opts)
            vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()'
        end
    end
})

-- Use a loop to call `setup` on multiple servers.
local servers = {
    'ansiblels',
    'esbonio',
    'gopls',
    'pyright',
    'rust_analyzer',
    'texlab',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = lsp_status.capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = common_on_attach,
  }
end
