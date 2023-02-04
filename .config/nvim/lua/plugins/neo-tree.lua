return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = "<C-b>",
  init = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  end,
  config = function()
    vim.keymap.set("n", "<C-b>", "<cmd> Neotree toggle reveal_force_cwd<CR>", { desc = "toggle nvim tree" })

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
        window = {
          mappings = {
            ["F"] = "fuzzy_finder",
            ["/"] = "",
          }
        },
      },
    })
  end,
}
