return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({})

        local map = vim.api.nvim_set_keymap

        map("n", "<C-k>", "<cmd>Telescope<cr>", { noremap = true })
        map("n", "<C-p>", "<cmd>Telescope git_files<cr>", { noremap = true })
        map("n", "<C-s>", "<cmd>Telescope live_grep<cr>", { noremap = true })
        map("n", ";", "<cmd>Telescope buffers<cr>", { noremap = true })
        map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { noremap = true })
    end,
}
