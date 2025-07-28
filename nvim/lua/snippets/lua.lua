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
--                                   LUA
-- ############################################################################
-- ############################################################################

ls.add_snippets("lua", {
  s("snip", {
    t("\n"),
    t('s("'),
    i(1),
    t('",{'),
    i(2),
    t("}),"),
  }),
  s("plugn", {
    t({ "return {", "  {" }),
    t('"'),
    i(1, "plugin/name"),
    t('",'),
    t({ "", "    opts = function(" }),
    i(2, ""),
    t(")"),
    t({ "", "    end,", "  },", "}" }),
  }),
  s("plug", {
    t({
      "  {",
      '    "',
    }),
    i(1, "plugin/name"),
    t({
      '",',
      "    opts = function(",
    }),
    i(2, ""),
    t({
      ")",
      "      ",
      "    end,",
      "  },",
    }),
  }),
})
