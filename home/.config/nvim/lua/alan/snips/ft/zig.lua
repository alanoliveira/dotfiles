require("luasnip.session.snippet_collection").clear_snippets "zig"
local ls = require "luasnip"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("zig", {
  s("fn", fmt("{}fn {}({}) {} {{\n\t{}\n}}", { i(4), i(1), i(2), i(3, "void"), i(0) })),
  s("import", fmt("const {} = @import(\"{}\"){};{} ", { i(1, "foo"), i(2, "foo.zig"), i(3), i(0) })),
  s("for", fmt("for ({}) |{}, {}| {{\n\t{}\n}}", { i(1, "list"), i(2, "item"), i(3, "idx"), i(0) })),
  s("sdp", fmt("std.debug.print(\"{}\", .{{{}}});{}", { i(1), i(2), i(0) })),
})
