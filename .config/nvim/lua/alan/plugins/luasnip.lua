-- snippets
return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require "luasnip"

    ls.config.setup {}
    ls.filetype_extend("ruby", { "rails" })

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set({ "s" }, "<C-h>", "<C-o>s", { silent = true })

    local snippets_path = vim.fn.stdpath("config") .. "/lua/alan/snippets"
    require("luasnip.loaders.from_lua").lazy_load({ paths = snippets_path })

    vim.api.nvim_create_user_command("LuaSnipEdit",
      function()
        require("luasnip.loaders").edit_snippet_files()
      end, {})
  end,
}
