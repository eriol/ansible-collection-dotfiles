require("lint").linters_by_ft = {
    python = { "flake8" },
    yaml = { "yamllint", "ansible_lint" },
}

vim.cmd [[ autocmd BufWritePost * lua require('lint').try_lint() ]]
