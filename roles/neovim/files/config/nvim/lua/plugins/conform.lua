return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            cpp = { "clang-format" },
            css = { "dprint" },
            go = { "gofmt", "goimports" },
            html = { "dprint" },
            javascript = { "dprint", "prettierd", "prettier", stop_after_first = true },
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            tex = { "latexindent" },
            yaml = { "dprint" },
        },
        formatters = {
            latexindent = {
                prepend_args = { "-l" },
            },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
