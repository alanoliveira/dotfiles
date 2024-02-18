return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    {
      "kristijanhusak/vim-dadbod-completion",
      enabled = os.getenv("DADBOD_COMPLETION") == '1',
      config = function()
        require("cmp").setup.filetype({ "sql" }, {
          sources = {
            { name = "vim-dadbod-completion" },
          },
        })
      end,
    },
  },
  lazy = true,
  ft = "sql",
}
