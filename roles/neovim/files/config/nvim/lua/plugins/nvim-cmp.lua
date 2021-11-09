local cmp = require('cmp')

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    -- TODO: S-Tab and Tab mappings seems that can be removed.
    mapping = {
        ['<cr>'] = cmp.mapping.confirm(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
    },
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
    },
})
