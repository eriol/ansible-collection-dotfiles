-- Format using dprint project.
local function dprint()
    return {
        exe = "dprint",
        args = {
            "fmt",
        },
        stdin = false,
    }
end

require("formatter").setup({
    filetype = {

        css = { dprint },

        go = {
            require("formatter.filetypes.go").gofmt,
            require("formatter.filetypes.go").goimports,
        },

        html = { dprint },

        lua = {
            require("formatter.filetypes.lua").stylua,
        },

        python = {
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.python").isort,
        },

        rust = {
            require("formatter.filetypes.rust").rustfmt,
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Format<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>FormatWrite<cr>", { silent = true, noremap = true })

-- Format after save.
vim.cmd [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]]
