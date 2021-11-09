-- Redefine sign.
local signs = { Error = " ", Warning = " ", Hint = " ", Infomation = " " }

for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

require('lspconfig').pyright.setup{}
