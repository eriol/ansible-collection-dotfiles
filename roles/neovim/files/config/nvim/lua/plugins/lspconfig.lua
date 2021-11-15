-- Configuration for null-ls, nvim-lspconfig and lsp-status.

-- Redefine sign.
local signs = { Error = ' ', Warning = ' ', Hint = ' ', Information = ' ' }

for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
local lsp_status = require('lsp-status')

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

local common_on_attach = function(client, bufnr)
    -- Mappings.
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    lsp_status.on_attach(client)
end

null_ls.config({
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
    }
})

-- Use a loop to call `setup` on multiple servers.
local servers = {
    'ansiblels',
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

lspconfig["null-ls"].setup({
    on_attach =  function(client, bufnr)
        -- Format on save.
        if client.resolved_capabilities.document_formatting then
            buf_set_keymap('n', '<A-f>', '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', opts)
            vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()'
        end
    end
})

