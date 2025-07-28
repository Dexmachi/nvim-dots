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
--                                   PYTHON
-- ############################################################################
-- ############################################################################

ls.add_snippets("python", {
  s("def", {
    t("def "),
    i(1, "function_name"),
    t("("),
    i(2, "args"),
    t({ "):", "", "    " }),
    i(0),
  }),
})
