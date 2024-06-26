return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        local ls = require "luasnip"
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        local function date_rfc3339()
            local cmd = assert(io.popen "/usr/bin/date --rfc-3339=seconds")
            local output = cmd:read "*all"
            cmd:close()
            return output:gsub("\n", "")
        end

        ls.add_snippets(nil, {
            markdown = {
                s({ trig = "zolan", dscr = "Create a new zola entry" }, {
                    t({ "+++", "draft = true" }),
                    t({ "", "date = " }),
                    f(date_rfc3339, {}, {}),
                    t({ "", 'title = "' }),
                    i(1),
                    t '"',
                    t({ "", "[taxonomies]" }),
                    t({ "", 'tags = ["' }),
                    i(2),
                    t '"]',
                    t({ "", "+++", "" }),
                    i(0),
                }),
            },
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
