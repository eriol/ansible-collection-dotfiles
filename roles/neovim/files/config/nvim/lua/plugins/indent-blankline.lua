return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        --  TODO: this should be moved into opts
        require("ibl").update({
            exclude = { filetypes = { "startify" } },
        })
    end,
}
