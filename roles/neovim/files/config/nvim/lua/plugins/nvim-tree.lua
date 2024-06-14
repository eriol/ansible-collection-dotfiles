return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
            view = {
                width = 35,
            },
        })
        -- FIX: this doesn't work anymore.
        vim.g.nvim_tree_quit_on_open = 1

        vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", {})

        vim.cmd "autocmd BufWinEnter NvimTree setlocal cursorline"
    end,
}
