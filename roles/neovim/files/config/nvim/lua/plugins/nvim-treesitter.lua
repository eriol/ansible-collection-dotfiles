return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require "nvim-treesitter.configs"

        configs.setup({
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "dockerfile",
                "go",
                "html",
                "just",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "rust",
                "sql",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn", -- set to `false` to disable one of the mappings
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        })
    end,
}
