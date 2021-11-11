local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    completion = {
        completeopt = 'menu,menuone,noinsert',
        keyword_length = 2
    },

    mapping = {
        ['<cr>'] = cmp.mapping.confirm(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = "luasnip" },
        { name = 'buffer' },
        { name = 'path' },
    },
})
