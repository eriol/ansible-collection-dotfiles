vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

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
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
