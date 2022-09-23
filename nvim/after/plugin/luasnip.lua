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

vim.keymap.set({ "i", "s" }, "<C-n>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", "<Plug>luasnip-prev-choice", { silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", "<Plug>luasnip-next-choice", { silent = true })


require("luasnip/loaders/from_vscode").lazy_load()
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/alan/snips/ft/*.lua", true)) do
  loadfile(ft_path)()
end
