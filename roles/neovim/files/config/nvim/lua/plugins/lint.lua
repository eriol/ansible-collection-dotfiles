require("lint").linters_by_ft = {
    python = { "flake8" },
    yaml = { "yamllint" },
}

vim.cmd [[ autocmd BufWritePost * lua require('lint').try_lint() ]]
