-- LOCALS
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local rep = extras.rep
-- LOCALS

-- ############################################################################
-- ############################################################################
--                                   md
-- ############################################################################
-- ############################################################################

ls.add_snippets("markdown", {
  s("link", {
    t("["),
    i(1, "text"),
    t("]("),
    i(2, "url"),
    t(")"),
  }),
  s("img", {
    t("!["),
    i(1, "alt text"),
    t("]("),
    i(2, "image url"),
    t(")"),
  }),
  s("dcode", {
    t("```"),
    i(1, "language"),
    t({ "", "" }),
    i(2, ""),
    t({ "", "```" }),
  }),
})
