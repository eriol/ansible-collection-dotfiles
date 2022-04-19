require("material").setup({
    borders = true,
    italics = {
        comments = true,
    },
    text_contrast = {
        darker = true,
    },
})

vim.g.material_style = "darker"
-- On lualine set theme = 'material-nvim'

pcall(vim.cmd, "colorscheme material")
