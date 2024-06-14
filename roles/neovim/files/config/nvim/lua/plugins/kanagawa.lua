return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            dimInactive = true,
        })

        vim.cmd.colorscheme "kanagawa-wave"
    end,
}
