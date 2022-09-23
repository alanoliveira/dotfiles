require("luasnip.session.snippet_collection").clear_snippets "zig"
local ls = require "luasnip"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("zig", {
  s("fn", {
    i(4),
    t("fn "),
    i(1),
    t("("),
    i(2),
    t({ ") " }),
    i(3, "void"),
    t({ " {", "\t" }),
    i(0),
    t({ "", "}" })
  })
})
