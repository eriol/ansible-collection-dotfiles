return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
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
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
            callback = function(args)
                local buf = args.buf
                local filetype = args.match

                local lang = vim.treesitter.language.get_lang(filetype)
                if not lang then
                    return
                end

                -- No-op when the parser is not installed.
                if not pcall(vim.treesitter.language.add, lang) then
                    return
                end

                vim.treesitter.start(buf, lang)
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
