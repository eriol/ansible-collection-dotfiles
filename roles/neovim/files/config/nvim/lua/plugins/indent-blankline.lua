require("indent_blankline").setup({
    buftype_exclude = { "terminal" },
    filetype_exclude = {
        "help",
        "packer",
        "startify",
    },
    show_first_indent_level = false,
    show_end_of_line = true,
})
