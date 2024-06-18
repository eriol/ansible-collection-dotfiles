return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {},
    keys = {
        { "<leader>xt", "<cmd>TodoTelescope<cr>" },
    },
}
