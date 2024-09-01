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

return {
    "mhartington/formatter.nvim",
    config = function()
        require("formatter").setup({
            filetype = {

                cpp = {
                    require("formatter.filetypes.cpp").clangformat,
                },

                css = { dprint },

                go = {
                    require("formatter.filetypes.go").gofmt,
                    require("formatter.filetypes.go").goimports,
                },

                html = { dprint },

                javascript = { dprint },

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

                yaml = { dprint },

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
    end,
}
