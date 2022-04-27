require("kanagawa").setup({
    dimInactive = true,
    globalStatus = true,
})

pcall(vim.cmd, "colorscheme kanagawa")
