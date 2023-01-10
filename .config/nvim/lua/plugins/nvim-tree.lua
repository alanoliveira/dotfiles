return {
  "kyazdani42/nvim-tree.lua",
  keys = "<C-b>",
  config = function()
    require "nvim-tree".setup()
    vim.keymap.set("n", "<C-b>", "<cmd> NvimTreeToggle<CR>", { desc = "toggle nvim tree" })
  end,
}
