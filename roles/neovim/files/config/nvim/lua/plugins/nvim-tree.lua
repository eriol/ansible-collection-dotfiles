return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            update_focused_file = {
                enable = true,
            },
            view = {
                width = 35,
            },
        })

        vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", {})

        vim.cmd "autocmd BufWinEnter NvimTree setlocal cursorline"
    end,
}
