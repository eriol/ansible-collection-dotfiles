require("formatter").setup({
    filetype = {

        go = {
            require("formatter.filetypes.go").gofmt,
            require("formatter.filetypes.go").goimports,
        },

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

        html = {
            function()
                local util = require "formatter.util"
                return {
                    exe = "dprint",
                    args = {
                        "fmt",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = false,
                }
            end,
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
