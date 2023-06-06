-- require('luasnip.session.snippet_collection').clear_snippets 'rust'

return {
  s('fn', {
    t 'fn ',
    i(1, 'name'),
    t '(',
    i(2, 'args'),
    t ')',
    f(function(args)
      if #args[1][1] == 0 then
        return ''
      end
      return ' -> '
    end, { 3 }),
    i(3, 'ret'),
    t { ' {', '\t' },
    i(4, 'unimplemented!()'),
    t { '', '}' },
  }),
}
