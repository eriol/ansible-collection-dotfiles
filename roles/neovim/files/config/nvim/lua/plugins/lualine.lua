require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { 'startify' },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1,1) end },
        },
    },
}
