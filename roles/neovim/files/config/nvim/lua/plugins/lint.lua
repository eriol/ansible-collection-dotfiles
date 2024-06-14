return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            python = { "flake8" },
            yaml = { "yamllint", "ansible_lint" },
        }

        -- TODO: https://github.com/mfussenegger/nvim-lint/issues/600#issuecomment-2168415996
        vim.cmd [[ autocmd BufWritePost * lua require('lint').try_lint() ]]
    end,
}
