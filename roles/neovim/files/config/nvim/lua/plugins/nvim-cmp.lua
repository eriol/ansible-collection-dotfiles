local cmp = require('cmp')

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<cr>'] = cmp.mapping.confirm(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
    },
})
