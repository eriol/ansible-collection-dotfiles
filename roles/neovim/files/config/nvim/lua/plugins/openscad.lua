return {
    "salkin-mada/openscad.nvim",
    dependencies = {
        "L3MON4D3/LuaSnip",
    },
    config = true,
    init = function()
        vim.g.openscad_load_snippets = true
        vim.g.openscad_default_mappings = true
    end,
}
